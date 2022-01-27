+++
title = "認識HTTPS, SSL,TLS"
description="How to create a self-signed certificate with openssl?"
date = 2022-01-25T10:11:00+08:00
lastmod = 2022-01-25
featured_image = ""
draft = false
weight = 0
tags = ["github"]
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

# HTTP*S*

HTTPS服務不同於HTTP服務，HTTPS是HTTP over SSL或HTTP over TLS。

因為原先網際網路上使用的 HTTP 協議是明文的，存在很多缺點——比如傳輸內容會被偷窺（嗅探）和篡改。發明 SSL 協議，就是為了解決這些問題。

到了1999年，SSL 因為應用廣泛，已經成為網際網路上的事實標準。IETF 就在那年把 SSL 標準化。

標準化之後的名稱改為 **TLS** 是"Transport Layer Security"的縮寫，中文叫做"傳輸層安全協議"。

----

## Create HTTPS Server

如果要建立HTTPS服務器，需要提供兩項東西

1. key.pem : 私鑰
2. cert.pem : 證書

以下幾種方式都可以生成

1. 使用OpenSSL生成

    ```yaml
    openssl genrsa -out key.pem 2048
    openssl req -new -x509 -key key.pem -out cert.pem -days 3650  # 3650表示有效期限的天數，相當於10年左右
    ```

2. 使用golang內建提供的[src/crypto/tls/generate_cert.go](https://github.com/golang/go/blob/2580d0e08d5e9f979b943758d3c49877fb2324cb/src/crypto/tls/generate_cert.go)

    使用go run 能運行單個檔案

    go run "C:\\Program Files/Go/1.17.1/src/crypto/tls/generate_cert.go" --host localhost

    > go run $GOROOT/src/crypto/tls/generate_cert.go --host localhost
    >
    > 您可以用 `go env GOROOT` 去尋找您的GOROOT的路徑
    >
    > 也可以直接告知generate_cert.go的完整路徑, cd到您要產出的資料夾執行:
    >
    > go run "C:\\Program Files/Go/1.17.1/src/crypto/tls/generate_cert.go" --host localhost

    您可以稍微看一下程式，就能瞭解可以用的參數有哪些，預設生成為1年 (365*24*time.Hour)

    ```go
    var (
        host       = flag.String("host", "", "Comma-separated hostnames and IPs to generate a certificate for")
        validFrom  = flag.String("start-date", "", "Creation date formatted as Jan 1 15:04:05 2011")
        validFor   = flag.Duration("duration", 365*24*time.Hour, "Duration that certificate is valid for")
        isCA       = flag.Bool("ca", false, "whether this cert should be its own Certificate Authority")
        rsaBits    = flag.Int("rsa-bits", 2048, "Size of RSA key to generate. Ignored if --ecdsa-curve is set")
        ecdsaCurve = flag.String("ecdsa-curve", "", "ECDSA curve to use to generate a key. Valid values are P224, P256 (recommended), P384, P521")
        ed25519Key = flag.Bool("ed25519", false, "Generate an Ed25519 key")
    )
    ```

## 相似名詞比較

| 名稱 | 描述 |
| ---- | ---- |
SSH | 是一種用於**登入**和**共享資料**的網路技術
SSL | 用於**保護網路傳輸**的資料

## 參考資料

- [How to generate a self-signed SSL certificate using OpenSSL?](https://stackoverflow.com/q/10175812/9935654)
- [Golang建立最簡單的HTTP和HTTPS服務](https://www.gushiciku.cn/pl/26GN/zh-tw)
- [證書之間的轉換（crt pem key）](https://www.itread01.com/content/1544769066.html)
