/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : guns

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-06-26 23:10:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `num` int(11) DEFAULT NULL COMMENT '����',
  `pid` int(11) DEFAULT NULL COMMENT '������id',
  `pids` varchar(255) DEFAULT NULL COMMENT '����ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '���',
  `fullname` varchar(255) DEFAULT NULL COMMENT 'ȫ��',
  `tips` varchar(255) DEFAULT NULL COMMENT '��ʾ',
  `version` int(11) DEFAULT NULL COMMENT '�汾���ֹ��������ֶΣ�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='���ű�';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('24', '1', '0', '[0],', '�ܹ�˾', '�ܹ�˾', '', null);
INSERT INTO `sys_dept` VALUES ('25', '2', '24', '[0],[24],', '������', '������', '', null);
INSERT INTO `sys_dept` VALUES ('26', '3', '24', '[0],[24],', '��Ӫ��', '��Ӫ��', '', null);
INSERT INTO `sys_dept` VALUES ('27', '4', '24', '[0],[24],', 'ս�Բ�', 'ս�Բ�', '', null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '����id',
  `num` int(11) DEFAULT NULL COMMENT '����',
  `pid` int(11) DEFAULT NULL COMMENT '�����ֵ�',
  `name` varchar(255) DEFAULT NULL COMMENT '����',
  `tips` varchar(255) DEFAULT NULL COMMENT '��ʾ',
  `code` varchar(255) DEFAULT NULL COMMENT 'ֵ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='�ֵ��';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('50', '0', '0', '�Ա�', null, 'sys_sex');
INSERT INTO `sys_dict` VALUES ('51', '1', '50', '��', null, '1');
INSERT INTO `sys_dict` VALUES ('52', '2', '50', 'Ů', null, '2');
INSERT INTO `sys_dict` VALUES ('53', '0', '0', '״̬', null, 'sys_state');
INSERT INTO `sys_dict` VALUES ('54', '1', '53', '����', null, '1');
INSERT INTO `sys_dict` VALUES ('55', '2', '53', '����', null, '2');
INSERT INTO `sys_dict` VALUES ('56', '0', '0', '�˺�״̬', null, 'account_state');
INSERT INTO `sys_dict` VALUES ('57', '1', '56', '����', null, '1');
INSERT INTO `sys_dict` VALUES ('58', '2', '56', '����', null, '2');
INSERT INTO `sys_dict` VALUES ('59', '3', '56', '��ɾ��', null, '3');

-- ----------------------------
-- Table structure for sys_expense
-- ----------------------------
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE `sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '�������',
  `desc` varchar(255) DEFAULT '' COMMENT '����',
  `createtime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `state` int(11) DEFAULT NULL COMMENT '״̬: 1.���ύ  2:�����   3.���ͨ�� 4:����',
  `userid` int(11) DEFAULT NULL COMMENT '�û�id',
  `processId` varchar(255) DEFAULT NULL COMMENT '���̶���id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Records of sys_expense
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '����',
  `logname` varchar(255) DEFAULT NULL COMMENT '��־����',
  `userid` int(65) DEFAULT NULL COMMENT '����Աid',
  `createtime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `succeed` varchar(255) DEFAULT NULL COMMENT '�Ƿ�ִ�гɹ�',
  `message` text COMMENT '������Ϣ',
  `ip` varchar(255) DEFAULT NULL COMMENT '��¼ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='��¼��¼';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `code` varchar(255) DEFAULT NULL COMMENT '�˵����',
  `pcode` varchar(255) DEFAULT NULL COMMENT '�˵������',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '��ǰ�˵������и��˵����',
  `name` varchar(255) DEFAULT NULL COMMENT '�˵�����',
  `icon` varchar(255) DEFAULT NULL COMMENT '�˵�ͼ��',
  `url` varchar(255) DEFAULT NULL COMMENT 'url��ַ',
  `num` int(65) DEFAULT NULL COMMENT '�˵������',
  `levels` int(65) DEFAULT NULL COMMENT '�˵��㼶',
  `ismenu` int(11) DEFAULT NULL COMMENT '�Ƿ��ǲ˵���1����  0�����ǣ�',
  `tips` varchar(255) DEFAULT NULL COMMENT '��ע',
  `status` int(65) DEFAULT NULL COMMENT '�˵�״̬ :  1:����   0:������',
  `isopen` int(11) DEFAULT NULL COMMENT '�Ƿ��:    1:��   0:����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='�˵���';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('105', 'system', '0', '[0],', 'ϵͳ����', 'fa-user', '#', '4', '1', '1', null, '1', '1');
INSERT INTO `sys_menu` VALUES ('106', 'mgr', 'system', '[0],[system],', '�û�����', '', '/mgr', '1', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '����û�', null, '/mgr/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '�޸��û�', null, '/mgr/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', 'ɾ���û�', null, '/mgr/delete', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '��������', null, '/mgr/reset', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '�����û�', null, '/mgr/freeze', '5', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '��������û�', null, '/mgr/unfreeze', '6', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '�����ɫ', null, '/mgr/setRole', '7', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('114', 'role', 'system', '[0],[system],', '��ɫ����', null, '/role', '2', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '��ӽ�ɫ', null, '/role/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '�޸Ľ�ɫ', null, '/role/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', 'ɾ����ɫ', null, '/role/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '����Ȩ��', null, '/role/setAuthority', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('119', 'menu', 'system', '[0],[system],', '�˵�����', null, '/menu', '4', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '��Ӳ˵�', null, '/menu/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '�޸Ĳ˵�', null, '/menu/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', 'ɾ���˵�', null, '/menu/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('128', 'log', 'system', '[0],[system],', 'ҵ����־', null, '/log', '6', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('130', 'druid', 'system', '[0],[system],', '��ع���', null, '/druid', '7', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('131', 'dept', 'system', '[0],[system],', '���Ź���', null, '/dept', '3', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('132', 'dict', 'system', '[0],[system],', '�ֵ����', null, '/dict', '4', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('133', 'loginLog', 'system', '[0],[system],', '��¼��־', null, '/loginLog', '6', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '�����־', null, '/log/delLog', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '��Ӳ���', null, '/dept/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '�޸Ĳ���', null, '/dept/update', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', 'ɾ������', null, '/dept/delete', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '����ֵ�', null, '/dict/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '�޸��ֵ�', null, '/dict/update', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', 'ɾ���ֵ�', null, '/dict/delete', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('141', 'notice', 'system', '[0],[system],', '֪ͨ����', null, '/notice', '9', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '���֪ͨ', null, '/notice/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '�޸�֪ͨ', null, '/notice/update', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', 'ɾ��֪ͨ', null, '/notice/delete', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('145', 'hello', '0', '[0],', '֪ͨ', 'fa-rocket', '/notice/hello', '1', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('148', 'code', '0', '[0],', '��������', 'fa-code', '/code', '3', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('149', 'api_mgr', '0', '[0],', '�ӿ��ĵ�', 'fa-leaf', '/swagger-ui.html', '2', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '�˵��༭��ת', '', '/menu/menu_edit', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '�˵��б�', '', '/menu/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '�޸Ĳ�����ת', '', '/dept/dept_update', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '�����б�', '', '/dept/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '��������', '', '/dept/detail', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '�޸Ĳ˵���ת', '', '/dict/dict_edit', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '�ֵ��б�', '', '/dict/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '�ֵ�����', '', '/dict/detail', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('158', 'log_list', 'log', '[0],[system],[log],', '��־�б�', '', '/log/list', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '��־����', '', '/log/detail', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '��յ�¼��־', '', '/loginLog/delLoginLog', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '��¼��־�б�', '', '/loginLog/list', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '�޸Ľ�ɫ��ת', '', '/role/role_edit', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '��ɫ������ת', '', '/role/role_assign', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '��ɫ�б�', '', '/role/list', '7', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '�����ɫ��ת', '', '/mgr/role_assign', '8', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '�༭�û���ת', '', '/mgr/user_edit', '9', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '�û��б�', '', '/mgr/list', '10', '3', '0', null, '1', null);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `title` varchar(255) DEFAULT NULL COMMENT '����',
  `type` int(11) DEFAULT NULL COMMENT '����',
  `content` text COMMENT '����',
  `createtime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `creater` int(11) DEFAULT NULL COMMENT '������',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='֪ͨ��';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('6', '����', '10', '��ӭʹ��Guns����ϵͳ', '2017-01-11 08:53:20', '1');
INSERT INTO `sys_notice` VALUES ('8', '���', null, '���', '2017-05-10 19:28:57', '1');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '����',
  `logtype` varchar(255) DEFAULT NULL COMMENT '��־����',
  `logname` varchar(255) DEFAULT NULL COMMENT '��־����',
  `userid` int(65) DEFAULT NULL COMMENT '�û�id',
  `classname` varchar(255) DEFAULT NULL COMMENT '������',
  `method` text COMMENT '��������',
  `createtime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `succeed` varchar(255) DEFAULT NULL COMMENT '�Ƿ�ɹ�',
  `message` text COMMENT '��ע',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8 COMMENT='������־';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����',
  `menuid` bigint(11) DEFAULT NULL COMMENT '�˵�id',
  `roleid` int(11) DEFAULT NULL COMMENT '��ɫid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3792 DEFAULT CHARSET=utf8 COMMENT='��ɫ�Ͳ˵�������';

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES ('3377', '105', '5');
INSERT INTO `sys_relation` VALUES ('3378', '106', '5');
INSERT INTO `sys_relation` VALUES ('3379', '107', '5');
INSERT INTO `sys_relation` VALUES ('3380', '108', '5');
INSERT INTO `sys_relation` VALUES ('3381', '109', '5');
INSERT INTO `sys_relation` VALUES ('3382', '110', '5');
INSERT INTO `sys_relation` VALUES ('3383', '111', '5');
INSERT INTO `sys_relation` VALUES ('3384', '112', '5');
INSERT INTO `sys_relation` VALUES ('3385', '113', '5');
INSERT INTO `sys_relation` VALUES ('3386', '114', '5');
INSERT INTO `sys_relation` VALUES ('3387', '115', '5');
INSERT INTO `sys_relation` VALUES ('3388', '116', '5');
INSERT INTO `sys_relation` VALUES ('3389', '117', '5');
INSERT INTO `sys_relation` VALUES ('3390', '118', '5');
INSERT INTO `sys_relation` VALUES ('3391', '119', '5');
INSERT INTO `sys_relation` VALUES ('3392', '120', '5');
INSERT INTO `sys_relation` VALUES ('3393', '121', '5');
INSERT INTO `sys_relation` VALUES ('3394', '122', '5');
INSERT INTO `sys_relation` VALUES ('3395', '150', '5');
INSERT INTO `sys_relation` VALUES ('3396', '151', '5');
INSERT INTO `sys_relation` VALUES ('3737', '105', '1');
INSERT INTO `sys_relation` VALUES ('3738', '106', '1');
INSERT INTO `sys_relation` VALUES ('3739', '107', '1');
INSERT INTO `sys_relation` VALUES ('3740', '108', '1');
INSERT INTO `sys_relation` VALUES ('3741', '109', '1');
INSERT INTO `sys_relation` VALUES ('3742', '110', '1');
INSERT INTO `sys_relation` VALUES ('3743', '111', '1');
INSERT INTO `sys_relation` VALUES ('3744', '112', '1');
INSERT INTO `sys_relation` VALUES ('3745', '113', '1');
INSERT INTO `sys_relation` VALUES ('3746', '165', '1');
INSERT INTO `sys_relation` VALUES ('3747', '166', '1');
INSERT INTO `sys_relation` VALUES ('3748', '167', '1');
INSERT INTO `sys_relation` VALUES ('3749', '114', '1');
INSERT INTO `sys_relation` VALUES ('3750', '115', '1');
INSERT INTO `sys_relation` VALUES ('3751', '116', '1');
INSERT INTO `sys_relation` VALUES ('3752', '117', '1');
INSERT INTO `sys_relation` VALUES ('3753', '118', '1');
INSERT INTO `sys_relation` VALUES ('3754', '162', '1');
INSERT INTO `sys_relation` VALUES ('3755', '163', '1');
INSERT INTO `sys_relation` VALUES ('3756', '164', '1');
INSERT INTO `sys_relation` VALUES ('3757', '119', '1');
INSERT INTO `sys_relation` VALUES ('3758', '120', '1');
INSERT INTO `sys_relation` VALUES ('3759', '121', '1');
INSERT INTO `sys_relation` VALUES ('3760', '122', '1');
INSERT INTO `sys_relation` VALUES ('3761', '150', '1');
INSERT INTO `sys_relation` VALUES ('3762', '151', '1');
INSERT INTO `sys_relation` VALUES ('3763', '128', '1');
INSERT INTO `sys_relation` VALUES ('3764', '134', '1');
INSERT INTO `sys_relation` VALUES ('3765', '158', '1');
INSERT INTO `sys_relation` VALUES ('3766', '159', '1');
INSERT INTO `sys_relation` VALUES ('3767', '130', '1');
INSERT INTO `sys_relation` VALUES ('3768', '131', '1');
INSERT INTO `sys_relation` VALUES ('3769', '135', '1');
INSERT INTO `sys_relation` VALUES ('3770', '136', '1');
INSERT INTO `sys_relation` VALUES ('3771', '137', '1');
INSERT INTO `sys_relation` VALUES ('3772', '152', '1');
INSERT INTO `sys_relation` VALUES ('3773', '153', '1');
INSERT INTO `sys_relation` VALUES ('3774', '154', '1');
INSERT INTO `sys_relation` VALUES ('3775', '132', '1');
INSERT INTO `sys_relation` VALUES ('3776', '138', '1');
INSERT INTO `sys_relation` VALUES ('3777', '139', '1');
INSERT INTO `sys_relation` VALUES ('3778', '140', '1');
INSERT INTO `sys_relation` VALUES ('3779', '155', '1');
INSERT INTO `sys_relation` VALUES ('3780', '156', '1');
INSERT INTO `sys_relation` VALUES ('3781', '157', '1');
INSERT INTO `sys_relation` VALUES ('3782', '133', '1');
INSERT INTO `sys_relation` VALUES ('3783', '160', '1');
INSERT INTO `sys_relation` VALUES ('3784', '161', '1');
INSERT INTO `sys_relation` VALUES ('3785', '141', '1');
INSERT INTO `sys_relation` VALUES ('3786', '142', '1');
INSERT INTO `sys_relation` VALUES ('3787', '143', '1');
INSERT INTO `sys_relation` VALUES ('3788', '144', '1');
INSERT INTO `sys_relation` VALUES ('3789', '145', '1');
INSERT INTO `sys_relation` VALUES ('3790', '148', '1');
INSERT INTO `sys_relation` VALUES ('3791', '149', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `num` int(11) DEFAULT NULL COMMENT '���',
  `pid` int(11) DEFAULT NULL COMMENT '����ɫid',
  `name` varchar(255) DEFAULT NULL COMMENT '��ɫ����',
  `deptid` int(11) DEFAULT NULL COMMENT '��������',
  `tips` varchar(255) DEFAULT NULL COMMENT '��ʾ',
  `version` int(11) DEFAULT NULL COMMENT '�����ֶ�(��ʱû�ã�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='��ɫ��';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '0', '��������Ա', '24', 'administrator', '1');
INSERT INTO `sys_role` VALUES ('5', '2', '1', '��ʱ', '26', 'temp', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `avatar` varchar(255) DEFAULT NULL COMMENT 'ͷ��',
  `account` varchar(45) DEFAULT NULL COMMENT '�˺�',
  `password` varchar(45) DEFAULT NULL COMMENT '����',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5������',
  `name` varchar(45) DEFAULT NULL COMMENT '����',
  `birthday` datetime DEFAULT NULL COMMENT '����',
  `sex` int(11) DEFAULT NULL COMMENT '�Ա�1���� 2��Ů��',
  `email` varchar(45) DEFAULT NULL COMMENT '�����ʼ�',
  `phone` varchar(45) DEFAULT NULL COMMENT '�绰',
  `roleid` varchar(255) DEFAULT NULL COMMENT '��ɫid',
  `deptid` int(11) DEFAULT NULL COMMENT '����id',
  `status` int(11) DEFAULT NULL COMMENT '״̬(1������  2������  3��ɾ����',
  `createtime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `version` int(11) DEFAULT NULL COMMENT '�����ֶ�',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='����Ա��';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'girl.gif', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '����', '2017-05-05 00:00:00', '2', 'sn93@qq.com', '18200000000', '1', '27', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `sys_user` VALUES ('44', null, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', '1', 'abc@123.com', '', '5', '26', '3', '2017-05-16 20:33:37', null);
INSERT INTO `sys_user` VALUES ('45', null, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '�ϰ�', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:02', null);
INSERT INTO `sys_user` VALUES ('46', null, 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '����', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:24', null);


DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `aaa` int(11) NOT NULL AUTO_INCREMENT,
  `bbb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aaa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;


CREATE
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `sys_menu_node`AS 
select `m`.`id` AS `id`,`m`.`url` AS `url`,`rel`.`roleid` AS `roleid` from (`sys_relation` `rel` join `sys_menu` `m` on((`rel`.`menuid` = `m`.`id`))) ;

CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `sys_menu_tree`AS 
select `m1`.`id` AS `id`,(case when ((`m2`.`id` = 0) or isnull(`m2`.`id`)) then 0 else `m2`.`id` end) AS `pId`,`m1`.`name` AS `NAME`,(case when ((`m2`.`id` = 0) or isnull(`m2`.`id`)) then 'true' else 'false' end) AS `isOpen` from (`sys_menu` `m1` left join `sys_menu` `m2` on((`m1`.`pcode` = `m2`.`code`))) order by `m1`.`id` ;

CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `sys_role_res`AS 
select `m1`.`id` AS `id`,`m1`.`icon` AS `icon`,`m3`.`roleid` AS `roleid`,(case when ((`m2`.`id` = 0) or isnull(`m2`.`id`)) then 0 else `m2`.`id` end) AS `parentId`,
	`m1`.`name` AS `name`,`m1`.`url` AS `url`,`m1`.`levels` AS `levels`,`m1`.`ismenu` AS `ismenu`,`m1`.`num` AS `num` 
	from ((`soccer`.`sys_menu` `m1` left join `soccer`.`sys_menu` `m2` on((`m1`.`pcode` = `m2`.`code`))) 
	join (select `soccer`.`sys_menu`.`id` AS `ID`,`rela`.`roleid` AS `roleid` from (`soccer`.`sys_menu` left join `soccer`.`sys_relation` `rela` on((`soccer`.`sys_menu`.`id` = `rela`.`menuid`)))) `m3` on((`m1`.`id` = `m3`.`ID`))) where (`m1`.`ismenu` = 1) order by `m1`.`levels`,`m1`.`num` ;
