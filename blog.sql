SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS  `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert into `auth_group`(`id`,`name`) values
('1','general');
DROP TABLE IF EXISTS  `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

insert into `auth_group_permissions`(`id`,`group_id`,`permission_id`) values
('1','1','13'),
('2','1','14'),
('3','1','16'),
('4','1','17'),
('5','1','19'),
('6','1','20'),
('7','1','22'),
('8','1','23'),
('9','1','25'),
('10','1','26'),
('11','1','28'),
('12','1','29');
DROP TABLE IF EXISTS  `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

insert into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values
('1','Can add log entry','1','add_logentry'),
('2','Can change log entry','1','change_logentry'),
('3','Can delete log entry','1','delete_logentry'),
('4','Can add user','2','add_user'),
('5','Can change user','2','change_user'),
('6','Can delete user','2','delete_user'),
('7','Can add group','3','add_group'),
('8','Can change group','3','change_group'),
('9','Can delete group','3','delete_group'),
('10','Can add permission','4','add_permission'),
('11','Can change permission','4','change_permission'),
('12','Can delete permission','4','delete_permission'),
('13','Can add content type','5','add_contenttype'),
('14','Can change content type','5','change_contenttype'),
('15','Can delete content type','5','delete_contenttype'),
('16','Can add session','6','add_session'),
('17','Can change session','6','change_session'),
('18','Can delete session','6','delete_session'),
('19','Can add category','7','add_category'),
('20','Can change category','7','change_category'),
('21','Can delete category','7','delete_category'),
('22','Can add tag','8','add_tag'),
('23','Can change tag','8','change_tag'),
('24','Can delete tag','8','delete_tag'),
('25','Can add post','9','add_post'),
('26','Can change post','9','change_post'),
('27','Can delete post','9','delete_post'),
('28','Can add comment','10','add_comment'),
('29','Can change comment','10','change_comment'),
('30','Can delete comment','10','delete_comment');
DROP TABLE IF EXISTS  `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

insert into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values
('1','pbkdf2_sha256$30000$h7Al7eqygwAX$Vv79bu/fmrcSQ05rY62CLtqlE9akjbeAeAP7HB+JauU=','2018-06-20 17:29:45','1','blog_admin','','','ls_huster@163.com','1','1','2018-06-19 09:17:24'),
('2','pbkdf2_sha256$30000$Nz75rlbA1quk$PnzvoA7MFgXoFdwpkKbLBs1fWrMMhBu6y/JWup0Tjfk=',null,'0','rsong','','','','0','1','2018-06-19 09:22:31'),
('3','pbkdf2_sha256$30000$nyGkPev1u4um$WU43Go2dvn2ATA2PLMhRLxYgULLsRiu6/MvHD6f1c1Y=','2018-06-20 08:39:37','1','blog_demo','demo','test','xiliu@gmail.com','1','1','2018-06-20 07:06:00');
DROP TABLE IF EXISTS  `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

insert into `auth_user_groups`(`id`,`user_id`,`group_id`) values
('1','3','1');
DROP TABLE IF EXISTS  `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS  `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

insert into `blog_category`(`id`,`name`) values
('1','python'),
('2','函数计算'),
('3','其他'),
('4','电影'),
('5','cccc');
DROP TABLE IF EXISTS  `blog_post`;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL,
  `body` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `modified_time` datetime(6) NOT NULL,
  `excerpt` varchar(200) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `views` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  KEY `blog_post_category_id_c326dbf8_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_post_category_id_c326dbf8_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

