+++
title = "Test"
date = 2020-12-11T16:11:51+08:00
draft = true
toc = true
bootstrap = true
plantuml = true

[article_image]
    src = "images/hugo/gohugoio-card.jpg"
+++

## Shortcodes-Details

### 普通文本

{{< details "Details test">}}

> 我是隱藏的區塊內容

{{< /details >}}

### 表格

| Name | Desc |
| ---- | ---- |
| {{< details "Fruit">}} Apple, **banana** {{< /details >}} | Ya |

## h2

### h21

hi

#### h22


## h22

ddd

## 中文

中文

### about {{</* */>}}

## PlantUML

取的cdn腳本的資訊 "https://www.srihash.org" , 例如:

> ``<script src="https://cdn.jsdelivr.net/npm/plantuml-encoder@1.4.0/dist/plantuml-encoder.min.js" integrity="sha256" crossorigin="anonymous"></script>``

```plantuml
@startmindmap
* Debian
** Ubuntu
*** Linux Mint
*** Kubuntu
*** Lubuntu
*** KDE Neon
** LMDE
** SolydXK
** SteamOS
** Raspbian with a very long name
*** <s>Raspmbc</s> => OSMC
*** <s>Raspyfi</s> => Volumio
@endmindmap
```
