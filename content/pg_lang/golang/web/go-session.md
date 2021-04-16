+++
title = "Web Session"
description="如何設計session"
date = 2021-04-12T11:42:17+08:00
lastmod = 2021-04-12
featured_image = ""
draft = false
weight = 0
tags = ["go"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++


## 前言

Session只是一個術語，他把一些資訊記憶在Server端(可以寫入機密資料，因為是記錄在server而不是cookie)

在網路上因為有些東西我們需要記憶(例如使用者不用每次登入)

所以我們會希望即便使用者關閉瀏覽器，下一次開起來的時候還可以自動登入。

首先，這樣的行為一定牽扯到cookie，因為當使用者關閉瀏覽器，server端已經沒辦法在掌握連上來的使用者資訊

由於使用者可以自己設定cookie，也就是cookie是可以被串改(cookie的容量也有限，也不適合紀錄很多資料)，所以一般而言我們不會在cookie寫入重要的資訊，

我們只會給一個unique ID記錄在此cookie之中。其他的重要資訊可以交給session來記錄。

## session設計

大致上有兩點

1. Manager:
    - 要可以掌握session
    - 寫入cookie ID

2. Provider: session的提供者，session的保存可以保存在server的記憶體、資料庫、實體文件等等，這個provider決定是哪一種

### Manager

```go {linenos=inline, hl_lines=[16]}
type Session interface {
	Set(key, value interface{}) error // set session value
	Get(key interface{}) interface{}  // get session value
	Clear(key interface{}) error      // clear session value
	SessionID() string                // back current sessionID
}

type Provider interface {
	SessionInit(sid string) (Session, error)
	SessionRead(sid string) (Session, error)
	// SessionUpdate(sid string) error
	SessionDestroy(sid string) error
	SessionGC(maxLifeTime int64)
}

var mapProvider map[string]Provider

func init() {
    mapProvider = make(map[string]Provider)
}
```

一個程式中有可能會有很多的provider，所以我們用一個mapProvider去表達

可以寫一個Register去註冊Provider

```go
func Register(name string, provide Provider) {
	if provide == nil {
		panic("session: Register provide is nil")
	}
	if _, dup := mapProvider[name]; dup {
		panic("session: Register called twice for provide " + name)
	}
	mapProvider[name] = provide
}
```

在完成之後可以創建NewManager

```go
func NewManager(provideName, cookieName string, maxLifeTime int64) (*Manager, error) {
	// 在執行前，請先執行Register
	provider, ok := mapProvider[provideName]
	if !ok {
		// %q: a single-quoted character literal safely escaped with Go syntax. // https://golang.org/pkg/fmt/
		return nil, fmt.Errorf("session: unknown provide %q (forgotten import?)", provideName)
	}
	return &Manager{provider: provider, cookieName: cookieName, maxLifeTime: maxLifeTime}, nil
}
```

SessionStart: 主要就是去cookie中尋找，看有沒有某個session的id存在，有存在我們就認為該使用者已經有和server取得聯繫

如果沒有就新增一個sid同時保存在server端和使用者的cookie之中

```go
// get Session
func (manager *Manager) SessionStart(w http.ResponseWriter, r *http.Request) (session Session) {
	manager.lock.Lock()
	defer manager.lock.Unlock()
	cookie, err := r.Cookie(manager.cookieName)
	if err != nil || cookie.Value == "" {
		sid := manager.generateSessionID()
		session, err = manager.provider.SessionInit(sid) // 保存在server端的資料
		if err != nil {
			log.Println(err.Error())
			return nil
		}
		cookie := http.Cookie{ // 只放id在使用者的cookie中
			Name:     manager.cookieName,
			Value:    url.QueryEscape(sid),
			Path:     "/",
			HttpOnly: true,
			MaxAge:   int(manager.maxLifeTime)}
		http.SetCookie(w, &cookie)
	} else {
		sid, _ := url.QueryUnescape(cookie.Value)
		session, _ = manager.provider.SessionRead(sid)
	}
	return session
}
```

可以在例外寫一些Manager的處理函數，如下

```go
// func (manager *Manager) SessionQuery(r *http.Request) (session Session)
// func (manager *Manager) SessionDestroy(w http.ResponseWriter, r *http.Request)
// func (manager *Manager) GC()
// func (manager *Manager) generateSessionID() string
```

- SessionQuery: 檢查cookie，有資料就向server要資料(session)

    因為GC會定期的清理session，所以是有可能發生cookie有值而session沒有的狀況

    因此用sid去向server查詢的寫法可以設計成: 若sid查到就回傳session，沒有就回傳error或者nil

- SessionDestroy: 檢查cookie，有資料才能刪除，刪除session和cookie.Value
- GC: session不能一直存在server，通常Manager在建立的時候，我們會給他一個maxLifeTime，

    把超過此時間的使用者給自動清除(指的是清除session)

    由於GC是自動執行，而且主要是清除server的資料，所以他並不需要request，

    也就是GC不會清理使用者的cookie。

- generateSessionID: 顧名思義只是生成unique ID而已

    這裡要注意，隨機必須具備:

    1. 真隨機性: 隨機樣本不可重現
    2. 密碼學安全偽隨機性: 給定隨機樣本的一部分和隨機演算法，不能有效的演算出隨機樣本的剩餘部分

    可以用 [crypto/rand](https://golang.org/pkg/crypto/rand/) 來幫您

### SessionStore

設部分的設計很簡單，基本上就是看要存放在哪而已，和使用者無關係(與cookie不相關)

以下這個是保存在memory的範例

```go
type MemoryProvider struct {
    mapStore map[string]*list.Element // key值用session id，每一個id代表一個使用者
    list     *list.List
    lock     sync.Mutex
}

type Store struct {
	id           string // 和mapStore中的key值是同樣的，都是session id的意思
	value        map[interface{}]interface{}
	timeAccessed time.Time                   // 最後存取時間
}
```

比較有趣的是MemoryProvider中又多出了一個list

list其實放的跟mapStore的東西是一樣的，

那既然是一樣的為什麼要多出這個東西？

這是因為我們利用timeAccessed(最後存取時間)來判斷哪些session比較常被使用，哪些已經閒置很久了

在GC的時候，我們優先從閒置很久的session開始清理，所以可以**提高GC的效率**

也因此您可以考慮新增一個SessionUpdate，不管是

- Set
- Get
- Clear

都要更新timeAccessed