insert into `blog_post`(`id`,`title`,`body`,`created_time`,`modified_time`,`excerpt`,`author_id`,`category_id`,`views`) values
('1','MarkDown 测试','### 主要特性

- 支持“标准”Markdown / CommonMark和Github风格的语法，也可变身为代码编辑器；
- 支持实时预览、图片（跨域）上传、预格式文本/代码/表格插入、代码折叠、搜索替换、只读模式、自定义样式主题和多语言语法高亮等功能；
- 支持ToC（Table of Contents）、Emoji表情、Task lists、@链接等Markdown扩展语法；
- 支持TeX科学公式（基于KaTeX）、流程图 Flowchart 和 时序图 Sequence Diagram;
- 支持识别和解析HTML标签，并且支持自定义过滤标签解析，具有可靠的安全性和几乎无限的扩展性；
- 支持 AMD / CMD 模块化加载（支持 Require.js & Sea.js），并且支持自定义扩展插件；
- 兼容主流的浏览器（IE8+）和Zepto.js，且支持iPad等平板设备；
- 支持自定义主题样式；

# Editor.md

![](https://pandao.github.io/editor.md/images/logos/editormd-logo-180x180.png)

![](https://img.shields.io/github/stars/pandao/editor.md.svg) ![](https://img.shields.io/github/forks/pandao/editor.md.svg) ![](https://img.shields.io/github/tag/pandao/editor.md.svg) ![](https://img.shields.io/github/release/pandao/editor.md.svg) ![](https://img.shields.io/github/issues/pandao/editor.md.svg) ![](https://img.shields.io/bower/v/editor.md.svg)

**目录 (Table of Contents)**

[TOCM]

[TOC]

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
# Heading 1 link [Heading link](https://github.com/pandao/editor.md "Heading link")
## Heading 2 link [Heading link](https://github.com/pandao/editor.md "Heading link")
### Heading 3 link [Heading link](https://github.com/pandao/editor.md "Heading link")
#### Heading 4 link [Heading link](https://github.com/pandao/editor.md "Heading link") Heading link [Heading link](https://github.com/pandao/editor.md "Heading link")
##### Heading 5 link [Heading link](https://github.com/pandao/editor.md "Heading link")
###### Heading 6 link [Heading link](https://github.com/pandao/editor.md "Heading link")

#### 标题（用底线的形式）Heading (underline)

This is an H1
=============

This is an H2
-------------

### 字符效果和横线等
                
----

~~删除线~~ <s>删除线（开启识别HTML标签时）</s>
*斜体字*      _斜体字_
**粗体**  __粗体__
***粗斜体*** ___粗斜体___

上标：X<sub>2</sub>，下标：O<sup>2</sup>

**缩写(同HTML的abbr标签)**

> 即更长的单词或短语的缩写形式，前提是开启识别HTML标签时，已默认开启

The <abbr title="Hyper Text Markup Language">HTML</abbr> specification is maintained by the <abbr title="World Wide Web Consortium">W3C</abbr>.

### 引用 Blockquotes

> 引用文本 Blockquotes

引用的行内混合 Blockquotes
                    
> 引用：如果想要插入空白换行`即<br />标签`，在插入处先键入两个以上的空格然后回车即可，[普通链接](http://localhost/)。

### 锚点与链接 Links

[普通链接](http://localhost/)

[普通链接带标题](http://localhost/ "普通链接带标题")

直接链接：<https://github.com>

[锚点链接][anchor-id] 

[anchor-id]: http://www.this-anchor-link.com/

GFM a-tail link @pandao

> @pandao

### 多语言代码高亮 Codes

#### 行内代码 Inline code

执行命令：`npm install marked`

#### 缩进风格

即缩进四个空格，也做为实现类似`<pre>`预格式化文本(Preformatted Text)的功能。

    <?php
        echo "Hello world!";
    ?>
    
预格式化文本：

    | First Header  | Second Header |
    | ------------- | ------------- |
    | Content Cell  | Content Cell  |
    | Content Cell  | Content Cell  |

#### JS代码　

```javascript
function test(){
	console.log("Hello world!");
}
 
(function(){
    var box = function(){
        return box.fn.init();
    };

    box.prototype = box.fn = {
        init : function(){
            console.log(\'box.init()\');

			return this;
        },

		add : function(str){
			alert("add", str);

			return this;
		},

		remove : function(str){
			alert("remove", str);

			return this;
		}
    };
    
    box.fn.init.prototype = box.fn;
    
    window.box =box;
})();

var testBox = box();
testBox.add("jQuery").remove("jQuery");
```

#### HTML代码 HTML codes

```html
<!DOCTYPE html>
<html>
    <head>
        <mate charest="utf-8" />
        <title>Hello world!</title>
    </head>
    <body>
        <h1>Hello world!</h1>
    </body>
</html>
```

### 图片 Images

Image:

![](https://pandao.github.io/editor.md/examples/images/4.jpg)

> Follow your heart.

![](https://pandao.github.io/editor.md/examples/images/8.jpg)

> 图为：厦门白城沙滩

图片加链接 (Image + Link)：

[![](https://pandao.github.io/editor.md/examples/images/7.jpg)](https://pandao.github.io/editor.md/examples/images/7.jpg "李健首张专辑《似水流年》封面")

> 图为：李健首张专辑《似水流年》封面
                
----

### 列表 Lists

#### 无序列表（减号）Unordered Lists (-)
                
- 列表一
- 列表二
- 列表三
     
#### 无序列表（星号）Unordered Lists (*)

* 列表一
* 列表二
* 列表三

#### 无序列表（加号和嵌套）Unordered Lists (+)
                
+ 列表一
+ 列表二
    + 列表二-1
    + 列表二-2
    + 列表二-3
+ 列表三
    * 列表一
    * 列表二
    * 列表三

#### 有序列表 Ordered Lists (-)
                
1. 第一行
2. 第二行
3. 第三行

#### GFM task list

- [x] GFM task list 1
- [x] GFM task list 2
- [ ] GFM task list 3
    - [ ] GFM task list 3-1
    - [ ] GFM task list 3-2
    - [ ] GFM task list 3-3
- [ ] GFM task list 4
    - [ ] GFM task list 4-1
    - [ ] GFM task list 4-2
                
----
                    
### 绘制表格 Tables

| 项目        | 价格   |  数量  |
| :--------:   | :-----:  | :----:  |
| 计算机      | $1600   |   5     |
| 手机        |   $12   |   12   |
| 管线        |    $1    |  234  |','2018-06-19 09:21:00','2018-06-19 09:21:00','主要特性支持“标准”Markdown / CommonMark和Github风格的语法，也可变身为代码编','2','3','19'),
('3','10分钟上线 - 利用函数计算构建微信小程序的Server端','### 前言

这篇文章适合所有的想微信小程序开发新手、老鸟以及想准备学习开发微信小程序的程序猿。本文以开发一个类似"语音口令红包“小程序为例，向您讲解如何使用阿里云函数计算快速构建微信小程序的`服务端`。通过本文，您将会了解以下内容:

- #### [demo概览](#concept)
- #### [传统服务器架构 VS Serverless架构](#trad-serverless)
- #### [Serverless架构详解](#serverless-detail)
- #### [demo开发配置步骤](#setup-detail)

<a name="concept"></a>
### demo概览

在本教程中，我们讲解如何利用函数计算一步一步来构建微信小程序的server端，其中小程序参考"口令红包", 实现一个简单版本，该demo中可以展示口令生成，口令转发，口令语音验证。

>微信语音红包小程序是基于微信小程序而开发的语音红包，发起者可以写下想要让别人说的话（口令），并且将钱塞入此红包中，其他用户只要读出这句话（口令）就可以获得红包。语音红包可以发到特定的好友、微信群以及朋友圈，朋友需要根据文字口令说出相应的语音，才能获得红包。这种互动行为,在朋友圈或者微信群社交的场景下，可以极大调动互动活跃度，规则简单方便，体验趣味十足，口令的形式丰富多样(恶搞、示爱、祝贺、说口号、甚至是广告语)，这些都让口令红包一直维持很高的热度。

##### demo客户端小程序具体效果截图如下:

* 生成口令

![image](https://yqfile.alicdn.com/6605c84b1d5458b93fc075db8805f0a354c81d4c.png)

* 转发口令

![image](https://yqfile.alicdn.com/a110119a12a1d5e95d3f7e24faa335bd2fb9a05b.png)

* 录音验证口令 

![image](https://yqfile.alicdn.com/0c56fe69232d9f730b3b264bc537810e8c9780f0.png)

<a name="trad-serverless"></a>
### 传统服务器架构 VS Serverless架构
正常来说，除了少数纯客户端的微信小程序运用，绝大部分的小程序都有自己的server端。用户开发server端服务，常常面临开发效率，运维成本高，机器资源弹性伸缩等痛点，而使用Serverless架构可以很好的解决上述问题。下面是传统架构和Serverless架构的对比：

|   Item     |   Serverless | 传统方式搭建服务  |
| :----------------------- | :--------------------------| :----------------------|
| 维护成本  | 维护成本低，无需管理服务器等基础设施，只需编写代码并上传，程序员从底层设备维护中解放出来，只考虑实际业务逻辑即可。| 维护成本高，自行维护服务器，需要处理服务器宕机、服务器扩容等一系列底层琐碎的事情   |
| 可用性  | 可用性高，函数计算为用户准备弹性、可靠的计算资源，具有根据流量自动scale特性，对有明显波峰波谷的运用效果奇佳 |  服务器故障会对应用服务产生严重影响 |
| 费用  | 按需付费，只为实际使用的计算资源付费，代码未运行则不产生费用 |  需要支付服务器的费用，代码运行与否都要收费   |

阿里云[函数计算](https://promotion.aliyun.com/ntms/act/fc/doc.html?spm=5176.137990.709885.btn3.2002bb57UV8Btt&wh_ttid=pc)是一个事件驱动的全托管计算服务。通过函数计算，您无需管理服务器等基础设施，只需编写代码并上传。函数计算会为您准备好计算资源，以弹性、可靠的方式运行您的代码，并提供日志查询，性能监控，报警等功能。借助于函数计算，您可以快速构建任何类型的应用和服务，无需管理和运维。

<a name="serverless-detail"></a>
### Serverless架构详解
![image](https://yqfile.alicdn.com/df8bce4f8b7d87360bc824f79786553e49137975.png)


方案大致如上图所示， 主要分为以下三个模块：

* Login & Auth
> 微信建议[登录时序图](https://mp.weixin.qq.com/debug/wxadoc/dev/api/api-login.html#wxchecksessionobject)如下, 其中第三方服务器用FC实现：
![image](https://yqfile.alicdn.com/8057e1438a052a3484f6e78186be59d251eaf3dc.png)

* 语音识别(包含音频格式转换)
> ffmpeg进行音频格式转换
> [百度语言识别开发文档](https://ai.baidu.com/docs#/ASR-Online-Python-SDK/top)

* 方案图下部虚线框柱的是可以拓展的模块，本demo中不展示，用户可以根据需求接入
> 比如微信小程序直接上传文件到oss保存，函数计算可以从oss拉取对应的数据做处理；如果需要数据库功能，可以采用ots

<a name="setup-detail"></a>
### demo开发配置步骤
##### 准备工作：
1，开通[阿里云](https://cn.aliyun.com/)账号，同时需要开通的产品有[函数计算](https://www.aliyun.com/product/fc?spm=a2c4g.11186623.2.3.H2aFTN), [api网关](https://www.aliyun.com/product/apigateway?spm=5176.10695662.1996646101.searchclickresult.67ac2b6eGQ6uCe)

2，购买[独立域名](https://wanwang.aliyun.com/?spm=5176.8142029.388261.261.105af7984EoebL),同时需对域名备案，以及购买[阿里云免费ssl证书](https://common-buy.aliyun.com/?commodityCode=cas#/buy),购买步骤可参考[免费申请阿里云DV SSL证书](https://www.xiaoz.me/archives/7442)

3，开通[微信小程序](https://mp.weixin.qq.com/debug/wxadoc/dev/)开发认证,以及[百度语音识别](http://yuyin.baidu.com/)

4，从github下载相应的[源码](https://github.com/awesome-fc/wx-demo)，里面client目录表示客户端，server表示用于创建函数。

##### FC端
1，利用源码中的server目录创建`服务端`函数，比如函数名为`wechatEntry`，有以下两种方案创建函数：
   * 利用控制台打包上传,设置对应的handler, 函数计算控制台使用可参考[hello world](https://yq.aliyun.com/articles/226545?spm=a2c4e.11155435.0.0.3e554a7cRLZ4Vr), 特别是控制台上传代码包创建函数部分。下面是重要步骤截图:
  ![image](https://yqfile.alicdn.com/90306b3ea4fc57991427afed45dd89f6ad7caa0e.png)
  
  ![image](https://yqfile.alicdn.com/518eed4682864aac9ae2316fbea9cf98db70dadd.png)
  
   * 函数计算熟悉fcli的工具的老用户可以使用函数计算命令行工具[fcli](https://github.com/aliyun/fcli/releases?spm=a2c4g.11186623.2.4.Zxk9nW), [fcli使用说明](https://help.aliyun.com/document_detail/52995.html?spm=a2c4g.11186623.2.5.Zxk9nW)
  `fcli function create -f wechatEntry  -h main.handler -d server -t python2.7 -s wechat`
  
> 注意：上面两种方案创建函数之前都需先把函数中main.py中相关开发配置改成自己申请的，包括`微信小程序开发者相关配配置`，`百度语音识别相关配置`
  
2, 以函数计算作为 API 网关后端服务
   * api网关支持https服务，具体可以参考[api网关支持https](https://help.aliyun.com/document_detail/48866.html)
   * [函数计算作为api网关后端服务](https://help.aliyun.com/document_detail/54788.html?spm=a2c4e.11153959.blogcont279124.16.7c3098feHThGm2)
   * api网关中设置函数对应的api分组配置独立域名
  ![image](https://yqfile.alicdn.com/07201ab16c53b9eb68dc4539175f3a2140db7506.png)
   
   * 最后效果图以及调试界面如下：
  ![image](https://yqfile.alicdn.com/431f50c71b2d95acb6074d81645abeddf7b0ec63.png)
  ![image](https://yqfile.alicdn.com/53aa2fdcf5acec18ecc30a55f670ede0ecdbc0db.png)
  ![image](https://yqfile.alicdn.com/edc3dfdaa052a5fdf5bd63d922e7e3e02bfb5252.png)
  
##### client端
* 按照[微信小程序官方教程](https://mp.weixin.qq.com/debug/wxadoc/dev/quickstart/basic/getting-started.html)，创建对应的小程序账号以及工程，需要注意的是要把api网关中配置的域名添加到微信小程序的开发配置中:
![image](https://yqfile.alicdn.com/9e6e724772c29ceef82abc6bf92f49fa347369b9.png)
* 直接用微信小程序开发工具打开，修改对应请求域名和appid即可，打开如下图所示：
![image](https://yqfile.alicdn.com/e459d25fc5c3369c6091652434a22d06cf92e80d.png)
![image](https://yqfile.alicdn.com/d49d77ff6982f80b7f9e0a8bf33411320ebfdffe.png)

### 总结
利用函数计算可以快速搭建微信小程序的serverless运用，结合oss，ots可以丰富`server`的功能，免服务器，免运维，成本低，不用担心流量，只需要函数就可以实现，你值的拥有！

#### [github源码地址](https://github.com/awesome-fc/wx-demo)

#### 一些补充FAQ, 仅供参考

##### 怎么调试fc？
fc可以接入sls，通过sls日志，可以查看你函数运行的情况，具体可以参考[函数访问日志服务](https://help.aliyun.com/document_detail/61023.html?spm=a2c4g.11186623.6.559.rzDK8w)

##### 如果录入的语音文件很大，时间很长，导致语音识别服务时间很长，怎么办？
可以参考[函数计算流式处理大文件](https://yq.aliyun.com/articles/281011?spm=a2c4e.11155435.0.0.45ce0a58du9Fkb)的分治思想对语音分割进行流式处理，或者直接选用有流式处理的语音识别的服务。

##### 如果想对语音文件或者其他文件做备份处理，怎么办？
可以参考微信小程序中客户端utils文件夹下面的uploadAliyun.js

### 声明
* 微信小程序使用的图片和部分样式素材来自互联网，在此声明，这个demo仅仅是做学习交流展示使用，并没有涉及商业化，如果原作者看到，请在文章下面留言或者给我发邮件，我注明引用地址。

* 欢迎大家通过扫码加入我们用户群中，搭建过程中有问题或者有其他问题可以在群里提出来。

  ![image](https://yqfile.alicdn.com/31243845f6e99e97578a7e6921a0a06db0f0b587.png)','2018-06-19 12:19:00','2018-06-19 12:19:00','前言这篇文章适合所有的想微信小程序开发新手、老鸟以及想准备学习开发微信小程序的程序猿。本文以开发一个类似"','1','2','14'),
('4','利用函数计算实现网络游戏或视频直播中的敏感词检测','#### 一、概述
目前，网络游戏和视频直播都是很火爆的产业，然而，无论在多人在线网络游戏（MMORPG)中，还是在游戏视频直播或者其他直播中(弹幕)，玩家或者用户的在线交流和互动都是它们的核心乐趣所在，但是玩家之间的交流和互动不可避免地会涉及到一些敏感词，对玩家或者用户交流中出现的敏感词进行过滤，提供一个健康和谐的网络环境是非常重要有意义的。

#### 二、现有技术方案
现有技术中，通常采用两种方式进行敏感词的过滤：

##### 第一种方式：客户端完成敏感词的过滤
客户端存储有敏感词库；由玩家输入的文本内容经过客户端敏感词过滤模块过滤，然后将过滤后的文本由客户端发送至服务器，再由服务器转发至接收方客户端显示，有时为了担心发送端的过滤模块被hacker绕过，需要在接收方在接收的时候，也经过下客户端敏感词过滤模块。

* 优势:
每个客户端单独执行敏感词过滤，效率高，且不占用服务器资源，服务器没有计算消耗。

* 劣势: 
敏感词具有时效性，针对最新出现的敏感词，不能实时的增加到客户端的敏感词库，只能等下次客户端打新包或者patch才可以添加进去，这个时间成本有点大。

##### 第二种方式：服务器完成敏感词的过滤
在服务器中存储敏感词库，并设置敏感词过滤模块，将服务器接收到的文本内容进行敏感词过滤，并将执行完敏感词过滤后的文本内容发送至客户端。

* 优势：
在于可实时增加敏感词，当出现突发事件后，不需要停服就可实现动态添加新的敏感词。

* 劣势：由服务器执行敏感词过滤会导致增加大量额外计算消耗，影响服务器性能。有的特殊的输入可能会导致执行某些检测规则时间过长造成服务器进程卡顿。

#### 三、函数计算可以提供的解决方案
将敏感词检测的模块放在函数计算实现，至于是由客户端和服务端发起函数调用看具体需求，在本示例中，我们把发起的敏感词检测过程放在客户端发起，如下图所示：
![image](https://yqfile.alicdn.com/8a23d352373713769897197b78cca869731791ed.png)

优势：不会增加服务器的计算消耗，同时只需要更新下函数，就可以达到实时更新敏感词目的。

#### 具体步骤
#####1 . 函数计算作为 API 网关后端服务, 具体的教程可以参考[官方教程](https://help.aliyun.com/document_detail/54788.html?spm=5176.doc29497.6.584.8ykpic)和[函数计算获取临时token](https://yq.aliyun.com/articles/279124?spm=5176.8091938.0.0.iUj0gd)

##### 2 . 函数计算实现敏感词检测的功能，本文主要讲解这个过程, 以python作为编程语言，给出具体的示例代码。

在本教程中，选用正则式作为我们的敏感词检测，也就是python的re模块，但是做敏感词检查还存在一些性能问题需要我们去解决，问题是：当游戏或者视频直播上线的时候，敏感词正则库一般有几百个，在python中通过 re.compile 编译正则表达式是很耗时的，几百个正则编译完可能需要10几秒甚至20多秒，但是如果正则式如果是编译完的，那么直接进行匹配match或者search还是很快的，十几毫秒可以搞定。

初始方案：我们可以将正则表达式的编译结果 cPickle.dumps 序列化保存到文件中。待下次程序启动时直接从文件读取内容， cPickle.loads 反序列化成正则表达式对象。但是这个有坑，根本没有耗时改善，详情见[cPickle正则表达式对象](http://blog.qiusuo.im/blog/2014/08/18/cpickle-regex-object/)

最终方案：基于[cPickle正则表达式对象](http://blog.qiusuo.im/blog/2014/08/18/cpickle-regex-object/)的处理方案，对于最耗时的结果压缩再序列化，反之，反序列的时候记得再解压一下就行，这样的好处是，中间的序列化文件大小可以大大压缩，本教程测试一般显示能压缩5倍以上，但是对整个运行时间影响不是很大，如果对时间特别敏感的，可以不考虑压缩过程。

核心处理代码文件`re_pickple.py`

```python
# -*- coding:utf-8 -*-
\'\'\'
_sre.SRE_Pattern 对象的序列化，就是编译的函数 re._compile 和输入的参数 pattern ，flags 给保存起来，
反序列化的时候 _compile(pattern, flags) ,这和直接 re.compile 没有有什么区别，赤裸裸的伪序列化
这里将re模块中的compile过程分成两个部分，dump最耗时间的code，然后load出code，再快速转换成 _sre.SRE_Pattern 对象
\'\'\'
import cPickle, re, sre_compile, sre_parse, _sre
import zlib,time


# 开启压缩的开关
zip_flag = False

# 目前函数计算的ca环境没有内置builtins
# 需要先在本地pip install -t . future
if zip_flag:
    from builtins import int

\'\'\'
raw_compile, build_compiled是re模块中的compile拆分成两个部分
\'\'\'
# the first half of sre_compile.compile
def raw_compile(p, flags=0):
    # internal: convert pattern list to internal format

    if sre_compile.isstring(p):
        pattern = p
        p = sre_parse.parse(p, flags)
    else:
        pattern = None
    # 主要耗时在_code函数
    code = sre_compile._code(p, flags)
    
    if zip_flag:
        code = zlib.compress(str(code)) # code格式简单，元素都是整型的list

    return code

# the second half of sre_compile.compile
def build_compiled(p, flags, code):
    # print code
    # 重新计算p, parse函数耗时很少，如果将p dump,占用空间较大
    if sre_compile.isstring(p):
        pattern = p
        p = sre_parse.parse(p, flags)
    else:
        pattern = None

    # XXX: <fl> get rid of this limitation!
    if p.pattern.groups > 100:
        raise AssertionError(
            "sorry, but this version only supports 100 named groups"
            )

    # map in either direction
    groupindex = p.pattern.groupdict
    indexgroup = [None] * p.pattern.groups
    for k, i in groupindex.items():
        indexgroup[i] = k

    return _sre.compile(
        pattern, flags | p.pattern.flags, code,
        p.pattern.groups-1,
        groupindex, indexgroup
        )

def dump(regexes, o_file):
    picklable = []
    for r in regexes:
        code = raw_compile(r, 0)
        picklable.append((r,code))
    cPickle.dump(picklable,o_file)

def load(pkl):
    regexes = []
    for r, code in cPickle.load(pkl):
        if zip_flag:
            code= decode_str(code)
        regexes.append(build_compiled(r, 0, code))
    return regexes

def decode_str(code_str): #解压缩
    raw_code = zlib.decompress(code_str)
    raw_code.strip()
    raw_code = raw_code[1:-1]
    str_li = raw_code.split(\',\')
    code = [int(item.strip()) for item in str_li]
    return code
```

假设我们有一个检测昵称的正则字库，一个有150条正则规则，部分内容如下:

```python
# -*- coding: utf-8 -*- 
data = [ 
  \'(?i)公会(强势)??入驻|招募.{0,3}?玩家|强势入驻|进群有??福利|体验号|交流群|群[^a-zA-Z一-龥0-9_丷灬一丨丿乀乄丶]*?号码|活跃工会|[qｑ][^a-zA-Z一-龥0-9_丷灬一丨丿乀乄丶]*?群|公会福利|福利[暴超]多|激活码|序列号|公会号|[百白]度搜|免费发放|发放免费|工会群|发放礼包|礼包发放|各种礼包|免费礼包|礼包免费|加入.{0,3}?公会\',
  \'([\\dⅠⅡⅢⅣⅤⅥⅧⅦⅨⅩⅪⅫ⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑⒒⒓⒔⒕⒖⒗⒘⒙⒚⒛㈠㈡㈢㈤㈣㈥㈦㈧㈨㈩①②③④⑤⑥⑦⑧⑨⑩⑴⑵⑷⑶⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇１２３４５６７８９０一二三四五六七八九十0０零oOＯｏ○〇0oOｏ０Ｏāóòáō零][^A-Za-z0-9_一-龥]{0,6}?){5,}?\',
  ......
  ]
```

2.1 我们对其中间最耗时的结果进行序列化,  序列化结果保存在`name_prog.pkl`文件中:

```python
  # -*- coding:utf-8 -*-
  import server_nick_name
  import re, time, re_pickle
  import cPickle as pickle

  with open(u\'name_prog.pkl\', \'wb\') as f:
      nick_name_regx = []
      for pattern in server_nick_name.data:
          pattern = unicode(pattern,"utf8")
          nick_name_regx.append( pattern )

      re_pickle.dump(nick_name_regx, f)

  print "done"
  ```
  
2.2 敏感词检测demo
  
```python
  # -*- coding:utf-8 -*-
import time, re_pickle

start = time.time()
with open(u\'name_prog.pkl\', \'r\') as f:
    nick_name_prog = re_pickle.load(f)

end = time.time()
print "load time = ", end - start

def check_nick_name_valid(nick_name):
    nick_name = unicode(nick_name,"utf8")
    for prog in nick_name_prog:
        if prog.search(nick_name):
            return False
    return True

if __name__ == \'__main__\':
    inputlst = ["李四", "小白兔", "李四", "王五"] 
    for input in inputlst:
        start = time.time()
        ret = check_nick_name_valid(input)
        end = time.time()
        print \'check ret = {} ; check_time = {}\'.format(ret,end - start)
```
输出如下：
```
load time =  0.238202095032
check ret = True ; check_time = 0.000257015228271
check ret = True ; check_time = 8.10623168945e-06
check ret = True ; check_time = 4.05311584473e-06
check ret = True ; check_time = 0.000158071517944
```
> 注：由于网络安全审查，这里举例的名字都是合法的，用户可以在本地尝试使用下敏感的名字

因此，只要我们将name_prog.pkl和我们的检测函数、re_pickple.py一起，构建我们的函数，假设我们的函数如下，一次性检查4个名字，我们测试下调用100消耗时间的情况。
```python
# -*- coding:utf-8 -*-
import time, re_pickle
begin = time.time()
with open(u\'name_prog.pkl\', \'r\') as f:
    nick_name_prog = re_pickle.load(f)

end = time.time()
print "load time = ", end - begin

def check_nick_name_valid(nick_name):
    nick_name = unicode(nick_name,"utf8")
    for prog in nick_name_prog:
        if prog.search(nick_name):
            return False
    return True

def handler(event, context):
    inputlst = ["李四", "毛泽东", "习近平", "张三"] 
    for input in inputlst:
        ret = check_nick_name_valid(input)
    return time.time() - begin
```
调用100次所消耗的时间情况如下：
> avg:  0.000343136787415
> min:  0.000230073928833
> max:  0.000503063201904

#### 总结

采用函数计算实现自定义的敏感词检测模块方案是一个很好的选择，自己预编译的的正则序列化中间结果除了第一次load大约是100来毫秒以外，其他的检测结果基本毫秒级就能给出结果，而且函数计算能做到自动按流量来scale，即使出现大量的文字交流，也能快速及时处理，很火的视频直播再也不怕海量弹幕了。同时，进一步扩展，针对网络游戏中出现的语音信息的翻译成文字，文字敏感性检测都可以通过函数计算来实现, [语音敏感检测](https://yq.aliyun.com/articles/436096?spm=a2c4e.11155435.0.0.1a62a1bffPVTQP)。

#### 参考
[cPickle正则表达式对象](http://blog.qiusuo.im/blog/2014/08/18/cpickle-regex-object/?spm=a2c4e.11153959.blogcont316808.20.1b2a3eb2n8Cxwc)','2018-06-19 14:48:00','2018-06-19 14:48:00','一、概述目前，网络游戏和视频直播都是很火爆的产业，然而，无论在多人在线网络游戏（MMORPG)中，还是在游','1','2','16'),
('5','《山楂树之恋》：潜藏在纯爱背后的生化危机','今天我看了《山楂树之恋》，开始的时候被这段干净的恋情感动，但是后来觉得有些不对劲，哪里不对劲又说不出来。回家的一路上我都在思考着，然后想到了——是那棵山楂树。

众所周知，山楂树是开白花的，这是自然规律。但电影里的那棵山楂树，角色们都说开的是红花，这成为了电影一条重要的线索和隐喻。对于这个违背自然规律的现象，女主角的老师在片子的开头解释说：“烈士们的鲜血染红了它。”

这个解释是一种抒情诗化，不会有人把它作为一个认真的答案，就好像我们不会认真计较国旗的颜色到底是哪种血型染红的一样。

但从电影里，无论是老师、村长还是老三，人人都在谈论这棵会开红花的山楂树，所以这棵山楂树不是被赋予了诗化，而是确实开的红花。

这棵山楂树，为何惟独它年年开出红花呢？

让我们把这条线索放下，看看另外一处细节。

老三得了白血病之后，静秋跑去村里地质队营地找他。地质队的人对她说了一番话，里面有几条很重要的信息：

第一，二队除了老三，也有人得了白血病；第二，导致白血病的，是地质队勘探的矿物；第三，老三怕二队的人继续得病，所以带着几块样品去城里化验去了。

后面的事情我们都知道，老三也得了白血病，最终去世。

原著小说里只提到了老三的病可能跟勘探环境有关，约略一提而过。这一段对话，是电影原创。我们不禁要怀疑了，导演一直在刻意地控制影片的长度，许多地方甚至用字幕来交代过场。如此惜时如金，为何要加上这么一段貌似毫无必要的原创场面呢？

戏剧创作理论里有个说法，说如果在舞台的布景里挂了一支枪，那么它至少要响一下，否则就不要挂——意思是不要在戏剧里放入无关的东西。

按照这个理论，这场戏显然是有意义的。

这场戏里给我们最重要的提示是：老三的白血病，和他在二队勘探的那些石头，有着莫大的关系。

能导致白血病一个重要原因，是辐射。老三常年呆在地质勘探队，他接触到的，应该是有强烈辐射的矿物，比如铀矿。

可这并不能解决疑问。

地质勘探队都是专业人员，探明矿物种类是他们的专长，如果是铀矿，第一时间就会判明。二队怎么可能会糊涂到队里好多人得了白血病，才想起来让老三带着石头去城里检验呢？

而且，如果二队挖到的是铀矿，这是国家级的战略物资，第一时间就会并封锁起来，绝不会让主角三天两头跑出去跟女人约会，还把二队的加班挂在嘴边。

可见，这种矿物很神秘，神秘到二队无法判断其性质；但它又没有太强烈的辐射，所以二队在一开始并没重视，更没有采取防护措施，以致老三酿成悲剧。

我们姑且把这种神秘矿物，称之为艾米矿，以纪念小说原作者。

接下来，让我们重新审视一下电影的时间线。

静秋回城前的部分略去不说。静秋回城后，老三去二队加班以换取轮休，跑去城里找她玩。两个人还下河游泳，被静秋母亲发现；老三在县医院体检住院，静秋偷偷跑去看他，两人最后一次合影。然后老三不辞而别。静秋去地质队询问老三下落。最后是她在课堂上得知恋人过世。

把这条时间线与老三的动向做对比，就能很清楚地猜测出二队的勘探进度。

首先，在静秋与老三初识的时候，二队在西坪村附近接触到了一条矿脉。这条矿脉的性质很奇特，不是铀，有辐射，但不太强烈。

二队一时无法判断艾米矿的性质，但并未多加重视，只是从其他勘探队抽调了一批人员，继续对该矿脉进行勘察。老三就是在这时候，开始加入二队工作，还可以自由往返县城与西坪村。恐怕就是在这期间，老三被艾米矿感染。

当老三与静秋一起游泳的时间前后，他的身体出现了异常状况，不仅表现出嗜睡，而且当静秋因为脚伤不肯去医院时，他居然拿出刀来划破自己的胳膊，这固然是一种爱的表现，但也反映出老三的情绪上已经出现暴躁，而且有暴力倾向。

这种症状在二队其他接触艾米矿的人身上也出现了，二队不得已，把这些队员送去了县医院，谎称体检，其实是留院做深度检查。

在病房里那场戏，静秋质问老三普通体检为何要住院，老三支支吾吾遮掩过去。其实老三有着和静秋相同的疑问，已经对二队的安排产生了怀疑。电影里用一个细节表达出来，当静秋探病的时候，他正在翻阅一本《病理学》，说明他已经心存疑窦，打算自己找出真相。

他那时候还没想到艾米矿的问题，一厢情愿地以为是白血病，也是这样告诉静秋的。

可惜他错了。在电影里我们可以看到，病房里满满的，都是人，说明这次艾米矿辐射感染的范围相当大，但不会通过人与人的交往传染。

这个阶段，勘探队仍旧没有重视异状，医院没有封锁，静秋晚上还能溜进去卿卿我我。在陪床期间，老三和静秋还能自由出入，两个人一起甜甜蜜蜜地拍了一张合影。

注意，在拍合影之前，老三做了一个非常古怪的举动，他竟然斗眼。

斗眼的时候，老三的表情是很狰狞的，我在电影院里看到这一段，突然毛骨悚然。

这是和恋人照相，不是万圣节舞会啊！而且那是在文革期间，不是二十一世纪的今天，照相是件严肃的事，就算是生性活泼的年轻人，也不可能有这种开放思维。

除非他不是自愿的，而是无法控制自己的肌肉……

电影里，静秋看到老三的斗眼，以为他在搞怪，也开始斗眼。老三愣了一下，连忙继续做鬼脸，以掩饰自己的失态。这个细节告诉我们，老三此时的病情，已经出现了新的征兆。

当天晚上，两个人睡到了一张床上。当静秋决定把自己身体交给老三时，老三只是简单地抚摸了一下便放弃，说了一通情话后，两个人都睡着了。

孤男寡女，同居一室，老三摩挲了一阵，居然没有更进一步。如果这个年轻人不是柳下惠转世，那只能说明他在害怕。

电影里有一处细节：当老三的手摸到静秋下身时，他犹豫了，脸上出现的，是恐慌，立刻要抽开手。最后还是静秋一把抓住他的手，把他按下去。

他在怕什么？

静秋没有性常识，但老三肯定有。静秋是处女，两人欢好之时，会流血。

难道老三晕血？

不可能。回想起老三割开自己胳膊血流出来的时候，他的表情是欢畅的。

由此可知：老三喜欢看到血，但他看到血后的反应，可能会伤害到身边的人。那天夜里，老三毅然决然地停止了动作，是怕静秋见红之后，自己要做出什么可怕的事情，伤害到自己爱人。

除此以外，无法解释他为何在天时地利人和的情况下，突兀地收了手。

这无损于整个影片的氛围，反而更证明主角为爱情牺牲的决心。

这更解释了老三为何让静秋挑了一件红衣服，还买了一个底部红殷殷的脸盆，甚至之前送的日记本，都是红红的一片。

这些举动当然出自老三对静秋的爱，但老三自己可能都不知道，从心理学的角度去观察，这些举动也表明，在潜意识层面里嗜血冲动已经悄然控制了他的思维，让他对红色有了强烈的倾向性。

对于这个细节，导演在后面做了隐晦的暗示。在静秋的朋友流产后，两个人进行了一番关于“得手”的对话，里面对性爱的细节欲言又止，正是对前头这段情节的呼应。
当静秋再一次去病房找老三时，病房里的其他病人都在，但老三却消失了，只来得及留下一个脸盆，甚至没时间写张纸条。

静秋问起医生病情，女护士却矢口否认白血病的事情，说老三没事。这造成了她对老三的误会。

从后面的剧情来看，老三在县医院被诊断出重病，已是确凿无疑，那么女护士直说便是，何必撒谎呢？

有一段戏，讲女护士深夜里把静秋赶出医院，可以看出，她是个工作严谨认真的人。这样一个人，无端对病人病情撒谎，一定有她的理由。

这个理由不难猜到。这说明，老三被感染的程度，比其他人要深得多，已经到了县医院无法处置的地步，只能连夜转院。这一意外惊动了二队以及上级主管部门，领导终于开始正视这一异状，开始封锁消息。

转院在极端秘密的情况下进行，所有知情人都被告知不能泄露。因此，女护士才对静秋撒了谎。

地质勘探队的人说老三带着石头去城里检验，不够准确，应该是老三和石头，一起被送去城里检验。这时候，艾米矿脉的异常性质应该已经通报给了国家，老三作为第一波感染者，和艾米矿石样本一同被送去检查。

最后，是静秋与老三的诀别。老三躺在病床上，脸色铅灰，浑身都是大块大块的青紫斑点，已经不能说话，眼皮还肿得吓人。

晚期白血病人在接受注射治疗时，因为本身凝血功能已经丧失，要采取特殊的止血手段，皮肤确实会留下泛黑的青紫斑点。

这一点，电影的化装很符合事实，可是……老三身上的斑点覆盖了全身，有点太多了，也有点太大了。无论是透析还是注射，都是围绕着血管作业，白血病人不会在全身上下都扎满针眼——镜头里很明显地表现出，许多没有血管的肌肉部分也泛起黑紫斑点，这不是治疗后遗症，这更象是溃烂，还有些部位象是瘀伤，象是经历过剧烈格斗。

老三在病床上的姿势和周围的陈设，很多细节表明他的身体不是简单地平躺，而是被控制住了。

综合这两点看，难道说他之前有过狂暴的举动，被强行镇压，以至现在垂死前医生都不敢松开？

要注意，当时在病房里，除了静秋、老三父亲和老三一位哭泣的亲人（可能是奶奶，片子里没交代，不好妄自猜测），还有一大堆旁观者。这些旁观者个个穿着军装，表情严肃，除了其中一名女子有几句台词，其他人就那么沉默地站着。

电影里对他们的来历没有任何交代，没说是亲戚，朋友，还是老三父亲的部下。他们突兀地出现，又突兀地消失，没留下任何痕迹。

如开头我说，山楂树是一部惜时如金的电影，不会出现无用的闲笔。病房里超乎寻常的人满为患，是要表达一些信息。

艾米矿的存在已经惊动了国家，那么作为第一例被感染者，老三肯定会得到特别重视，会有专人监视或者保护他。

再联想到老三病床上的控制痕迹，和他身上奇异的瘀伤。我们甚至可以推测，老三之前有过狂暴到局面几乎失控的地步，力气变大，破坏欲很强，没有三五个人根本制服不了他。所以病房里的那些军装人员，不是老三的朋友或亲戚，更不是老三父亲的部下，而是国家派来监视老三的护卫。

这些军方护卫很称职，哪怕是老三临终前见亲人，他们也不离开病房，不敢有丝毫松懈。这从护卫的数量，能看出来之前老三的狂暴举动有多么大的威力。

当周围所有人包括父亲都无法唤起老三反应时，静秋出现了——注意，此时的她，穿的正是一身红色衣服，血红血红——深情地呼唤老三，老三的眼角流出泪水。我们相信泪水是真情流露，不过唤起他意识的，恐怕更可能是那件红色的衣服。

从这个顺序可以看出，此时的老三，嗜血性已经强大到压倒了理性，所以才会先本能地被
血红衣服唤醒，再理性地判断出自己恋人，进而流泪。可惜他那个时候，已经口不能言。

于是，我们从电影里老三不同时期的表现，能够总结出艾米矿物对人体的感染症状：

第一期症状，嗜睡，感染者脾气暴躁，有暴力倾向。

第二期症状，易疲劳，面部肌肉开始不受控制。

第三期症状，强烈的嗜血性开始显现。

第四期症状，全身皮肤开始大面积溃烂，感染者逐渐丧失神智，嗜血性进一步加强。

第五期症状（？）体质得到异乎寻常的提高，攻击性与破坏力成倍上涨，但神智会大幅下降。

有没有觉得这些症状很眼熟？象不象某一类在游戏、电影和小说里经常出现的物种？

现在，让我们回到影片的主题，那棵红色的山楂树。

科普作家刘夙在《究竟有没有开红花的山楂树》一文里告诉我们：“绝大多数山楂树都只开白花，因为一种叫AHS(花青素合成酶)的基因在它们的花瓣中不能发挥作用，不能把无色的花青素前体转变为有颜色的花青素……但有个别种的野生山楂树也能开淡粉红色花……据推测，应该是因为这些植株发生了变异，使AHS基因在花中也可以少量表达的缘故。”

就是说，开红花的山楂树可以有，前提是它的基因发生了变异。

我们知道，基因突变的原因之一，正是受到辐射影响。

开红花的山楂树，就长在西坪村不远的地方。二队勘探到艾米矿，肯定也在那附近。

艾米矿物改变了山楂树的基因，让原本开白花的山楂树开出了红花。它既然能改变植物的基因，那么同样也能够改变人类的基因。接近艾米矿的老三和二队的队员，被它散发的不甚强烈但足以改变生物基因的辐射感染，变成了另外一副模样。

他们，就是人类之中开红花的山楂树。

这里有一个疑问，既然靠近艾米矿，就会被其辐射改变，那么西坪村的老百姓住了这么多年，怎么没事呢？

电影里，同样给出了解释。

电影里提到，静秋的妈妈身体有病，需要吃核桃冰糖。因此西坪村村长家老二得了老三授意，特意给送来一大口袋核桃。

说明核桃是西坪村的特产。

核桃这种东西富含多酚和脂多糖，正是防辐射最好的食品。宇航员因为要生活在外太空，辐射强烈，因此核桃是太空食品中的必备成分。

所以，习惯吃核桃的西坪村民安然地生活了这么多年，而外地前来的地质勘探队，却惨遭大变。

说到这里，《山楂树之恋》这部电影真正的主题，已经呼之欲出。

开红花的山楂树，正是老三悲剧性命运的象征。他与山楂树是两体同命，而且比它更不幸。同样是被改变了基因，山楂树开出红花，被当成革命象征为人颂扬，而老三则只能眼看着自己一步步地丧失理智，终于变成一个异类，被军队控制直到临终。他和勘探二队的不幸遭遇，是这部电影在主线下潜藏的另外一根线。

而对这一切茫然无知的静秋，仍旧在变异的山楂树痴痴地思念着自己的爱人。

这部电影的名字，不该叫做《山楂树之恋》，而是叫做《山楂树之变》。','2018-06-20 01:49:00','2018-06-20 01:50:00','今天我看了《山楂树之恋》，开始的时候被这段干净的恋情感动，但是后来觉得有些不对劲，哪里不对劲又说不出来。回家','2','4','17'),
('6','如何利用函数计算获取临时token访问其他阿里云资源','对于一些用户来说，可能需要在网页，app等客户端可以操作阿里云资源，如上传文件到oss，但是用户又不想把自己的AK暴露出来，在本文中，实现用户不需要自己直接使用自己的AK来实现文件上传到oss的例子
  主要步骤如下：
 ** 1，用户创建一个函数 get_sts,该函数如下：**

```python
  # -*- coding: utf-8 -*-

def handler(event, context):
    response = {
       \'isBase64Encoded\': False,
         \'statusCode\': 200,
         \'headers\': {
            "x-custom-header" : "header value"
        },
        \'body\': {
          "access_key_id":context.credentials.access_key_id ,
          "access_key_secret": context.credentials.access_key_secret,
          "security_token" : context.credentials.security_token
        }
    }
    return response
```

  <font color="red">*注意：要想获取context中credentials信息，需要配置函数所在的service的服务角色，在本例中, 配置的服务角色是一个具有操作oss读写权限的角色, 这样context.credentials有能操作oss的临时token信息*</font>
 本文的配置如下：

![image](http://yqfile.alicdn.com/07962da351180f8352c9dc78815c9616e61ed3b2.png)

如何给service配置服务角色，可以参考https://help.aliyun.com/document_detail/60984.html?spm=5176.doc61023.6.558.RkgmAR

 ** 2, 以函数计算作为 API 网关后端服务**
2.1，具体的教程可以参考:https://help.aliyun.com/document_detail/54788.html?spm=5176.doc29497.6.584.8ykpic
2.2，本教程最后配置如下：

![image](http://yqfile.alicdn.com/dde4338a48e6f5d3e717f5d18e79cd48faac22f6.png)

![image](http://yqfile.alicdn.com/7c4270ea887a153f31f190b17f2a248806a53921.png)

2.3，将api发布以后，可以使用curl来测试下：

![image](https://yqfile.alicdn.com/5e6d8e00b2ae13887b72a2ec81242cc7ee379a22.png)

 ** 3, 使用函数计算返回的临时token对oss进行操作**

```python
# coding=utf-8
import oss2
import requests

def put_object_to_oss():
    # use your api
    r = requests.get("http://05248dd6f0c14c7ebaa723f18c17b7d4-cn-shanghai.alicloudapi.com/getSts")
    if r.status_code!=200:
         return
    sts_creds = r.json()
    auth = oss2.StsAuth(sts_creds[\'access_key_id\'], sts_creds[\'access_key_secret\'], sts_creds[\'security_token\'])
    endpoint = "oss-cn-shanghai.aliyuncs.com" # your endpoint
    bucket = "ls-oss-test" # your bucket
    bucket = oss2.Bucket(auth, endpoint, bucket)
    bucket.put_object("apigateway.txt", "api gate way uploaddata")
    remote_stream = bucket.get_object(\'apigateway.txt\')
    return remote_stream.read()

print put_object_to_oss()
```','2018-06-20 01:52:00','2018-06-20 01:52:00','对于一些用户来说，可能需要在网页，app等客户端可以操作阿里云资源，如上传文件到oss，但是用户又不想把自己','2','2','29'),
('7','函数计算入口参数event详解','#### 官方文档中对event的解释如下：
event是用户调用函数时传入的数据，它可以是一个简单的string，也可以是一个JSON string，还可以是一个图片（二进制数据）。函数中的event参数是个字节流，在Python2.7中是str类型，在Python3中是bytes类型。

用户在函数中可以根据实际情况对event进行转换：
- 输入数据是一个JSON string的话，用户可以把它转换成一个dict:
```python
# -*- coding: utf-8 -*-
import json
def my_handler(event, context):
    evt = json.loads(event)
    return evt[\'key\']
```
- 输入数据是一个文件的bytes, 比如图片的文件作为event参数传入
```python
# -*- coding: utf-8 -*-
from wand.image import Image
def resize(event, context):
    with Image(blob=event) as img:
        with img.clone() as i:
            i.resize(128, 128)
            return i.make_blob()
```

#### 丰富event参数功能
上面列出的event参数功能都是针对具体的string或者文件bytes的情况，假设用户想在event中同时传送文本字符串和图片、音频、视频等其他文件资源，这个是可行吗？答案是肯定的。
在本教程中，我们以python3 runtime为例，将一张图片作为json的某个filed值传入函数的event参数，先在控制台上创建一个函数如下：
```python
# -*- coding: utf-8 -*- 
import json
from wand.image import Image
import base64

def handler(event, context):
    evt = json.loads(event)
    img_str = evt.get(\'image_str\', "")
    print("handler log:", evt.get(\'name\'))
    image_data = base64.b64decode(img_str)
    if not image_data:
        return
    with Image(blob=image_data) as img:
        with img.clone() as i:
            i.resize(128, 128)
            return i.make_blob()
```
假设这个函数所在的service名为`demo`, 函数名字是`multimedia`, 本地代码:
```python
# coding=utf-8
import fc2
import base64
import json

def get_multimedia_json(img_file):
    json_data = None
    with open(img_file, \'rb\') as jpg_file:
        byte_content = jpg_file.read()
        base64_bytes = base64.b64encode(byte_content)
        base64_str = base64_bytes.decode(\'utf-8\')
        raw_data = {
            \'name\': "multimedia",
            \'image_str\': base64_str,
        }
        json_data = json.dumps(raw_data)
    return json_data

json_data = get_multimedia_json("test.jpg")

client = fc2.Client(
    endpoint=\'<your account id>.cn-hangzhou.fc.aliyuncs.com\',
    accessKeyID=\'<your ak id>\',
    accessKeySecret=\'<your ak secret>\',
    )

# Invoke function synchronously.
resp = client.invoke_function(\'demo\', \'multimedia\', payload=json_data)

with open(\'output.jpg\', \'wb\') as jpg_file:
    jpg_file.write(resp.data)
```
这里假设函数的当前目录有`test.jpg`图片，执行函数之后，在本地会生成一张`test.jpg`缩放成128*128大小的图像`output.jpg`。

event是一个可以根据具体需求高度自由化定制的参数，真的可以为所欲为：
![image](https://yqfile.alicdn.com/3a87072a9ce8e5a3c5f3aec31b89956c48819987.png)','2018-06-20 01:52:00','2018-06-20 01:52:00','官方文档中对event的解释如下：
event是用户调用函数时传入的数据，它可以是一个简单的string，也','2','2','13'),
('8','python 3.6,django 1.11 配置mysql数据库','###1 安装pymysql： pip installl pymysql
python 3.6 中没有MySQLdb ,换成了pymysql

### 2 配置驱动：pymysql.install_as_MySQLdb()
在项目的init文件中导入

```python
import pymysql
pymysql.install_as_MySQLdb()
```


这一步必须要，不然会报错：找不到mysqldb 包 ，因为django中默认为mysql 驱动包名为MySQLdb ，但是我们安装的是 pymysql 所以有这一步

3 修改DATABASES{}：
将内容换成：

``` bash
\'default\': {
    \'ENGINE\': \'django.db.backends.mysql\',
    \'NAME\': \'dbname\',   #数据库名
    \'USER\': \'username\',    #用户名
    \'PASSWORD\': \'123456\',
    \'HOST\': \'hostname\',
    \'PORT\': \'3306\',
    \'CHARSET\':\'utf8\',##设置字符集，不然会出现中文乱码
    }
```

重启django： 
数据库中生成表：django_migrations 表示配置成功','2018-06-20 01:55:00','2018-06-20 01:55:00','1 安装pymysql： pip installl pymysqlpython 3.6 中没有MySQLd','2','1','29');
DROP TABLE IF EXISTS  `blog_post_tags`;
CREATE TABLE `blog_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_tags_post_id_4925ec37_uniq` (`post_id`,`tag_id`),
  KEY `blog_post_tags_tag_id_0875c551_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_post_tags_post_id_a1c71c8a_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`),
  CONSTRAINT `blog_post_tags_tag_id_0875c551_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

insert into `blog_post_tags`(`id`,`post_id`,`tag_id`) values
('6','1','7'),
('3','3','1'),
('4','3','2'),
('5','3','3'),
('7','4','1'),
('8','4','2'),
('9','4','3'),
('10','5','4'),
('11','5','5'),
('12','6','1'),
('13','6','2'),
('14','7','1'),
('15','7','2'),
('16','8','1');
DROP TABLE IF EXISTS  `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

insert into `blog_tag`(`id`,`name`) values
('1','python'),
('2','函数计算'),
('3','程序设计'),
('4','音乐'),
('5','电影'),
('6','动漫'),
('7','文档格式');
DROP TABLE IF EXISTS  `comments_comment`;
CREATE TABLE `comments_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_comment_post_id_96a9ac05_fk_blog_post_id` (`post_id`),
  CONSTRAINT `comments_comment_post_id_96a9ac05_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

insert into `comments_comment`(`id`,`name`,`email`,`url`,`text`,`created_time`,`post_id`) values
('1','luosong','abc@qq.com','http://www.baidu.com','不错不错','2018-06-19 09:25:35','1'),
('2','rsong','ls_huster@163.com','http://www.360doc.com/content/17/0710/14/11253639_670299444.shtml','加一个测试','2018-06-19 11:45:07','1'),
('3','张三','ls_huster@163.com','http://caibaojian.com/','很好很强大','2018-06-19 12:22:37','3'),
('4','洪泽湖','hongzehu@163.com','http://test.com','hello world!','2018-06-20 07:43:04','5'),
('5','我不填名字','191984292@qq.com','http://kongdehui.com','666','2018-06-20 07:44:11','6'),
('6','sadad','asdASD@QQ.COM','https://WWW.BAIDU.COM','ASDASDASDS','2018-06-20 07:53:27','6'),
('7','函数计算','10992121212@qq.com','https://www.baidu.com','不错，意义重大','2018-06-20 07:54:33','6'),
('8','函数计算','10992121212@qq.com','https://www.baidu.com','不错，意义重大','2018-06-20 07:54:34','6'),
('9','函数计算','10992121212@qq.com','https://www.baidu.com','不错，意义重大','2018-06-20 07:54:44','6'),
('10','函数计算','10992121212@qq.com','https://www.baidu.com','不错，意义重大','2018-06-20 07:54:45','6'),
('11','函数计算','10992121212@qq.com','https://www.baidu.com','不错，意义重大','2018-06-20 07:54:46','6'),
('12','函数计算','10992121212@qq.com','https://www.baidu.com','不错，意义重大','2018-06-20 07:54:48','6'),
('13','函数计算','10992121212@qq.com','https://www.baidu.com','不错，意义重大','2018-06-20 07:54:49','6');
DROP TABLE IF EXISTS  `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

insert into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values
('1','2018-06-19 09:21:31','1','python','1','[{"added": {}}]','7','1'),
('2','2018-06-19 09:21:35','1','python','1','[{"added": {}}]','8','1'),
('3','2018-06-19 09:22:31','2','rsong','1','[{"added": {}}]','2','1'),
('4','2018-06-19 09:22:35','1','hello world','1','[{"added": {}}]','9','1'),
('5','2018-06-19 12:15:34','2','函数计算','1','[{"added": {}}]','7','1'),
('6','2018-06-19 12:15:58','3','其他','1','[{"added": {}}]','7','1'),
('7','2018-06-19 12:16:17','2','函数计算','1','[{"added": {}}]','8','1'),
('8','2018-06-19 12:16:25','3','程序设计','1','[{"added": {}}]','8','1'),
('9','2018-06-19 12:16:32','4','音乐','1','[{"added": {}}]','8','1'),
('10','2018-06-19 12:16:38','5','电影','1','[{"added": {}}]','8','1'),
('11','2018-06-19 12:16:44','6','动漫','1','[{"added": {}}]','8','1'),
('12','2018-06-19 12:18:07','2','10分钟上线 - 利用函数计算构建微信小程序的Server端','1','[{"added": {}}]','9','1'),
('13','2018-06-19 12:19:18','2','10分钟上线 - 利用函数计算构建微信小程序的Server端','3','','9','1'),
('14','2018-06-19 12:20:09','3','10分钟上线 - 利用函数计算构建微信小程序的Server端','1','[{"added": {}}]','9','1'),
('15','2018-06-19 12:21:08','3','10分钟上线 - 利用函数计算构建微信小程序的Server端','2','[{"changed": {"fields": ["body", "excerpt"]}}]','9','1'),
('16','2018-06-19 12:25:25','1','MarkDown 测试','2','[{"changed": {"fields": ["title", "body", "excerpt"]}}]','9','1'),
('17','2018-06-19 12:27:19','7','文档格式','1','[{"added": {}}]','8','1'),
('18','2018-06-19 12:27:29','1','MarkDown 测试','2','[{"changed": {"fields": ["category"]}}]','9','1'),
('19','2018-06-19 12:28:28','3','10分钟上线 - 利用函数计算构建微信小程序的Server端','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('20','2018-06-19 12:29:32','3','10分钟上线 - 利用函数计算构建微信小程序的Server端','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('21','2018-06-19 12:30:21','3','10分钟上线 - 利用函数计算构建微信小程序的Server端','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('22','2018-06-19 14:48:51','4','利用函数计算实现网络游戏或视频直播中的敏感词检测','1','[{"added": {}}]','9','1'),
('23','2018-06-19 15:24:48','4','利用函数计算实现网络游戏或视频直播中的敏感词检测','2','[{"changed": {"fields": ["body", "excerpt"]}}]','9','1'),
('24','2018-06-19 15:25:42','4','利用函数计算实现网络游戏或视频直播中的敏感词检测','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('25','2018-06-19 15:27:34','4','利用函数计算实现网络游戏或视频直播中的敏感词检测','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('26','2018-06-19 15:28:54','4','利用函数计算实现网络游戏或视频直播中的敏感词检测','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('27','2018-06-20 01:50:16','4','电影','1','[{"added": {}}]','7','1'),
('28','2018-06-20 01:50:28','5','《山楂树之恋》：潜藏在纯爱背后的生化危机','1','[{"added": {}}]','9','1'),
('29','2018-06-20 01:52:23','6','如何利用函数计算获取临时token访问其他阿里云资源','1','[{"added": {}}]','9','1'),
('30','2018-06-20 01:53:03','7','函数计算入口参数event详解','1','[{"added": {}}]','9','1'),
('31','2018-06-20 01:55:36','8','WSGI PEP-0333','1','[{"added": {}}]','9','1'),
('32','2018-06-20 01:59:57','8','python 3.6,django 1.11 配置mysql数据库','2','[{"changed": {"fields": ["title", "body", "excerpt"]}}]','9','1'),
('33','2018-06-20 02:01:59','8','python 3.6,django 1.11 配置mysql数据库','2','[{"changed": {"fields": ["excerpt"]}}]','9','1'),
('34','2018-06-20 07:05:09','1','general','1','[{"added": {}}]','3','1'),
('35','2018-06-20 07:06:16','3','blog_demo','1','[{"added": {}}]','2','1'),
('36','2018-06-20 07:06:26','3','blog_demo','2','[{"changed": {"fields": ["last_login"]}}]','2','1'),
('37','2018-06-20 07:07:42','1','blog_admin','2','[{"changed": {"fields": ["password"]}}]','2','1'),
('38','2018-06-20 07:18:59','3','blog_demo','2','[{"changed": {"fields": ["first_name", "last_name", "email"]}}]','2','1'),
('39','2018-06-20 07:19:11','3','blog_demo','2','[{"changed": {"fields": ["is_staff"]}}]','2','1'),
('40','2018-06-20 07:19:59','3','blog_demo','2','[{"changed": {"fields": ["is_superuser", "last_login"]}}]','2','1'),
('41','2018-06-20 07:37:05','8','python 3.6,django 1.11 配置mysql数据库','2','[{"changed": {"fields": ["body", "excerpt"]}}]','9','3'),
('42','2018-06-20 07:43:03','1','blog_admin','2','[{"changed": {"fields": ["password"]}}]','2','1'),
('43','2018-06-20 07:56:31','6','如何利用函数计算获取临时token访问其他阿里云资源','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('44','2018-06-20 07:56:50','6','如何利用函数计算获取临时token访问其他阿里云资源','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('45','2018-06-20 07:57:11','6','如何利用函数计算获取临时token访问其他阿里云资源','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('46','2018-06-20 07:57:37','6','如何利用函数计算获取临时token访问其他阿里云资源','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('47','2018-06-20 08:31:31','2','函数计算','2','[]','7','1'),
('48','2018-06-20 08:31:34','5','cccc','1','[{"added": {}}]','7','1'),
('49','2018-06-20 08:39:25','3','blog_demo','2','[{"changed": {"fields": ["password"]}}]','2','3'),
('50','2018-06-20 08:45:59','6','如何利用函数计算获取临时token访问其他阿里云资源','2','[{"changed": {"fields": ["body"]}}]','9','3'),
('51','2018-06-20 08:46:42','6','如何利用函数计算获取临时token访问其他阿里云资源','2','[{"changed": {"fields": ["body"]}}]','9','3');
DROP TABLE IF EXISTS  `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

insert into `django_content_type`(`id`,`app_label`,`model`) values
('1','admin','logentry'),
('3','auth','group'),
('4','auth','permission'),
('2','auth','user'),
('7','blog','category'),
('9','blog','post'),
('8','blog','tag'),
('10','comments','comment'),
('5','contenttypes','contenttype'),
('6','sessions','session');
DROP TABLE IF EXISTS  `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

insert into `django_migrations`(`id`,`app`,`name`,`applied`) values
('1','contenttypes','0001_initial','2018-06-19 09:16:03'),
('2','auth','0001_initial','2018-06-19 09:16:03'),
('3','admin','0001_initial','2018-06-19 09:16:03'),
('4','admin','0002_logentry_remove_auto_add','2018-06-19 09:16:03'),
('5','contenttypes','0002_remove_content_type_name','2018-06-19 09:16:04'),
('6','auth','0002_alter_permission_name_max_length','2018-06-19 09:16:04'),
('7','auth','0003_alter_user_email_max_length','2018-06-19 09:16:04'),
('8','auth','0004_alter_user_username_opts','2018-06-19 09:16:04'),
('9','auth','0005_alter_user_last_login_null','2018-06-19 09:16:04'),
('10','auth','0006_require_contenttypes_0002','2018-06-19 09:16:04'),
('11','auth','0007_alter_validators_add_error_messages','2018-06-19 09:16:04'),
('12','auth','0008_alter_user_username_max_length','2018-06-19 09:16:04'),
('13','blog','0001_initial','2018-06-19 09:16:04'),
('14','blog','0002_auto_20170517_1929','2018-06-19 09:16:04'),
('15','comments','0001_initial','2018-06-19 09:16:04'),
('16','sessions','0001_initial','2018-06-19 09:16:04');
DROP TABLE IF EXISTS  `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `django_session`(`session_key`,`session_data`,`expire_date`) values
('2m1vhvrq19brcghm1071xof3v7933284','MDA0YmY5NDQ4OWE4MTU1MjM2MjFkYmE3ODkwOTBjZDgyMmQwZTdhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzMzMDJkNzI2ZmEyOWRhODRhZTQ3MmJmZjFjYjA4MDg5YTA2ZTM3In0=','2018-07-04 07:45:26'),
('9cp3olo2a49azok1is62xjqk7a539zej','MDA0YmY5NDQ4OWE4MTU1MjM2MjFkYmE3ODkwOTBjZDgyMmQwZTdhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzMzMDJkNzI2ZmEyOWRhODRhZTQ3MmJmZjFjYjA4MDg5YTA2ZTM3In0=','2018-07-04 07:45:56'),
('c7j4qs153u49u3z7effg16anecwixfo8','OTRiY2ZhMjMwNmRmNzA5YTJkZWI5ZDJjOTRhYzIxODZmODhiNDQyNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNTQ5ODEyMTExMDY1Zjg0NmU2YzMxNDk3M2IyYjA4Y2YzNjMwZDU1In0=','2018-07-03 09:18:45'),
('cdq6qdfm5z9jw3ejfe0nxvsztcadrev9','MDA0YmY5NDQ4OWE4MTU1MjM2MjFkYmE3ODkwOTBjZDgyMmQwZTdhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzMzMDJkNzI2ZmEyOWRhODRhZTQ3MmJmZjFjYjA4MDg5YTA2ZTM3In0=','2018-07-04 08:31:15'),
('mbxcgkunchgcww5xkfsjb11nboxhpwho','ZDM4N2MzZmRiNzQwOTZkYjgwMzI4YzYyNGZlZjdkZjRlODQ1NGNhMDp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjZGZmMTZkOWU4ZDhhYzY2ZjQxOTJmNmZlMmE3NjY1NDIyOTE4YTczIn0=','2018-07-04 08:39:37'),
('qrg7wpu7v4i454i5nxi8jvakati4vo9l','MDA0YmY5NDQ4OWE4MTU1MjM2MjFkYmE3ODkwOTBjZDgyMmQwZTdhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzMzMDJkNzI2ZmEyOWRhODRhZTQ3MmJmZjFjYjA4MDg5YTA2ZTM3In0=','2018-07-04 07:44:38'),
('rxids7l855euuxmdlhkf1fsj0ftorais','OTRiY2ZhMjMwNmRmNzA5YTJkZWI5ZDJjOTRhYzIxODZmODhiNDQyNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlNTQ5ODEyMTExMDY1Zjg0NmU2YzMxNDk3M2IyYjA4Y2YzNjMwZDU1In0=','2018-07-03 12:12:27'),
('seq8efh033jcxid2grshjva3qpigt6tz','MDA0YmY5NDQ4OWE4MTU1MjM2MjFkYmE3ODkwOTBjZDgyMmQwZTdhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzMzMDJkNzI2ZmEyOWRhODRhZTQ3MmJmZjFjYjA4MDg5YTA2ZTM3In0=','2018-07-04 07:44:46'),
('zhrsjvkjjoma24rqrkkpgmgqx8h99eug','MDA0YmY5NDQ4OWE4MTU1MjM2MjFkYmE3ODkwOTBjZDgyMmQwZTdhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzMzMDJkNzI2ZmEyOWRhODRhZTQ3MmJmZjFjYjA4MDg5YTA2ZTM3In0=','2018-07-04 07:45:21'),
('zmehf468xsydlwt2l827ycmx3lxsxlhb','MDA0YmY5NDQ4OWE4MTU1MjM2MjFkYmE3ODkwOTBjZDgyMmQwZTdhNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NzMzMDJkNzI2ZmEyOWRhODRhZTQ3MmJmZjFjYjA4MDg5YTA2ZTM3In0=','2018-07-04 07:45:35');
SET FOREIGN_KEY_CHECKS = 1;

