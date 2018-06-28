本案例以一个基于django开源的[个人博客](https://github.com/zmrenwu/django-blog-tutorial)移植部署到到阿里云[函数计算](https://help.aliyun.com/document_detail/52895.html?spm=a2c4g.11186623.6.539.9WhlbL)

## 案例体验入口:
- 前台：http://1986114430573743.cn-hongkong.fc.aliyuncs.com/2016-08-15/proxy/blog-service/blog/
- 后台：http://1986114430573743.cn-hongkong.fc.aliyuncs.com/2016-08-15/proxy/blog-service/blog/admin
  - 账号：blog_demo
  - 密码：pwd_123456

- [详细setup教程](https://yq.aliyun.com/articles/603249)

## 在本地运行项目

1. 克隆项目到本地

   打开命令行，进入到保存项目的文件夹，输入如下命令：

   ```
   git clone https://github.com/awesome-fc/django-blog.git
   ```

2. 创建并激活虚拟环境，注：后面指的python version >=3.5

   在命令行进入到保存虚拟环境的文件夹，输入如下命令创建并激活虚拟环境：

   ```
   virtualenv blogproject_env

   # windows
   blogproject_env\Scripts\activate

   # linux or mac
   source blogproject_env/bin/activate
   ```

   关于如何使用虚拟环境，参阅：[搭建开发环境](http://zmrenwu.com/post/3/) 的 Virtualenv 部分。如果不想使用虚拟环境，可以跳过这一步。

3. 修改setting.py中的DATABASES，修改成自己的mysql数据库
``` python
DATABASES = {
    'default': {
    'ENGINE': 'django.db.backends.mysql',
    'NAME': 'django-blog',   #数据库名
    'USER': 'root', #用户名
    'PASSWORD': '123456',
    'HOST': 'rm-xxxxxyyyyyyyzzzzz.mysql.rds.aliyuncs.com',
    'PORT': '3306',
    'CHARSET':'utf8',##设置字符集，不然会出现中文乱码
    }
}
```

4. 迁移数据库，在上一步所在的位置运行如下命令迁移数据库：
   ```
   python manage.py migrate
   ```
   这句命令正常执行的话，会在您的mysql数据库初始化好对应的db和table

5. 创建后台管理员账户
   在上一步所在的位置运行如下命令创建后台管理员账户

   ```
   python manage.py createsuperuser
   ```

   具体请参阅 [在 Django Admin 后台发布文章](http://zmrenwu.com/post/9/)

6. 运行开发服务器

   在上一步所在的位置运行如下命令开启开发服务器：

   ```
   python manage.py runserver
   ```

   在浏览器输入：127.0.0.1:8000

7. 进入后台发布文章
   在浏览器输入：127.0.0.1:8000/admin
   使用第 5 步创建的后台管理员账户登录
   具体请参阅 [在 Django Admin 后台发布文章](http://zmrenwu.com/post/9/)
  
## 在FC环境中运行项目
在本地调试成功后，现在可以将django-blog部署到FC环境中，步骤如下：
> 如果想要获取更详细的信息，请参考[详细setup教程](https://yq.aliyun.com/articles/603249)
>
> 目前仅在海外region 开通了函数计算支持VPC功能，分别在香港，澳大利亚，新加坡，在这里以香港region为例

1. 安装fun工具
  - [安装nodejs](https://www.liaoxuefeng.com/wiki/001434446689867b27157e896e74d51a89c25cc8b43bdb3000/00143450141843488beddae2a1044cab5acb5125baf0882000) 
  - 安装[fun](https://github.com/aliyun/fun/tree/enhance_feature) enhance_feature 分支
  
  ```bash
  npm install git://github.com/aliyun/fun.git#enhance_feature --save -g
  ```

2. 开通相关阿里云产品(函数计算，日志服务， RDS)，[创建vpc内的rds-mysql](https://yq.aliyun.com/articles/603249#setup-detail)
3. 修改setting.py中的DATABASES，.env 中自己的配置信息, 以及template.yml中自己的配置信息，尤其是`VpcConfig`和`logproject`的名字
4. 执行`fun deploy`
5. 部署成功后，直接通过url访问首页， url的格式为：
```plain
http://${account_id}.${region}.fc.aliyuncs.com/2016-08-15/proxy/$(seevice_name}/{function_name}/
比如:
http://12345.cn-hongkong.fc.aliyuncs.com/2016-08-15/proxy/blog-service/blog/
```

* 欢迎大家通过扫码加入我们用户群中，搭建过程中有问题或者有其他问题可以在群里提出来。

   - 函数计算官网客户群（11721331）。
   - ![image](http://fc-public.oss-cn-hangzhou.aliyuncs.com/demo/quick_start/fc-guanwang.png)
