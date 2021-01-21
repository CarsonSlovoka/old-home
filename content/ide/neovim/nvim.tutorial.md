+++
title = "neovim基礎教學"
date = 2021-01-14T14:26:00+08:00
description = "neovim教學"
tags = ["neovim"]
bootstrap = true
markmap = true
toc_markmap = true
toc_bootstrap = true
+++

## 安裝

請參考: [套件安裝-常用安裝項目-neovim]({{< ref "/os/windows/package_manager#一些常用的安裝項目" >}})

## Neovim配置

windows系統通常是在``%userprofile%/AppData/Local/nvim`` (如果nvim的資料夾不在就要自己建立)

然後在裡面創建init.vim 即: ``%userprofile%/AppData/Local/nvim/init.vim``

附帶一提他的swap檔案存放的位置: ``%userprofile%/AppData/Local/nvim-data/swap``

## 安裝vim-plug

這個是plugin是用來下載其他的plugin，所以您要安裝其他的plugin之前必須先安裝這個(當然還有其他的例如vundle)

不過我個人認為vundle已經過時，不要去用他。

打開``powershell``

vim使用者:
>  ``iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force``

Neovim使用者:
> ``iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force``

它和vim的差異vim是放在``HOME/vimfiles``而neovim放在``%localappdata%/nvim-data/site``之中

## 用其他語言來幫助neovim

``:checkhealth provider`` 可以查看各個provider的情況，就能知到是否可以開始始用該語言寫腳本

### Python

Neovim有提供特殊的接口，可以和Python進行聯繫，要安裝**pynvim**

