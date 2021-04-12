+++
title = "網站管理名詞簡介"
description="網站管理名詞簡介"
date = 2021-03-22T15:49:26+08:00
lastmod = 2021-03-22
featured_image = ""
draft = false
weight = 0
tags = ["hosting", "service"]
markmap = true
toc_markmap = true
+++

## SPI 模型

大家目前普遍認同的雲端運算服務是SPI模型

SPI指:

- Software（軟體）
- Platform（平臺）
- Infrastructure（基礎設施）

## XaaS (X as a service)

談到一些網站管理的服務，可能很常聽到一堆XaaS，其中X是隨意的東西。

在這裡我們要介紹以下東西

| 名稱  | 附註 | 案例 |
| ---- | ---- | ---- |
IaaS (Infrastructure)  | |  Amazon EC2, Azure VMs, ect.
CaaS (Containers)   | 是IaaS的子集 | Docker Cloud, Amazon ECS ect.
BaaS (Backend)   |  | authentication, database management, remote updating, cloud storage, Push notifications
PaaS (Platform)  |  | Heroku, Amazon Elastic Beanstalk, ect.
FaaS (Feature)   |  | AWS Lambda, Google Cloud Functions, IBM Cloud Functions, Azure Functions
SaaS (Software)  |  |


{{< insert-figure "images/pg_lang/web/service/hosting/XaaS-pyramid.jpg" "" "100%" "" "https://aigo.org.tw/zh-tw/forum/content/102" >}}
{{< insert-figure src="images/pg_lang/web/service/hosting/XaaS-pyramid-reverse.jpg" from="https://progressbar.tw/posts/51" >}}
{{< insert-figure src="images/pg_lang/web/service/hosting/XaaS.png" from="https://serverless.zone/abstracting-the-back-end-with-faas-e5e80e837362" >}}
{{< insert-figure src="images/pg_lang/web/service/hosting/cloud-services.png" from="https://dzone.com/articles/iaas-caas-paas-faas-how-do-you-choose" >}}
{{< insert-figure src="images/pg_lang/web/service/hosting/NoOps.jpg" from="https://www.programmersought.com/article/89905788485/" >}}

```markmap
{"t":"h","d":1,"v":"SaaS","c":[
 {"t":"h","d":2,"v":"PaaS","c":[
  {"t":"h","d":3,"v":"IaaS","c":[
   {"t":"h","d":4,"v":"CaaS","c":[
   ]}
  ]}
 ]}
]}
```

我們可以知道越上層所涵蓋的東西愈多，舉例來說您選擇了SaaS的服務

那麼這些服務其實也包含了PaaS和IaaS所提供的服務在內。

### SaaS

SaaS (Software as a Service) 服務型式，是將軟體以服務的型式來提供。**SaaS服務供應商建置好整個軟體使用環境**，讓使用者透過網頁瀏覽器即可使用軟體，而不需要在自己的電腦安裝軟體。

網頁郵件即是個典型的例子，你不需要安裝電子郵件軟體，以瀏覽器即可收發信件，而電子郵件則是儲存在SaaS供應商的資料中心。

常見的SaaS服務，除了個人取向的郵件、日曆、文書處理，亦有針對企業應用的，如客戶關係管理、專案管理、協同作業等等。

#### SaaS特性

- 多租戶型式。
- 使用者透過網路即可使用軟體，通常是透過網際網路。
- 依照使用者數量或使用量來計費。(Pay as you go)

### PaaS

PaaS( Platform as a Service )服務型式，是將應用程式**開發環境以服務的型式來提供**。

PaaS服務供應商主要提供虛擬的開發環境、相關的開發工具，以及應用程式部署至雲端服務的工具，**讓開發人員透過網路就能開發應用程式**。

PaaS服務供應商同時提供

- 運算資源
- 開發環境

開發人員不需要先建置開發環境的硬體平臺，只要透過租用服務，即**可取得虛擬的應用程式開發環境，立即撰寫程式**。

如果是用於開發網站應用程式，亦可結合其他型式的雲端服務，讓服務快速部署上線。

此外，PaaS服務供應商不只是提供應用程式開發生命周期所需要的工具與服務，更進一步提供**軟體市集**，讓軟體開發商在應用程式完成後，即有銷售的管道。

#### PaaS特性

- 多租戶型式。
- 提供應用程式開發環境與管理工具，支援網頁應用程式開發標準。
- 提供雲端軟體部署平臺與線上軟體市集。
- 使用者不需管理背後的雲端基礎架構，並可依照使用量自動調配運算資源。


### FaaS

FaaS (Feature/Function as a Service) 功能即服務

針對應用程序的**各個功能**或**組件**進行雲端運算的服務。

使用FaaS，服務提供商會自動處理客戶端的物理硬件，虛擬機操作系統和Web服務器軟件管理。

#### FaaS特性

- 獨立
- 無狀態 ( stateless ) : 每個請求都是獨立的，執行的結果不會受到其他請求所影響。
- 快速 ( ephemeral ) : 隨呼隨用，並且執行完畢後立刻關閉。啟動與關機的時間都非常短暫(毫秒為單位)
- 事件驅動 ( event-triggered ) : 雖然functions可以直接用，但是通常我們會把它設計在HTTP的請求，例如送一個Get回傳一個結果。
- 擴展性高 ( scalable by default ) : 可以一次啟動好幾個container來同時呼叫一個function。同一時間就算有很多請求( incoming request ) 也不須擔心。
- 可以實現REST API
- 不用管理SERVER (佈建、升級伺服器。都不需要)

