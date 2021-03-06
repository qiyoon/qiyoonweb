/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : moqie

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-05-03 11:13:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for moqie_aboutus
-- ----------------------------
DROP TABLE IF EXISTS `moqie_aboutus`;
CREATE TABLE `moqie_aboutus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) DEFAULT NULL COMMENT '公司名',
  `company_url` varchar(100) DEFAULT NULL COMMENT '企业网站',
  `logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `company_description` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moqie_aboutus
-- ----------------------------
INSERT INTO `moqie_aboutus` VALUES ('1', '模切之家', 'http://www.tigonetwork.com', '/data/upload/20160428/5721c4f4cccb3.jpg', 'dfgdfdfgdfgdfdfgdf', '123456789');

-- ----------------------------
-- Table structure for moqie_ad
-- ----------------------------
DROP TABLE IF EXISTS `moqie_ad`;
CREATE TABLE `moqie_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moqie_ad
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_asset
-- ----------------------------
DROP TABLE IF EXISTS `moqie_asset`;
CREATE TABLE `moqie_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of moqie_asset
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `moqie_auth_access`;
CREATE TABLE `moqie_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of moqie_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `moqie_auth_rule`;
CREATE TABLE `moqie_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of moqie_auth_rule
-- ----------------------------
INSERT INTO `moqie_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('162', 'Portal', 'admin_url', 'portal/adminaboutus/index', null, '关于我们', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('163', 'Portal', 'admin_url', 'portal/admindemandsupplylist/index', null, '供需管理', '1', '');
INSERT INTO `moqie_auth_rule` VALUES ('164', 'Portal', 'admin_url', 'portal/admindslist/index', null, '供需管理', '1', '');

-- ----------------------------
-- Table structure for moqie_comments
-- ----------------------------
DROP TABLE IF EXISTS `moqie_comments`;
CREATE TABLE `moqie_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of moqie_comments
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_common_action_log
-- ----------------------------
DROP TABLE IF EXISTS `moqie_common_action_log`;
CREATE TABLE `moqie_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of moqie_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_dslist
-- ----------------------------
DROP TABLE IF EXISTS `moqie_dslist`;
CREATE TABLE `moqie_dslist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  `companyname` char(50) DEFAULT NULL COMMENT '公司名称',
  `price` float(10,2) DEFAULT NULL COMMENT '类别id',
  `specification` text COMMENT '产品参数',
  `description` text COMMENT '产品描述',
  `num` int(10) DEFAULT NULL COMMENT '数量',
  `switch` int(255) DEFAULT NULL COMMENT '是否显示公司名称',
  `tag` varchar(50) DEFAULT NULL COMMENT '标签',
  `img1` varchar(255) DEFAULT NULL COMMENT '图片1',
  `img2` varchar(255) DEFAULT NULL COMMENT '图片2',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of moqie_dslist
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `moqie_guestbook`;
CREATE TABLE `moqie_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of moqie_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_links
-- ----------------------------
DROP TABLE IF EXISTS `moqie_links`;
CREATE TABLE `moqie_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of moqie_links
-- ----------------------------
INSERT INTO `moqie_links` VALUES ('1', 'http://www.tigonetwork.com', 'TIGO', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for moqie_menu
-- ----------------------------
DROP TABLE IF EXISTS `moqie_menu`;
CREATE TABLE `moqie_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(50) NOT NULL COMMENT '控制器',
  `action` char(50) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of moqie_menu
-- ----------------------------
INSERT INTO `moqie_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '1', '内容管理', 'th', '', '30');
INSERT INTO `moqie_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `moqie_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `moqie_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `moqie_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `moqie_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `moqie_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '1', '扩展工具', 'cloud', '', '40');
INSERT INTO `moqie_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `moqie_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `moqie_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `moqie_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `moqie_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '1', '菜单管理', 'list', '', '20');
INSERT INTO `moqie_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '1', '设置', 'cogs', '', '0');
INSERT INTO `moqie_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `moqie_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `moqie_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '1', '用户组', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `moqie_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `moqie_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '1', '角色管理', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `moqie_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('162', '1', 'Portal', 'AdminAboutus', 'index', '', '1', '1', '关于我们', '', '', '0');
INSERT INTO `moqie_menu` VALUES ('163', '1', 'Portal', 'AdminDslist', 'index', '', '1', '1', '供需管理', '', '', '0');

