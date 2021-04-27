+++
title = "TOML教學"
description=""
date = 2021-03-08T13:21:40+08:00
lastmod = 2021-03-08
featured_image = ""
draft = false
weight = 0
tags = []
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++


## TOML介紹

一種檔案格式，容易閱讀以及編寫，

以閱讀和編寫來談，目前能和TOML匹敵的應該只有YAML (INI不討論，INI寫不了複雜的東西)

如果不考慮「引用」的問題，那麼TOML確實是比較優的


## 注意事項

- TOML有區分大小寫
- TOML文件必須是UTF-8編碼

## 註解

```toml
# 全行註解
key = "value"  # 行末註釋
other = "# 這不是一個註釋"
```

> ⚠ 除Tab以外的控制字符（U+0000 至 U+0008，U+000A 至 U+001F，U+007F）**不可出現** 在註解中。

## 鍵名

命名規則可以是

- 引號鍵: 用「引號」{``"``, `` ' ``}把鍵名包起來
- 裸鍵: 裸鍵只能是ASCII字符所構成，其中``1234``，這種純數字的鍵名會被當作字串。
- 點分格鍵: 一系列通過「``點``」(``.``)相連在一起的「裸鍵」或「引號鍵」。

### 引號鍵

除非必要，不然不建議用這種方式來為鍵名命名

```toml
"我是鍵名" = "中文"
"127.0.0.1" = "..."
"system   version" = "..."
'quoted "value"' = "..."
"" = "空"     # 正確，但不鼓勵
'' = '空'     # 正確，但不鼓勵
```

### 裸鍵

```toml
key = "value"
bare_key = "value"
bare-key = "value"
1234 = "value"  # 會被當作鍵名會當作字串
```

### 點分格鍵

{{< table/code-by-example "TOML" "YAML" >}}

```toml
name = "橙子"
physical.color = "橙色"
physical.shape = "圆形"
site."google.com" = true
'3.14159' = "pi"  # 不建議
# 👇 空白會被忽略
fruit . name = "香蕉"  # 等同 fruit.name
fruit. color = "黄色"  # 等同 fruit.color
```

@@NEW-COL@@

```yaml
name: 橙子
physical:
    color: 橙色
    shape: 圆形
site:
    google.com: true
'3':
'14159': pi
fruit:
    name: 香蕉
    color: 黃色
```

{{< /table/code-by-example >}}

## 字串

### 多行字串

- 換行: 使用``"""``開頭和結尾，其中**緊鄰開頭的的換行會被去除**，其他的空白和換行全部保留！
- ``\``: 使用``\``會把它後面的所有空白和換行一併刪除


```toml
str="""
輕輕的我走了
正如我輕輕的來"""

strWindows = """輕輕的我走了\r\n正如我輕輕的來"""
strUnix = """輕輕的我走了\n正如我輕輕的來"""

str2 = """\
    我輕輕的招手\
    作別西天的雲彩"""

str2-1 = """\
    我輕輕的招手\


    作別西天的雲彩"""

str2result= """我輕輕的招手作別西天的雲彩"""


```

## 數字

### 整數

```toml
int1 = +99
int2 = 42
int3 = 0
int4 = -17

int5 = 1_000  # 1000
int6 = 5_349_221  # 5349221
int7 = 53_49_221  # 印度记數体系分组
int8 = 1_2_3_4_5  # 无误但不鼓励
```

### 進制


```toml
# 带有 `0x` 前缀的十六进制
hex1 = 0xDEADBEEF
hex2 = 0xdeadbeef
hex3 = 0xdead_beef

# 带有 `0o` 前缀的八进制
oct1 = 0o01234567
oct2 = 0o755 # 对于表示 Unix 文件权限很有用

# 带有 `0b` 前缀的二进制
bin1 = 0b11010110
```

任何 64 位有符号整數（从 −2^63 到 2^63−1）都應當被接受并无損处理。
如果无法无損表現某个整數，則必須拋出錯誤。


### 浮點數

```toml
# 小數
flt1 = +1.0
flt2 = 3.1415
flt3 = -0.01

# 指數
flt4 = 5e+22
flt5 = 1e06
flt6 = -2E-2

# 都有
flt7 = 6.626e-34
```

#### 無窮

```
# 无穷
sf1 = inf  # 正无穷
sf2 = +inf # 正无穷
sf3 = -inf # 负无穷

# 非數
sf4 = nan  # 实际上对應信号非數码还是静默非數码，取决于实現
sf5 = +nan # 等同于 `nan`
sf6 = -nan # 正确，实际码取决于实現
```

## 時區

可以使用 [rfc3339](https://tools.ietf.org/html/rfc3339) 的格式

```toml
datetime1 = 2021-03-08T13:21:40Z  # Z表示UTC offset of 00:00
datetime2 = 2021-03-08T13:21:40+08:00  # UTC+8
datetime3 = 2021-03-08T13:21:40  # 捨棄時區偏移
date = 2021-03-08  # 表示該天，不涉及時區以及其偏移
time = 07:32:00  # 時刻，與日期無關
```

## 數組

- 空白會被忽略
- 用方括號包起來``[``, ``]``
- 子元素用``,``分開
- 可以混合不同的類型的值
- 可以換行
- 可以有尾逗號
- 註釋可以存在於其中
- 數組值和逗號之間的「Tab」被當作空白而忽略！

```toml
integers = [ 1, 2, 3 ]
colors = [ "红", "黄", "绿" ]
nested_array_of_ints = [ [ 1, 2 ], [3, 4, 5] ]
nested_mixed_array = [ [ 1, 2 ], ["a", "b", "c"] ]
string_array = [ "所有的", '字符串', """是相同的""", '''类型''' ]

# 允许混合类型的數组
numbers = [ 0.1, 0.2, 0.5, 1, 2, 5 ]
contributors = [
  "Foo Bar <foo@example.com>",
  { name = "Baz Qux", email = "bazqux@example.com", url = "https://example.com/bazqux" }
]
```

## Table

表內的元素縮進不是必須的

```toml
[table]
  name = "..."

# 等價於
[table]
name = "..."
```

{{< table/code-by-example "TOML" "YAML">}}

```toml
[dog."tater.man"]
  type.name = "哈巴狗"
```

@@NEW-COL@@

```yaml
dog:
  tater.man:
    type:
      name: 哈巴狗
```

{{< /table/code-by-example >}}

鍵名旁的空格會被忽略

```toml
[a.b.c]            # 這是最佳实践
[ d.e.f ]          # 等同于 [d.e.f]
[ g .  h  . i ]    # 等同于 [g.h.i]
[ j . "ʞ" . 'l' ]  # 等同于 [j."ʞ".'l']
```

🐬 您不必講究地寫出所有途徑，例如:
```toml
# [x] 你
# [x.y] 不
# [x.y.z] 需要這些
[x.y.z.w] # 來让這生效

[x] # 后置父表定义是可以的
```

类似于键名，你不能重复定义一个表。
這样做是錯誤的。

```toml
# 不要這样做

[fruit]
apple = "红色"

[fruit]
orange = "橙色"

# 也不要這样做

[fruit]
apple = "红色"

[fruit.apple]
texture = "光滑"
```

### 頂層表

頂層表，又被稱為根表，于文檔開始处開始并在第一个表头（或文件結束处）前結束。
不同于其它表，它沒有名字且无法后置。

```toml
# 頂層表開始。
name = "Fido"
breed = "哈巴狗"

# 頂層表結束。
[owner]
name = "Regina Dogman"
member_since = 1999-08-04
```

### 表數組

{{< table/code-by-example "TOML" "YAML" >}}

```toml
[[products]]
name = "锤子"
sku = 738594937

[[products]]  # 數组里的空表

[[products]]
name = "钉子"
sku = 284758393

color = "灰色"
```

@@NEW-COL@@

```yaml
products:
- name: 锤子
  sku: 738594937
- {}
- name: 钉子
  sku: 284758393
  color: gray

```

{{< /table/code-by-example  >}}

🐬 **任何对表數组的引用都指向该數组里最近定义的表元素**

{{< table/code-by-example "TOML" "YAML" >}}

```toml
[[fruits]]
name = "苹果"

[fruits.physical]  # 子表
color = "红色"
shape = "圆形"

[[fruits.varieties]]  # 嵌套表數组
name = "蛇果"

[[fruits.varieties]]
name = "澳洲青苹"

[[fruits]]
name = "香蕉"

[[fruits.varieties]]
name = "车前草"
```

@@NEW-COL@@

```yaml
fruits:
- name: 苹果
  physical:
    color: 红色
    shape: 圆形
  varieties:
  - name: 蛇果
  - name: 澳洲青苹
- name: 香蕉
  varieties:
  - name: 车前草
```

{{< /table/code-by-example  >}}


## MIME類型

``application/toml``

## 參考資料

- [龙腾道-译TOML](https://github.com/LongTengDao/TOML/tree/%E9%BE%99%E8%85%BE%E9%81%93-%E8%AF%91)
- [toml.io/cn/v1.0.0](https://toml.io/cn/v1.0.0)
- [json2yaml](https://www.json2yaml.com/)
