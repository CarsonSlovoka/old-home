+++
title = "Getting Started"
description="FFmpeg Getting Started"
date = 2021-09-17T18:03:00+08:00
lastmod = 2021-09-17
featured_image = ""
draft = false
weight=0
tags = ["ffmpeg", "C"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++

## Install

> choco install ffmpeg -y

👉 [download by chocolate]({{< ref "package_manager#choco" >}})


## Usage

| Commands | Description |
| ---- | ---- |
ffmpeg -i result.webm -c copy output.mp4 | 將webm轉檔成mp4 (會沒有聲音)
ffmpeg -i result.webm -c copy -c:a aac output.mp4 | 將webm轉檔成mp4 (含聲音)
ffmpeg -i input.mp4  output.gif  | 轉成gif
ffmpeg -i input.mp4 -ss 01:19:27 -to 02:18:51 -c:v copy -c:a copy output.mp4 | 剪輯影片
ffmpeg -i video.mp4 -i audio.wav -map 0:v -map 1:a -c:v copy -shortest output.mp4 |
`ffmpeg -i console.mp4 -i console.mp3 -c copy -map 0:v:0 -map 1:a:0 -shortest result.mp4` | 替mp4新增音樂
ffmpeg -ss 00:00:03 -t 10  -i input.mp4 output.gif | 從第3秒開始往後錄10秒 轉成gif


## 參考資料
- [ffmpeg大全](https://www.cnblogs.com/brt2/p/14006745.html)
- [How do I convert a video to GIF using ffmpeg, with reasonable quality?](https://superuser.com/a/556031/1093221)
- https://github.com/CarsonSlovoka/pylib/issues/3
