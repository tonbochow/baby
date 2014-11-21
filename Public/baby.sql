INSERT INTO `role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`) VALUES
(1, '管理员', 0, 1, '',  now(), now()),
(2, '普通用户', 0, 1, '', now(), now());

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, '1'),
(2, '2');

INSERT INTO `node` (`id`, `name`, `title`, `status`, `remark`, `sort`, `pid`, `level`) VALUES
(1, 'Admin', '后台模块', 1, '', NULL, 0, 1),
(2, 'Home', '前台模块', 1, '', NULL, 0, 1),
(3, 'Index', '后台首页', 1, '', NULL, 1, 2),
(4, 'index', '后台首页操作', 1, '', NULL, 3, 3);

INSERT INTO `access` (`role_id`, `node_id`, `level`,  `module`) VALUES
(1, 1, 1,  NULL),
(1, 2, 1,  NULL),
(1, 3, 2,  NULL),
(1, 4, 3,  NULL);