CREATE TABLE IF NOT EXISTS `access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(10) DEFAULT 0,
  `update_time` int(10) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `name` varchar(20) NOT NULL COMMENT '用户登录名字母数字或下划线',
  `password` char(32) NOT NULL COMMENT '用户密码',
  `email` varchar(40) NOT NULL COMMENT '用户email',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态0不可用1可用',
  `nickname` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `qq` varchar(15) DEFAULT '' COMMENT '用户qq',
  `mobile` char(11) DEFAULT '' COMMENT '用户手机号码',
  `headimg` varchar(256) DEFAULT '' COMMENT '用户头像',
  `is_superuser` tinyint(1) DEFAULT '0' COMMENT '是否超级用户0否1是',
  `lastlogin_date` int(10) DEFAULT '0' COMMENT '最后一次登录时间',
  `register_ip` char(15) DEFAULT '' COMMENT '注册ip地址',
  `lastlogin_ip` char(15) DEFAULT '' COMMENT '最后一次登录ip',
  `regtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE `app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '应用名称',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT '应用url 类似 /Admin/Index/index',
  `module` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名',
  `module_node_id` smallint(6) NOT NULL COMMENT '模块对应的node表id',
  `module_title` varchar(30) NOT NULL COMMENT '模块标题',
  `controller` varchar(50) NOT NULL DEFAULT '' COMMENT '控制器名',
  `controller_node_id` smallint(6) NOT NULL COMMENT '控制器对应node表id',
  `controller_title` varchar(30) NOT NULL COMMENT '控制器标题',
  `action` varchar(50) NOT NULL COMMENT '操作名称',
  `action_node_id` smallint(6) NOT NULL COMMENT '操作对应node表id',
  `action_title` varchar(30) NOT NULL COMMENT '操作标题',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1可用 0 不可用',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `role_app` (
  `role_id` smallint(6) unsigned NOT NULL COMMENT '角色role表主键id',
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `app_ids` text NOT NULL COMMENT '对应app应用表主键id的集合',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色应用状态默认1可用0禁用',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '角色应用创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '角色应用更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `role_user`
ADD COLUMN `role_name`  varchar(20) NULL COMMENT '角色名称' AFTER `user_id`;


ALTER TABLE `user`
MODIFY COLUMN `id`  int(10) UNSIGNED NULL AUTO_INCREMENT COMMENT '用户表主键' FIRST ,
ADD COLUMN `backend_login`  tinyint(1) NULL DEFAULT 0 COMMENT '是否允许后台登陆1允许0不允许' AFTER `is_superuser`;

ALTER TABLE `role`
ADD COLUMN `backend_login`  tinyint(1) NULL DEFAULT 0 COMMENT '是否允许登陆后台1允许0不允许' AFTER `status`;


CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `name` varchar(20) NOT NULL COMMENT '用户登录名字母数字或下划线',
  `password` char(32) NOT NULL COMMENT '用户密码',
  `email` varchar(40) NOT NULL COMMENT '用户email',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态0不可用1可用',
  `nickname` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `qq` varchar(15) DEFAULT '' COMMENT '用户qq',
  `mobile` char(11) DEFAULT '' COMMENT '用户手机号码',
  `headimg` varchar(256) DEFAULT '' COMMENT '用户头像',
  `is_superuser` tinyint(1) DEFAULT '0' COMMENT '是否超级用户0否1是',
  `backend_login` tinyint(1) DEFAULT '0' COMMENT '是否允许后台登陆1允许0不允许',
  `lastlogin_date` int(10) DEFAULT '0' COMMENT '最后一次登录时间',
  `register_ip` char(15) DEFAULT '' COMMENT '注册ip地址',
  `lastlogin_ip` char(15) DEFAULT '' COMMENT '最后一次登录ip',
  `regtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `master` (
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '站长真实姓名',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '站长别名',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '性别1男默认0女',
  `birthday` int(10) NOT NULL DEFAULT '0' COMMENT '站长出生日期',
  `qq` varchar(15) DEFAULT '' COMMENT '站长qq',
  `weixin` varchar(20) DEFAULT '' COMMENT '站长微信号',
  `mobile` varchar(11) DEFAULT '' COMMENT '站长手机',
  `province` int(10) DEFAULT '0' COMMENT '省id',
  `city` int(10) DEFAULT '0' COMMENT '市id',
  `town` int(10) DEFAULT '0' COMMENT '县id',
  `address` varchar(100) DEFAULT '' COMMENT '详细地址',
  `photo` varchar(255) DEFAULT '' COMMENT '站长头像地址',
  `remark` text COMMENT '站长简介',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  `show_flag` tinyint(1) DEFAULT '1' COMMENT '是否显示1显示0不显示'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `master`
ADD COLUMN `id`  smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT FIRST ,
ADD PRIMARY KEY (`id`);

CREATE TABLE `article_category` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志分类主键id',
  `cate_name` varchar(80) NOT NULL DEFAULT '' COMMENT '日志分类名称',
  `keyword` varchar(40) DEFAULT '' COMMENT '日志分类关键字描述',
  `description` varchar(255) DEFAULT '' COMMENT '日志分类详细描述',
  `order` tinyint(4) NOT NULL DEFAULT '1' COMMENT '日志分类顺序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '日志分类状态默认1可用0不可用',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '日志分类创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '日志分类更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `article_category`
CHANGE COLUMN `order` `sort`  tinyint(4) NOT NULL DEFAULT 1 COMMENT '日志分类顺序' AFTER `description`;


CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '日志标题',
  `keyword` varchar(20) DEFAULT '' COMMENT '日志关键字',
  `description` varchar(255) DEFAULT '' COMMENT '日志简单描述',
  `content` text NOT NULL COMMENT '日志详细内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '日志状态1显示0不显示',
  `view_times` int(10) DEFAULT '0' COMMENT '日志浏览次数',
  `allow_comment` tinyint(1) DEFAULT '1' COMMENT '日志是否允许评论1允许0禁止',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '日志创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '日志更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `article`
ADD COLUMN `category_id`  smallint(6) UNSIGNED NOT NULL COMMENT '日志所属分类id' AFTER `content`;


CREATE TABLE `article_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志评论主键',
  `article_id` int(10) NOT NULL COMMENT '对应日志article表主键id',
  `article_title` varchar(60) NOT NULL COMMENT '对应日志表article标题title',
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '评论状态:1显示默认0不显示',
  `parent_id` int(10) DEFAULT '0' COMMENT '父评论id',
  `user_id` int(10) DEFAULT '0' COMMENT '用户user表id',
  `user_name` varchar(20) DEFAULT '' COMMENT '用户user表name',
  `ip_address` varchar(15) NOT NULL DEFAULT '' COMMENT '评论用户ip地址',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '用户评论时间',
  `update_time` int(10) DEFAULT '0' COMMENT '用户评论更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `talk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '说说表主键',
  `content` text NOT NULL COMMENT '说说内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '说说状态1显示0不显示',
  `view_times` int(10) DEFAULT '0' COMMENT '说说浏览次数',
  `allow_comment` tinyint(1) NOT NULL DEFAULT '1' COMMENT '说说是否允许评论1允许0禁止',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '说说创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '说说更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `talk_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '说说评论主键id',
  `talk_id` int(10) NOT NULL COMMENT '说说表主键id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '说说评论内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '说说评论状态1显示0不显示',
  `user_id` int(10) DEFAULT NULL COMMENT '说说评论者用户id对应user表id',
  `user_name` varchar(20) DEFAULT '' COMMENT '说说评论者用户名对应user表name',
  `ip_address` varchar(15) DEFAULT '' COMMENT '说说评论者ip地址',
  `parent_id` int(10) DEFAULT NULL COMMENT '说说评论父评论id',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '说说评论创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '说说评论更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `music` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '音乐表主键id',
  `music_name` varchar(80) NOT NULL DEFAULT '' COMMENT '音乐名称',
  `music_url` varchar(255) NOT NULL DEFAULT '' COMMENT '音乐文件url',
  `exttype` varchar(20) DEFAULT '' COMMENT '音乐文件类型如audio/mp3',
  `extfield` char(32) DEFAULT '' COMMENT '音乐文件的md5值',
  `description` varchar(255) DEFAULT '' COMMENT '音乐文件详细描述',
  `list_order` tinyint(4) DEFAULT NULL COMMENT '音乐文件顺序',
  `status` tinyint(1) DEFAULT '1' COMMENT '音乐文件状态1可用0不可用',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '音乐文件生成时间',
  `update_time` int(10) DEFAULT '0' COMMENT '音乐文件更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `album` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册album表主键',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '相册标题描述',
  `thumb_url` varchar(255) NOT NULL DEFAULT '' COMMENT '相册封面图片url',
  `description` varchar(255) DEFAULT '' COMMENT '相册描述',
  `list_order` tinyint(3) DEFAULT NULL COMMENT '相册显示排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '相册是否显示1公开0不公开',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '相册创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '相册更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相片主键id',
  `photo_name` varchar(80) NOT NULL DEFAULT '' COMMENT '相片名',
  `photo_url` varchar(255) NOT NULL DEFAULT '' COMMENT '相片url',
  `exttype` varchar(20) DEFAULT '' COMMENT '相片扩展类型',
  `extfield` char(32) DEFAULT '' COMMENT '相片md5值',
  `description` varchar(256) DEFAULT '' COMMENT '相片描述',
  `list_order` tinyint(3) DEFAULT NULL COMMENT '相片在相册的排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '相片状态1公开0不公开',
  `view_times` int(10) DEFAULT '0' COMMENT '相片浏览次数',
  `allow_comment` tinyint(1) DEFAULT '1' COMMENT '相片允许评论1允许0禁止',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '相片创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '相片更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `photo_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相片评论表主键id',
  `photo_id` int(10) NOT NULL COMMENT '相片表id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '相片评论内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '评论状态1公开0不公开',
  `user_id` int(10) DEFAULT NULL COMMENT '用户表id',
  `user_name` varchar(20) DEFAULT '' COMMENT '用户表name',
  `ip_address` varchar(15) DEFAULT '' COMMENT '相片评论用户ip地址',
  `parent_id` int(10) DEFAULT NULL COMMENT '父评论id',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '相片评论创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '相片评论更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `photo`
ADD COLUMN `album_id`  mediumint(8) NOT NULL COMMENT '相册album表主键id' AFTER `id`;


ALTER TABLE `photo_comment`
ADD COLUMN `album_id`  mediumint(8) NOT NULL COMMENT '相册表album主键id' AFTER `id`;


CREATE TABLE `video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '视频表主键id',
  `video_name` varchar(80) NOT NULL DEFAULT '' COMMENT '视频名',
  `video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '视频url',
  `exttype` varchar(20) DEFAULT '' COMMENT '视频文件类型',
  `extfield` char(32) DEFAULT '' COMMENT '视频md5值',
  `description` varchar(255) DEFAULT '' COMMENT '视频描述',
  `list_order` int(10) NOT NULL DEFAULT '1' COMMENT '视频显示排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '视频状态1公开0不公开',
  `view_times` int(10) DEFAULT '0' COMMENT '视频浏览次数',
  `allow_comment` tinyint(1) DEFAULT '1' COMMENT '视频是否允许评论1允许0禁止',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '视频创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '视频更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `video_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '视频评论表主键id',
  `video_id` int(10) NOT NULL COMMENT '视频表主键id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '视频评论内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '视频评论状态1公开0不公开',
  `user_id` int(10) DEFAULT NULL COMMENT '视频评论者用户表id',
  `user_name` varchar(20) DEFAULT '' COMMENT '视频评论者用户名',
  `ip_address` varchar(15) DEFAULT '' COMMENT '视频评论者ip地址',
  `parent_id` int(10) DEFAULT NULL COMMENT '视频评论夫评论',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '视频评论创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '视频评论更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `website` (
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '网站名',
  `record` varchar(60) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `website_email` varchar(60) NOT NULL DEFAULT '' COMMENT '站长电子邮箱',
  `copyright` varchar(60) NOT NULL DEFAULT '' COMMENT '网站版权信息',
  `seo_title` varchar(60) NOT NULL DEFAULT '' COMMENT '网站seo标题',
  `seo_keyword` varchar(120) NOT NULL DEFAULT '' COMMENT '网站seo关键字',
  `seo_description` varchar(255) NOT NULL DEFAULT '' COMMENT '网站seo描述',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '留言板表主键id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '留言板内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '留言状态1显示0不显示',
  `view_times` int(10) DEFAULT '0' COMMENT '留言浏览次数',
  `user_id` int(10) DEFAULT NULL COMMENT '留言用户id',
  `user_name` varchar(20) DEFAULT '' COMMENT '留言用户名',
  `ip_address` varchar(15) DEFAULT '' COMMENT '留言用户ip地址',
  `parent_id` int(10) DEFAULT NULL COMMENT '留言父id',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '留言创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '留言更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板表';


CREATE TABLE `message_reply` (
  `id` int(10) NOT NULL COMMENT '留言回复表主键',
  `message_id` int(10) NOT NULL COMMENT '对应留言板表主键id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '留言回复内容',
  `status` tinyint(1) DEFAULT '1' COMMENT '留言回复状态1显示0不显示',
  `user_id` int(10) DEFAULT NULL COMMENT '留言回复用户id',
  `user_name` varchar(20) DEFAULT '' COMMENT '留言回复用户名',
  `ip_address` varchar(15) DEFAULT '' COMMENT '留言回复用户ip地址',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '留言回复创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '留言回复更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言回复表';

CREATE TABLE `content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容表主键id',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '内容表标题',
  `type` tinyint(1) NOT NULL COMMENT '内容类型1(talk说说)2(article日志)3(album相册)4(video视频)',
  `content` text COMMENT '内容',
  `album_url` varchar(255) DEFAULT '' COMMENT '类型为相册时相册url',
  `video_url` varchar(255) DEFAULT NULL COMMENT '内容为视频时视频url',
  `status` tinyint(1) DEFAULT '1' COMMENT '内容状态1显示0不显示',
  `view_times` int(10) DEFAULT '0' COMMENT '内容浏览次数',
  `comment_times` int(10) DEFAULT '0' COMMENT '内容评论次数',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '内容创建时间',
  `update_time` int(10) DEFAULT '0' COMMENT '内容更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容表(中间表)类型可为说说 日志 相册  视频等';


ALTER TABLE `message_reply`
MODIFY COLUMN `id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '留言回复表主键' FIRST ;


ALTER TABLE `content`
ADD COLUMN `tapv_id`  int(10) NOT NULL COMMENT '内容表对应的说说日志相册或视频表主键' AFTER `id`;



ALTER TABLE `website`
ADD COLUMN `background_img`  varchar(255) NULL DEFAULT '' COMMENT '网站背景图片' AFTER `seo_description`;

ALTER TABLE `website`
ADD COLUMN `front_page_num`  smallint(4) NULL DEFAULT 20 COMMENT '前台内容分页显示数量' AFTER `seo_description`,
ADD COLUMN `back_page_num`  smallint(4) NULL DEFAULT 20 COMMENT '后台分页显示数量' AFTER `front_page_num`;

