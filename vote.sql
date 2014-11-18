/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50163
 Source Host           : localhost
 Source Database       : vote

 Target Server Version : 50163
 File Encoding         : utf-8

 Date: 11/18/2014 16:23:49 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_user`
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$12000$D1TE4sfBSTNo$9JHbAsT9JUxX+4Ke14D25NfOLFNnD9hk2+6gKncAk4I=', '2014-11-17 23:12:57', '1', 'admin', '', '', '', '1', '1', '2014-11-13 14:49:40');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
INSERT INTO `django_session` VALUES ('foptyit5ylfv1d5yaxnqdkhrww0jb21f', 'OGY4MGEwYTlhMmI0NGY5NzgyODdkYjMwZjY4NWY0NTgyOTAyMjgxMzp7IkxJU1RfUVVFUlkiOltbInFkdm90ZSIsImNvbXBhbnkiXSwiIl0sIl9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJcXHU4ODRjXFx1NGUxYSBcXFwiPGEgY2xhc3M9J2FsZXJ0LWxpbmsnIGhyZWY9Jy9hZG1pbi9xZHZvdGUvaW5kdXN0cnkvNy91cGRhdGUvJz5cXHU1MTljXFx1NGUxYTwvYT5cXFwiIFxcdTZkZmJcXHU1MmEwXFx1NjIxMFxcdTUyOWZcXHUzMDAyIFxcdTRmNjBcXHU1M2VmXFx1NGVlNVxcdTU3MjhcXHU0ZTBiXFx1OTc2MlxcdTU4OWVcXHU1MmEwXFx1NTNlNlxcdTRlMDBcXHU0ZTJhIFxcdTg4NGNcXHU0ZTFhIFxcdTMwMDJcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiXFx1ODg0Y1xcdTRlMWEgXFxcIjxhIGNsYXNzPSdhbGVydC1saW5rJyBocmVmPScvYWRtaW4vcWR2b3RlL2luZHVzdHJ5LzgvdXBkYXRlLyc+XFx1NzI2OVxcdTZkNDE8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTRmMDFcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9jb21wYW55LzEvdXBkYXRlLyc+XFx1NGUwYVxcdTZkNzdcXHU4ZjliXFx1ODQ3NVxcdTc5ZDFcXHU2MjgwXFx1ODBhMVxcdTRlZmRcXHU2NzA5XFx1OTY1MFxcdTUxNmNcXHU1M2Y4PC9hPlxcXCIgXFx1NmRmYlxcdTUyYTBcXHU2MjEwXFx1NTI5ZlxcdTMwMDJcIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiXFx1NGYwMVxcdTRlMWEgXFxcIlxcdTRlMGFcXHU2ZDc3XFx1OGY5YlxcdTg0NzVcXHU3OWQxXFx1NjI4MFxcdTgwYTFcXHU0ZWZkXFx1NjcwOVxcdTk2NTBcXHU1MTZjXFx1NTNmOFxcXCIgXFx1NGZlZVxcdTY1MzlcXHU2MjEwXFx1NTI5ZlxcdTMwMDJcIl1dIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==', '2014-12-01 21:29:38'), ('v7wsacojpdbt0obskuev4vwttrvyduqi', 'YTZiMDJkYWQ0Mzg2ZTI0M2YwODgwNThjMzdkNjQ0ZTZiZWE5MzQ3MTp7IkxJU1RfUVVFUlkiOltbInFkdm90ZSIsImp1ZGdlIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2014-11-27 22:06:23'), ('j1a4p0lbbso3g8lnnkqzio7qapx8b2lt', 'MmY1YWYxYjMyZmE4ZjI0ZjA2Yzg1MzIzNjIyNjFmNmY4OTA5MDE2NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sicWR2b3RlIiwicmFuZG9tY29kZSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6MSwiX21lc3NhZ2VzIjoiW1tcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xMC91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTI8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xMS91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTM8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xMi91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTQ8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xMy91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTU8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xNC91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTY8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xNS91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTc8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xNi91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTg8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xNy91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTk8L2E+XFxcIiBcXHU2ZGZiXFx1NTJhMFxcdTYyMTBcXHU1MjlmXFx1MzAwMiBcXHU0ZjYwXFx1NTNlZlxcdTRlZTVcXHU1NzI4XFx1NGUwYlxcdTk3NjJcXHU1ODllXFx1NTJhMFxcdTUzZTZcXHU0ZTAwXFx1NGUyYSBcXHU4ODRjXFx1NGUxYSBcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTg4NGNcXHU0ZTFhIFxcXCI8YSBjbGFzcz0nYWxlcnQtbGluaycgaHJlZj0nL2FkbWluL3Fkdm90ZS9pbmR1c3RyeS8xOC91cGRhdGUvJz5cXHU2ZDRiXFx1OGJkNTEwPC9hPlxcXCIgXFx1NmRmYlxcdTUyYTBcXHU2MjEwXFx1NTI5ZlxcdTMwMDIgXFx1NGY2MFxcdTUzZWZcXHU0ZWU1XFx1NTcyOFxcdTRlMGJcXHU5NzYyXFx1NTg5ZVxcdTUyYTBcXHU1M2U2XFx1NGUwMFxcdTRlMmEgXFx1ODg0Y1xcdTRlMWEgXFx1MzAwMlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJcXHU4ODRjXFx1NGUxYSBcXFwiPGEgY2xhc3M9J2FsZXJ0LWxpbmsnIGhyZWY9Jy9hZG1pbi9xZHZvdGUvaW5kdXN0cnkvMTkvdXBkYXRlLyc+XFx1NmQ0YlxcdThiZDUxMTwvYT5cXFwiIFxcdTZkZmJcXHU1MmEwXFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTRmMDFcXHU0ZTFhIFxcXCJcXHU0ZTBhXFx1NmQ3N1xcdThmOWJcXHU4NDc1XFx1NzlkMVxcdTYyODBcXHU4MGExXFx1NGVmZFxcdTY3MDlcXHU5NjUwXFx1NTE2Y1xcdTUzZjhcXFwiIFxcdTRmZWVcXHU2NTM5XFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTlhOGNcXHU4YmMxXFx1NzgwMSBcXFwiMTg2NDYzNzM0MzdcXFwiIFxcdTRmZWVcXHU2NTM5XFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTlhOGNcXHU4YmMxXFx1NzgwMSBcXFwiMTMxMzY2NTI1MjFcXFwiIFxcdTRmZWVcXHU2NTM5XFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTlhOGNcXHU4YmMxXFx1NzgwMSBcXFwiMTMxMzY2NTI1MjFcXFwiIFxcdTRmZWVcXHU2NTM5XFx1NjIxMFxcdTUyOWZcXHUzMDAyXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTYyMTBcXHU1MjlmXFx1NTIyMFxcdTk2NjRcXHU0ZTg2IDEgXFx1NGUyYSBcXHU2Mjk1XFx1Nzk2OFxcdThiYjBcXHU1ZjU1XCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTYyMTBcXHU1MjlmXFx1NTIyMFxcdTk2NjRcXHU0ZTg2IDEgXFx1NGUyYSBcXHU2Mjk1XFx1Nzk2OFxcdThiYjBcXHU1ZjU1XCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlxcdTYyMTBcXHU1MjlmXFx1NTIyMFxcdTk2NjRcXHU0ZTg2IDEgXFx1NGUyYSBcXHU2Mjk1XFx1Nzk2OFxcdThiYjBcXHU1ZjU1XCJdXSJ9', '2014-12-02 16:21:52');
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
INSERT INTO `qdvote_company` VALUES ('1', '上海辛葵科技股份有限公司', '5', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('2', '上海辛葵科技股份有限公司', '3', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('3', '上海辛葵科技股份有限公司', '3', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('4', '上海辛葵科技股份有限公司', '1', '0', '1', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('5', '上海辛葵科技股份有限公司', '7', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('6', '上海辛葵科技股份有限公司', '3', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('7', '上海辛葵科技股份有限公司', '2', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('8', '上海辛葵科技股份有限公司', '3', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('9', '上海辛葵科技股份有限公司', '2', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('10', '上海辛葵科技股份有限公司', '4', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('11', '上海辛葵科技股份有限公司', '6', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('12', '上海辛葵科技股份有限公司', '1', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('13', '上海辛葵科技股份有限公司', '7', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('14', '上海辛葵科技股份有限公司', '2', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('15', '上海辛葵科技股份有限公司', '8', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('16', '上海辛葵科技股份有限公司', '6', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('17', '上海辛葵科技股份有限公司', '6', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('18', '上海辛葵科技股份有限公司', '5', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('19', '上海辛葵科技股份有限公司', '2', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('20', '上海辛葵科技股份有限公司', '1', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('21', '上海辛葵科技股份有限公司', '3', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('22', '上海辛葵科技股份有限公司', '7', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('23', '上海辛葵科技股份有限公司', '4', '0', '0', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>'), ('24', '上海辛葵科技股份有限公司', '3', '0', '1', 'logo/logo.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-size: 18px;\">&nbsp;上海辛葵科技股份有限公司（以下简称“辛葵”、“公司”）成立于2007年4月26日，注册资本783万元人民币。公司专注于建筑节能领域，具备建筑保温施工资质、专业的施工队伍和专业化保温项目管理体系。针对国内不同地区建筑节能的达标要求及客户需求，设计制定专业的建筑节能方案。上海辛葵科技股份有限公司为了更好的扩大业务范围，把握市场机遇，有效整合社会各界资源，拟充分利用某的盛誉和我公司卓越的技术和管理优势，本着互惠互利的原则，吸引其他有意向的投资家共同成立上海辛葵子公司，并且作为独立核算、自负盈亏的公司开展气凝胶项目的研发和市场拓展业务。</span></p>');
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qdvote_industry`
-- ----------------------------
BEGIN;
INSERT INTO `qdvote_industry` VALUES ('1', '环保', '0'), ('2', 'IT', '1'), ('3', '电子商务', '2'), ('4', '建筑', '4'), ('5', '食品安全', '5'), ('6', '医药健康', '6'), ('7', '农业', '7'), ('8', '物流', '8'), ('9', '测试1', '10'), ('10', '测试2', '21'), ('11', '测试3', '23'), ('12', '测试4', '24'), ('13', '测试5', '25'), ('14', '测试6', '26'), ('15', '测试7', '27'), ('16', '测试8', '28'), ('17', '测试9', '29'), ('18', '测试10', '30'), ('19', '测试11', '31');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qdvote_randomcode`
-- ----------------------------
BEGIN;
INSERT INTO `qdvote_randomcode` VALUES ('1', '13136652521', '725816', '2014-11-18 16:18:15', '4'), ('2', '18646373437', '098163', '2014-11-18 15:55:04', '3');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `qdvote_votephone`
-- ----------------------------
BEGIN;
INSERT INTO `qdvote_votephone` VALUES ('4', '13136652521', '2014-11-18 16:21:57', '4');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `xadmin_usersettings`
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_usersettings` VALUES ('1', '1', 'dashboard:home:pos', '');
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
