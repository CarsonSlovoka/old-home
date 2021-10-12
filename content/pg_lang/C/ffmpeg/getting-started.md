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
ffmpeg -i result.webm -c copy -c:a aac `-c:v libx264` output.mp4 | 將webm轉檔成mp4 (含聲音)  可以解決錯誤: `Could not find tag for codec vp8 in stream #0, codec not currently supported in container Could not write header for output file #0 (incorrect codec parameters ?): Invalid argument Error initializing output stream 0:0 --`
ffmpeg -i input.mp4 -i input.m4a -acodec copy -vcodec copy mix.mp4 | mp4加上m4a聲音和新的mp4，後面的copy可以大大的加快速度
ffmpeg -i input.mp4 -s 1280x720 -c:a copy output.mp4 | 解析度轉為 1280×720
ffmpeg -i input.mp4 -an output.mp4 | -an表示audio no，不含聲音
ffmpeg -i input.mp4 -vn output.mp3 | -vn表示video no,不含影像，只保留聲音
ffmpeg -i input.mp4 -filter:v "crop=640:480:200:150" output.mp4 | 從位置250,150的地方，擷取寬640高480，轉成新的mp4檔案
ffmpeg -i input.mp4 -t 10 output.avi | 我們以秒具體說明時間。此外，以 hh.mm.ss 格式具體說明時間也是可以的。
ffmpeg -i audio.mp3 -ss 00:01:54 -to 00:06:53 -c copy output.mp3 |  剪輯區間類的聲音
fmpeg -i input.mp4 -i subtitle.srt -map 0 -map 1 -c copy -c:v libx264 -crf 23 -preset veryfast output.mp | 添加字幕
ffmpeg -i input.mp4 -vf "setpts=0.5*PTS" output.mp4 | 影片撥放速度改為2倍(0.5)
ffmpeg -i input.mp4 -vf "setpts=4.0*PTS" output.mp4 | 影片撥放速度比原本慢4倍
ffmpeg -i input.mp4  output.gif  | 轉成gif
ffmpeg -i input.mp4 -ss 01:19:27 -to 02:18:51 -c:v copy -c:a copy output.mp4 | 剪輯影片
ffmpeg -i video.mp4 -i audio.wav -map 0:v -map 1:a -c:v copy -shortest output.mp4 |
`ffmpeg -i console.mp4 -i console.mp3 -c copy -map 0:v:0 -map 1:a:0 -shortest result.mp4` | 替mp4新增音樂
ffmpeg -ss 00:00:03 -t 10  -i input.mp4 output.gif | 從第3秒開始往後錄10秒 轉成gif


## 參考資料
- [ffmpeg大全](https://www.cnblogs.com/brt2/p/14006745.html)
- [How do I convert a video to GIF using ffmpeg, with reasonable quality?](https://superuser.com/a/556031/1093221)
- https://github.com/CarsonSlovoka/pylib/issues/3
