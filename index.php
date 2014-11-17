<?php
/**
 * 为dear baby 做的个人网站 以展示相片 视频 日志等为主
 */

// 应用入口文件

// 检测PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',True);

//绑定生成Admin后台模块
//define('BIND_MODULE','Admin');

// 定义应用目录 (用绝对路径定义APP_PATH,提高系统加载速度)
//define('APP_PATH','./Application/');
define('APP_PATH',realpath('./..').'/App/');

//定义框架绝对路径
define('THINK_PATH',realpath('../ThinkPHP').'/');

// 引入ThinkPHP入口文件 (用绝对路径包含框架入口文件,提高系统加载速度)
require THINK_PATH.'ThinkPHP.php';
