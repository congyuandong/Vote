/*
 Navicat MySQL Data Transfer

 Source Server         : 投票服务器
 Source Server Version : 50173
 Source Host           : 182.92.100.135
 Source Database       : vote

 Target Server Version : 50173
 File Encoding         : utf-8

 Date: 12/05/2014 20:48:11 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_permission`
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can view log entry', '1', 'view_logentry'), ('5', 'Can add permission', '2', 'add_permission'), ('6', 'Can change permission', '2', 'change_permission'), ('7', 'Can delete permission', '2', 'delete_permission'), ('8', 'Can add group', '3', 'add_group'), ('9', 'Can change group', '3', 'change_group'), ('10', 'Can delete group', '3', 'delete_group'), ('11', 'Can add user', '4', 'add_user'), ('12', 'Can change user', '4', 'change_user'), ('13', 'Can delete user', '4', 'delete_user'), ('14', 'Can view group', '3', 'view_group'), ('15', 'Can view permission', '2', 'view_permission'), ('16', 'Can view user', '4', 'view_user'), ('17', 'Can add content type', '5', 'add_contenttype'), ('18', 'Can change content type', '5', 'change_contenttype'), ('19', 'Can delete content type', '5', 'delete_contenttype'), ('20', 'Can view content type', '5', 'view_contenttype'), ('21', 'Can add session', '6', 'add_session'), ('22', 'Can change session', '6', 'change_session'), ('23', 'Can delete session', '6', 'delete_session'), ('24', 'Can view session', '6', 'view_session'), ('25', 'Can add revision', '7', 'add_revision'), ('26', 'Can change revision', '7', 'change_revision'), ('27', 'Can delete revision', '7', 'delete_revision'), ('28', 'Can add version', '8', 'add_version'), ('29', 'Can change version', '8', 'change_version'), ('30', 'Can delete version', '8', 'delete_version'), ('31', 'Can view revision', '7', 'view_revision'), ('32', 'Can view version', '8', 'view_version'), ('33', 'Can add Bookmark', '9', 'add_bookmark'), ('34', 'Can change Bookmark', '9', 'change_bookmark'), ('35', 'Can delete Bookmark', '9', 'delete_bookmark'), ('36', 'Can add User Setting', '10', 'add_usersettings'), ('37', 'Can change User Setting', '10', 'change_usersettings'), ('38', 'Can delete User Setting', '10', 'delete_usersettings'), ('39', 'Can add User Widget', '11', 'add_userwidget'), ('40', 'Can change User Widget', '11', 'change_userwidget'), ('41', 'Can delete User Widget', '11', 'delete_userwidget'), ('42', 'Can view Bookmark', '9', 'view_bookmark'), ('43', 'Can view User Setting', '10', 'view_usersettings'), ('44', 'Can view User Widget', '11', 'view_userwidget'), ('45', 'Can add 评委', '12', 'add_judge'), ('46', 'Can change 评委', '12', 'change_judge'), ('47', 'Can delete 评委', '12', 'delete_judge'), ('48', 'Can view 评委', '12', 'view_judge'), ('49', 'Can add 行业', '13', 'add_industry'), ('50', 'Can change 行业', '13', 'change_industry'), ('51', 'Can delete 行业', '13', 'delete_industry'), ('52', 'Can add 行业', '14', 'add_company'), ('53', 'Can change 行业', '14', 'change_company'), ('54', 'Can delete 行业', '14', 'delete_company'), ('55', 'Can add 验证码', '15', 'add_randomcode'), ('56', 'Can change 验证码', '15', 'change_randomcode'), ('57', 'Can delete 验证码', '15', 'delete_randomcode'), ('58', 'Can view 行业', '13', 'view_industry'), ('59', 'Can view 行业', '14', 'view_company'), ('60', 'Can view 验证码', '15', 'view_randomcode'), ('61', 'Can add 投票记录', '16', 'add_votephone'), ('62', 'Can change 投票记录', '16', 'change_votephone'), ('63', 'Can delete 投票记录', '16', 'delete_votephone'), ('64', 'Can view 投票记录', '16', 'view_votephone');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_user`
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$12000$bpNHqBiqsRMB$fPcLlxH+/xLSn7KNurKLp8ni2h/em4HDHGJtbZKneCY=', '2014-11-20 19:08:27', '1', 'admin', '', '', '', '1', '1', '2014-11-13 14:49:40'), ('2', 'pbkdf2_sha256$12000$3KY091m8w1vQ$CFFi7teRjk7icz8Gz/jQ9HZ1NTZHorImk0UAcDkWMQk=', '2014-11-23 22:56:57', '0', 'qhinvest', '', '', '', '1', '1', '2014-11-20 16:36:13');
COMMIT;

-- ----------------------------
--  Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_user_user_permissions`
-- ----------------------------
BEGIN;
INSERT INTO `auth_user_user_permissions` VALUES ('138', '2', '64'), ('137', '2', '59'), ('136', '2', '58'), ('135', '2', '54'), ('134', '2', '53'), ('133', '2', '52'), ('132', '2', '51'), ('131', '2', '50'), ('130', '2', '49'), ('129', '2', '48'), ('128', '2', '47'), ('127', '2', '46'), ('126', '2', '45'), ('125', '2', '44'), ('124', '2', '43'), ('123', '2', '42'), ('122', '2', '41'), ('121', '2', '40'), ('120', '2', '39'), ('119', '2', '38'), ('118', '2', '37'), ('117', '2', '36'), ('116', '2', '35'), ('115', '2', '34'), ('114', '2', '33'), ('113', '2', '32'), ('112', '2', '31'), ('111', '2', '30'), ('110', '2', '29'), ('109', '2', '28'), ('108', '2', '27'), ('107', '2', '26'), ('106', '2', '25'), ('105', '2', '20'), ('104', '2', '19'), ('103', '2', '18'), ('102', '2', '17');
COMMIT;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_content_type`
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'log entry', 'admin', 'logentry'), ('2', 'permission', 'auth', 'permission'), ('3', 'group', 'auth', 'group'), ('4', 'user', 'auth', 'user'), ('5', 'content type', 'contenttypes', 'contenttype'), ('6', 'session', 'sessions', 'session'), ('7', 'revision', 'reversion', 'revision'), ('8', 'version', 'reversion', 'version'), ('9', 'Bookmark', 'xadmin', 'bookmark'), ('10', 'User Setting', 'xadmin', 'usersettings'), ('11', 'User Widget', 'xadmin', 'userwidget'), ('12', '评委', 'qdvote', 'judge'), ('13', '行业', 'qdvote', 'industry'), ('14', '行业', 'qdvote', 'company'), ('15', '验证码', 'qdvote', 'randomcode'), ('16', '投票记录', 'qdvote', 'votephone');
COMMIT;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_session`
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('foptyit5ylfv1d5yaxnqdkhrww0jb21f', 'OGY4MGEwYTlhMmI0NGY5NzgyODdkYjMwZjY4NWY0NTgyOTAyMjgxMzp7IkxJU1RfUVVFUlkiOltbInFkdm90ZSIsImNvbXBhbnkiXSwiIl0sIl9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJcXHU4ODRjXFx1NGUxYSBcXFwiPGEgY2xhc3M9J2FsZXJ0LWxpbmsnIGhyZWY9Jy9hZG1pbi9xZHZvdGUvaW5kdXN0cnkvNy91cGRhdGUvJz5cXHU1MTljXFx1NGUxYTwvYT5cXFwiIFxcdTZkZmJcXHU1MmEwXFx1NjIxMFxcdTUyOWZcXHUzMDAyIFxcdTRmNjBcXHU1M2VmXFx1NGVlNVxcdTU3MjhcXHU0ZTBiXFx1OTc2MlxcdTU4OWVcXHU1MmEwXFx1NTNlNlxcdTRlMDBcXHU0ZTJhIFxcdTg4NGNcXHU0ZTFhIFxcdTMwMDJcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiXFx1ODg0Y1xcdTRlMWEgXFxcIjxhIGNsYXNzPSdhbGVydC1saW5rJyBocmVmPScvYWRtaW4vcWR2b3RlL2luZHVzdHJ5LzgvdXBkYXRlLyc+XFx1NzI2OVxcdTZkNDE8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTRmMDFcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9jb21wYW55LzEvdXBkYXRlLyc+XFx1NGUwYVxcdTZkNzdcXHU4ZjliXFx1ODQ3NVxcdTc5ZDFcXHU2MjgwXFx1ODBhMVxcdTRlZmRcXHU2NzA5XFx1OTY1MFxcdTUxNmNcXHU1M2Y4PC9hPlxcXCIgXFx1NmRmYlxcdTUyYTBcXHU2MjEwXFx1NTI5ZlxcdTMwMDJcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiXFx1NGYwMVxcdTRlMWEgXFxcIlxcdTRlMGFcXHU2ZDc3XFx1OGY5YlxcdTg0NzVcXHU3OWQxXFx1NjI4MFxcdTgwYTFcXHU0ZWZkXFx1NjcwOVxcdTk2NTBcXHU1MTZjXFx1NTNmOFxcXCIgXFx1NGZlZVxcdTY1MzlcXHU2MjEwXFx1NTI5ZlxcdTMwMDJcIl1dIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==', '2014-12-01 21:29:38'), ('v7wsacojpdbt0obskuev4vwttrvyduqi', 'YTZiMDJkYWQ0Mzg2ZTI0M2YwODgwNThjMzdkNjQ0ZTZiZWE5MzQ3MTp7IkxJU1RfUVVFUlkiOltbInFkdm90ZSIsImp1ZGdlIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2014-11-27 22:06:23'), ('j1a4p0lbbso3g8lnnkqzio7qapx8b2lt', 'MmY1YWYxYjMyZmE4ZjI0ZjA2Yzg1MzIzNjIyNjFmNmY4OTA5MDE2NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sicWR2b3RlIiwicmFuZG9tY29kZSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6MSwiX21lc3NhZ2VzIjoiW1tcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xMC91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTI8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xMS91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTM8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xMi91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTQ8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xMy91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTU8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xNC91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTY8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xNS91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTc8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xNi91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTg8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xNy91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTk8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xOC91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTEwPC9hPlxcXCIgXFx1NmRmYlxcdTUyYTBcXHU2MjEwXFx1NTI5ZlxcdTMwMDIgXFx1NGY2MFxcdTUzZWZcXHU0ZWU1XFx1NTcyOFxcdTRlMGJcXHU5NzYyXFx1NTg5ZVxcdTUyYTBcXHU1M2U2XFx1NGUwMFxcdTRlMmEgXFx1ODg0Y1xcdTRlMWEgXFx1MzAwMlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJcXHU4ODRjXFx1NGUxYSBcXFwiPGEgY2xhc3M9J2FsZXJ0LWxpbmsnIGhyZWY9Jy9hZG1pbi9xZHZvdGUvaW5kdXN0cnkvMTkvdXBkYXRlLyc+XFx1NmQ0YlxcdThiZDUxMTwvYT5cXFwiIFxcdTZkZmJcXHU1MmEwXFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTRmMDFcXHU0ZTFhIFxcXCJcXHU0ZTBhXFx1NmQ3N1xcdThmOWJcXHU4NDc1XFx1NzlkMVxcdTYyODBcXHU4MGExXFx1NGVmZFxcdTY3MDlcXHU5NjUwXFx1NTE2Y1xcdTUzZjhcXFwiIFxcdTRmZWVcXHU2NTM5XFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTlhOGNcXHU4YmMxXFx1NzgwMSBcXFwiMTg2NDYzNzM0MzdcXFwiIFxcdTRmZWVcXHU2NTM5XFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTlhOGNcXHU4YmMxXFx1NzgwMSBcXFwiMTMxMzY2NTI1MjFcXFwiIFxcdTRmZWVcXHU2NTM5XFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTlhOGNcXHU4YmMxXFx1NzgwMSBcXFwiMTMxMzY2NTI1MjFcXFwiIFxcdTRmZWVcXHU2NTM5XFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTYyMTBcXHU1MjlmXFx1NTIyMFxcdTk2NjRcXHU0ZTg2IDEgXFx1NGUyYSBcXHU2Mjk1XFx1Nzk2OFxcdThiYjBcXHU1ZjU1XCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTYyMTBcXHU1MjlmXFx1NTIyMFxcdTk2NjRcXHU0ZTg2IDEgXFx1NGUyYSBcXHU2Mjk1XFx1Nzk2OFxcdThiYjBcXHU1ZjU1XCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTYyMTBcXHU1MjlmXFx1NTIyMFxcdTk2NjRcXHU0ZTg2IDEgXFx1NGUyYSBcXHU2Mjk1XFx1Nzk2OFxcdThiYjBcXHU1ZjU1XCJdXSJ9', '2014-12-02 16:21:52'), ('jq2x3h86qxcqfqavljis0c3jwylxsud2', 'OWIzOWJkNTUxOTNlNGQyMDBjMjcyNGY1NDMzMWI0YjVlNzM1YTZkNDp7fQ==', '2014-12-02 16:29:52'), ('bq9tyym474dbtt5us8ou1z7momqba4i7', 'MjQ0MjIyMGQ2ZWYwNzA4ZWE2YjM0YWM4NTBiOTI0MGQ0ZTc4ZDEwNzp7Il9hdXRoX3VzZXJfaWQiOjIsIkxJU1RfUVVFUlkiOltbInFkdm90ZSIsImNvbXBhbnkiXSwiIl0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX21lc3NhZ2VzIjoiW1tcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTRmMDFcXHU0ZTFhIFxcXCJcXHU0ZTBhXFx1NmQ3N1xcdTUxNmNcXHU1MTc0XFx1NTZmZFxcdTk2NDVcXHU3MjY5XFx1NmQ0MVxcdTgwYTFcXHU0ZWZkXFx1NjcwOVxcdTk2NTBcXHU1MTZjXFx1NTNmOFxcXCIgXFx1NGZlZVxcdTY1MzlcXHU2MjEwXFx1NTI5ZlxcdTMwMDJcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiXFx1NGYwMVxcdTRlMWEgXFxcIlxcdTRlMGFcXHU2ZDc3XFx1NzAxYVxcdTViYTNcXHU2NTg3XFx1NTMxNlxcdTRmMjBcXHU2NGFkXFx1ODBhMVxcdTRlZmRcXHU2NzA5XFx1OTY1MFxcdTUxNmNcXHU1M2Y4XFxcIiBcXHU0ZmVlXFx1NjUzOVxcdTYyMTBcXHU1MjlmXFx1MzAwMlwiXV0ifQ==', '2014-12-06 14:16:33'), ('2bn8lnnonexkv6hzrgczqinrdhx80lfl', 'MDc5NzVmYzg2MDZmZmVmZTAwZmUxYTI0ZjQzMTFiNWQ3OGFlMjQ3YTp7IkxJU1RfUVVFUlkiOltbInFkdm90ZSIsImluZHVzdHJ5Il0sIiJdLCJfYXV0aF91c2VyX2lkIjoyLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2014-12-05 09:27:09'), ('qy1e1c4nmm397ierem7d926qo67srjy8', 'MDExNGE5MzE0YTE4MjRkOTVmOWVmYTQwNGMyOGI1NTU2MGQ4NWI2NDp7IkxJU1RfUVVFUlkiOltbInFkdm90ZSIsInZvdGVwaG9uZSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ3aXphcmRfeGFkbWludXNlcndpZGdldF9hZG1pbl93aXphcmRfZm9ybV9wbHVnaW4iOnsic3RlcF9maWxlcyI6e30sInN0ZXAiOiJXaWRnZXRcdTdjN2JcdTU3OGIiLCJleHRyYV9kYXRhIjp7fSwic3RlcF9kYXRhIjp7fX19', '2014-12-05 11:47:00'), ('brni13gm97jz3s8mtxgsvymonsi37h9f', 'OTliN2MxYTBlZTkwNThjYzZlMDdhODE5NDg3NWI0YmQxYjUyYjZhYjp7IkxJU1RfUVVFUlkiOltbInFkdm90ZSIsImNvbXBhbnkiXSwiIl0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=', '2014-12-10 09:35:34');
COMMIT;

-- ----------------------------
--  Table structure for `qdvote_company`
-- ----------------------------
DROP TABLE IF EXISTS `qdvote_company`;
CREATE TABLE `qdvote_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `industry_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `detail` longtext,
  PRIMARY KEY (`id`),
  KEY `qdvote_company_c3dc70a9` (`industry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qdvote_company`
-- ----------------------------
BEGIN;
INSERT INTO `qdvote_company` VALUES ('2', '上海辛葵科技股份有限公司', '3', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('3', '上海辛葵科技股份有限公司', '3', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('4', '清大益讯（上海）投资管理有限公司', '21', '0', '5', 'logo/logo.jpg', '<p style=\"text-indent: 28px;\"><span style=\"font-family:;\">清大益讯系一家由清华大学校友办发起，近50名清华大学EMBA校友共同出资组建的中国场外市场综合服务集团化公司，秉承以北京为管理中心、上海为运营中心并逐步辐射全国乃至全球的发展战略，分别在安徽、广东、吉林、浙江、江苏、福建、山东、宁夏、贵州、哈尔滨、四川及重庆等全国主要省市分设了10余家全资子公司，且在中国台湾、香港设有办事处，现由近百名曾任职毕马威、普华、德勤、安永四大国际会所资深主管和美国邓白氏、IDG等国际金融集团的清华、交大名校硕博士组成。</span></p><p style=\"text-indent: 28px;\"><span style=\"font-family:;\">清大益讯致力于为中小企业对接资本市场牵线搭桥，为数十个中国场外OTC市场提供挂牌推荐金融服务，如今已帮助八十余家企业成功挂牌，并成功筹资3亿多元的中国场外市场基金并购重组和投融资管理业务，同时从事以发布中国场外市场指数为代表的大数据研究与开发业务。清大益讯已经成为上海、安徽股交中心挂牌数量最多、最佳推荐机构，并与宁夏经信委、贵州省中小企业局、吉林国资委、海南金融办签订了战略合作协议，协助当地政府服务全中国，在业内树立了良好的品牌。</span></p><p><br/></p><p>企业官网：<a href=\"http://www.qinghuainvest.com\"><a href=\"http://www.qinghuainvest.com/\">http://www.qinghuainvest.com/</a></a></p><p></p>'), ('5', '上海辛葵科技股份有限公司', '7', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('6', '上海辛葵科技股份有限公司', '3', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('7', '侨园养老', '21', '0', '0', 'logo/9.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('8', '任远环保', '1', '0', '0', 'logo/7.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('9', '迪纳声', '2', '3', '1', 'logo/6.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('10', '金地', '4', '0', '0', 'logo/5.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('11', '贝得美科技', '6', '0', '0', 'logo/4.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('12', '幸福家园', '1', '0', '2', 'logo/2.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('13', '上海辛葵科技股份有限公司', '7', '0', '0', 'logo/1_3.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('14', '上海瀚宣文化传播股份有限公司', '21', '0', '1', 'logo/Haohan.jpg', '<p><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;瀚宣传播（Ad-Focus），成立于2009年6月，是一家以数字化创新媒体及商业解决方案的整合营销公司。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">公司拥有一支强大资深团队，服务于众多知名品牌客户，在直客领域、国际4A领域、传统的媒介领域公关公司领域以及广告媒介领域都有过丰富的服务经验。秉承着“执行为重，策略兼创新为先”的原则。通过多年的积累，在数字营销的时代标新立异，已跨入互动品牌营销与社交营销领域专业服务公司第一阵营，并为很多品牌商获得了多项奖项。公司主要专注于企业品牌数字整合策略、社交营销策略、创意策略服务、社交媒体托管、社会化电商、O2O策略及社会化CRM营销软件开发、品牌内容策略服务、精准广告代理、网络公关等领域，帮助品牌商在社交媒体及数字媒体的发展大浪中提供更专业贴心的服务，为品牌商在数字化的世界里建立更好的品牌形象及声誉。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;</span><span style=\"font-family:;\"><a href=\"http://www.ad-focus.cn/\"><span style=\"padding: 0px; border: 1px windowtext; border-image: none; color: rgb(64, 64, 64);\">www.ad-focus.cn</span></a></span></p><p></p>'), ('15', '上海公兴国际物流股份有限公司', '8', '0', '0', 'logo/Gongxing.jpg', '<p><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公兴物流主要为目标客户提供针对性的物流解决方案，经营范围包括：普通货运、国际货物代理、仓储、装卸、物流信息咨询等，公司主营业务为普通货物运输服务与装卸服务。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">公司成立于2010年6月1日，并于2013年通过了ISO9001（2008版）中国质量管理体系认证。在成立之初，公司就坚持“服务创造价值”的理念，以服务客户为己任，追求安全、高效、及时、认真的服务宗旨，并探索出一套严格的管理制度和高效、合理的物流运作程序，让客户省心、放心。在3年多的发展过程中，公司十分注重服务能力、服务水平及服务质量的不断提高，目前已形成了一定的品牌效应，并与上海烟草集团有限公司等大型客户建立了稳定的合作关系。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">公司控股母公司为上海公兴搬场物流有限公司，母公司主要经营居民、企事业单位搬场，小件快运，都市物流配送，集装箱运输，化工运输等项目。一方面，母公司通过诚信的服务，过硬的质量，良好的形象，受到了各界的一致肯定，并创立了“公兴”这一品牌，这一品牌将促进物流市场对本公司服务的接纳度与认可度；另一方面，母公司经营的业务广泛，具有丰富的业内经验，可以为本公司开拓市场，拓宽收入渠道提供必要的帮助。从2011年下半年开始，母公司与上海烟草集团有限公司的业务转入本公司，并预计从2014年开始，再将与DHL合作的相关业务转入本公司，这将进一步扩大公司的业务规模，增强公司的竞争优势，实现公司的长足发展。</span></p><p><span style=\"font-family:;\"><a href=\"http://12674771.czvv.com/\"><span style=\"color: rgb(0, 0, 255);\">http://12674771.czvv.com/</span></a></span></p><p></p>'), ('16', '上海茂霖高分子科技股份有限公司', '20', '0', '0', 'logo/Maolin.jpg', '<p><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;茂霖高科的前身为上海语际包装制品有限公司，成立于2009年11月，原从事包装材料销售。2013年5月，上海欣展橡胶有限公司收购了语际包装，将上海欣展已成熟运营的胶辊业务注入语际包装，随后将其更名为“上海茂霖高分子科技有限公司”。公司目前主要从事橡胶制品，橡胶材料及酚醛树脂材料的技术开发和产品研发，销售橡胶制品，主要产品为半导电胶辊。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">上海欣展在橡胶制品领域已有多年发展经验，于1995年由台湾进入大陆市场，因拥有台湾橡胶领域权威的化学专家，在橡胶制品研发方面具备较强的优势，有新型橡胶材料和光电鼠标滚球、滚轴、阀座和胶辊等众多产品。1999年，上海欣展成为世界最大的鼠标球供应商，高峰时期一度占全球85%的鼠标球产量。后由于科技进步，机械鼠标被光电鼠标所替代，公司进行转型发展，实现技术转移，作为激光打印机耗材的印刷胶辊就是上海欣展转型后的主要产品之一。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">上海欣展在经过5年的研发后成功开发出了半导电橡胶材料，将其用于生产导电胶辊，目前产品从性价比角度已经超越日、韩竞争对手，具备进入北美市场的能力，但尚缺乏扩大产能的资金，因此将胶辊业务注入茂霖高科,计划通过进入上海股交中心挂牌融资来扩大产能，以提高市场占有率，逐步打造国内最大的显影辊、充电辊生产基地，同时应对很可能即将快速增长的国际订单。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">茂霖高科目前接受了上海欣展胶辊业务的全部专利和大部分生产能力，生产导电胶辊的关键环节目前由茂霖高科委托上海欣展持有60%股权的淮安欣展加工。未来茂霖高科计划于上海股交中心挂牌后进行融资，以便收购淮安欣展的全部股权（包括上海欣展持有的60%股权和外资持有的40%股权），随后再在珠海建立一个更靠近珠三角市场的生产基地，在此产能保障的基础上积极开拓国际市场业务。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;</span><span style=\"font-family:;\"><a href=\"http://www.shmltech.com/\"><span style=\"padding: 0px; border: 1px windowtext; border-image: none; color: rgb(64, 64, 64);\">http://www.shmltech.com</span></a></span></p><p></p>'), ('17', '联鼎软件', '2', '0', '0', 'logo/1_2.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">联鼎软件</span></p>'), ('18', '江苏伯克生物医药股份有限公司', '6', '0', '0', 'logo/Berkgen.jpg', '<p><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏伯克生物医药股份有限公司由“千人计划”特聘专家王飞博士于2010年6月创办，2013年11月17日完成股改成立股份公司，注册资本9259万元人民币，专注于创新药物、医疗器械、功能食品和食品安全四个领域中产品的研究、生产及销售。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">项目研发管理团队总人数48人，博士8位，硕士7位，本科24人。核心团队人员8位，其中6位海外高层次留学人才，2位国家“千人计划”特聘专家，1位已获得国家“青年千人计划”；团队技术全面，在管理、技术产业化和市场方面的经验优势充分互补。公司还与江南大学、扬州大学、天津医科大学、国家疾病预防控制中心职业病防治研究院、美国加州大学伯克利分校等国内外多所科研院所具有科研合作。在王飞博士的带领下公司团队获得江苏省首批培育“100家科技创新团队”、国务院侨办“重点华侨华人创业团队”等。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">目前公司正在开发的三个创新药物项目进展顺利，有2个已获得国家“十一五”新药创制重大专项的项目。已获各类国家和地方人才与科研项目经费1400万元，地方政府间接支持3000万元。同时有很好的融资渠道。公司将立足于国内市场并积极开拓国际市场，以成长为世界一流的生物医药企业作为长远发展的战略目标。</span></p><p><span style=\"font-family:;\"><a href=\"http://www.berkgen.com/\"><span style=\"padding: 0px; border: 1px windowtext; border-image: none;\"><span style=\"color: rgb(0, 0, 255);\">http://www.berkgen.com/</span></span></a></span></p>'), ('19', '南通新帝克单丝科技股份有限公司', '20', '0', '0', 'logo/Ntec.jpg', '<p><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;南通新帝克单丝科技股份有限公司是一家专业从事大直径特种聚合物单丝研发、生产、销售的高科技企业，注册资本1618万元。公司是国家高新技术企业、江苏省创新型企业、江苏民营科技企业、南通市“蹬羚”企业。公司占地面积4万平方米，建筑面积3万平方米，从韩国、德国、台湾地区引进纺丝及后加工生产线51条，产品包括聚酯类（PET、PBT）、聚烯烃类(PE、PP)、聚酰胺类（PA6、PA12、PA66、PA1010）、功能类（阻燃、抗静电、抗UV、抗菌）、高性能类(PPS、PVDF、PEI、PEEK)、钓鱼线类（休闲、竞技、海钓）、割草线（经济、商业、专业级）、球线类（网球线、羽线），年生产能力达8000吨，应用领域包括工业滤布、筛网、绝缘编织网管、运输带材、装饰“3D”织物等，产品热销江苏、上海、浙江、福建、广东、天津等地，同时出口欧美、日本、中东及东南亚等国家。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">公司始终坚持以“科技创新”为立业基础，不断加大科技研发投入，成立了南通市特种单丝工程科技研究中心，中心现拥有6台套大直径单丝专用研发设备，与南通大学等高校建立了产学研合作关系。已承担国家、省（部）、市科技项目12项，拥有34项专利。公司子公司南通金虹环保科技有限公司专业从事环保单丝产品的研发，子公司南通特种纤维有限公司专业从事特殊功能单丝产品的研发。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">未来，公司将继续坚持以科技为企业发展的主要动力，扩大生产规模，立志成为国内单丝产品专家。</span></p><p><span style=\"font-family:;\"><a href=\"http://www.jsntec.net/\"><span style=\"padding: 0px; border: 1px windowtext; border-image: none;\"><span style=\"color: rgb(0, 0, 255);\">http://www.jsntec.net/</span></span></a></span></p><p></p>'), ('20', '海南主健医学股份有限公司', '6', '0', '1', 'logo/Zhujian.jpg', '<p style=\"text-indent: 28px;\"><span style=\"color: black; font-family:;\">海南主健医学股份有限公司</span><span style=\"font-family:;\">（股份代码：100052，股份简称：主健医学）<span style=\"color: black;\">是我国分子医学技术应用于临床实践的倡导者，</span>专注于分子遗传医学检验的临床应用与干预技术的研发、技术服务，是我国出生缺陷筛查与干预领域的领军企业。公司经过多年发展，通过不断的技术创新、服务创新和市场模式创新，不仅可以向全国各级医疗、妇幼保健和计生服务机构提供丰富的分子医学技术、数据库、干预方法等全方位的服务，还可向其提供相关技术培训、科研、信息系统和生物样本数据库建设等一系列技术支持。</span></p><p><span style=\"color: black; font-family:;\">公司</span><span style=\"font-family:;\">主营业务“妇幼分子遗传医学检验项目”，是在科技部重大公关项目科研成果的基础上，经自主研发形成的拥有技术专利和知识产权的分子医学临床服务项目。它通过对人类遗传标记物（DNA）的检测，依托大型生物数据库对检测数据进行分析，为妇幼常见病、多发病的早期筛查、早期干预、早期诊断和早期治疗提供临床技术服务。</span></p><p><span style=\"color: black; font-family:;\">主健医学的产品与服务面向我国妇幼领域、面向每个家庭，提供优质、迅速、贴近的分子遗传医学检验和个性化医疗保健服务，贯彻和实践国家“降低出生缺陷、提高出生质量，提升全民健康素质”的公共卫生政策。“让家家都有健康的孩子”是主健医学及全体员工的共同理想与使命，也是企业的核心精神与经营理念。</span></p><p><span style=\"color: black; font-family:;\">主健医学成立以来，遵循“边科研、边验证、边生产、边服务、边实现经济回报，以实现的经营回报反哺科研”的创新经营理念，以“跨行业、跨部门、跨组织、跨区域、跨学科”的形式，汇集优势资源，</span><span style=\"font-family:;\">支持<span style=\"color: black;\">妇幼保健分子遗传医学研究计划，实现分子医学科技成果在妇幼保健领域规模化、集约化的转化应用，促进了分子医学技术在妇幼保健领域的普及与提升。主健医学依靠前期技术领先取得的稳步发展，完成了</span>技术、品牌、人才积累和项目产品的产业化布局，构建了能够持续激发技术创新动力并转化成为成果的研发模式，成为公司在妇幼分子遗传医学检验技术服务领域保持领先优势的重要保障。</span></p><p><span style=\"font-family:;\">公司全资拥有的海南主健细胞分子遗传医学检验中心是我国首家专注于细胞分子遗传临床医学检验的专业医疗机构，经批准设立了海南地中海贫血筛查诊断技术服务中心和司法鉴定所，承担着国家妇幼保健中心出生缺陷干预预防和<span style=\"color: black;\">海南省人口计生委南方严重遗传性疾病“地中海贫血”分子诊断的技术服务工作。</span></span></p><p><span style=\"color: black; font-family:;\">公司全资机构上海恒健生物技术有限公</span><span style=\"font-family:;\">司作为主健医学的研发技术中心，为“妇幼分子遗传医学检验项目”通过医学检验数据分析与医学检验报告的技术支持，并承担项目的研发、培训、信息系统建设等工作。</span></p><p><span style=\"color: black; font-family:;\">公司出资建立海南主健分子医学研究所</span><span style=\"font-family:;\">是海南省科技厅主管下的专业研究机构，是一个社会开放式的研究平台，通过聘请国内外的专家学者，及与国内外的临床机构和科研院所建立广泛的横向合作，开展专项研究。</span></p><p><span style=\"color: black; font-family:;\">公司在北京设立了全资机构</span><span style=\"font-family:;\">主健（北京）生物科技有限公司，主要承担“妇幼分子遗传医学检验项目”项目的交流与推广工作。</span></p><p><span style=\"font-family:;\"><a href=\"http://www.zhujianyixue.com/\"><span style=\"color: windowtext; text-underline: none;\">http://www.zhujianyixue.com</span></a></span></p><p><span style=\"font-family:;\">&nbsp;</span></p><p>&nbsp;</p>'), ('21', '上海育生堂母婴护理服务股份有限公司', '21', '0', '0', 'logo/yushengtang.jpg', '<p><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;&nbsp;&nbsp;&nbsp;上海育生堂母婴护理服务股份有限公司的前身为上海育生堂母婴护理服务有限公司，总部位于上海，于2012年3月14日成立。公司专业从事母婴护理服务，拥有先进的产后护理仪器和独家的育生堂药膳秘方。公司主要是为孕产妇和新生婴儿提供护理服务，从饮食、清洁、保养等多个方面对其进行护理，为处于脆弱期的他们提供健康、舒适和安静的休养环境，更为其提供健康产后恢复的条件。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">“育生堂”字号始于清朝，原为医科学堂及诊断开方药堂，创办人为当时安徽地区著名妇科医生杨维纲，后其子杨有成在杨维纲从医经验基础上汇编了以妇科、外科药方为主的《经验良方》一书。公司实际控制人之一的杨峰先生为育生堂当代传人，杨峰先生在家传药方的基础上进行市场化开发，创办了上海育生堂母婴护理服务有限公司。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">公司下设无锡分公司及其门店，位于无锡市中心京杭大运河畔的酒店式公寓内，环境优雅，拥有38张床位，30多位员工，同时可为38对母婴提供服务。主要提供月子处方、月子养生药膳、瑜伽疗愈、启智早教和24小时不间断看护等专业特色服务，为城市高端产妇和新生儿提供全方位的护理服务。</span></p><p><span style=\"color: rgb(64, 64, 64); font-family:;\">公司目前处于发展初期，主要专注于开发母婴护理服务这一细分市场，将主要精力放在如何为产后妈妈以及新生儿提供更优质、更贴合实际需要的服务上，以高质量、标准化、专业化的服务赢得市场口碑、建立品牌知名度，成为月子护理产业领域的知名服务提供商。</span></p><p><span style=\"font-family:;\"><a href=\"http://www.yst1890.com/\"><span style=\"padding: 0px; border: 1px windowtext; border-image: none; color: rgb(64, 64, 64);\">www.yst1890.com</span></a></span></p><p></p>'), ('22', '上海长翊科技股份有限公司', '20', '0', '0', 'logo/changyi.jpg', '<p><span style=\"color: black; font-family:;\">&nbsp;&nbsp;&nbsp;&nbsp;上海长翊科技股份有限公司成立于2012年4月，注册资本3000万元，总部位于中国上海徐家汇，是一家集研发、生产、销售的高科技股份制企业。</span></p><p><span style=\"color: black; font-family:;\">公司管理层具有多年在世界500强公司的管理和研发经验，90%为本科及以上学历，其中持有博士学位者三人。公司主要致力于金属离子吸附与分离材料的研究开发、生产、应用，特别是金属镓等稀贵金属的树脂提取技术和工艺流程、设备的研究。经生产实践证明具有技术新、成本低、效率高的特点，获得用户一致认同。同时，公司进一步深化金属镓深加工，扩展镓应用市场的广度和深度；公司研发中心设在上海，由富有研发经验的技术团队组成，并得到当地政府产业政策倾斜和支持；公司与华东理工大学等科研院校广泛合作，共同进行新产品、新技术的前沿开发。</span></p><p><span style=\"color: black; font-family:;\">公司以符合国家倡导的高效利用、清洁生产、循环经济等产业方针为宗旨，立足于国家的产业振兴计划和节能减排的发展思路，分别在河南等地设有生产工厂，配置先进的生产、检测设备，健全的质量保证体系，为实验室研发成果到工业生产应用提供了可靠保障。</span><span style=\"color: rgb(64, 64, 64); font-family:;\">&nbsp;</span></p><p><span style=\"color: black; font-family:;\">http://www.scyid.com</span></p><p></p>'), ('23', '上海华龙测试仪器股份有限公司', '20', '0', '0', 'logo/Hualong.jpg', '<p style=\"text-indent: 28px;\"><span style=\"font-family:;\">上海华龙测试仪器股份有限公司组建于1993年11月30日，是智能化、数字化、自动化高端试验机产品研制基地，是国家批准授权的“中华人民共和国进出口企业”。公司通过&nbsp;ISO9001中国和美国国际质量体系认证。2000年被上海市政府认定批准为“上海市高新技术企业”。2007年公司研发中心被浦东新区人民政府认定批准为“浦东新区企业技术开发机构”和2004-2006年“浦东新区先进集体”，被上海市政府授予2004-2006年度“上海市劳模集体”，2007年公司被浦东新区人民政府考评认定为“浦东新区科技创新基地”。2008年按国务院高新技术企业评定条例，复评认定批准为“国家高新技术企业”。2010年被浦东新区人民政府命名为“浦东新区小巨人企业”。</span></p><p><span style=\"font-family:;\">公司坐落于上海浦东新区川沙经济园区，企业占地23500㎡，建筑面积19800㎡，具有综合办公楼、科研办公楼、电装调试楼、总装车间、重机车间、机加车间、下料车间、喷漆车间、冷作车间、计量室、产品展厅等生产和办公设施。公司拥有大型数控镗铣床、微控线切割、龙门刨、龙门铣、龙门磨、立车、数控铣床、卧式数控车床等各类精密加工设备和检测设备386台套。企业年产试验机生产能力可达1500余台。</span></p><p><span style=\"font-family:;\">公司创建20年来，研发完成89大系列960余个品种的试验机，先后有五大系列产品荣获“上海市重点新产品”和“上海市自主创新产品”，两大系列产品荣获“国家重点新产品”，十二大系列产品被市科委评定为“上海市高新技术成果转化项目”。公司研发的所有产品均具独立自主知识产权，拥有76项“中华人民共和国专利”。在提高产品质量，提升品牌价值的同时，注重工艺设计?提高标准化、系列化、规范化，将产品研制生产的全过程纳入ISO9001质量体系，全面进行受控管理。</span></p><p><span style=\"font-family:;\">公司产品广泛应用于航空航天、国防军工、机械制造、车辆船舶、钢铁冶金、电线电缆、塑料橡胶、建筑建材、大专院校、科研院所、商检质检等国民经济各领域，对各类金属、非金属、构件、成品、新材料的各项物理力学性能测试、分析和研究。公司产品遍布国内各省区，并远销美国、加拿大、巴西、德国、西班牙、日本、韩国、巴基斯坦、马来西亚、南非、安哥拉、墨西哥等国际市场。</span></p><p><span style=\"font-family:;\">公司将竭诚为国内外客户，为世界计量检测工作的发展，做出新的贡献。</span></p><p><span style=\"font-family:;\">&nbsp;公司官网：</span><span style=\"font-family:;\">&nbsp;<a href=\"http://www.hualong.net/\"><span style=\"color: blue; text-underline: none;\">www.hualong.net</span></a></span></p><p></p>'), ('24', '测试企业', '3', '0', '1', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p><p style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 0); font-size: 18px;\"><img src=\"/media/ueditor/images/logo_20141118164026_242.png\" title=\"\" alt=\"logo.png\"/> </span></p>');
COMMIT;

-- ----------------------------
--  Table structure for `qdvote_industry`
-- ----------------------------
DROP TABLE IF EXISTS `qdvote_industry`;
CREATE TABLE `qdvote_industry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qdvote_industry`
-- ----------------------------
BEGIN;
INSERT INTO `qdvote_industry` VALUES ('1', '环保', '0'), ('2', '信息技术和服务', '1'), ('3', '电子商务', '2'), ('4', '建筑', '4'), ('5', '食品安全', '5'), ('6', '医药健康', '6'), ('7', '农业', '7'), ('8', '物流', '8'), ('21', '社会服务业', '9'), ('20', '制造业', '10');
COMMIT;

-- ----------------------------
--  Table structure for `qdvote_judge`
-- ----------------------------
DROP TABLE IF EXISTS `qdvote_judge`;
CREATE TABLE `qdvote_judge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `company` varchar(50) NOT NULL,
  `position` varchar(200) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qdvote_judge`
-- ----------------------------
BEGIN;
INSERT INTO `qdvote_judge` VALUES ('1', '朱丽叶', 'avatar/a1.jpg', '哈尔滨工程大学', '公寓楼阿姨', '1'), ('2', '罗密欧', 'avatar/a2.jpg', '哈尔滨工程大学', '创始合伙人、董事总经理', '2'), ('3', '亚历山大', 'avatar/a3.jpg', '华山资本投资管理公司', '创始合伙人、董事总经理', '3'), ('4', '伊丽莎白', 'avatar/a4.jpg', '英格兰国王亨利七世的王后', '大不列颠及北爱尔兰联合王国与其属土及领地之女王，伊丽莎白二世', '4');
COMMIT;

-- ----------------------------
--  Table structure for `qdvote_randomcode`
-- ----------------------------
DROP TABLE IF EXISTS `qdvote_randomcode`;
CREATE TABLE `qdvote_randomcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  `time` datetime NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qdvote_randomcode`
-- ----------------------------
BEGIN;
INSERT INTO `qdvote_randomcode` VALUES ('3', '13136652521', '391406', '2014-11-25 22:07:00', '3'), ('4', '13836030532', '139275', '2014-11-18 16:48:32', '1'), ('5', '14532345678', '102469', '2014-11-18 16:50:34', '1'), ('6', '11111111111', '534189', '2014-11-18 21:56:18', '1'), ('7', '13136686521', '279064', '2014-11-20 19:34:03', '3'), ('8', '15601622688', '189635', '2014-11-20 13:01:18', '1'), ('9', '18646373437', '136927', '2014-11-20 17:21:32', '1'), ('10', '13681349597', '642310', '2014-11-24 08:56:41', '1'), ('11', '18917609206', '956128', '2014-11-26 09:43:50', '1');
COMMIT;

-- ----------------------------
--  Table structure for `qdvote_votephone`
-- ----------------------------
DROP TABLE IF EXISTS `qdvote_votephone`;
CREATE TABLE `qdvote_votephone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL,
  `time` datetime NOT NULL,
  `company_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tel` (`tel`),
  KEY `qdvote_votephone_0316dde1` (`company_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qdvote_votephone`
-- ----------------------------
BEGIN;
INSERT INTO `qdvote_votephone` VALUES ('11', '13136686521', '2014-11-20 19:35:14', '4'), ('7', '13836030532', '2014-11-18 16:49:25', '9'), ('12', '13681349597', '2014-11-24 08:57:20', '14'), ('9', '15601622688', '2014-11-20 13:01:34', '12'), ('10', '18646373437', '2014-11-20 17:22:01', '12'), ('13', '18917609206', '2014-11-26 09:44:40', '4');
COMMIT;

-- ----------------------------
--  Table structure for `reversion_revision`
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_slug` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_86395673` (`manager_slug`),
  KEY `reversion_revision_816e0180` (`date_created`),
  KEY `reversion_revision_6340c63c` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `reversion_version`
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) NOT NULL,
  `object_id` longtext NOT NULL,
  `object_id_int` int(11) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_version_0c5c14b2` (`revision_id`),
  KEY `reversion_version_33b489b4` (`object_id_int`),
  KEY `reversion_version_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url_name` varchar(64) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `xadmin_usersettings`
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_usersettings` VALUES ('1', '1', 'dashboard:home:pos', ''), ('2', '2', 'dashboard:home:pos', '');
COMMIT;

-- ----------------------------
--  Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
