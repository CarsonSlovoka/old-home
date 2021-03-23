+++
title = "Snipcart"
description="這是一個可以提供購物車的第三方服務"
date = 2021-03-22T15:28:49+08:00
lastmod = 2021-03-22
featured_image = ""
draft = false
weight = 0
tags = ["shopping"]
markmap = true
toc_markmap = true
+++


## Snipcart簡介

讓任何網站都可以安裝他們家服務的外掛，將商品、購物車與結帳模組導入，完成消費功能。

## [教學](https://docs.snipcart.com/v3/setup/products)

```html
<button class="snipcart-add-item"
  data-item-id="starry-night"
  data-item-price="79.99"
  data-item-url="/paintings/starry-night"
  data-item-description="High-quality replica of The Starry Night by the Dutch post-impressionist painter Vincent van Gogh."
  data-item-image="/assets/images/starry-night.jpg"
  data-item-name="The Starry Night"
  data-item-custom1-name="Frame color"
  data-item-custom1-options="Black|Brown|Gold">
  Add to cart
</button>
```

按鍵會將您導向結帳的頁面

## FAQ

### [Snipcart可以幫我建立網站嗎？](https://snipcart.com/faq/getting-started/can-i-build-a-new-website-with-snipcart)

不能。

他是一個HTML+JavaScript所製成的購物車應用，您需要提供您的網站才可以使用。

### [Snipcart的收費](https://snipcart.com/faq/standard-custom-pricing/how-much-will-it-cost-me-to-use-snipcart)

收取您銷售額的2%利潤，每月最低要付10美元。

換句話說:

- 銷售額達500美元以上，收取您利潤的2%
- 銷售額500內(含)，每月10美金 (500 *0.02=10)

### [如果沒有任何銷售我需要支付每月最低的10元美金費用嗎？](https://snipcart.com/faq/standard-custom-pricing/if-i-make-no-sales-will-i-pay-the-10-minimal-monthly-fee-on-the-standard-plan)

在測試模式(Test)不用，但如果您在live模式，且已經輸入了付款資訊，就要付！

### [網站需要有SSL/HTTPS的認證嗎](https://snipcart.com/faq/getting-started/do-i-need-an-sslhttps-certificate-installed-on-my-website)

這不是強制的，snipcart的購物車會連回到snipcart，他會確保使用者與其服務之間是經過加密處理的

### [是否可以客製化儀表板dashboard](https://snipcart.com/faq/getting-started/does-snipcart-offer-a-merchant-dashboard)

可以的，您可以自定義您的儀表板內容。
