+++
title = "go-admin"
description=""
date = 2021-02-26T18:45:47+08:00
lastmod = 2021-02-26
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

## 前言

前言之前寫了一個舊內容主要是在談go的版本比較新會裝不起來，

但後來我又用新的版本再從裝，就沒發現問題了，確實可以用golang 1.6去跑go-admin

### (已棄用，請忽略) ~~go版本~~

請先確定您裝的go版本是什麼

> go version

接著請考慮跟著套件的版本走，而不是盲目的追尋潮流(要潮就要解一堆奇奇怪怪的問題，然後解完，這個版本只有你自己在用...)

{{< details "我自己遇到的問題" >}}

我一開始是用golang 1.16，但後來遇到[multiple-value uuid.NewV4() in single-value context](https://github.com/GoAdminGroup/go-admin/issues/93#issuecomment-550296588)

後來改用和 [go-admin相同的版本](https://github.com/GoAdminGroup/go-admin/blob/master/go.mod#L3) 就沒問題了

{{< /details >}}

----

- [gin-gonic/gin/go.mod](https://github.com/gin-gonic/gin/blob/master/go.mod)
- [GoAdminGroup/go-admin/go.mod](https://github.com/GoAdminGroup/go-admin/blob/master/go.mod)

go-admin也就算了，但是gin應該就很多人在用了，所以如果你用的版本不是和它一樣，就建議改掉！

下載相對應的golang版本，[golang download](https://golang.org/dl/)

下載zip檔案就好了，msi檔案主要給比較毫無頭緒的玩家使用(如果你抓多個golang版本，他一開始就問你，你已經抓了golang要解除安裝還是要離開...)

#### 多個golang安裝

以下是我的結構(您可以隨意不一定要照我的方式)

以下兩個環境變數要設定:

  - GOPATH: ``%USERPROFILE%\go\1.13.15``  (您可以加在使用者的環境變數中
    - 📁 bin
    - 📁 pkg
    - 📁 src

    > GOPATH要有這三個資料夾才可以！

  - PATH: ``%ProgramFiles%\Go\1.13.15\bin``
      - ``go env`` 其實就已經知道GOROOT在哪了，但是IDE不知道

GOROOT可以在golang的IDE設置go SDK用的

  - GOROOT: ``%ProgramFiles%\Go\1.13.15``


## go-admin是什麼？

| repository |  |  |
| ------ | ----- | ----- |
| [go-admin] | {{< github/get_info_img GoAdminGroup go-admin stars >}} | {{< github/get_info_img GoAdminGroup go-admin forks "https://www.google.com/" >}} |

- 🚀 高生产效率: 10分钟内做一个好看的管理后台
- 🎨 主题: 默认为adminlte，更多好看的主题正在制作中，欢迎给我们留言
- 🔢 插件化: 提供插件使用，真正实现一个插件解决不了问题，那就两个
- ✅ 认证: 开箱即用的[rbac认证系统](https://en.wikipedia.org/wiki/Role-based_access_control)
 -⚙ 框架支持: 支持大部分框架接入，让你更容易去上手和扩展

好，總之就各種好棒棒...讓我們繼續往下看要怎麼弄


## Getting Started

### 為您的資料庫新增一些資料表和欄位

你可能自己已經在一些網站爬過文，那麼人家一開就叫你匯入SQL...

他會要求導入sql，是因為go-admin可以讓您客製化面板，那麼您總不希望成功運行之後什麼東西都沒看到對吧，

- [SQL](https://github.com/eddycjy/go-gin-example/blob/master/docs/sql/blog.sql)
- 這是從上面的SQL改來的postgreSQL版本
  {{< details "postgreSQL" >}}
  ```sql
  SET search_path = carsonsite;  -- USE DatabaseName;

  -- ----------------------------
  -- Table structure for blog_article
  -- ----------------------------
  DROP TABLE IF EXISTS public.blog_article;  -- public是schema的名稱，如果您的schema名稱是別的就要改掉
  CREATE TABLE public.blog_article (  -- https://www.postgresqltutorial.com/postgresql-create-table/
    id SERIAL NOT NULL,  -- https://www.postgresqltutorial.com/postgresql-serial/
    tag_id SERIAL,
    title varchar(100) DEFAULT '',
    "desc" varchar(255) DEFAULT '',
    content text,
    cover_image_url varchar(255) DEFAULT '',
    created_on int DEFAULT '0',
    created_by varchar(100) DEFAULT '',
    modified_on int DEFAULT '0',
    modified_by varchar(255) DEFAULT '',
    deleted_on int DEFAULT '0',
    state smallint DEFAULT '1',  -- https://www.postgresqltutorial.com/postgresql-data-types/
    PRIMARY KEY (id)
  );

  -- https://www.postgresql.org/docs/9.1/sql-comment.html
  COMMENT ON COLUMN public.blog_article.tag_id IS '標籤ID';
  COMMENT ON COLUMN public.blog_article.title IS '文章标题';
  COMMENT ON COLUMN public.blog_article.desc IS '简述';
  COMMENT ON COLUMN public.blog_article.content IS '内容';
  COMMENT ON COLUMN public.blog_article.cover_image_url IS '封面图片地址';
  COMMENT ON COLUMN public.blog_article.created_on IS '新建时间';
  COMMENT ON COLUMN public.blog_article.created_by IS '创建人';
  COMMENT ON COLUMN public.blog_article.modified_on IS '修改时间';
  COMMENT ON COLUMN public.blog_article.modified_by IS '修改人';
  COMMENT ON COLUMN public.blog_article.deleted_on IS '删除时间';
  COMMENT ON TABLE public.blog_article IS '文章管理';

  -- ----------------------------
  -- Table structure for blog_auth
  -- ----------------------------
  DROP TABLE IF EXISTS public.blog_auth;
  CREATE TABLE public.blog_auth (
    id SERIAL NOT NULL,
    username varchar(50) DEFAULT '',
    password varchar(50) DEFAULT '',
    PRIMARY KEY (id)
  );

  COMMENT ON COLUMN public.blog_auth.username IS '账号';
  COMMENT ON COLUMN public.blog_auth.password IS '密码';

  INSERT INTO public.blog_auth (id, username, password) VALUES ('1', 'test', 'test123');

  -- ----------------------------
  -- Table structure for blog_tag
  -- ----------------------------
  DROP TABLE IF EXISTS public.blog_tag;
  CREATE TABLE public.blog_tag (
    id SERIAL NOT NULL,
    name varchar(100) DEFAULT '',
    created_on int DEFAULT '0',
    created_by varchar(100) DEFAULT '',
    modified_on int DEFAULT '0',
    modified_by varchar(100) DEFAULT '',
    deleted_on int DEFAULT '0',
    state smallint NOT NULL DEFAULT '1',
    PRIMARY KEY (id)
  );

  COMMENT ON COLUMN public.blog_tag.name IS '标签名称';
  COMMENT ON COLUMN public.blog_tag.created_on IS '创建时间';
  COMMENT ON COLUMN public.blog_tag.created_by IS '创建人';
  COMMENT ON COLUMN public.blog_tag.modified_on IS '修改时间';
  COMMENT ON COLUMN public.blog_tag.modified_by IS '修改人';
  COMMENT ON COLUMN public.blog_tag.deleted_on IS '删除时间';
  COMMENT ON COLUMN public.blog_tag.state IS '状态 0为禁用、1为启用';
  COMMENT ON TABLE public.blog_tag IS '文章标签管理';
  ```
  {{< /details >}}

{{< set-id "三個資料表" "他要這三個資料表">}}
```
- blog_article
- blog_auth
- blog_tag
```

### [安裝gcc](https://en.wikipedia.org/wiki/GNU_Compiler_Collection)

如果沒有裝gcc等一下裝goAdmin可能會失敗！

參考[gcc安裝]({{< ref "package_manager#一些常用的安裝項目" >}})

大致上就是先裝choco，然後

> choco install mingw -y

就裝完gcc了，檢查:

> gcc -V

要查看gcc裝在哪邊可以用 [gcm](https://superuser.com/a/1605156) 去檢查

### 安裝GoAdmin的工具

```
GO111MODULE=on  (go env -w GO111MODULE=on)
GOPROXY=https://goproxy.cn
go install github.com/GoAdminGroup/go-admin/adm  (如果失敗就改用go get)
```

- GOPROXY一定要用cn的那個嗎？
  > 不一定。 go-admin就是中國人設計的，中國沒辦法用``https://proxy.golang.org``所以才用那個。

----

完成以後您就可以下指令:

> adm -V
>
> 輸出: GoAdmin CLI v1.2.7

如果沒有成功請檢查``$GOPATH/bin``這個路徑是不是有在您的環境變數之中，因為adm.exe就放在這邊。

### 再匯入goadmin需要用到的資料表

導入GoAdmin所需的sql文件進數據庫中

#### 生成資料表

可以直接在[go-admin/data](https://github.com/GoAdminGroup/go-admin/tree/master/data) 找尋適用於您資料庫的sql

我是用postgresql，所以以下只特別講這個

- [postgresql](https://raw.githubusercontent.com/GoAdminGroup/go-admin/master/data/admin.pgsql)

  > 如果您使用上面的腳本，必須在psql中運行而不是pgAdmin，因為stdin沒有辦法在pgAdmin中運行[詳](https://dba.stackexchange.com/a/41040)

  ~~這個是我的版本~~:{{< details "~~postgreSQL純資料表無內容~~" >}}
  ```sql
  --
  -- PostgreSQL database dump
  --

  -- Dumped from database version 9.5.14
  -- Dumped by pg_dump version 10.5

  -- ALTER DATABASE name OWNER TO new_owner;  -- 如果遇到rule的錯誤 請嘗試這個
  -- CREATE ROLE Carson superuser;

  SET search_path = carsonsite;  -- USE DatabaseName;
  SET statement_timeout = 0;
  SET lock_timeout = 0;
  SET idle_in_transaction_session_timeout = 0;
  SET client_encoding = 'UTF8';
  SET standard_conforming_strings = on;
  SELECT pg_catalog.set_config('search_path', '', false);
  SET check_function_bodies = false;
  SET client_min_messages = warning;
  SET row_security = off;

  --
  -- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
  --

  CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


  --
  -- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
  --

  COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


  --
  -- Name: goadmin_menu_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
  --

  CREATE SEQUENCE public.goadmin_menu_myid_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 99999999
  CACHE 1;


  ALTER TABLE public.goadmin_menu_myid_seq OWNER TO Carson;

  SET default_tablespace = '';

  SET default_with_oids = false;

  --
  -- Name: goadmin_menu; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_menu (
  id integer DEFAULT nextval('public.goadmin_menu_myid_seq'::regclass) NOT NULL,
  parent_id integer DEFAULT 0 NOT NULL,
  type integer DEFAULT 0,
  "order" integer DEFAULT 0 NOT NULL,
  title character varying(50) NOT NULL,
  header character varying(100),
  plugin_name character varying(100) NOT NULL,
  icon character varying(50) NOT NULL,
  uri character varying(3000) NOT NULL,
  uuid character varying(100),
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_menu OWNER TO Carson;

  --
  -- Name: goadmin_operation_log_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
  --

  CREATE SEQUENCE public.goadmin_operation_log_myid_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 99999999
  CACHE 1;


  ALTER TABLE public.goadmin_operation_log_myid_seq OWNER TO Carson;

  --
  -- Name: goadmin_operation_log; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_operation_log (
  id integer DEFAULT nextval('public.goadmin_operation_log_myid_seq'::regclass) NOT NULL,
  user_id integer NOT NULL,
  path character varying(255) NOT NULL,
  method character varying(10) NOT NULL,
  ip character varying(15) NOT NULL,
  input text NOT NULL,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_operation_log OWNER TO Carson;

  --
  -- Name: goadmin_site_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
  --

  CREATE SEQUENCE public.goadmin_site_myid_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 99999999
  CACHE 1;


  ALTER TABLE public.goadmin_site_myid_seq OWNER TO Carson;

  --
  -- Name: goadmin_site; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_site (
  id integer DEFAULT nextval('public.goadmin_site_myid_seq'::regclass) NOT NULL,
  key character varying(100) NOT NULL,
  value text NOT NULL,
  type integer DEFAULT 0,
  description character varying(3000),
  state integer DEFAULT 0,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_site OWNER TO Carson;

  --
  -- Name: goadmin_permissions_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
  --

  CREATE SEQUENCE public.goadmin_permissions_myid_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 99999999
  CACHE 1;


  ALTER TABLE public.goadmin_permissions_myid_seq OWNER TO Carson;

  --
  -- Name: goadmin_permissions; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_permissions (
  id integer DEFAULT nextval('public.goadmin_permissions_myid_seq'::regclass) NOT NULL,
  name character varying(50) NOT NULL,
  slug character varying(50) NOT NULL,
  http_method character varying(255),
  http_path text NOT NULL,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_permissions OWNER TO Carson;

  --
  -- Name: goadmin_role_menu; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_role_menu (
  role_id integer NOT NULL,
  menu_id integer NOT NULL,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_role_menu OWNER TO Carson;

  --
  -- Name: goadmin_role_permissions; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_role_permissions (
  role_id integer NOT NULL,
  permission_id integer NOT NULL,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_role_permissions OWNER TO Carson;

  --
  -- Name: goadmin_role_users; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_role_users (
  role_id integer NOT NULL,
  user_id integer NOT NULL,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_role_users OWNER TO Carson;

  --
  -- Name: goadmin_roles_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
  --

  CREATE SEQUENCE public.goadmin_roles_myid_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 99999999
  CACHE 1;


  ALTER TABLE public.goadmin_roles_myid_seq OWNER TO Carson;

  --
  -- Name: goadmin_roles; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_roles (
  id integer DEFAULT nextval('public.goadmin_roles_myid_seq'::regclass) NOT NULL,
  name character varying NOT NULL,
  slug character varying NOT NULL,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_roles OWNER TO Carson;

  --
  -- Name: goadmin_session_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
  --

  CREATE SEQUENCE public.goadmin_session_myid_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 99999999
  CACHE 1;


  ALTER TABLE public.goadmin_session_myid_seq OWNER TO Carson;

  --
  -- Name: goadmin_session; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_session (
  id integer DEFAULT nextval('public.goadmin_session_myid_seq'::regclass) NOT NULL,
  sid character varying(50) NOT NULL,
  "values" character varying(3000) NOT NULL,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_session OWNER TO Carson;

  --
  -- Name: goadmin_user_permissions; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_user_permissions (
  user_id integer NOT NULL,
  permission_id integer NOT NULL,
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_user_permissions OWNER TO Carson;

  --
  -- Name: goadmin_users_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
  --

  CREATE SEQUENCE public.goadmin_users_myid_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  MAXVALUE 99999999
  CACHE 1;


  ALTER TABLE public.goadmin_users_myid_seq OWNER TO Carson;

  --
  -- Name: goadmin_users; Type: TABLE; Schema: public; Owner: Carson
  --

  CREATE TABLE public.goadmin_users (
  id integer DEFAULT nextval('public.goadmin_users_myid_seq'::regclass) NOT NULL,
  username character varying(100) NOT NULL,
  password character varying(100) NOT NULL,
  name character varying(100) NOT NULL,
  avatar character varying(255),
  remember_token character varying(100),
  created_at timestamp without time zone DEFAULT now(),
  updated_at timestamp without time zone DEFAULT now()
  );


  ALTER TABLE public.goadmin_users OWNER TO Carson;

  --
  -- Data for Name: goadmin_menu; Type: TABLE DATA; Schema: public; Owner: Carson
  --





  --
  -- Data for Name: goadmin_operation_log; Type: TABLE DATA; Schema: public; Owner: Carson
  --




  --
  -- Data for Name: goadmin_site; Type: TABLE DATA; Schema: public; Owner: Carson
  --





  --
  -- Data for Name: goadmin_permissions; Type: TABLE DATA; Schema: public; Owner: Carson
  --



  --
  -- Data for Name: goadmin_role_menu; Type: TABLE DATA; Schema: public; Owner: Carson
  --





  --
  -- Data for Name: goadmin_role_permissions; Type: TABLE DATA; Schema: public; Owner: Carson
  --




  --
  -- Data for Name: goadmin_role_users; Type: TABLE DATA; Schema: public; Owner: Carson
  --




  --
  -- Data for Name: goadmin_roles; Type: TABLE DATA; Schema: public; Owner: Carson
  --




  --
  -- Data for Name: goadmin_session; Type: TABLE DATA; Schema: public; Owner: Carson
  --





  --
  -- Data for Name: goadmin_user_permissions; Type: TABLE DATA; Schema: public; Owner: Carson
  --




  --
  -- Data for Name: goadmin_users; Type: TABLE DATA; Schema: public; Owner: Carson
  --



  --
  -- Name: goadmin_menu_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
  --

  SELECT pg_catalog.setval('public.goadmin_menu_myid_seq', 7, true);


  --
  -- Name: goadmin_operation_log_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
  --

  SELECT pg_catalog.setval('public.goadmin_operation_log_myid_seq', 1, true);


  --
  -- Name: goadmin_permissions_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
  --

  SELECT pg_catalog.setval('public.goadmin_permissions_myid_seq', 2, true);


  --
  -- Name: goadmin_roles_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
  --

  SELECT pg_catalog.setval('public.goadmin_roles_myid_seq', 2, true);


  --
  -- Name: goadmin_site_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
  --

  SELECT pg_catalog.setval('public.goadmin_site_myid_seq', 1, true);


  --
  -- Name: goadmin_session_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
  --

  SELECT pg_catalog.setval('public.goadmin_session_myid_seq', 1, true);


  --
  -- Name: goadmin_users_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
  --

  SELECT pg_catalog.setval('public.goadmin_users_myid_seq', 2, true);


  --
  -- Name: goadmin_menu goadmin_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
  --

  ALTER TABLE ONLY public.goadmin_menu
  ADD CONSTRAINT goadmin_menu_pkey PRIMARY KEY (id);


  --
  -- Name: goadmin_operation_log goadmin_operation_log_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
  --

  ALTER TABLE ONLY public.goadmin_operation_log
  ADD CONSTRAINT goadmin_operation_log_pkey PRIMARY KEY (id);


  --
  -- Name: goadmin_permissions goadmin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
  --

  ALTER TABLE ONLY public.goadmin_permissions
  ADD CONSTRAINT goadmin_permissions_pkey PRIMARY KEY (id);


  --
  -- Name: goadmin_roles goadmin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
  --

  ALTER TABLE ONLY public.goadmin_roles
  ADD CONSTRAINT goadmin_roles_pkey PRIMARY KEY (id);


  --
  -- Name: goadmin_site goadmin_site_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
  --

  ALTER TABLE ONLY public.goadmin_site
  ADD CONSTRAINT goadmin_site_pkey PRIMARY KEY (id);


  --
  -- Name: goadmin_session goadmin_session_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
  --

  ALTER TABLE ONLY public.goadmin_session
  ADD CONSTRAINT goadmin_session_pkey PRIMARY KEY (id);


  --
  -- Name: goadmin_users goadmin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
  --

  ALTER TABLE ONLY public.goadmin_users
  ADD CONSTRAINT goadmin_users_pkey PRIMARY KEY (id);


  --
  -- Name: SCHEMA public; Type: ACL; Schema: -; Owner: Carson
  --

  REVOKE ALL ON SCHEMA public FROM PUBLIC;
  REVOKE ALL ON SCHEMA public FROM Carson;
  GRANT ALL ON SCHEMA public TO Carson;
  GRANT ALL ON SCHEMA public TO PUBLIC;


  --
  -- PostgreSQL database dump complete
  --
  ```
  {{< /details >}}

#### (已棄用，請忽略) ~~插入內容~~

不行只有空的資料表，他的一些內容在啟動的時候需要用到，舉例來說

goadmin_users資料表掌控登入的資訊，所以如果裡面是空的，那就永遠沒辦法登入進去(詳:[#155](https://github.com/GoAdminGroup/go-admin/issues/155#issuecomment-595522308))

##### (已棄用，請忽略) ~~新建使用者~~

以下請自行斟酌修改

```sql
INSERT INTO public.goadmin_users(
id, username, password, name)
VALUES (1, 'admin', 'admin', 'carson');
```


#### 使用psql來生成資料表和內容

我發現如果要先插入資料表再插入內容，會很麻煩，所以還是psql來解決[詳](https://stackoverflow.com/a/47088848)

打開psql的console，他會問以下東西:

```
Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:**********
```

完成之後，使用``\c``來連接資料庫 (如果已經是您的資料庫，就可以忽略這個步驟)

```
postgres=# \c yourdatabase;
```

然後用``\i``把sql檔案丟給它即可

```
carsonsite=# \i 'c:/path/path/data/data.sql'
```

> 注意！ 是用``/``而不是``\``，此外用``'``把路徑包起來，不然可能會遇到permission denied [詳](https://dba.stackexchange.com/a/29773)

最後附上我的data.sql
{{< details "data.sql">}}
```sql
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 10.5

-- ALTER DATABASE name OWNER TO new_owner;  -- 如果遇到rule的錯誤 請嘗試這個
-- CREATE ROLE Carson superuser;

SET search_path = carsonsite;  -- USE DatabaseName;
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: goadmin_menu_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
--

CREATE SEQUENCE public.goadmin_menu_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.goadmin_menu_myid_seq OWNER TO Carson;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: goadmin_menu; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_menu (
                                     id integer DEFAULT nextval('public.goadmin_menu_myid_seq'::regclass) NOT NULL,
                                     parent_id integer DEFAULT 0 NOT NULL,
                                     type integer DEFAULT 0,
                                     "order" integer DEFAULT 0 NOT NULL,
                                     title character varying(50) NOT NULL,
                                     header character varying(100),
                                     plugin_name character varying(100) NOT NULL,
                                     icon character varying(50) NOT NULL,
                                     uri character varying(3000) NOT NULL,
                                     uuid character varying(100),
                                     created_at timestamp without time zone DEFAULT now(),
                                     updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_menu OWNER TO Carson;

--
-- Name: goadmin_operation_log_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
--

CREATE SEQUENCE public.goadmin_operation_log_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.goadmin_operation_log_myid_seq OWNER TO Carson;

--
-- Name: goadmin_operation_log; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_operation_log (
                                              id integer DEFAULT nextval('public.goadmin_operation_log_myid_seq'::regclass) NOT NULL,
                                              user_id integer NOT NULL,
                                              path character varying(255) NOT NULL,
                                              method character varying(10) NOT NULL,
                                              ip character varying(15) NOT NULL,
                                              input text NOT NULL,
                                              created_at timestamp without time zone DEFAULT now(),
                                              updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_operation_log OWNER TO Carson;

--
-- Name: goadmin_site_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
--

CREATE SEQUENCE public.goadmin_site_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.goadmin_site_myid_seq OWNER TO Carson;

--
-- Name: goadmin_site; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_site (
                                     id integer DEFAULT nextval('public.goadmin_site_myid_seq'::regclass) NOT NULL,
                                     key character varying(100) NOT NULL,
                                     value text NOT NULL,
                                     type integer DEFAULT 0,
                                     description character varying(3000),
                                     state integer DEFAULT 0,
                                     created_at timestamp without time zone DEFAULT now(),
                                     updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_site OWNER TO Carson;

--
-- Name: goadmin_permissions_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
--

CREATE SEQUENCE public.goadmin_permissions_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.goadmin_permissions_myid_seq OWNER TO Carson;

--
-- Name: goadmin_permissions; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_permissions (
                                            id integer DEFAULT nextval('public.goadmin_permissions_myid_seq'::regclass) NOT NULL,
                                            name character varying(50) NOT NULL,
                                            slug character varying(50) NOT NULL,
                                            http_method character varying(255),
                                            http_path text NOT NULL,
                                            created_at timestamp without time zone DEFAULT now(),
                                            updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_permissions OWNER TO Carson;

--
-- Name: goadmin_role_menu; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_role_menu (
                                          role_id integer NOT NULL,
                                          menu_id integer NOT NULL,
                                          created_at timestamp without time zone DEFAULT now(),
                                          updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_role_menu OWNER TO Carson;

--
-- Name: goadmin_role_permissions; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_role_permissions (
                                                 role_id integer NOT NULL,
                                                 permission_id integer NOT NULL,
                                                 created_at timestamp without time zone DEFAULT now(),
                                                 updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_role_permissions OWNER TO Carson;

--
-- Name: goadmin_role_users; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_role_users (
                                           role_id integer NOT NULL,
                                           user_id integer NOT NULL,
                                           created_at timestamp without time zone DEFAULT now(),
                                           updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_role_users OWNER TO Carson;

--
-- Name: goadmin_roles_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
--

CREATE SEQUENCE public.goadmin_roles_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.goadmin_roles_myid_seq OWNER TO Carson;

--
-- Name: goadmin_roles; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_roles (
                                      id integer DEFAULT nextval('public.goadmin_roles_myid_seq'::regclass) NOT NULL,
                                      name character varying NOT NULL,
                                      slug character varying NOT NULL,
                                      created_at timestamp without time zone DEFAULT now(),
                                      updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_roles OWNER TO Carson;

--
-- Name: goadmin_session_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
--

CREATE SEQUENCE public.goadmin_session_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.goadmin_session_myid_seq OWNER TO Carson;

--
-- Name: goadmin_session; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_session (
                                        id integer DEFAULT nextval('public.goadmin_session_myid_seq'::regclass) NOT NULL,
                                        sid character varying(50) NOT NULL,
                                        "values" character varying(3000) NOT NULL,
                                        created_at timestamp without time zone DEFAULT now(),
                                        updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_session OWNER TO Carson;

--
-- Name: goadmin_user_permissions; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_user_permissions (
                                                 user_id integer NOT NULL,
                                                 permission_id integer NOT NULL,
                                                 created_at timestamp without time zone DEFAULT now(),
                                                 updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_user_permissions OWNER TO Carson;

--
-- Name: goadmin_users_myid_seq; Type: SEQUENCE; Schema: public; Owner: Carson
--

CREATE SEQUENCE public.goadmin_users_myid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999
    CACHE 1;


ALTER TABLE public.goadmin_users_myid_seq OWNER TO Carson;

--
-- Name: goadmin_users; Type: TABLE; Schema: public; Owner: Carson
--

CREATE TABLE public.goadmin_users (
                                      id integer DEFAULT nextval('public.goadmin_users_myid_seq'::regclass) NOT NULL,
                                      username character varying(100) NOT NULL,
                                      password character varying(100) NOT NULL,
                                      name character varying(100) NOT NULL,
                                      avatar character varying(255),
                                      remember_token character varying(100),
                                      created_at timestamp without time zone DEFAULT now(),
                                      updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goadmin_users OWNER TO Carson;

--
-- Data for Name: goadmin_menu; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_menu (id, parent_id, type, "order", title, plugin_name, header, icon, uri, created_at, updated_at) FROM stdin;
1	0	1	2	Admin		\N	fa-tasks		2019-09-10 00:00:00	2019-09-10 00:00:00
2	1	1	2	Users		\N	fa-users	/info/manager	2019-09-10 00:00:00	2019-09-10 00:00:00
3	1	1	3	Roles		\N	fa-user	/info/roles	2019-09-10 00:00:00	2019-09-10 00:00:00
4	1	1	4	Permission		\N	fa-ban	/info/permission	2019-09-10 00:00:00	2019-09-10 00:00:00
5	1	1	5	Menu		\N	fa-bars	/menu	2019-09-10 00:00:00	2019-09-10 00:00:00
6	1	1	6	Operation log		\N	fa-history	/info/op	2019-09-10 00:00:00	2019-09-10 00:00:00
7	0	1	1	Dashboard		\N	fa-bar-chart	/	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: goadmin_operation_log; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_operation_log (id, user_id, path, method, ip, input, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: goadmin_site; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_site (id, key, value, description, state, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: goadmin_permissions; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_permissions (id, name, slug, http_method, http_path, created_at, updated_at) FROM stdin;
1	All permission	*		*	2019-09-10 00:00:00	2019-09-10 00:00:00
2	Dashboard	dashboard	GET,PUT,POST,DELETE	/	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: goadmin_role_menu; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_role_menu (role_id, menu_id, created_at, updated_at) FROM stdin;
1	1	2019-09-10 00:00:00	2019-09-10 00:00:00
1	7	2019-09-10 00:00:00	2019-09-10 00:00:00
2	7	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: goadmin_role_permissions; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_role_permissions (role_id, permission_id, created_at, updated_at) FROM stdin;
1	1	2019-09-10 00:00:00	2019-09-10 00:00:00
1	2	2019-09-10 00:00:00	2019-09-10 00:00:00
2	2	2019-09-10 00:00:00	2019-09-10 00:00:00
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
0	3	\N	\N
\.


--
-- Data for Name: goadmin_role_users; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_role_users (role_id, user_id, created_at, updated_at) FROM stdin;
1	1	2019-09-10 00:00:00	2019-09-10 00:00:00
2	2	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: goadmin_roles; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_roles (id, name, slug, created_at, updated_at) FROM stdin;
1	Administrator	administrator	2019-09-10 00:00:00	2019-09-10 00:00:00
2	Operator	operator	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Data for Name: goadmin_session; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_session (id, sid, "values", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: goadmin_user_permissions; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_user_permissions (user_id, permission_id, created_at, updated_at) FROM stdin;
1	1	2019-09-10 00:00:00	2019-09-10 00:00:00
2	2	2019-09-10 00:00:00	2019-09-10 00:00:00
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
0	1	\N	\N
\.


--
-- Data for Name: goadmin_users; Type: TABLE DATA; Schema: public; Owner: Carson
--

COPY public.goadmin_users (id, username, password, name, avatar, remember_token, created_at, updated_at) FROM stdin;
1	admin	$2a$10$OxWYJJGTP2gi00l2x06QuOWqw5VR47MQCJ0vNKnbMYfrutij10Hwe	admin		tlNcBVK9AvfYH7WEnwB1RKvocJu8FfRy4um3DJtwdHuJy0dwFsLOgAc0xUfh	2019-09-10 00:00:00	2019-09-10 00:00:00
2	operator	$2a$10$rVqkOzHjN2MdlEprRflb1eGP0oZXuSrbJLOmJagFsCd81YZm0bsh.	Operator		\N	2019-09-10 00:00:00	2019-09-10 00:00:00
\.


--
-- Name: goadmin_menu_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
--

SELECT pg_catalog.setval('public.goadmin_menu_myid_seq', 7, true);


--
-- Name: goadmin_operation_log_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
--

SELECT pg_catalog.setval('public.goadmin_operation_log_myid_seq', 1, true);


--
-- Name: goadmin_permissions_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
--

SELECT pg_catalog.setval('public.goadmin_permissions_myid_seq', 2, true);


--
-- Name: goadmin_roles_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
--

SELECT pg_catalog.setval('public.goadmin_roles_myid_seq', 2, true);


--
-- Name: goadmin_site_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
--

SELECT pg_catalog.setval('public.goadmin_site_myid_seq', 1, true);


--
-- Name: goadmin_session_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
--

SELECT pg_catalog.setval('public.goadmin_session_myid_seq', 1, true);


--
-- Name: goadmin_users_myid_seq; Type: SEQUENCE SET; Schema: public; Owner: Carson
--

SELECT pg_catalog.setval('public.goadmin_users_myid_seq', 2, true);


--
-- Name: goadmin_menu goadmin_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
--

ALTER TABLE ONLY public.goadmin_menu
    ADD CONSTRAINT goadmin_menu_pkey PRIMARY KEY (id);


--
-- Name: goadmin_operation_log goadmin_operation_log_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
--

ALTER TABLE ONLY public.goadmin_operation_log
    ADD CONSTRAINT goadmin_operation_log_pkey PRIMARY KEY (id);


--
-- Name: goadmin_permissions goadmin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
--

ALTER TABLE ONLY public.goadmin_permissions
    ADD CONSTRAINT goadmin_permissions_pkey PRIMARY KEY (id);


--
-- Name: goadmin_roles goadmin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
--

ALTER TABLE ONLY public.goadmin_roles
    ADD CONSTRAINT goadmin_roles_pkey PRIMARY KEY (id);


--
-- Name: goadmin_site goadmin_site_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
--

ALTER TABLE ONLY public.goadmin_site
    ADD CONSTRAINT goadmin_site_pkey PRIMARY KEY (id);


--
-- Name: goadmin_session goadmin_session_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
--

ALTER TABLE ONLY public.goadmin_session
    ADD CONSTRAINT goadmin_session_pkey PRIMARY KEY (id);


--
-- Name: goadmin_users goadmin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: Carson
--

ALTER TABLE ONLY public.goadmin_users
    ADD CONSTRAINT goadmin_users_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: Carson
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM Carson;
GRANT ALL ON SCHEMA public TO Carson;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
```
{{< /details >}}

基本上和官方的[postgresql](https://raw.githubusercontent.com/GoAdminGroup/go-admin/master/data/admin.pgsql) 一樣

差別只有:

> Owner TO: ~~postgres~~ -> Carson


#### 小節

連同我們前面講的[三個blog資料表]({{<ref "#三個資料表" >}})

```
- blog_article
- blog_auth
- blog_tag
- goadmin_menu
- goadmin_operation_log
- goadmin_permissions
- goadmin_role_menu
- goadmin_role_permissions
- goadmin_role_users
- goadmin_roles
- goadmin_session
- goadmin_user_permissions
- goadmin_users
```

至此，請確保您的資料庫有以上這些資料表

### 生成數據模型代碼

建立一個您想要的專案名稱，然後cd過去，接著

> ``adm generate``

他會問你要的資料庫是哪一個，選擇您要的就好了

```
? choose a driver  [Use arrows to move, type to filter, enter to select]
  mysql
> postgresql
  sqlite
  mssql
```

問相關的設定

```
? choose a driver mysql
? sql address 127.0.0.1
? sql port (5432)
? sql username (postgres)
? sql password ****
? sql schema (public)
? sql database name carsonsite
```

可以管理那些資料表

```
? choose table to generate  [Use arrows to move, space to select, type to filter]
> [x]  [select all]  (按下space可以選擇)
  [ ]  blog_article
  [ ]  blog_auth
  [ ]  blog_tag
```

接著還有一些相關的設定，我們都用預設的即可

```
? set package name main
? set connection name default
? set file output path (./)
? generate permission records for tables  [Use arrows to move, type to filter, enter to select]
> yes
```

完成之後的訊息:

```
✔ generating:

 100% |████████████████████████████████████████| [0s:0s]

Generate data table models success~~��

# 以下這些只是告訴您可以參考一些資料，以及訪問論壇而已
see the docs: https://book.go-admin.com
visit forum: http://discuss.go-admin.com
```

最後您可以看到這些文件被生成:

```
.
├── tables.go
├── blog_article.go
├── blog_auth.go
└── blog_tag.go
```

### 編寫main.go

{{< table/code-by-example "|20%" >}}

注意本篇代碼是使用gin-gonic他配go-adm，他也有其他的配法不一定要用gin-gonic。

第6列: 請選擇適合自己的資料庫

34-41要改成自己的設定

@@NEW-COL@@

```go {linenos=inline,hl_lines=[6,"34-41"]}
package main

import ( // https://golang.org/pkg/

    _ "github.com/GoAdminGroup/go-admin/adapter/gin"              // 适配器
    _ "github.com/GoAdminGroup/go-admin/modules/db/drivers/postgres" // postgres 驅動  // panic: sql: unknown driver "postgres" (forgotten import?)
    _ "github.com/GoAdminGroup/themes/adminlte"                   // 引入ui主题，必须引入，不然报错


    "github.com/GoAdminGroup/go-admin/engine"
    "github.com/GoAdminGroup/go-admin/examples/datamodel"
    "github.com/GoAdminGroup/go-admin/modules/config"
    "github.com/GoAdminGroup/go-admin/modules/db"
    "github.com/GoAdminGroup/go-admin/modules/language"
    "github.com/GoAdminGroup/go-admin/template"
    "github.com/GoAdminGroup/go-admin/template/chartjs"
    "github.com/gin-gonic/gin"
    "io/ioutil"
)

func main() {
    r := gin.Default()

    gin.SetMode(gin.ReleaseMode)
    gin.DefaultWriter = ioutil.Discard

    eng := engine.Default()

    template.AddComp(chartjs.NewChart())

    if err := eng.AddConfig(config.Config{
        Databases: config.DatabaseList{
            "default": {
                Host:       "127.0.0.1",
                Port:       "5432",
                User:       "postgres",
                Pwd:        "",
                Name:       "", // database name
                MaxIdleCon: 50,
                MaxOpenCon: 150,
                Driver:     db.DriverPostgresql, // db.DriverMysql,
            },
        },
        UrlPrefix: "admin",
        IndexUrl:  "/",
        Debug:     true,
        Language:  language.CN,
    }).
        AddGenerators(Generators).
        Use(r); err != nil {
        panic(err)
    }

    r.Static("/uploads", "./uploads")

    eng.HTML("GET", "/admin", datamodel.GetContent)

    _ = r.Run(":9033")
}
```

{{< /table/code-by-example >}}

寫完代碼之後

> go run .

```
> go run .

[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

GoAdmin is now running.
Running in "debug" mode. Switch to "release" mode in production.
```

看到GoAdmin is now running.就表示成功了

您可以開始訪問: [http://localhost:9033/admin/login](http://localhost:9033/admin/login)

預設的帳號密碼都是:``admin``

## 客製化

如果您要訪問menu頁面，即: [http://localhost:9033/admin/menu](http://localhost:9033/admin/menu)

那麼您要編寫一個``tables.go``文件，如下:

```go
package main

import "github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"

// The key of Generators is the prefix of table info url.
// The corresponding value is the Form and Table data.
//
// http://{{config.Domain}}:{{Port}}/{{config.Prefix}}/info/{{key}}
//
// example:
//
// "blog_article" => http://localhost:9033/admin/info/blog_article
// "blog_auth" => http://localhost:9033/admin/info/blog_auth
// "blog_tag" => http://localhost:9033/admin/info/blog_tag
//
// example end
//
var Generators = map[string]table.Generator{
    "blog_article": GetBlogArticleTable,
    "blog_auth":    GetBlogAuthTable,
    "blog_tag":     GetBlogTagTable,

    // generators end
}
```



## 參考資料

- ★[使用GoAdmin极速搭建golang应用管理后台]


[go-admin]: https://github.com/GoAdminGroup/go-admin
[使用GoAdmin极速搭建golang应用管理后台]: https://segmentfault.com/a/1190000022215579
