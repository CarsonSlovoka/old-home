+++
title = "Python疑難排解"
description="Python疑難排解"
date = 2021-02-15T11:43:06+08:00
lastmod = 2021-02-15
featured_image = ""
draft = false
tags = ["python"]
markmap = true
toc_markmap = true
toc_bootstrap = true
[next_and_previous.link]
  previous_page = ""
  next_page = ""
  previous_section = ""
  next_section = ""
+++


## pip的錯誤

1. ValueError: Unable to find resource t64.exe in package pip._vendor.distlib

    當您嘗試: ``python -m pip install --upgrade pip``

    卻遇到上面的錯誤時，請做以下事情即可解決

    - python -m pip uninstall pip
    - python -m ensurepip
    - python -m pip install -U pip

   👉 [出處](https://github.com/pypa/pip/issues/8450)
