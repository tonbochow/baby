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

