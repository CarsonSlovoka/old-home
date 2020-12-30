在Hugo中如果您要取得到asset的文件，請使用：

> resources.Get

以下是一個範例:

    {{ $image := resources.Get "images/xxx.jpg" }}

等同取得:

> ./assets/images/xxx.jpg
