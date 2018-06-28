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
('2','��������'),
('3','����'),
('4','��Ӱ'),
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
('1','MarkDown ����','### ��Ҫ����

- ֧�֡���׼��Markdown / CommonMark��Github�����﷨��Ҳ�ɱ���Ϊ����༭����
- ֧��ʵʱԤ����ͼƬ�������ϴ���Ԥ��ʽ�ı�/����/�����롢�����۵��������滻��ֻ��ģʽ���Զ�����ʽ����Ͷ������﷨�����ȹ��ܣ�
- ֧��ToC��Table of Contents����Emoji���顢Task lists��@���ӵ�Markdown��չ�﷨��
- ֧��TeX��ѧ��ʽ������KaTeX��������ͼ Flowchart �� ʱ��ͼ Sequence Diagram;
- ֧��ʶ��ͽ���HTML��ǩ������֧���Զ�����˱�ǩ���������пɿ��İ�ȫ�Ժͼ������޵���չ�ԣ�
- ֧�� AMD / CMD ģ�黯���أ�֧�� Require.js & Sea.js��������֧���Զ�����չ�����
- �����������������IE8+����Zepto.js����֧��iPad��ƽ���豸��
- ֧���Զ���������ʽ��

# Editor.md

![](https://pandao.github.io/editor.md/images/logos/editormd-logo-180x180.png)

![](https://img.shields.io/github/stars/pandao/editor.md.svg) ![](https://img.shields.io/github/forks/pandao/editor.md.svg) ![](https://img.shields.io/github/tag/pandao/editor.md.svg) ![](https://img.shields.io/github/release/pandao/editor.md.svg) ![](https://img.shields.io/github/issues/pandao/editor.md.svg) ![](https://img.shields.io/bower/v/editor.md.svg)

**Ŀ¼ (Table of Contents)**

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

#### ���⣨�õ��ߵ���ʽ��Heading (underline)

This is an H1
=============

This is an H2
-------------

### �ַ�Ч���ͺ��ߵ�
                
----

~~ɾ����~~ <s>ɾ���ߣ�����ʶ��HTML��ǩʱ��</s>
*б����*      _б����_
**����**  __����__
***��б��*** ___��б��___

�ϱ꣺X<sub>2</sub>���±꣺O<sup>2</sup>

**��д(ͬHTML��abbr��ǩ)**

> �������ĵ��ʻ�������д��ʽ��ǰ���ǿ���ʶ��HTML��ǩʱ����Ĭ�Ͽ���

The <abbr title="Hyper Text Markup Language">HTML</abbr> specification is maintained by the <abbr title="World Wide Web Consortium">W3C</abbr>.

### ���� Blockquotes

> �����ı� Blockquotes

���õ����ڻ�� Blockquotes
                    
> ���ã������Ҫ����հ׻���`��<br />��ǩ`���ڲ��봦�ȼ����������ϵĿո�Ȼ��س����ɣ�[��ͨ����](http://localhost/)��

### ê�������� Links

[��ͨ����](http://localhost/)

[��ͨ���Ӵ�����](http://localhost/ "��ͨ���Ӵ�����")

ֱ�����ӣ�<https://github.com>

[ê������][anchor-id] 

[anchor-id]: http://www.this-anchor-link.com/

GFM a-tail link @pandao

> @pandao

### �����Դ������ Codes

#### ���ڴ��� Inline code

ִ�����`npm install marked`

#### �������

�������ĸ��ո�Ҳ��Ϊʵ������`<pre>`Ԥ��ʽ���ı�(Preformatted Text)�Ĺ��ܡ�

    <?php
        echo "Hello world!";
    ?>
    
Ԥ��ʽ���ı���

    | First Header  | Second Header |
    | ------------- | ------------- |
    | Content Cell  | Content Cell  |
    | Content Cell  | Content Cell  |

#### JS���롡

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

#### HTML���� HTML codes

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

### ͼƬ Images

Image:

![](https://pandao.github.io/editor.md/examples/images/4.jpg)

> Follow your heart.

![](https://pandao.github.io/editor.md/examples/images/8.jpg)

> ͼΪ�����Ű׳�ɳ̲

ͼƬ������ (Image + Link)��

[![](https://pandao.github.io/editor.md/examples/images/7.jpg)](https://pandao.github.io/editor.md/examples/images/7.jpg "�����ר������ˮ���꡷����")

> ͼΪ�������ר������ˮ���꡷����
                
----

### �б� Lists

#### �����б����ţ�Unordered Lists (-)
                
- �б�һ
- �б��
- �б���
     
#### �����б��Ǻţ�Unordered Lists (*)

* �б�һ
* �б��
* �б���

#### �����б��Ӻź�Ƕ�ף�Unordered Lists (+)
                
+ �б�һ
+ �б��
    + �б��-1
    + �б��-2
    + �б��-3
+ �б���
    * �б�һ
    * �б��
    * �б���

#### �����б� Ordered Lists (-)
                
1. ��һ��
2. �ڶ���
3. ������

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
                    
### ���Ʊ�� Tables

| ��Ŀ        | �۸�   |  ����  |
| :--------:   | :-----:  | :----:  |
| �����      | $1600   |   5     |
| �ֻ�        |   $12   |   12   |
| ����        |    $1    |  234  |','2018-06-19 09:21:00','2018-06-19 09:21:00','��Ҫ����֧�֡���׼��Markdown / CommonMark��Github�����﷨��Ҳ�ɱ���Ϊ�����','2','3','19'),
('3','10�������� - ���ú������㹹��΢��С�����Server��','### ǰ��

��ƪ�����ʺ����е���΢��С���򿪷����֡������Լ���׼��ѧϰ����΢��С����ĳ���Գ�������Կ���һ������"������������С����Ϊ���������������ʹ�ð����ƺ���������ٹ���΢��С�����`�����`��ͨ�����ģ��������˽���������:

- #### [demo����](#concept)
- #### [��ͳ�������ܹ� VS Serverless�ܹ�](#trad-serverless)
- #### [Serverless�ܹ����](#serverless-detail)
- #### [demo�������ò���](#setup-detail)

<a name="concept"></a>
### demo����

�ڱ��̳��У����ǽ���������ú�������һ��һ��������΢��С�����server�ˣ�����С����ο�"������", ʵ��һ���򵥰汾����demo�п���չʾ�������ɣ�����ת��������������֤��

>΢���������С�����ǻ���΢��С�������������������������߿���д����Ҫ�ñ���˵�Ļ�����������ҽ�Ǯ����˺���У������û�ֻҪ������仰������Ϳ��Ի�ú��������������Է����ض��ĺ��ѡ�΢��Ⱥ�Լ�����Ȧ��������Ҫ�������ֿ���˵����Ӧ�����������ܻ�ú�������ֻ�����Ϊ,������Ȧ����΢��Ⱥ�罻�ĳ����£����Լ������������Ծ�ȣ�����򵥷��㣬����Ȥζʮ�㣬�������ʽ�ḻ����(��㡢ʾ����ף�ء�˵�ںš������ǹ����)����Щ���ÿ�����һֱά�ֺܸߵ��ȶȡ�

##### demo�ͻ���С�������Ч����ͼ����:

* ���ɿ���

![image](https://yqfile.alicdn.com/6605c84b1d5458b93fc075db8805f0a354c81d4c.png)

* ת������

![image](https://yqfile.alicdn.com/a110119a12a1d5e95d3f7e24faa335bd2fb9a05b.png)

* ¼����֤���� 

![image](https://yqfile.alicdn.com/0c56fe69232d9f730b3b264bc537810e8c9780f0.png)

<a name="trad-serverless"></a>
### ��ͳ�������ܹ� VS Serverless�ܹ�
������˵�������������ͻ��˵�΢��С�������ã����󲿷ֵ�С�������Լ���server�ˡ��û�����server�˷��񣬳������ٿ���Ч�ʣ���ά�ɱ��ߣ�������Դ����������ʹ�㣬��ʹ��Serverless�ܹ����ԺܺõĽ���������⡣�����Ǵ�ͳ�ܹ���Serverless�ܹ��ĶԱȣ�

|   Item     |   Serverless | ��ͳ��ʽ�����  |
| :----------------------- | :--------------------------| :----------------------|
| ά���ɱ�  | ά���ɱ��ͣ��������������Ȼ�����ʩ��ֻ���д���벢�ϴ�������Ա�ӵײ��豸ά���н�ų�����ֻ����ʵ��ҵ���߼����ɡ�| ά���ɱ��ߣ�����ά������������Ҫ���������崻������������ݵ�һϵ�еײ����������   |
| ������  | �����Ըߣ���������Ϊ�û�׼�����ԡ��ɿ��ļ�����Դ�����и��������Զ�scale���ԣ��������Բ��岨�ȵ�����Ч����� |  ���������ϻ��Ӧ�÷����������Ӱ�� |
| ����  | ���踶�ѣ�ֻΪʵ��ʹ�õļ�����Դ���ѣ�����δ�����򲻲������� |  ��Ҫ֧���������ķ��ã������������Ҫ�շ�   |

������[��������](https://promotion.aliyun.com/ntms/act/fc/doc.html?spm=5176.137990.709885.btn3.2002bb57UV8Btt&wh_ttid=pc)��һ���¼�������ȫ�йܼ������ͨ���������㣬���������������Ȼ�����ʩ��ֻ���д���벢�ϴ������������Ϊ��׼���ü�����Դ���Ե��ԡ��ɿ��ķ�ʽ�������Ĵ��룬���ṩ��־��ѯ�����ܼ�أ������ȹ��ܡ������ں������㣬�����Կ��ٹ����κ����͵�Ӧ�úͷ�������������ά��

<a name="serverless-detail"></a>
### Serverless�ܹ����
![image](https://yqfile.alicdn.com/df8bce4f8b7d87360bc824f79786553e49137975.png)


������������ͼ��ʾ�� ��Ҫ��Ϊ��������ģ�飺

* Login & Auth
> ΢�Ž���[��¼ʱ��ͼ](https://mp.weixin.qq.com/debug/wxadoc/dev/api/api-login.html#wxchecksessionobject)����, ���е�������������FCʵ�֣�
![image](https://yqfile.alicdn.com/8057e1438a052a3484f6e78186be59d251eaf3dc.png)

* ����ʶ��(������Ƶ��ʽת��)
> ffmpeg������Ƶ��ʽת��
> [�ٶ�����ʶ�𿪷��ĵ�](https://ai.baidu.com/docs#/ASR-Online-Python-SDK/top)

* ����ͼ�²����߿������ǿ�����չ��ģ�飬��demo�в�չʾ���û����Ը����������
> ����΢��С����ֱ���ϴ��ļ���oss���棬����������Դ�oss��ȡ��Ӧ�����������������Ҫ���ݿ⹦�ܣ����Բ���ots

<a name="setup-detail"></a>
### demo�������ò���
##### ׼��������
1����ͨ[������](https://cn.aliyun.com/)�˺ţ�ͬʱ��Ҫ��ͨ�Ĳ�Ʒ��[��������](https://www.aliyun.com/product/fc?spm=a2c4g.11186623.2.3.H2aFTN), [api����](https://www.aliyun.com/product/apigateway?spm=5176.10695662.1996646101.searchclickresult.67ac2b6eGQ6uCe)

2������[��������](https://wanwang.aliyun.com/?spm=5176.8142029.388261.261.105af7984EoebL),ͬʱ��������������Լ�����[���������ssl֤��](https://common-buy.aliyun.com/?commodityCode=cas#/buy),������ɲο�[������밢����DV SSL֤��](https://www.xiaoz.me/archives/7442)

3����ͨ[΢��С����](https://mp.weixin.qq.com/debug/wxadoc/dev/)������֤,�Լ�[�ٶ�����ʶ��](http://yuyin.baidu.com/)

4����github������Ӧ��[Դ��](https://github.com/awesome-fc/wx-demo)������clientĿ¼��ʾ�ͻ��ˣ�server��ʾ���ڴ���������

##### FC��
1������Դ���е�serverĿ¼����`�����`���������纯����Ϊ`wechatEntry`�����������ַ�������������
   * ���ÿ���̨����ϴ�,���ö�Ӧ��handler, �����������̨ʹ�ÿɲο�[hello world](https://yq.aliyun.com/articles/226545?spm=a2c4e.11155435.0.0.3e554a7cRLZ4Vr), �ر��ǿ���̨�ϴ�����������������֡���������Ҫ�����ͼ:
  ![image](https://yqfile.alicdn.com/90306b3ea4fc57991427afed45dd89f6ad7caa0e.png)
  
  ![image](https://yqfile.alicdn.com/518eed4682864aac9ae2316fbea9cf98db70dadd.png)
  
   * ����������Ϥfcli�Ĺ��ߵ����û�����ʹ�ú������������й���[fcli](https://github.com/aliyun/fcli/releases?spm=a2c4g.11186623.2.4.Zxk9nW), [fcliʹ��˵��](https://help.aliyun.com/document_detail/52995.html?spm=a2c4g.11186623.2.5.Zxk9nW)
  `fcli function create -f wechatEntry  -h main.handler -d server -t python2.7 -s wechat`
  
> ע�⣺�������ַ�����������֮ǰ�����ȰѺ�����main.py����ؿ������øĳ��Լ�����ģ�����`΢��С���򿪷������������`��`�ٶ�����ʶ���������`
  
2, �Ժ���������Ϊ API ���غ�˷���
   * api����֧��https���񣬾�����Բο�[api����֧��https](https://help.aliyun.com/document_detail/48866.html)
   * [����������Ϊapi���غ�˷���](https://help.aliyun.com/document_detail/54788.html?spm=a2c4e.11153959.blogcont279124.16.7c3098feHThGm2)
   * api���������ú�����Ӧ��api�������ö�������
  ![image](https://yqfile.alicdn.com/07201ab16c53b9eb68dc4539175f3a2140db7506.png)
   
   * ���Ч��ͼ�Լ����Խ������£�
  ![image](https://yqfile.alicdn.com/431f50c71b2d95acb6074d81645abeddf7b0ec63.png)
  ![image](https://yqfile.alicdn.com/53aa2fdcf5acec18ecc30a55f670ede0ecdbc0db.png)
  ![image](https://yqfile.alicdn.com/edc3dfdaa052a5fdf5bd63d922e7e3e02bfb5252.png)
  
##### client��
* ����[΢��С����ٷ��̳�](https://mp.weixin.qq.com/debug/wxadoc/dev/quickstart/basic/getting-started.html)��������Ӧ��С�����˺��Լ����̣���Ҫע�����Ҫ��api���������õ�������ӵ�΢��С����Ŀ���������:
![image](https://yqfile.alicdn.com/9e6e724772c29ceef82abc6bf92f49fa347369b9.png)
* ֱ����΢��С���򿪷����ߴ򿪣��޸Ķ�Ӧ����������appid���ɣ�������ͼ��ʾ��
![image](https://yqfile.alicdn.com/e459d25fc5c3369c6091652434a22d06cf92e80d.png)
![image](https://yqfile.alicdn.com/d49d77ff6982f80b7f9e0a8bf33411320ebfdffe.png)

### �ܽ�
���ú���������Կ��ٴ΢��С�����serverless���ã����oss��ots���Էḻ`server`�Ĺ��ܣ��������������ά���ɱ��ͣ����õ���������ֻ��Ҫ�����Ϳ���ʵ�֣���ֵ��ӵ�У�

#### [githubԴ���ַ](https://github.com/awesome-fc/wx-demo)

#### һЩ����FAQ, �����ο�

##### ��ô����fc��
fc���Խ���sls��ͨ��sls��־�����Բ鿴�㺯�����е������������Բο�[����������־����](https://help.aliyun.com/document_detail/61023.html?spm=a2c4g.11186623.6.559.rzDK8w)

##### ���¼��������ļ��ܴ�ʱ��ܳ�����������ʶ�����ʱ��ܳ�����ô�죿
���Բο�[����������ʽ������ļ�](https://yq.aliyun.com/articles/281011?spm=a2c4e.11155435.0.0.45ce0a58du9Fkb)�ķ���˼��������ָ������ʽ��������ֱ��ѡ������ʽ���������ʶ��ķ���

##### �����������ļ����������ļ������ݴ�����ô�죿
���Բο�΢��С�����пͻ���utils�ļ��������uploadAliyun.js

### ����
* ΢��С����ʹ�õ�ͼƬ�Ͳ�����ʽ�ز����Ի��������ڴ����������demo��������ѧϰ����չʾʹ�ã���û���漰��ҵ�������ԭ���߿��������������������Ի��߸��ҷ��ʼ�����ע�����õ�ַ��

* ��ӭ���ͨ��ɨ����������û�Ⱥ�У��������������������������������Ⱥ���������

  ![image](https://yqfile.alicdn.com/31243845f6e99e97578a7e6921a0a06db0f0b587.png)','2018-06-19 12:19:00','2018-06-19 12:19:00','ǰ����ƪ�����ʺ����е���΢��С���򿪷����֡������Լ���׼��ѧϰ����΢��С����ĳ���Գ�������Կ���һ������"','1','2','14'),
('4','���ú�������ʵ��������Ϸ����Ƶֱ���е����дʼ��','#### һ������
Ŀǰ��������Ϸ����Ƶֱ�����Ǻܻ𱬵Ĳ�ҵ��Ȼ���������ڶ�������������Ϸ��MMORPG)�У���������Ϸ��Ƶֱ����������ֱ����(��Ļ)����һ����û������߽����ͻ����������ǵĺ�����Ȥ���ڣ��������֮��Ľ����ͻ������ɱ���ػ��漰��һЩ���дʣ�����һ����û������г��ֵ����дʽ��й��ˣ��ṩһ��������г�����绷���Ƿǳ���Ҫ������ġ�

#### �������м�������
���м����У�ͨ���������ַ�ʽ�������дʵĹ��ˣ�

##### ��һ�ַ�ʽ���ͻ���������дʵĹ���
�ͻ��˴洢�����дʿ⣻�����������ı����ݾ����ͻ������дʹ���ģ����ˣ�Ȼ�󽫹��˺���ı��ɿͻ��˷����������������ɷ�����ת�������շ��ͻ�����ʾ����ʱΪ�˵��ķ��Ͷ˵Ĺ���ģ�鱻hacker�ƹ�����Ҫ�ڽ��շ��ڽ��յ�ʱ��Ҳ�����¿ͻ������дʹ���ģ�顣

* ����:
ÿ���ͻ��˵���ִ�����дʹ��ˣ�Ч�ʸߣ��Ҳ�ռ�÷�������Դ��������û�м������ġ�

* ����: 
���дʾ���ʱЧ�ԣ�������³��ֵ����дʣ�����ʵʱ�����ӵ��ͻ��˵����дʿ⣬ֻ�ܵ��´οͻ��˴��°�����patch�ſ�����ӽ�ȥ�����ʱ��ɱ��е��

##### �ڶ��ַ�ʽ��������������дʵĹ���
�ڷ������д洢���дʿ⣬���������дʹ���ģ�飬�����������յ����ı����ݽ������дʹ��ˣ�����ִ�������дʹ��˺���ı����ݷ������ͻ��ˡ�

* ���ƣ�
���ڿ�ʵʱ�������дʣ�������ͻ���¼��󣬲���Ҫͣ���Ϳ�ʵ�ֶ�̬����µ����дʡ�

* ���ƣ��ɷ�����ִ�����дʹ��˻ᵼ�����Ӵ�������������ģ�Ӱ����������ܡ��е������������ܻᵼ��ִ��ĳЩ������ʱ�������ɷ��������̿��١�

#### ����������������ṩ�Ľ������
�����дʼ���ģ����ں�������ʵ�֣��������ɿͻ��˺ͷ���˷��������ÿ����������ڱ�ʾ���У����ǰѷ�������дʼ����̷��ڿͻ��˷�������ͼ��ʾ��
![image](https://yqfile.alicdn.com/8a23d352373713769897197b78cca869731791ed.png)

���ƣ��������ӷ������ļ������ģ�ͬʱֻ��Ҫ�����º������Ϳ��Դﵽʵʱ�������д�Ŀ�ġ�

#### ���岽��
#####1 . ����������Ϊ API ���غ�˷���, ����Ľ̳̿��Բο�[�ٷ��̳�](https://help.aliyun.com/document_detail/54788.html?spm=5176.doc29497.6.584.8ykpic)��[���������ȡ��ʱtoken](https://yq.aliyun.com/articles/279124?spm=5176.8091938.0.0.iUj0gd)

##### 2 . ��������ʵ�����дʼ��Ĺ��ܣ�������Ҫ�����������, ��python��Ϊ������ԣ����������ʾ�����롣

�ڱ��̳��У�ѡ������ʽ��Ϊ���ǵ����дʼ�⣬Ҳ����python��reģ�飬���������дʼ�黹����һЩ����������Ҫ����ȥ����������ǣ�����Ϸ������Ƶֱ�����ߵ�ʱ�����д������һ���м��ٸ�����python��ͨ�� re.compile ����������ʽ�Ǻܺ�ʱ�ģ����ٸ���������������Ҫ10��������20���룬�����������ʽ����Ǳ�����ģ���ôֱ�ӽ���ƥ��match����search���Ǻܿ�ģ�ʮ��������Ը㶨��

��ʼ���������ǿ��Խ�������ʽ�ı����� cPickle.dumps ���л����浽�ļ��С����´γ�������ʱֱ�Ӵ��ļ���ȡ���ݣ� cPickle.loads �����л���������ʽ���󡣵�������пӣ�����û�к�ʱ���ƣ������[cPickle������ʽ����](http://blog.qiusuo.im/blog/2014/08/18/cpickle-regex-object/)

���շ���������[cPickle������ʽ����](http://blog.qiusuo.im/blog/2014/08/18/cpickle-regex-object/)�Ĵ��������������ʱ�Ľ��ѹ�������л�����֮�������е�ʱ��ǵ��ٽ�ѹһ�¾��У������ĺô��ǣ��м�����л��ļ���С���Դ��ѹ�������̳̲���һ����ʾ��ѹ��5�����ϣ����Ƕ���������ʱ��Ӱ�첻�Ǻܴ������ʱ���ر����еģ����Բ�����ѹ�����̡�

���Ĵ�������ļ�`re_pickple.py`

```python
# -*- coding:utf-8 -*-
\'\'\'
_sre.SRE_Pattern ��������л������Ǳ���ĺ��� re._compile ������Ĳ��� pattern ��flags ������������
�����л���ʱ�� _compile(pattern, flags) ,���ֱ�� re.compile û����ʲô���𣬳������α���л�
���ｫreģ���е�compile���̷ֳ��������֣�dump���ʱ���code��Ȼ��load��code���ٿ���ת���� _sre.SRE_Pattern ����
\'\'\'
import cPickle, re, sre_compile, sre_parse, _sre
import zlib,time


# ����ѹ���Ŀ���
zip_flag = False

# Ŀǰ���������ca����û������builtins
# ��Ҫ���ڱ���pip install -t . future
if zip_flag:
    from builtins import int

\'\'\'
raw_compile, build_compiled��reģ���е�compile��ֳ���������
\'\'\'
# the first half of sre_compile.compile
def raw_compile(p, flags=0):
    # internal: convert pattern list to internal format

    if sre_compile.isstring(p):
        pattern = p
        p = sre_parse.parse(p, flags)
    else:
        pattern = None
    # ��Ҫ��ʱ��_code����
    code = sre_compile._code(p, flags)
    
    if zip_flag:
        code = zlib.compress(str(code)) # code��ʽ�򵥣�Ԫ�ض������͵�list

    return code

# the second half of sre_compile.compile
def build_compiled(p, flags, code):
    # print code
    # ���¼���p, parse������ʱ���٣������p dump,ռ�ÿռ�ϴ�
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

def decode_str(code_str): #��ѹ��
    raw_code = zlib.decompress(code_str)
    raw_code.strip()
    raw_code = raw_code[1:-1]
    str_li = raw_code.split(\',\')
    code = [int(item.strip()) for item in str_li]
    return code
```

����������һ������ǳƵ������ֿ⣬һ����150��������򣬲�����������:

```python
# -*- coding: utf-8 -*- 
data = [ 
  \'(?i)����(ǿ��)??��פ|��ļ.{0,3}?���|ǿ����פ|��Ⱥ��??����|�����|����Ⱥ|Ⱥ[^a-zA-Zһ-��0-9_�R��һحد�T�Wؼ]*?����|��Ծ����|[q��][^a-zA-Zһ-��0-9_�R��һحد�T�Wؼ]*?Ⱥ|���ḣ��|����[����]��|������|���к�|�����|[�ٰ�]����|��ѷ���|�������|����Ⱥ|�������|�������|�������|������|������|����.{0,3}?����\',
  \'([\\d��������������������������������������������������������¢âĢ����������٢ڢۢܢݢޢߢ���ŢƢȢǢɢʢˢ̢͢΢ϢТѢҢӢԢբ֢עأ�������������������һ�����������߰˾�ʮ0����oO�ϣ��0oO��Ϩ�����������][^A-Za-z0-9_һ-��]{0,6}?){5,}?\',
  ......
  ]
```

2.1 ���Ƕ����м����ʱ�Ľ���������л�,  ���л����������`name_prog.pkl`�ļ���:

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
  
2.2 ���дʼ��demo
  
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
    inputlst = ["����", "С����", "����", "����"] 
    for input in inputlst:
        start = time.time()
        ret = check_nick_name_valid(input)
        end = time.time()
        print \'check ret = {} ; check_time = {}\'.format(ret,end - start)
```
������£�
```
load time =  0.238202095032
check ret = True ; check_time = 0.000257015228271
check ret = True ; check_time = 8.10623168945e-06
check ret = True ; check_time = 4.05311584473e-06
check ret = True ; check_time = 0.000158071517944
```
> ע���������簲ȫ��飬������������ֶ��ǺϷ��ģ��û������ڱ��س���ʹ�������е�����

��ˣ�ֻҪ���ǽ�name_prog.pkl�����ǵļ�⺯����re_pickple.pyһ�𣬹������ǵĺ������������ǵĺ������£�һ���Լ��4�����֣����ǲ����µ���100����ʱ��������
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
    inputlst = ["����", "ë��", "ϰ��ƽ", "����"] 
    for input in inputlst:
        ret = check_nick_name_valid(input)
    return time.time() - begin
```
����100�������ĵ�ʱ��������£�
> avg:  0.000343136787415
> min:  0.000230073928833
> max:  0.000503063201904

#### �ܽ�

���ú�������ʵ���Զ�������дʼ��ģ�鷽����һ���ܺõ�ѡ���Լ�Ԥ����ĵ��������л��м������˵�һ��load��Լ��100���������⣬�����ļ�����������뼶���ܸ�����������Һ��������������Զ���������scale����ʹ���ִ��������ֽ�����Ҳ�ܿ��ټ�ʱ�����ܻ����Ƶֱ����Ҳ���º�����Ļ�ˡ�ͬʱ����һ����չ�����������Ϸ�г��ֵ�������Ϣ�ķ�������֣����������Լ�ⶼ����ͨ������������ʵ��, [�������м��](https://yq.aliyun.com/articles/436096?spm=a2c4e.11155435.0.0.1a62a1bffPVTQP)��

#### �ο�
[cPickle������ʽ����](http://blog.qiusuo.im/blog/2014/08/18/cpickle-regex-object/?spm=a2c4e.11153959.blogcont316808.20.1b2a3eb2n8Cxwc)','2018-06-19 14:48:00','2018-06-19 14:48:00','һ������Ŀǰ��������Ϸ����Ƶֱ�����Ǻܻ𱬵Ĳ�ҵ��Ȼ���������ڶ�������������Ϸ��MMORPG)�У���������','1','2','16'),
('5','��ɽ���֮������Ǳ���ڴ������������Σ��','�����ҿ��ˡ�ɽ���֮��������ʼ��ʱ����θɾ�������ж������Ǻ���������Щ���Ծ������ﲻ�Ծ���˵���������ؼҵ�һ·���Ҷ���˼���ţ�Ȼ���뵽�ˡ������ǿ�ɽ�����

������֪��ɽ����ǿ��׻��ģ�������Ȼ���ɡ�����Ӱ����ǿ�ɽ�������ɫ�Ƕ�˵�����Ǻ컨�����Ϊ�˵�Ӱһ����Ҫ���������������������Υ����Ȼ���ɵ�����Ů���ǵ���ʦ��Ƭ�ӵĿ�ͷ����˵������ʿ�ǵ���ѪȾ����������

���������һ������ʫ�����������˰�����Ϊһ������Ĵ𰸣��ͺ������ǲ�������ƽϹ������ɫ����������Ѫ��Ⱦ���һ����

���ӵ�Ӱ���������ʦ���峤�������������˶���̸����ûῪ�컨��ɽ������������ɽ������Ǳ�������ʫ��������ȷʵ���ĺ컨��

���ɽ�����Ϊ��Ω�������꿪���컨�أ�

�����ǰ������������£���������һ��ϸ�ڡ�

�������˰�Ѫ��֮�󣬾�����ȥ������ʶ�Ӫ�����������ʶӵ��˶���˵��һ�����������м�������Ҫ����Ϣ��

��һ�����ӳ���������Ҳ���˵��˰�Ѫ�����ڶ������°�Ѫ���ģ��ǵ��ʶӿ�̽�Ŀ�������������¶��ӵ��˼����ò������Դ��ż�����Ʒȥ���ﻯ��ȥ�ˡ�

������������Ƕ�֪��������Ҳ���˰�Ѫ��������ȥ����

ԭ��С˵��ֻ�ᵽ�������Ĳ����ܸ���̽�����йأ�Լ��һ���������һ�ζԻ����ǵ�Ӱԭ�������ǲ���Ҫ�����ˣ�����һֱ�ڿ���ؿ���ӰƬ�ĳ��ȣ����ط���������Ļ���������������ϧʱ���Ϊ��Ҫ������ôһ��ò�ƺ��ޱ�Ҫ��ԭ�������أ�

Ϸ�紴���������и�˵����˵�������̨�Ĳ��������һ֧ǹ����ô������Ҫ��һ�£�����Ͳ�Ҫ�ҡ�����˼�ǲ�Ҫ��Ϸ��������޹صĶ�����

����������ۣ��ⳡϷ��Ȼ��������ġ�

�ⳡϷ�����������Ҫ����ʾ�ǣ������İ�Ѫ���������ڶ��ӿ�̽����Щʯͷ������Ī��Ĺ�ϵ��

�ܵ��°�Ѫ��һ����Ҫԭ���Ƿ��䡣����������ڵ��ʿ�̽�ӣ����Ӵ����ģ�Ӧ������ǿ�ҷ���Ŀ�������˿�

���Ⲣ���ܽ�����ʡ�

���ʿ�̽�Ӷ���רҵ��Ա��̽���������������ǵ�ר����������˿󣬵�һʱ��ͻ�������������ô���ܻ��Ϳ������ö��˵��˰�Ѫ����������������������ʯͷȥ��������أ�

���ң���������ڵ������˿����ǹ��Ҽ���ս�����ʣ���һʱ��ͻᲢ����������������������������ͷ�ܳ�ȥ��Ů��Լ�ᣬ���Ѷ��ӵļӰ������ߡ�

�ɼ������ֿ�������أ����ص������޷��ж������ʣ�������û��̫ǿ�ҵķ��䣬���Զ�����һ��ʼ��û���ӣ���û�в�ȡ������ʩ������������ɱ��硣

���ǹ��Ұ��������ؿ����֮Ϊ���׿��Լ���С˵ԭ���ߡ�

����������������������һ�µ�Ӱ��ʱ���ߡ�

����س�ǰ�Ĳ�����ȥ��˵������سǺ�����ȥ���ӼӰ��Ի�ȡ���ݣ���ȥ���������档�����˻��º���Ӿ��������ĸ�׷��֣���������ҽԺ���סԺ������͵͵��ȥ�������������һ�κ�Ӱ��Ȼ���������Ƕ��𡣾���ȥ���ʶ�ѯ���������䡣��������ڿ����ϵ�֪���˹�����

������ʱ�����������Ķ������Աȣ����ܺ�����ز²�����ӵĿ�̽���ȡ�

���ȣ��ھ�����������ʶ��ʱ�򣬶�������ƺ�帽���Ӵ�����һ���������������������ʺ����أ������ˣ��з��䣬����̫ǿ�ҡ�

����һʱ�޷��жϰ��׿�����ʣ�����δ������ӣ�ֻ�Ǵ�������̽�ӳ����һ����Ա�������Ըÿ������п��졣������������ʱ�򣬿�ʼ������ӹ��������������������س�����ƺ�塣���¾��������ڼ䣬���������׿��Ⱦ��

�������뾲��һ����Ӿ��ʱ��ǰ����������������쳣״�����������ֳ���˯�����ҵ�������Ϊ���˲���ȥҽԺʱ������Ȼ�ó����������Լ��ĸ첲�����Ȼ��һ�ְ��ı��֣���Ҳ��ӳ���������������Ѿ����ֱ��꣬�����б�������

����֢״�ڶ��������Ӵ����׿��������Ҳ�����ˣ����Ӳ����ѣ�����Щ��Ա��ȥ����ҽԺ���ѳ���죬��ʵ����Ժ����ȼ�顣

�ڲ������ǳ�Ϸ����������������ͨ���Ϊ��ҪסԺ������֧֧�������ڹ�ȥ����ʵ�������ź;�����ͬ�����ʣ��Ѿ��Զ��ӵİ��Ų����˻��ɡ���Ӱ����һ��ϸ�ڱ�������������̽����ʱ�������ڷ���һ��������ѧ����˵�����Ѿ��Ĵ���񼣬�����Լ��ҳ����ࡣ

����ʱ��û�뵽���׿�����⣬һ����Ը����Ϊ�ǰ�Ѫ����Ҳ���������߾���ġ�

��ϧ�����ˡ��ڵ�Ӱ�����ǿ��Կ����������������ģ������ˣ�˵����ΰ��׿�����Ⱦ�ķ�Χ�൱�󣬵�����ͨ�������˵Ľ�����Ⱦ��

����׶Σ���̽���Ծ�û��������״��ҽԺû�з������������ϻ������ȥ�������ҡ����㴲�ڼ䣬�����;��ﻹ�����ɳ��룬������һ���������۵�����һ�ź�Ӱ��

ע�⣬���ĺ�Ӱ֮ǰ����������һ���ǳ��Źֵľٶ�������Ȼ���ۡ�

���۵�ʱ�������ı����Ǻ������ģ����ڵ�ӰԺ�￴����һ�Σ�ͻȻë���Ȼ��

���Ǻ��������࣬������ʥ����ᰡ�������������ĸ��ڼ䣬���Ƕ�ʮһ���͵Ľ��죬�����Ǽ�������£����������Ի��õ������ˣ�Ҳ�����������ֿ���˼ά��

������������Ը�ģ������޷������Լ��ļ��⡭��

��Ӱ����￴�������Ķ��ۣ���Ϊ���ڸ�֣�Ҳ��ʼ���ۡ��������һ�£���æ�������������������Լ���ʧ̬�����ϸ�ڸ������ǣ�������ʱ�Ĳ��飬�Ѿ��������µ����ס�

�������ϣ�������˯����һ�Ŵ��ϡ�������������Լ����彻������ʱ������ֻ�Ǽ򵥵ظ�����һ�±������˵��һͨ�黰�������˶�˯���ˡ�

���й�Ů��ͬ��һ�ң�����Ħ����һ�󣬾�Ȼû�и���һ���������������˲������»�ת������ֻ��˵�����ں��¡�

��Ӱ����һ��ϸ�ڣ�����������������������ʱ������ԥ�ˣ����ϳ��ֵģ��ǿֻţ�����Ҫ�鿪�֡�����Ǿ���һ��ץס�����֣���������ȥ��

������ʲô��

����û���Գ�ʶ���������϶��С������Ǵ�Ů�����˻���֮ʱ������Ѫ��

�ѵ�������Ѫ��

�����ܡ�������������Լ��첲Ѫ��������ʱ�����ı����ǻ����ġ�

�ɴ˿�֪������ϲ������Ѫ����������Ѫ��ķ�Ӧ�����ܻ��˺�����ߵ��ˡ�����ҹ�������Ȼ��Ȼ��ֹͣ�˶��������¾������֮���Լ�Ҫ����ʲô���µ����飬�˺����Լ����ˡ�

�������⣬�޷�������Ϊ������ʱ�����˺͵�����£�ͻأ�������֡�

������������ӰƬ�ķ�Χ��������֤������Ϊ���������ľ��ġ�

�������������Ϊ���þ�������һ�����·���������һ���ײ�����������裬����֮ǰ�͵��ռǱ������Ǻ���һƬ��

��Щ�ٶ���Ȼ���������Ծ���İ����������Լ����ܶ���֪����������ѧ�ĽǶ�ȥ�۲죬��Щ�ٶ�Ҳ��������Ǳ��ʶ��������Ѫ�嶯�Ѿ���Ȼ����������˼ά�������Ժ�ɫ����ǿ�ҵ������ԡ�

�������ϸ�ڣ������ں����������޵İ�ʾ���ھ�������������������˽�����һ�����ڡ����֡��ĶԻ���������԰���ϸ��������ֹ�����Ƕ�ǰͷ�����ڵĺ�Ӧ��
��������һ��ȥ����������ʱ����������������˶��ڣ�������ȴ��ʧ�ˣ�ֻ���ü�����һ�����裬����ûʱ��д��ֽ����

��������ҽ�����飬Ů��ʿȴʸ�ڷ��ϰ�Ѫ�������飬˵����û�¡��������������������ᡣ

�Ӻ���ľ�����������������ҽԺ����ϳ��ز�������ȷ�����ɣ���ôŮ��ʿֱ˵���ǣ��α������أ�

��һ��Ϸ����Ů��ʿ��ҹ��Ѿ���ϳ�ҽԺ�����Կ��������Ǹ������Ͻ�������ˡ�����һ���ˣ��޶˶Բ��˲������ѣ�һ�����������ɡ�

������ɲ��Ѳµ�����˵������������Ⱦ�ĳ̶ȣ���������Ҫ��ö࣬�Ѿ�������ҽԺ�޷����õĵز���ֻ����ҹתԺ����һ���⾪���˶����Լ��ϼ����ܲ��ţ��쵼���ڿ�ʼ������һ��״����ʼ������Ϣ��

תԺ�ڼ������ܵ�����½��У�����֪���˶�����֪����й¶����ˣ�Ů��ʿ�ŶԾ������˻ѡ�

���ʿ�̽�ӵ���˵��������ʯͷȥ������飬����׼ȷ��Ӧ����������ʯͷ��һ����ȥ������顣��ʱ�򣬰��׿������쳣����Ӧ���Ѿ�ͨ�����˹��ң�������Ϊ��һ����Ⱦ�ߣ��Ͱ��׿�ʯ����һͬ����ȥ��顣

����Ǿ����������ľ����������ڲ����ϣ���ɫǦ�ң������Ǵ��������ϰߵ㣬�Ѿ�����˵������Ƥ���׵����ˡ�

���ڰ�Ѫ�����ڽ���ע������ʱ����Ϊ������Ѫ�����Ѿ�ɥʧ��Ҫ��ȡ�����ֹѪ�ֶΣ�Ƥ��ȷʵ�����·��ڵ����ϰߵ㡣

��һ�㣬��Ӱ�Ļ�װ�ܷ�����ʵ�����ǡ����������ϵİߵ㸲����ȫ���е�̫���ˣ�Ҳ�е�̫���ˡ�������͸������ע�䣬����Χ����Ѫ����ҵ����Ѫ���˲�����ȫ�����¶��������ۡ�����ͷ������Եر��ֳ������û��Ѫ�ܵļ��ⲿ��Ҳ������ϰߵ㣬�ⲻ�����ƺ���֢������������ã�����Щ��λ�������ˣ����Ǿ��������Ҹ񶷡�

�����ڲ����ϵ����ƺ���Χ�ĳ��裬�ܶ�ϸ�ڱ����������岻�Ǽ򵥵�ƽ�ɣ����Ǳ�����ס�ˡ�

�ۺ������㿴���ѵ�˵��֮ǰ�й��񱩵ľٶ�����ǿ����ѹ���������ڴ���ǰҽ���������ɿ���

Ҫע�⣬��ʱ�ڲ�������˾���������׺�����һλ���������ˣ����������̣�Ƭ����û�������������Բ²⣩������һ����Թ��ߡ���Щ�Թ��߸������ž�װ���������࣬��������һ��Ů���м���̨�ʣ������˾���ô��Ĭ��վ�š�

��Ӱ������ǵ�����û���κν�����û˵�����ݣ����ѣ������������׵Ĳ��¡�����ͻأ�س��֣���ͻأ����ʧ��û�����κκۼ���

�翪ͷ��˵��ɽ�����һ��ϧʱ���ĵ�Ӱ������������õ��бʡ������ﳬ��Ѱ��������Ϊ������Ҫ���һЩ��Ϣ��

���׿�Ĵ����Ѿ������˹��ң���ô��Ϊ��һ������Ⱦ�ߣ������϶���õ��ر����ӣ�����ר�˼��ӻ��߱�������

�����뵽���������ϵĿ��ƺۼ�������������������ˡ��������������Ʋ⣬����֮ǰ�й��񱩵����漸��ʧ�صĵز�����������ƻ�����ǿ��û��������˸����Ʒ������������Բ��������Щ��װ��Ա���������������ѻ����ݣ��������������׵Ĳ��£����ǹ����������������Ļ�����

��Щ���������ܳ�ְ����������������ǰ�����ˣ�����Ҳ���뿪������������˿����и����ӻ������������ܿ�����֮ǰ�����Ŀ񱩾ٶ��ж�ô���������

����Χ�����˰������׶��޷�����������Ӧʱ����������ˡ���ע�⣬��ʱ��������������һ���ɫ�·���Ѫ��Ѫ�졪������غ����������������۽�������ˮ������������ˮ��������¶��������������ʶ�ģ����¸��������Ǽ���ɫ���·���

�����˳����Կ�������ʱ����������Ѫ���Ѿ�ǿ��ѹ�������ԣ����ԲŻ��ȱ��ܵر�
Ѫ���·����ѣ������Ե��жϳ��Լ����ˣ��������ᡣ��ϧ���Ǹ�ʱ���Ѿ��ڲ����ԡ�

���ǣ����Ǵӵ�Ӱ��������ͬʱ�ڵı��֣��ܹ��ܽ�����׿��������ĸ�Ⱦ֢״��

��һ��֢״����˯����Ⱦ��Ƣ�����꣬�б�������

�ڶ���֢״����ƣ�ͣ��沿���⿪ʼ���ܿ��ơ�

������֢״��ǿ�ҵ���Ѫ�Կ�ʼ���֡�

������֢״��ȫ��Ƥ����ʼ��������ã���Ⱦ����ɥʧ���ǣ���Ѫ�Խ�һ����ǿ��

������֢״���������ʵõ����Ѱ������ߣ����������ƻ����ɱ����ǣ������ǻ����½���

��û�о�����Щ֢״�����죿����ĳһ������Ϸ����Ӱ��С˵�ﾭ�����ֵ����֣�

���ڣ������ǻص�ӰƬ�����⣬�ǿú�ɫ��ɽ�����

�������������ڡ�������û�п��컨��ɽ�����һ����������ǣ����������ɽ�����ֻ���׻�����Ϊһ�ֽ�AHS(�����غϳ�ø)�Ļ��������ǵĻ����в��ܷ������ã����ܰ���ɫ�Ļ�����ǰ��ת��Ϊ����ɫ�Ļ����ء������и����ֵ�Ұ��ɽ���Ҳ�ܿ����ۺ�ɫ���������Ʋ⣬Ӧ������Ϊ��Щֲ�귢���˱��죬ʹAHS�����ڻ���Ҳ������������Ե�ʡ���

����˵�����컨��ɽ��������У�ǰ�������Ļ������˱��졣

����֪��������ͻ���ԭ��֮һ�������ܵ�����Ӱ�졣

���컨��ɽ������ͳ�����ƺ�岻Զ�ĵط������ӿ�̽�����׿󣬿϶�Ҳ���Ǹ�����

���׿���ı���ɽ����Ļ�����ԭ�����׻���ɽ��������˺컨������Ȼ�ܸı�ֲ��Ļ�����ôͬ��Ҳ�ܹ��ı�����Ļ��򡣽ӽ����׿�������Ͷ��ӵĶ�Ա������ɢ���Ĳ���ǿ�ҵ����Ըı��������ķ����Ⱦ�����������һ��ģ����

���ǣ���������֮�п��컨��ɽ�����

������һ�����ʣ���Ȼ�������׿󣬾ͻᱻ�����ı䣬��ô��ƺ����ϰ���ס����ô���꣬��ôû���أ�

��Ӱ�ͬ�������˽��͡�

��Ӱ���ᵽ����������������в�����Ҫ�Ժ��ұ��ǡ������ƺ��峤���϶������������⣬���������һ��ڴ����ҡ�

˵����������ƺ����ز���

�������ֶ���������Ӻ�֬���ǣ����Ƿ�������õ�ʳƷ���Ա��ΪҪ��������̫�գ�����ǿ�ң���˺�����̫��ʳƷ�еıر��ɷ֡�

���ԣ�ϰ�߳Ժ��ҵ���ƺ����Ȼ����������ô���꣬�����ǰ���ĵ��ʿ�̽�ӣ�ȴ�����䡣

˵�������ɽ���֮�����ⲿ��Ӱ���������⣬�Ѿ���֮������

���컨��ɽ����������������������˵�����������ɽ���������ͬ�������ұ��������ҡ�ͬ���Ǳ��ı��˻���ɽ��������컨�������ɸ�������Ϊ�������������ֻ���ۿ����Լ�һ������ɥʧ���ǣ����ڱ��һ�����࣬�����ӿ���ֱ�����ա����Ϳ�̽���ӵĲ������������ⲿ��Ӱ��������Ǳ�ص�����һ���ߡ�

������һ��ãȻ��֪�ľ���Ծ��ڱ����ɽ����ճյ�˼�����Լ��İ��ˡ�

�ⲿ��Ӱ�����֣����ý�����ɽ���֮���������ǽ�����ɽ���֮�䡷��','2018-06-20 01:49:00','2018-06-20 01:50:00','�����ҿ��ˡ�ɽ���֮��������ʼ��ʱ����θɾ�������ж������Ǻ���������Щ���Ծ������ﲻ�Ծ���˵���������ؼ�','2','4','17'),
('6','������ú��������ȡ��ʱtoken����������������Դ','����һЩ�û���˵��������Ҫ����ҳ��app�ȿͻ��˿��Բ�����������Դ�����ϴ��ļ���oss�������û��ֲ�����Լ���AK��¶�������ڱ����У�ʵ���û�����Ҫ�Լ�ֱ��ʹ���Լ���AK��ʵ���ļ��ϴ���oss������
  ��Ҫ�������£�
 ** 1���û�����һ������ get_sts,�ú������£�**

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

  <font color="red">*ע�⣺Ҫ���ȡcontext��credentials��Ϣ����Ҫ���ú������ڵ�service�ķ����ɫ���ڱ�����, ���õķ����ɫ��һ�����в���oss��дȨ�޵Ľ�ɫ, ����context.credentials���ܲ���oss����ʱtoken��Ϣ*</font>
 ���ĵ��������£�

![image](http://yqfile.alicdn.com/07962da351180f8352c9dc78815c9616e61ed3b2.png)

��θ�service���÷����ɫ�����Բο�https://help.aliyun.com/document_detail/60984.html?spm=5176.doc61023.6.558.RkgmAR

 ** 2, �Ժ���������Ϊ API ���غ�˷���**
2.1������Ľ̳̿��Բο�:https://help.aliyun.com/document_detail/54788.html?spm=5176.doc29497.6.584.8ykpic
2.2�����̳�����������£�

![image](http://yqfile.alicdn.com/dde4338a48e6f5d3e717f5d18e79cd48faac22f6.png)

![image](http://yqfile.alicdn.com/7c4270ea887a153f31f190b17f2a248806a53921.png)

2.3����api�����Ժ󣬿���ʹ��curl�������£�

![image](https://yqfile.alicdn.com/5e6d8e00b2ae13887b72a2ec81242cc7ee379a22.png)

 ** 3, ʹ�ú������㷵�ص���ʱtoken��oss���в���**

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
```','2018-06-20 01:52:00','2018-06-20 01:52:00','����һЩ�û���˵��������Ҫ����ҳ��app�ȿͻ��˿��Բ�����������Դ�����ϴ��ļ���oss�������û��ֲ�����Լ�','2','2','29'),
('7','����������ڲ���event���','#### �ٷ��ĵ��ж�event�Ľ������£�
event���û����ú���ʱ��������ݣ���������һ���򵥵�string��Ҳ������һ��JSON string����������һ��ͼƬ�����������ݣ��������е�event�����Ǹ��ֽ�������Python2.7����str���ͣ���Python3����bytes���͡�

�û��ں����п��Ը���ʵ�������event����ת����
- ����������һ��JSON string�Ļ����û����԰���ת����һ��dict:
```python
# -*- coding: utf-8 -*-
import json
def my_handler(event, context):
    evt = json.loads(event)
    return evt[\'key\']
```
- ����������һ���ļ���bytes, ����ͼƬ���ļ���Ϊevent��������
```python
# -*- coding: utf-8 -*-
from wand.image import Image
def resize(event, context):
    with Image(blob=event) as img:
        with img.clone() as i:
            i.resize(128, 128)
            return i.make_blob()
```

#### �ḻevent��������
�����г���event�������ܶ�����Ծ����string�����ļ�bytes������������û�����event��ͬʱ�����ı��ַ�����ͼƬ����Ƶ����Ƶ�������ļ���Դ������ǿ����𣿴��ǿ϶��ġ�
�ڱ��̳��У�������python3 runtimeΪ������һ��ͼƬ��Ϊjson��ĳ��filedֵ���뺯����event���������ڿ���̨�ϴ���һ���������£�
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
��������������ڵ�service��Ϊ`demo`, ����������`multimedia`, ���ش���:
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
������躯���ĵ�ǰĿ¼��`test.jpg`ͼƬ��ִ�к���֮���ڱ��ػ�����һ��`test.jpg`���ų�128*128��С��ͼ��`output.jpg`��

event��һ�����Ը��ݾ�������߶����ɻ����ƵĲ�������Ŀ���Ϊ����Ϊ��
![image](https://yqfile.alicdn.com/3a87072a9ce8e5a3c5f3aec31b89956c48819987.png)','2018-06-20 01:52:00','2018-06-20 01:52:00','�ٷ��ĵ��ж�event�Ľ������£�
event���û����ú���ʱ��������ݣ���������һ���򵥵�string��Ҳ','2','2','13'),
('8','python 3.6,django 1.11 ����mysql���ݿ�','###1 ��װpymysql�� pip installl pymysql
python 3.6 ��û��MySQLdb ,������pymysql

### 2 ����������pymysql.install_as_MySQLdb()
����Ŀ��init�ļ��е���

```python
import pymysql
pymysql.install_as_MySQLdb()
```


��һ������Ҫ����Ȼ�ᱨ���Ҳ���mysqldb �� ����Ϊdjango��Ĭ��Ϊmysql ��������ΪMySQLdb ���������ǰ�װ���� pymysql ��������һ��

3 �޸�DATABASES{}��
�����ݻ��ɣ�

``` bash
\'default\': {
    \'ENGINE\': \'django.db.backends.mysql\',
    \'NAME\': \'dbname\',   #���ݿ���
    \'USER\': \'username\',    #�û���
    \'PASSWORD\': \'123456\',
    \'HOST\': \'hostname\',
    \'PORT\': \'3306\',
    \'CHARSET\':\'utf8\',##�����ַ�������Ȼ�������������
    }
```

����django�� 
���ݿ������ɱ�django_migrations ��ʾ���óɹ�','2018-06-20 01:55:00','2018-06-20 01:55:00','1 ��װpymysql�� pip installl pymysqlpython 3.6 ��û��MySQLd','2','1','29');
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
('2','��������'),
('3','�������'),
('4','����'),
('5','��Ӱ'),
('6','����'),
('7','�ĵ���ʽ');
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
('1','luosong','abc@qq.com','http://www.baidu.com','������','2018-06-19 09:25:35','1'),
('2','rsong','ls_huster@163.com','http://www.360doc.com/content/17/0710/14/11253639_670299444.shtml','��һ������','2018-06-19 11:45:07','1'),
('3','����','ls_huster@163.com','http://caibaojian.com/','�ܺú�ǿ��','2018-06-19 12:22:37','3'),
('4','�����','hongzehu@163.com','http://test.com','hello world!','2018-06-20 07:43:04','5'),
('5','�Ҳ�������','191984292@qq.com','http://kongdehui.com','666','2018-06-20 07:44:11','6'),
('6','sadad','asdASD@QQ.COM','https://WWW.BAIDU.COM','ASDASDASDS','2018-06-20 07:53:27','6'),
('7','��������','10992121212@qq.com','https://www.baidu.com','���������ش�','2018-06-20 07:54:33','6'),
('8','��������','10992121212@qq.com','https://www.baidu.com','���������ش�','2018-06-20 07:54:34','6'),
('9','��������','10992121212@qq.com','https://www.baidu.com','���������ش�','2018-06-20 07:54:44','6'),
('10','��������','10992121212@qq.com','https://www.baidu.com','���������ش�','2018-06-20 07:54:45','6'),
('11','��������','10992121212@qq.com','https://www.baidu.com','���������ش�','2018-06-20 07:54:46','6'),
('12','��������','10992121212@qq.com','https://www.baidu.com','���������ش�','2018-06-20 07:54:48','6'),
('13','��������','10992121212@qq.com','https://www.baidu.com','���������ش�','2018-06-20 07:54:49','6');
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
('5','2018-06-19 12:15:34','2','��������','1','[{"added": {}}]','7','1'),
('6','2018-06-19 12:15:58','3','����','1','[{"added": {}}]','7','1'),
('7','2018-06-19 12:16:17','2','��������','1','[{"added": {}}]','8','1'),
('8','2018-06-19 12:16:25','3','�������','1','[{"added": {}}]','8','1'),
('9','2018-06-19 12:16:32','4','����','1','[{"added": {}}]','8','1'),
('10','2018-06-19 12:16:38','5','��Ӱ','1','[{"added": {}}]','8','1'),
('11','2018-06-19 12:16:44','6','����','1','[{"added": {}}]','8','1'),
('12','2018-06-19 12:18:07','2','10�������� - ���ú������㹹��΢��С�����Server��','1','[{"added": {}}]','9','1'),
('13','2018-06-19 12:19:18','2','10�������� - ���ú������㹹��΢��С�����Server��','3','','9','1'),
('14','2018-06-19 12:20:09','3','10�������� - ���ú������㹹��΢��С�����Server��','1','[{"added": {}}]','9','1'),
('15','2018-06-19 12:21:08','3','10�������� - ���ú������㹹��΢��С�����Server��','2','[{"changed": {"fields": ["body", "excerpt"]}}]','9','1'),
('16','2018-06-19 12:25:25','1','MarkDown ����','2','[{"changed": {"fields": ["title", "body", "excerpt"]}}]','9','1'),
('17','2018-06-19 12:27:19','7','�ĵ���ʽ','1','[{"added": {}}]','8','1'),
('18','2018-06-19 12:27:29','1','MarkDown ����','2','[{"changed": {"fields": ["category"]}}]','9','1'),
('19','2018-06-19 12:28:28','3','10�������� - ���ú������㹹��΢��С�����Server��','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('20','2018-06-19 12:29:32','3','10�������� - ���ú������㹹��΢��С�����Server��','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('21','2018-06-19 12:30:21','3','10�������� - ���ú������㹹��΢��С�����Server��','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('22','2018-06-19 14:48:51','4','���ú�������ʵ��������Ϸ����Ƶֱ���е����дʼ��','1','[{"added": {}}]','9','1'),
('23','2018-06-19 15:24:48','4','���ú�������ʵ��������Ϸ����Ƶֱ���е����дʼ��','2','[{"changed": {"fields": ["body", "excerpt"]}}]','9','1'),
('24','2018-06-19 15:25:42','4','���ú�������ʵ��������Ϸ����Ƶֱ���е����дʼ��','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('25','2018-06-19 15:27:34','4','���ú�������ʵ��������Ϸ����Ƶֱ���е����дʼ��','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('26','2018-06-19 15:28:54','4','���ú�������ʵ��������Ϸ����Ƶֱ���е����дʼ��','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('27','2018-06-20 01:50:16','4','��Ӱ','1','[{"added": {}}]','7','1'),
('28','2018-06-20 01:50:28','5','��ɽ���֮������Ǳ���ڴ������������Σ��','1','[{"added": {}}]','9','1'),
('29','2018-06-20 01:52:23','6','������ú��������ȡ��ʱtoken����������������Դ','1','[{"added": {}}]','9','1'),
('30','2018-06-20 01:53:03','7','����������ڲ���event���','1','[{"added": {}}]','9','1'),
('31','2018-06-20 01:55:36','8','WSGI PEP-0333','1','[{"added": {}}]','9','1'),
('32','2018-06-20 01:59:57','8','python 3.6,django 1.11 ����mysql���ݿ�','2','[{"changed": {"fields": ["title", "body", "excerpt"]}}]','9','1'),
('33','2018-06-20 02:01:59','8','python 3.6,django 1.11 ����mysql���ݿ�','2','[{"changed": {"fields": ["excerpt"]}}]','9','1'),
('34','2018-06-20 07:05:09','1','general','1','[{"added": {}}]','3','1'),
('35','2018-06-20 07:06:16','3','blog_demo','1','[{"added": {}}]','2','1'),
('36','2018-06-20 07:06:26','3','blog_demo','2','[{"changed": {"fields": ["last_login"]}}]','2','1'),
('37','2018-06-20 07:07:42','1','blog_admin','2','[{"changed": {"fields": ["password"]}}]','2','1'),
('38','2018-06-20 07:18:59','3','blog_demo','2','[{"changed": {"fields": ["first_name", "last_name", "email"]}}]','2','1'),
('39','2018-06-20 07:19:11','3','blog_demo','2','[{"changed": {"fields": ["is_staff"]}}]','2','1'),
('40','2018-06-20 07:19:59','3','blog_demo','2','[{"changed": {"fields": ["is_superuser", "last_login"]}}]','2','1'),
('41','2018-06-20 07:37:05','8','python 3.6,django 1.11 ����mysql���ݿ�','2','[{"changed": {"fields": ["body", "excerpt"]}}]','9','3'),
('42','2018-06-20 07:43:03','1','blog_admin','2','[{"changed": {"fields": ["password"]}}]','2','1'),
('43','2018-06-20 07:56:31','6','������ú��������ȡ��ʱtoken����������������Դ','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('44','2018-06-20 07:56:50','6','������ú��������ȡ��ʱtoken����������������Դ','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('45','2018-06-20 07:57:11','6','������ú��������ȡ��ʱtoken����������������Դ','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('46','2018-06-20 07:57:37','6','������ú��������ȡ��ʱtoken����������������Դ','2','[{"changed": {"fields": ["body"]}}]','9','1'),
('47','2018-06-20 08:31:31','2','��������','2','[]','7','1'),
('48','2018-06-20 08:31:34','5','cccc','1','[{"added": {}}]','7','1'),
('49','2018-06-20 08:39:25','3','blog_demo','2','[{"changed": {"fields": ["password"]}}]','2','3'),
('50','2018-06-20 08:45:59','6','������ú��������ȡ��ʱtoken����������������Դ','2','[{"changed": {"fields": ["body"]}}]','9','3'),
('51','2018-06-20 08:46:42','6','������ú��������ȡ��ʱtoken����������������Դ','2','[{"changed": {"fields": ["body"]}}]','9','3');
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