> :exclamation: **不要**安裝neovim 這是舊版的，如果您有興趣可以查看[issue-366](https://github.com/neovim/pynvim/issues/366)

    pip uninstall neovim
    pip uninstall pynvim
    pip install pynvim  " 只要裝這個就好了，這兩個其實都一模一樣
    pip show pynvim  " pip show 可以查看有沒有裝該套件

#### curl的問題

如果``:checkhealth provider``出現了:

    HTTP request failed: error curl error with
    https://pypi.python.org/pypi/pynvim/json :35

解決辦法 :

1. 先檢查有沒有裝curl

2. 有了話檢查檔案:

  - ``$vimruntime/autoload/healthprovider.vim``

3. 根據該檔案描述:``curl -V``中的Protocols必須有``https``支援，

   另外他有用-sL (s: silent, L: Follow redirects)
let rv = s:system(['curl', '-sL',
   curl失敗可能是因為他需要 憑證 如果用 ``curl -k`` (k: Allow insecure server connections when using SSL

   ``let rv = s:system(['curl', '-sL', a:url], '', 1, 1)`` 多加上-k防止SSL

## 指令

- 查看config的位置指令: ``echo stdpath('config')``

### marks

{{< table/bootstrap-table table-info >}}

| @@w=7em@@Command | Description |
| ---- | ---- |
ma  |	set mark **a** at current cursor location
'a  |	jump to line of mark **a** (first non-blank character in line)
\`a  | "jump to position (line and column) of mark **a**"
d'a |	delete from current line to line of mark **a**
d\`a	| delete from current cursor position to position of mark **a**
c'a	| change text from current line to line of mark **a**
y\`a	| yank text to unnamed buffer from cursor to position of mark **a**
:marks   |	list all the current marks
:marks **aB**|	list marks **a**, **B**

*以上資料來自: [vim.fandom.com](https://vim.fandom.com/wiki/Using_marks#:~:text=To%20jump%20to%20a%20mark,exists%20in%20the%20current%20buffer.)*

{{< /table/bootstrap-table >}}

## Ctags

其實**VIM本身就有支援Tags**，至於什麼``CTags``，一狗票的Tags幹嘛的? 其實就是有一些語言，專門為他們的語法寫了個生成Tags的文件

例如``CTags``中就寫了很多關於一堆有的沒的語言合集的文件，至於你要是不爽用他們的，可以自己生成一個Tags的文件

如果您只想要創建出python的參考，可以參考如下

- [github ptags.py](https://github.com/python/cpython/blob/master/Tools/scripts/ptags.py)
- [svn-python ptags.py](http://svn.python.org/projects/python/trunk/Tools/scripts/ptags.py)
- 或是我寫的:

    {{< hide-block ptag.py >}}

```python {linenos=false, hl_lines=[123, "127-129"], linenostart=1}
import sys, re
from pathlib import Path
from typing import List
import asyncio
from asyncio import Task, Condition
# from concurrent.futures._base  import PENDING, FINISHED
# from asyncio.base_futures import _PENDING
import aiofiles
import functools


async def async_read(file_path: Path):
    try:
        async with aiofiles.open(file_path, 'r', encoding='utf-8') as f:
            return [line async for line in f]
    except:
        sys.stderr.write('Cannot open %s\n' % file_path)


class PyTagBuilder:
    __slots__ = ('tags', 'files', 'dirs',
                 'task_source_getter',
                 'q_source', 'q_data',
                 'cond_write',)

    REGEX = re.compile(r"(?P<keyword>^[ \t]*(def|class))"
                       r"(?P<name>[ \t]+([a-zA-Z0-9_]+))"
                       r"(?P<end>([ \t]*[:\\(]))")
    SEP = '\t'  # sep of C-TAGS
    NUM_FILE_FINDER = 200
    NUM_DIR_FINDER = 200
    NUM_LISTENER = 64
    DEBUG = False

    def __init__(self, files: List[Path], dirs: List[Path]):
        self.files = files
        self.dirs = dirs
        self.tags = []
        self.task_source_getter = []
        # Your queues must be created inside the loop.
        self.q_source = asyncio.Queue(maxsize=20000)
        self.q_data = asyncio.Queue(maxsize=20000)
        # self.cond = asyncio.Condition()  # got Future <Future pending> attached to a different loop

    async def _task_write(self, cond: Condition, name=None):
        while 1:
            async with cond:
                await cond.wait()  # wait until notified
                while self.q_data.qsize() > 0:
                    row_data: str = await self.q_data.get()
                    print(f'{name} write data: {row_data}') if self.DEBUG else None
                    await self._async_write(row_data)

    async def _async_write(self, row_data: str):
        async with aiofiles.open('tags', 'a', encoding='utf-8') as f:
            await f.write(self.SEP.join(row_data) + '\n')

    async def _treat_file(self, cond: Condition, name=None):

        async def put(item):
            await self.q_data.put(item)
            print(f'{name} put to write list: {item}') if self.DEBUG else None
            if self.q_data.qsize() >= int(self.q_data.maxsize / 2):
                print(f'{name} {self._treat_file.__name__} notify all') if self.DEBUG else None
                async with cond:
                    cond.notify_all()

        while 1:
            if self.q_source.empty() and all([task.done() for task in self.task_source_getter]):
                break
            file_path: Path = await self.q_source.get()
            lines = await async_read(file_path)
            row = (file_path.stem, str(file_path.absolute()), '1')  # tag of script, jump to the first line.
            await put(row)
            for j, line in enumerate(lines):
                if len(line) == 0:
                    continue
                m = self.REGEX.match(line)
                if m:
                    d = m.groupdict()
                    full_string = '/^' + m.group() + r'/'
                    if self.SEP in full_string:
                        full_string = '"' + full_string + '"'
                    row = (d['name'].strip(), str(file_path.absolute()), full_string)
                    await put(row)
        async with cond:
            cond.notify_all()

    async def _build_main(self):
        async def file_finder(name=None):
            while self.files:
                data = self.files.pop()
                print(f'{name} {file_finder.__name__} get: {str(data):<30}') if self.DEBUG else None
                await self.q_source.put(data)

        async def dir_finder(name=None):
            while self.dirs:
                dir_path = self.dirs.pop()
                print(f'{name} {dir_finder.__name__} get: {str(dir_path):<30}') if self.DEBUG else None
                for file_path in dir_path.glob('**/*.py'):
                    await self.q_source.put(file_path)

        cond_write = asyncio.Condition()
        file_finder_list = [file_finder(str(_)) for _ in range(self.NUM_FILE_FINDER)]
        dir_finder_list = [dir_finder(str(_)) for _ in range(self.NUM_DIR_FINDER)]
        writer_list = [self._task_write(cond_write, str(_)) for _ in range(128)]
        listen_list = [self._treat_file(cond_write, str(_)) for _ in range(self.NUM_LISTENER)]
        main_task = asyncio.all_tasks()
        asyncio.ALL_TASKS = functools.wraps(asyncio.all_tasks)(lambda: asyncio.all_tasks() - set(main_task))  # exclude the main_task
        self.task_source_getter = [asyncio.create_task(task) for task in (file_finder_list + dir_finder_list)]
        tasks: List[Task] = []
        tasks.extend(self.task_source_getter)
        [tasks.append(asyncio.create_task(task)) for task in listen_list]
        tasks_writer = [asyncio.create_task(task) for task in writer_list]
        await asyncio.wait(tasks)
        while 1:
            if self.q_data.qsize() == 0:
                for task in tasks_writer:
                    task.cancel()
                break
            await asyncio.sleep(0.5)

    async def build(self):
        # asyncio.run(self._build_main())
        await asyncio.create_task(self._build_main())
        import pandas as pd
        df = pd.read_csv('tags', index_col=[0], header=None, sep='\t')
        df = df.sort_values([0, ], ascending=[True, ])  # Otherwise, Tags file not sorted
        df.to_csv('tags', header=None, sep='\t')


async def async_main():
    args = sys.argv[1:]
    files = [Path(_) for _ in args if Path(_).is_file()]
    dirs = [Path(_) for _ in args if Path(_).is_dir()]
    await PyTagBuilder(files, dirs).build()


if __name__ == '__main__':
    asyncio.run(async_main())
```
{{< /hide-block >}}

要小心的是tags他是需要排序的！ 不排序會報錯

最後不管您的語言是什麼，總之[Ctags格式]就是以下這樣

> ``{tagname}\t{tagfile}\t{tagaddress}``

只要準備好這種檔案，他就會自動幫你跳過去

----

接下來談，**用現成**人家寫好的CTags來產生tags檔案

CTags 下載: {{<raw_html>}}<a href="http://ctags.sourceforge.net/"><i class="fas fa-download fa-2x"></i></a>{{</raw_html>}}

先點選左側的release然後點ctags 去找對應的版本下載，例如:

> ``https://sourceforge.net/projects/ctags/files/ctags/5.8/ctags58.zip/download``

完成之後，解壓縮，取得裡面的``ctags.exe``把它放到system32中(或者加到系統變數，讓系統能抓的到此exe)

cd到``$VIMRUNTIME``(neovim中使用: ``:echo $VIMRUNTIME`` 即可知道在哪個資料夾了)的資料夾

指令:

> ctags -R

> :orange_book: 其實ctags -R就是產生tags的文件而已，至於你的工作目錄是否是在``$VIMRUNTIME``無關緊要，完全看你的tags想要寫什麼內容進去而已

接著會生成一個文件: tags (沒有任何的附檔名)

把這個檔案(``tags``)放到: ``C:\tools\neovim\Neovim\bin`` 底下即可完成

> :exclamation: 如果重新放置了``tags``的文件需要重新啟動或載入才會生效！

[Ctags格式]: https://en.wikipedia.org/wiki/Ctags#Ctags