-- ----------------------------
-- Table structure for moqie_nav
-- ----------------------------
DROP TABLE IF EXISTS `moqie_nav`;
CREATE TABLE `moqie_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of moqie_nav
-- ----------------------------
INSERT INTO `moqie_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `moqie_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `moqie_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for moqie_nav_cat
-- ----------------------------
DROP TABLE IF EXISTS `moqie_nav_cat`;
CREATE TABLE `moqie_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of moqie_nav_cat
-- ----------------------------
INSERT INTO `moqie_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for moqie_oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `moqie_oauth_user`;
CREATE TABLE `moqie_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of moqie_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_options
-- ----------------------------
DROP TABLE IF EXISTS `moqie_options`;
CREATE TABLE `moqie_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of moqie_options
-- ----------------------------
INSERT INTO `moqie_options` VALUES ('1', 'member_email_active', '{\"title\":\"TIGO\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.tigonetwork.com\\\">TIGO<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fTIGO\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; TIGO \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `moqie_options` VALUES ('2', 'site_options', '            {\n            		\"site_name\":\"模切之家\",\n            		\"site_host\":\"http://localhost:7010/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"346685825@qq.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"模切之家\",\n            		\"site_seo_keywords\":\"模切之家\",\n            		\"site_seo_description\":\"模切之家\"\n        }', '1');

-- ----------------------------
-- Table structure for moqie_plugins
-- ----------------------------
DROP TABLE IF EXISTS `moqie_plugins`;
CREATE TABLE `moqie_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of moqie_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_posts
-- ----------------------------
DROP TABLE IF EXISTS `moqie_posts`;
CREATE TABLE `moqie_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of moqie_posts
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_role
-- ----------------------------
DROP TABLE IF EXISTS `moqie_role`;
CREATE TABLE `moqie_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of moqie_role
-- ----------------------------
INSERT INTO `moqie_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for moqie_role_user
-- ----------------------------
DROP TABLE IF EXISTS `moqie_role_user`;
CREATE TABLE `moqie_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of moqie_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_route
-- ----------------------------
DROP TABLE IF EXISTS `moqie_route`;
CREATE TABLE `moqie_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of moqie_route
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_slide
-- ----------------------------
DROP TABLE IF EXISTS `moqie_slide`;
CREATE TABLE `moqie_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of moqie_slide
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_slide_cat
-- ----------------------------
DROP TABLE IF EXISTS `moqie_slide_cat`;
CREATE TABLE `moqie_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of moqie_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_terms
-- ----------------------------
DROP TABLE IF EXISTS `moqie_terms`;
CREATE TABLE `moqie_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of moqie_terms
-- ----------------------------
INSERT INTO `moqie_terms` VALUES ('1', '资讯', '', 'article', '资讯', '0', '0', '0-1', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('2', '供需', '', 'dslist', '供需', '0', '0', '0-2', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('3', '技术', '', 'article', '技术', '1', '0', '0-1-3', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('4', '活动', '', 'article', '活动', '1', '0', '0-1-4', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('5', '行业', '', 'article', '行业', '1', '0', '0-1-5', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('6', '供应', '', 'dslist', '供应', '2', '0', '0-2-6', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('7', '需求', '', 'dslist', '需求', '2', '0', '0-2-7', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('8', '薄膜类', '', 'dslist', '薄膜类', '6', '0', '0-2-6-8', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('9', '胶粘类', '', 'dslist', '胶粘类\n\n\n\n', '6', '0', '0-2-6-9', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('10', '纸品类', '', 'dslist', '纸品类\n', '6', '0', '0-2-6-10', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('11', '防水防尘类', '', 'dslist', '防水防尘类\n\n\n\n', '6', '0', '0-2-6-11', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('12', '导电屏蔽类', '', 'dslist', '导电屏蔽类\n\n\n\n\n', '6', '0', '0-2-6-12', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('13', '导热散热类', '', 'dslist', '导热散热类\n\n\n', '6', '0', '0-2-6-13', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('14', '绝缘阻燃类', '', 'dslist', '绝缘阻燃类\n', '6', '0', '0-2-6-14', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('15', '密封缓冲类', '', 'dslist', '密封缓冲类\n', '6', '0', '0-2-6-15', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('16', '刀模刀具', '', 'dslist', '刀模刀具\n\n', '6', '0', '0-2-6-16', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('17', '自动化设备', '', 'dslist', '自动化设备', '6', '0', '0-2-6-17', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('18', '加工', '', 'dslist', '加工', '6', '0', '0-2-6-18', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('19', '薄膜类', '', 'dslist', '薄膜类', '7', '0', '0-2-7-19', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('20', '胶粘类', '', 'dslist', '胶粘类\n\n\n\n', '7', '0', '0-2-7-20', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('21', '纸品类', '', 'dslist', '纸品类\n', '7', '0', '0-2-7-21', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('22', '防水防尘类', '', 'dslist', '防水防尘类\n\n\n\n', '7', '0', '0-2-7-22', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('23', '导电屏蔽类', '', 'dslist', '导电屏蔽类\n\n\n\n\n', '7', '0', '0-2-7-23', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('24', '导热散热类', '', 'dslist', '导热散热类\n\n\n', '7', '0', '0-2-7-24', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('25', '绝缘阻燃类', '', 'dslist', '绝缘阻燃类\n', '7', '0', '0-2-7-25', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('26', '密封缓冲类', '', 'dslist', '密封缓冲类\n', '7', '0', '0-2-7-26', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('27', '刀模刀具', '', 'dslist', '刀模刀具\n\n', '7', '0', '0-2-7-27', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('28', '自动化设备', '', 'dslist', '自动化设备', '7', '0', '0-2-7-28', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('29', '加工', '', 'dslist', '加工', '7', '0', '0-2-7-29', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('30', '离型膜', '', 'dslist', '离型膜', '8', '0', '0-2-6-8-30', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('31', '保护膜', '', 'dslist', '保护膜', '8', '0', '0-2-6-8-31', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('32', '增光膜', '', 'dslist', '增光膜', '8', '0', '0-2-6-8-32', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('33', '扩散膜', '', 'dslist', '扩散膜', '8', '0', '0-2-6-8-33', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('34', '反射膜', '', 'dslist', '反射膜', '8', '0', '0-2-6-8-34', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('35', 'ITO导电膜', '', 'dslist', 'ITO导电膜', '8', '0', '0-2-6-8-35', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('36', '3D膜', '', 'dslist', '3D膜', '8', '0', '0-2-6-8-36', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('37', '双面胶带', '', 'dslist', '双面胶带', '9', '0', '0-2-6-9-37', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('38', '黑白胶', '', 'dslist', '黑白胶', '9', '0', '0-2-6-9-38', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('39', '泡棉胶', '', 'dslist', '泡棉胶', '9', '0', '0-2-6-9-39', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('40', 'OCA光学胶', '', 'dslist', 'OCA光学胶', '9', '0', '0-2-6-9-40', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('41', 'AB胶', '', 'dslist', 'AB胶', '9', '0', '0-2-6-9-41', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('42', '离型纸', '', 'dslist', '离型纸', '10', '0', '0-2-6-10-42', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('43', '美纹纸', '', 'dslist', '美纹纸', '10', '0', '0-2-6-10-43', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('44', '尼龙网纱', '', 'dslist', '尼龙网纱', '11', '0', '0-2-6-11-44', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('45', '金属网纱', '', 'dslist', '金属网纱', '11', '0', '0-2-6-11-45', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('46', '防水透气膜', '', 'dslist', '防水透气膜', '11', '0', '0-2-6-11-46', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('47', '不织布', '', 'dslist', '不织布', '11', '0', '0-2-6-11-47', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('48', '调音纸', '', 'dslist', '调音纸', '11', '0', '0-2-6-11-48', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('49', '导电布', '', 'dslist', '导电布', '12', '0', '0-2-6-12-49', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('50', '导电泡棉', '', 'dslist', '导电泡棉', '12', '0', '0-2-6-12-50', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('51', '导电胶', '', 'dslist', '导电胶', '12', '0', '0-2-6-12-51', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('52', '铜箔', '', 'dslist', '铜箔', '12', '0', '0-2-6-12-52', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('53', '铝箔', '', 'dslist', '铝箔', '12', '0', '0-2-6-12-53', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('54', '纳米碳铜', '', 'dslist', '纳米碳铜', '12', '0', '0-2-6-12-54', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('55', '石墨片', '', 'dslist', '石墨片', '13', '0', '0-2-6-13-55', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('56', '吸波片', '', 'dslist', '吸波片', '13', '0', '0-2-6-13-56', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('57', '导热硅胶', '', 'dslist', '导热硅胶', '13', '0', '0-2-6-13-57', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('58', '导热硅脂', '', 'dslist', '导热硅脂', '13', '0', '0-2-6-13-58', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('59', '麦拉', '', 'dslist', '麦拉', '14', '0', '0-2-6-14-59', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('60', 'PC/PVC/PET', '', 'dslist', 'PC/PVC/PET', '14', '0', '0-2-6-14-60', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('61', '硅胶', '', 'dslist', '硅胶', '15', '0', '0-2-6-15-61', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('62', 'poron', '', 'dslist', 'poron', '15', '0', '0-2-6-15-62', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('63', '激光刀模', '', 'dslist', '激光刀模', '16', '0', '0-2-6-16-63', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('64', '雕刻刀模', '', 'dslist', '雕刻刀模', '16', '0', '0-2-6-16-64', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('65', '腐蚀刀模', '', 'dslist', '腐蚀刀模', '16', '0', '0-2-6-16-65', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('66', 'QDC模', '', 'dslist', 'QDC模', '16', '0', '0-2-6-16-66', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('67', '磁性刀皮', '', 'dslist', '磁性刀皮', '16', '0', '0-2-6-16-67', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('68', '圆刀五金模', '', 'dslist', '圆刀五金模', '16', '0', '0-2-6-16-68', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('69', '刀模配套', '', 'dslist', '刀模配套', '16', '0', '0-2-6-16-69', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('70', '模切机', '', 'dslist', '模切机', '17', '0', '0-2-6-17-70', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('71', '贴合机', '', 'dslist', '贴合机', '17', '0', '0-2-6-17-71', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('72', '覆膜机', '', 'dslist', '覆膜机', '17', '0', '0-2-6-17-72', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('73', '套位机', '', 'dslist', '套位机', '17', '0', '0-2-6-17-73', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('74', '轮转机', '', 'dslist', '轮转机', '17', '0', '0-2-6-17-74', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('75', '涂布机', '', 'dslist', '涂布机', '17', '0', '0-2-6-17-75', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('76', '分条机', '', 'dslist', '分条机', '17', '0', '0-2-6-17-76', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('77', '分切机', '', 'dslist', '分切机', '17', '0', '0-2-6-17-77', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('78', '激光打样机', '', 'dslist', '激光打样机', '17', '0', '0-2-6-17-78', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('79', '检测设备', '', 'dslist', '检测设备', '17', '0', '0-2-6-17-79', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('80', '配套设备', '', 'dslist', '配套设备', '17', '0', '0-2-6-17-80', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('81', '模切加工', '', 'dslist', '模切加工', '18', '0', '0-2-6-18-81', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('82', '离型膜', '', 'dslist', '离型膜', '19', '0', '0-2-6-19-82', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('83', '保护膜', '', 'dslist', '保护膜', '19', '0', '0-2-6-19-83', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('84', '增光膜', '', 'dslist', '增光膜', '19', '0', '0-2-6-19-84', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('85', '扩散膜', '', 'dslist', '扩散膜', '19', '0', '0-2-6-19-85', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('86', '反射膜', '', 'dslist', '反射膜', '19', '0', '0-2-6-19-86', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('87', 'ITO导电膜', '', 'dslist', 'ITO导电膜', '19', '0', '0-2-6-19-87', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('88', '3D膜', '', 'dslist', '3D膜', '19', '0', '0-2-6-19-88', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('89', '双面胶带', '', 'dslist', '双面胶带', '20', '0', '0-2-6-20-89', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('90', '黑白胶', '', 'dslist', '黑白胶', '20', '0', '0-2-6-20-90', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('91', '泡棉胶', '', 'dslist', '泡棉胶', '20', '0', '0-2-6-20-91', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('92', 'OCA光学胶', '', 'dslist', 'OCA光学胶', '20', '0', '0-2-6-20-92', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('93', 'AB胶', '', 'dslist', 'AB胶', '20', '0', '0-2-6-20-93', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('94', '离型纸', '', 'dslist', '离型纸', '21', '0', '0-2-6-21-94', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('95', '美纹纸', '', 'dslist', '美纹纸', '21', '0', '0-2-6-21-95', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('96', '尼龙网纱', '', 'dslist', '尼龙网纱', '22', '0', '0-2-6-22-96', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('97', '金属网纱', '', 'dslist', '金属网纱', '22', '0', '0-2-6-22-97', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('98', '防水透气膜', '', 'dslist', '防水透气膜', '22', '0', '0-2-6-22-98', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('99', '不织布', '', 'dslist', '不织布', '22', '0', '0-2-6-22-99', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('100', '调音纸', '', 'dslist', '调音纸', '22', '0', '0-2-6-22-100', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('101', '导电布', '', 'dslist', '导电布', '23', '0', '0-2-6-23-101', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('102', '导电泡棉', '', 'dslist', '导电泡棉', '23', '0', '0-2-6-23-102', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('103', '导电胶', '', 'dslist', '导电胶', '23', '0', '0-2-6-23-103', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('104', '铜箔', '', 'dslist', '铜箔', '23', '0', '0-2-6-23-104', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('105', '铝箔', '', 'dslist', '铝箔', '23', '0', '0-2-6-23-105', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('106', '纳米碳铜', '', 'dslist', '纳米碳铜', '23', '0', '0-2-6-23-106', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('107', '石墨片', '', 'dslist', '石墨片', '24', '0', '0-2-6-24-107', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('108', '吸波片', '', 'dslist', '吸波片', '24', '0', '0-2-6-24-108', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('109', '导热硅胶', '', 'dslist', '导热硅胶', '24', '0', '0-2-6-24-106', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('110', '导热硅脂', '', 'dslist', '导热硅脂', '24', '0', '0-2-6-24-110', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('111', '麦拉', '', 'dslist', '麦拉', '25', '0', '0-2-6-25-111', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('112', 'PC/PVC/PET', '', 'dslist', 'PC/PVC/PET', '25', '0', '0-2-6-25-112', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('113', '硅胶', '', 'dslist', '硅胶', '26', '0', '0-2-6-26-113', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('114', 'poron', '', 'dslist', 'poron', '26', '0', '0-2-6-26-114', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('115', '激光刀模', '', 'dslist', '激光刀模', '27', '0', '0-2-6-27-115', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('116', '雕刻刀模', '', 'dslist', '雕刻刀模', '27', '0', '0-2-6-27-116', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('117', '腐蚀刀模', '', 'dslist', '腐蚀刀模', '27', '0', '0-2-6-27-117', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('118', 'QDC模', '', 'dslist', 'QDC模', '27', '0', '0-2-6-27-118', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('119', '磁性刀皮', '', 'dslist', '磁性刀皮', '27', '0', '0-2-6-27-119', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('120', '圆刀五金模', '', 'dslist', '圆刀五金模', '27', '0', '0-2-6-27-120', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('121', '刀模配套', '', 'dslist', '刀模配套', '27', '0', '0-2-6-27-121', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('122', '模切机', '', 'dslist', '模切机', '28', '0', '0-2-6-28-122', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('123', '贴合机', '', 'dslist', '贴合机', '28', '0', '0-2-6-28-123', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('124', '覆膜机', '', 'dslist', '覆膜机', '28', '0', '0-2-6-28-124', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('125', '套位机', '', 'dslist', '套位机', '28', '0', '0-2-6-28-125', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('126', '轮转机', '', 'dslist', '轮转机', '28', '0', '0-2-6-28-126', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('127', '涂布机', '', 'dslist', '涂布机', '28', '0', '0-2-6-28-127', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('128', '分条机', '', 'dslist', '分条机', '28', '0', '0-2-6-28-128', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('129', '分切机', '', 'dslist', '分切机', '28', '0', '0-2-6-28-129', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('130', '激光打样机', '', 'dslist', '激光打样机', '28', '0', '0-2-6-28-130', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('131', '检测设备', '', 'dslist', '检测设备', '28', '0', '0-2-6-28-131', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('132', '配套设备', '', 'dslist', '配套设备', '28', '0', '0-2-6-28-132', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `moqie_terms` VALUES ('133', '模切加工', '', 'dslist', '模切加工', '29', '0', '0-2-6-29-133', '', '', '', 'list', 'article', '0', '1');

-- ----------------------------
-- Table structure for moqie_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `moqie_term_relationships`;
CREATE TABLE `moqie_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of moqie_term_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for moqie_users
-- ----------------------------
DROP TABLE IF EXISTS `moqie_users`;
CREATE TABLE `moqie_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `companyname` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `logo` varchar(100) DEFAULT NULL COMMENT '公司logo',
  `company_add` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `primarybusiness` varchar(100) DEFAULT NULL COMMENT '主营业务',
  `customer_groups` varchar(100) DEFAULT NULL COMMENT '客户群体',
  `customer_email` varchar(100) DEFAULT NULL COMMENT '公司邮箱',
  `company_status` int(11) DEFAULT '0' COMMENT '1.未审核2.正在审核3.审核失败4.审核',
  `address` varchar(255) DEFAULT NULL COMMENT '个人地址',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of moqie_users
-- ----------------------------
INSERT INTO `moqie_users` VALUES ('1', 'admin', '###a8e846e448a270d4e83fbeff163727df', 'admin', '346685825@qq.com', '', '', '0', '0000-00-00', '', '0.0.0.0', '2016-05-03 09:32:55', '2016-04-26 10:38:22', '', '1', '0', '1', '0', '', '', '', '', '', '', '', null, null);
INSERT INTO `moqie_users` VALUES ('3', 'test_test_com', '###b122598d8c3f0714d3e2ee7a7f6443d3', 'test_test_com', 'test@test.com', '', null, '0', null, null, '0.0.0.0', '2016-04-29 17:18:35', '2016-04-28 16:48:45', '', '1', '0', '2', '0', '', null, null, null, null, null, null, '4', null);

-- ----------------------------
-- Table structure for moqie_user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `moqie_user_favorites`;
CREATE TABLE `moqie_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of moqie_user_favorites
-- ----------------------------
