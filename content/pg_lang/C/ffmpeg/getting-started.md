+++
title = "Getting Started"
description="FFmpeg Getting Started"
date = 2021-09-17T18:03:00+08:00
lastmod = 2022-01-29
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
ffmpeg -i input.mp4 -i subtitle.srt -map 0 -map 1 -c copy -c:v libx264 -crf 23 -preset veryfast output.mp4 | 添加字幕
ffmpeg -i my.mp4 -i my.srt -c copy -c:s mov_text output.mp4 | 添加字幕 (這個指令比較短), 請使用[VLC](https://www.videolan.org/vlc/download-windows.html)撥放軟體來撥放(開啟字幕軌道後即可看到成果)，建議字幕從1秒開始設定起，避免開頭字幕看不到
ffmpeg -i input.mp4 -vf "setpts=0.5*PTS" output.mp4 | 影片撥放速度改為2倍(0.5)
ffmpeg -i input.mp4 -vf "setpts=4.0*PTS" output.mp4 | 影片撥放速度比原本慢4倍
ffmpeg -i input.mp4  output.gif  | 轉成gif
ffmpeg -i input.mp4 -ss 01:19:27 -to 02:18:51 -c:v copy -c:a copy output.mp4 | 剪輯影片, -c:v copy的v指的是video, -c:a copy的a指的是audio。意思是影片+音效都要複製
ffmpeg -i input.mp3 -ss 00:00:01 -to 00:04:54 -c:a copy output.mp3 | mp3剪輯 (不能混用，例如input.mp3 output.m4a是錯的)
ffmpeg -i input.m4a -ss 00:00:01 -to 00:04:54 -c:a copy output.m4a | m4a剪輯
ffmpeg -i "concat:file1.mp3|file2.mp3" -acodec copy output.mp3 | 多個mp3檔案合併成一個
ffmpeg -i video.mp4 -i audio.wav -map 0:v -map 1:a -c:v copy -shortest output.mp4 |
`ffmpeg -i console.mp4 -i console.mp3 -c copy -map 0:v:0 -map 1:a:0 -shortest result.mp4` | 替mp4新增音樂
ffmpeg -ss 00:00:03 -t 10  -i input.mp4 output.gif | 從第3秒開始往後錄10秒 轉成gif
ffmpeg -i input.gif output.mp4 | 將gif轉成mp4(可以利用chrome瀏覽器撥放，但是一般電腦內建的撥放軟體可能會無法撥放)

----

```
ffmpeg -i input.mp4 -i input.mp3 -c copy -map 0:v:0 -map 1:a:0 result.mp4
```

```
輸入源1(下標index 0) console.mp4 (軌道1)
輸入源2(index 1) console.mp3 (軌道1)

-c copy 複製到
-map 對應設定
0:v:0 表示選擇第一個輸入源，v表示video，最後的0表示輸出軌道的下標值，也就是0等於輸出的第一個軌道
1:a:0 表示選擇第二個輸入源，a表示audio，把結果放到輸出的第一個軌道
```

拖曳變數名稱

```shell
@echo off
:: d is drive
:: p is path
:: n is name
:: x is extension, and
:: fn is filename with extension
:: https://stackoverflow.com/a/60623900/9935654
echo input:
echo %~dpfn1
:: C:\...\my.mkv
output:
echo output:
echo %fn1.mp3
:: my.mp3
ffmpeg -i %~dpfn1 %fn1.mp3
echo done
pause > nul
```

## 推流 live streaming RTMP

查看本機video, audio的設備資訊

> ffmpeg -list_devices true -f dshow -i dummy

```
[dshow @ 00000123452234fa] DirectShow video devices (some may be both video and audio devices) // 告訴您video的裝置內容
[dshow @ 00000123452234fa] "HD Webcam"  // 記好您的video裝置名稱
[dshow @ 00000123452234fa]   Alternative name "@device_pnp_\\?\usb#vid_5986&pid_211c&mi_00#6&9da3735&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
[dshow @ 00000123452234fa] DirectShow audio devices // 告訴您audio裝置內容
[dshow @ 00000123452234fa]  "Microphone (Realtek(R) Audio)" // 記好您的audio裝置名稱
[dshow @ 00000123452234fa]     Alternative name "@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{C19C2334-F595-4F17-B261-CDF6157B0496}"
```

如果您沒有攝像頭，那麼裝置名稱就會看到

> Could not enumerate video devices (or none found).

其他還可能出現的裝置

```
video="USB2.0 PC CAMERA":audio="麦克风 (USB2.0 MIC)"
```

----


如果您有rtmp的直播協議的編碼，可以透過ffmpeg去送串流，例如


> ffmpeg -f dshow -i video="HD Webcam":audio="Microphone (Realtek(R) Audio)" -vcodec libx264 -acodec aac -f flv "rtmp://example.com[:port]/live/test"

> ffmpeg -f dshow -i video="HD Webcam":audio="Microphone (Realtek(R) Audio)" -vcodec libx264 -acodec aac -f flv "rtmp://127.0.0.1:1935/live/rfBd56ti2SMtYvSgD5xAV0YU99zampta7Z7S575KLkIZ9PYk"

> ffmpeg -f video="HD Webcam" -i "0" -vcodec h264 -acodec aac -f flv rtmp://127.0.0.1:1935/live/rfBd56ti2SMtYvSgD5xAV0YU99zampta7Z7S575KLkIZ9PYk // 不要聲音


| name | desc |
| ---- | ---- |
-vcodec 視頻編碼方式 | libx264
-acodec 音頻編碼方式 | aac


## 參考資料
- [FFmpeg Filters Documentation](https://ffmpeg.org/ffmpeg-filters.html)
- [ffmpeg大全](https://www.cnblogs.com/brt2/p/14006745.html)
- [How do I convert a video to GIF using ffmpeg, with reasonable quality?](https://superuser.com/a/556031/1093221)
- https://github.com/CarsonSlovoka/pylib/issues/3
- [实现一个直播DEMO——RTMP推流和HTTP-FLV拉流](https://juejin.cn/post/6978882334829477918)
- [音视频技术参考资料](https://github.com/gwuhaolin/blog/issues/5)