#### 與PaaS的差異？

不會因為一個事件而開啟整個應用程序又結束 : 也就是不能做到像FaaS一樣的隨開隨用，用完又立刻關閉，PaaS的成本比較大

#### Serverless

Serverless architecture (also known as serverless computing or function as a service, FaaS)

無伺服器服務，即您不需要擔心伺服器的問題，您只要專注在於您的代碼，至於佈建、防火牆、伺服器等相關問題您都不需要擔心。

簡單來說您使用了無伺服器服務，就不需要維護sever的運作，第三方會幫您解決。

付費上是採用用多少付多少的概念(Pay as you go)

#### FaaS與Serverless有何區別？

最初兩個是差不多的東西，但後來Serverless擴展了更多體系架構，除了以FaaS編碼的自定義業務邏輯外，還使用了大量的通用服務。

FaaS主要通過事件驅動架構連接通用後端服務(資料庫、消息傳遞、身分驗證)來為開發人員帶來收益。

我個人比較認同

> Serverless = FaaS + BaaS + Database ( [參考一](https://www.bmc.com/blogs/serverless-paas/) 、 [參考二](https://zhuanlan.zhihu.com/p/355235133) )

#### 提供FaaS的平台有哪些？

##### [Webtask](https://webtask.io)

是 [Auth0](https://auth0.com/) 公司提供的線上FaaS服務


##### [Google Cloud Functions](https://cloud.google.com/functions)

- [quickstart-go](https://cloud.google.com/functions/docs/quickstart-go)

##### [IBM Cloud Functions](https://www.ibm.com/cloud/functions)

##### [Azure Functions](https://azure.microsoft.com/en-us/services/functions/)

##### [AWS Lambda](https://aws.amazon.com/tw/getting-started/hands-on/run-serverless-code/)

###### [AWS收費](https://aws.amazon.com/tw/free/free-tier-faqs/)

ASW服務收費分為三種

1. 12個月免費
2. 試用期(通常是一年)
3. 永遠免費(但可能有流量限制，超量會收費！)

永遠免費優惠服務可讓客戶免費使用產品一段指定的時間，只要具備有效的 AWS 帳戶就能無限期使用。

根據您選擇的服務，短期試用服務可免費使用一段指定的時間或一次性的用量限制。

當**免費方案到期或應用程式的用量超過免費方案限制**時，您只**需支付**標準的按用量付費服務費率

> 免費流量一旦超標，就要付費！

###### [FAQ](https://aws.amazon.com/tw/lambda/faqs/)

### IaaS

IaaS(Infrastructure as a Service)服務型式，是將IT基礎設施以服務的方式提供，像是IT架構的主要基礎設備，伺服器、儲存與網路，分別以虛擬伺服器服務、儲存服務與網路服務等型式提供給使用者。

當使用者需要運算資源時，可立即獲得資源，而不需要自己採購設備、建置與部署。這種模式因而打破了過往取得運算資源的方法。

#### IaaS特性

- 使用者不需要理解雲端運算背後的架構，只要設定好所需資源組態，即可取得硬體資源。
- 可依使用者的需求動態彈性縮放，當使用者需要加大規模或縮小規模，皆可立即因應。
- 依照使用量來計費。

### [CaaS](https://www.ibm.com/services/cloud/containers-as-a-service)

Containers as a service

### BaaS (Backend as a Service)

## DevOps NoOps

無服務器的宗旨是，讓系統可以**自動化**，並將底層基礎架構(Infrastructure)抽象出來，

管理員或IT團隊只需專注於開發，不用管理作業系統，形成了一種無操作的概念(NoOps)

{{< insert-figure "images/pg_lang/web/service/hosting/DevOps-NoOps.jpg" "" "50%" "25%" "https://www.cio.gov/resources/Demystifying%20NoOps%20and%20Serverless%20Computing_FINAL.pdf" >}}

上圖您可以看到整個的過程

第一張圖: 是最原始的流程，開發、測試、到發佈，一步一步循序漸進，都是單獨進行結束之後才往下一步走

第二張圖: DevOps，整個生命週期需要**協同作業**

第三張圖: NoOps的概念，將需要人力進行開發、部屬和維護的作業都交由自動化來取代，如此就能專注於主要的業務之中。

## Host檔案

hosts檔案位子:

> %windir%\system32\drivers\etc

```
127.0.0.1 www.xxx.net
0.0.0.0 https://account.xxx.com:443
```

## 參考資料

- [Serverless & FaaS](https://medium.com/@jinghua.shih/serverless-faas-3b607f0158fe)
- [Serverless vs PaaS: Is Serverless the New PaaS?](https://www.bmc.com/blogs/serverless-paas/)
- [pdf WHITE PAPER: DEMYSTIFYING NOOPS AND SERVERLESS COMPUTING](https://www.cio.gov/resources/Demystifying%20NoOps%20and%20Serverless%20Computing_FINAL.pdf)
- [徹底了解Cloud Computing｜服務型式篇](https://www.ithome.com.tw/article/93007)
- [Abstracting the Back-end with FaaS](https://serverless.zone/abstracting-the-back-end-with-faas-e5e80e837362)
