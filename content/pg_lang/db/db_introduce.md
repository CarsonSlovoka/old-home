+++
title = "Introduce"
description=""
date = 2021-03-02T10:50:05+08:00
lastmod = 2021-03-02
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


## 資料庫種類

- RDBMS: Relational Database Management System
- NoSQL: No Only SQL


## RDBMS

### ACID

- A = Atomicity: Each transaction be "all or nothing"

    轉帳，要不就成功，失敗也不會有任何問題

- C = Consistency: Any transaction will bring the database from one valid state to another

    交易的結果該是甚麼就是甚麼，匯錢100萬不會變50萬

- I = Isolation: Concurrent execution of transactions results in a system state that would be obtained if transactions were executed sequentially.

    每一個執行都是獨立開來的，也就是當如果有一連串的交易要運行，那麼順序上誰先執行無所謂。

- D = Durability: Once a transaction has been committed, it will remain so, even in the event of power loss, crashes, or errors.

    指令只要就永遠有效，即便後續停電了也還是一樣


## NoSQL

### CAP

- CAP:
  - C = Consistency: 每一次讀取都會收到最近寫入或錯誤
  - A = Availability: 每個請求都會收到一個(非錯誤)響應 - 不保證它包含最新的寫入
  - P = Partition tolerance: 儘管節點之間的網絡丟棄（或延遲了）任意數量的消息，但係統仍繼續運行


目前NoSQL只會提供CAP的兩個，至於哪兩個要視資料庫而定
