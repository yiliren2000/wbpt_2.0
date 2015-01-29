/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : wbpt

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2014-07-04 17:36:07
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `basic_code_catalog`
-- ----------------------------
DROP TABLE IF EXISTS `basic_code_catalog`;
CREATE TABLE `basic_code_catalog` (
  `uid` int(11) NOT NULL auto_increment,
  `codeNo` varchar(20) default NULL,
  `codeName` varchar(50) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_code_catalog
-- ----------------------------
INSERT INTO `basic_code_catalog` VALUES ('1', 'Boolean', '布尔类型');
INSERT INTO `basic_code_catalog` VALUES ('2', 'YesNo', '是否');
INSERT INTO `basic_code_catalog` VALUES ('3', 'Status', '正常/停用状态');
INSERT INTO `basic_code_catalog` VALUES ('4', 'OrgLevel', '机构级别');
INSERT INTO `basic_code_catalog` VALUES ('5', 'direction', '朝向');
INSERT INTO `basic_code_catalog` VALUES ('6', 'decorateDegree', '装修程度');
INSERT INTO `basic_code_catalog` VALUES ('7', 'houseQuality', '楼盘性质');
INSERT INTO `basic_code_catalog` VALUES ('8', 'houseType', '房屋类型');
INSERT INTO `basic_code_catalog` VALUES ('9', 'rightType', '产权类型');
INSERT INTO `basic_code_catalog` VALUES ('10', 'source', '来源');
INSERT INTO `basic_code_catalog` VALUES ('11', 'structure', '结构类型');
INSERT INTO `basic_code_catalog` VALUES ('12', 'facility', '设施');
INSERT INTO `basic_code_catalog` VALUES ('13', 'payType', '付款方式');
INSERT INTO `basic_code_catalog` VALUES ('14', 'businessStatus', '业务状态');
INSERT INTO `basic_code_catalog` VALUES ('15', 'priceCondition', '价格条件');
INSERT INTO `basic_code_catalog` VALUES ('16', 'viewMethod', '看房方式');
INSERT INTO `basic_code_catalog` VALUES ('17', 'ownerType', '业主类型');
INSERT INTO `basic_code_catalog` VALUES ('18', 'traceType', '跟进类型');
INSERT INTO `basic_code_catalog` VALUES ('19', 'customerType', '客源类型');
INSERT INTO `basic_code_catalog` VALUES ('20', 'customerStatus', '客源状态');
INSERT INTO `basic_code_catalog` VALUES ('21', 'cusHouseType', '客盘类型');
INSERT INTO `basic_code_catalog` VALUES ('22', 'payTypeDetail', '付款方式');
INSERT INTO `basic_code_catalog` VALUES ('23', 'businessClassify', '业务');
INSERT INTO `basic_code_catalog` VALUES ('24', 'businessType', '业务类型');
INSERT INTO `basic_code_catalog` VALUES ('25', 'taskType', '任务类型');
INSERT INTO `basic_code_catalog` VALUES ('26', 'taskStatus', '任务状态');
INSERT INTO `basic_code_catalog` VALUES ('27', 'resultDesc', '业绩说明');
INSERT INTO `basic_code_catalog` VALUES ('28', 'gender', '性别');

-- ----------------------------
-- Table structure for `basic_code_library`
-- ----------------------------
DROP TABLE IF EXISTS `basic_code_library`;
CREATE TABLE `basic_code_library` (
  `uid` int(11) NOT NULL auto_increment,
  `value` varchar(20) default NULL,
  `text` varchar(50) default NULL,
  `codeCatalog` int(11) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `FKE6238CDA2B2285A3` (`codeCatalog`),
  CONSTRAINT `FKE6238CDA2B2285A3` FOREIGN KEY (`codeCatalog`) REFERENCES `basic_code_catalog` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_code_library
-- ----------------------------
INSERT INTO `basic_code_library` VALUES ('0', 'false', '否', '1');
INSERT INTO `basic_code_library` VALUES ('1', 'true', '是', '1');
INSERT INTO `basic_code_library` VALUES ('2', 'valid', '正常', '3');
INSERT INTO `basic_code_library` VALUES ('3', 'invalid', '停用', '3');
INSERT INTO `basic_code_library` VALUES ('4', '1', '一级机构', '4');
INSERT INTO `basic_code_library` VALUES ('5', '2', '二级机构', '4');
INSERT INTO `basic_code_library` VALUES ('6', '3', '三级机构', '4');
INSERT INTO `basic_code_library` VALUES ('7', '4', '四级机构', '4');
INSERT INTO `basic_code_library` VALUES ('8', 'e', '东', '5');
INSERT INTO `basic_code_library` VALUES ('9', 's', '南', '5');
INSERT INTO `basic_code_library` VALUES ('10', 'w', '西', '5');
INSERT INTO `basic_code_library` VALUES ('11', 'n', '北', '5');
INSERT INTO `basic_code_library` VALUES ('12', 'e_w', '东西', '5');
INSERT INTO `basic_code_library` VALUES ('13', 's_n', '南北', '5');
INSERT INTO `basic_code_library` VALUES ('14', 's_s', '南南', '5');
INSERT INTO `basic_code_library` VALUES ('15', 'e_e', '东南', '5');
INSERT INTO `basic_code_library` VALUES ('16', 'e_s', '东北', '5');
INSERT INTO `basic_code_library` VALUES ('17', 'w_s', '西南', '5');
INSERT INTO `basic_code_library` VALUES ('18', 'w_n', '西北', '5');
INSERT INTO `basic_code_library` VALUES ('19', '1', '毛坯', '6');
INSERT INTO `basic_code_library` VALUES ('20', '2', '简单装修', '6');
INSERT INTO `basic_code_library` VALUES ('21', '3', '中等装修', '6');
INSERT INTO `basic_code_library` VALUES ('22', '4', '精装修', '6');
INSERT INTO `basic_code_library` VALUES ('23', '5', '豪华装修', '6');
INSERT INTO `basic_code_library` VALUES ('24', '1', '公盘', '7');
INSERT INTO `basic_code_library` VALUES ('25', '2', '私盘', '7');
INSERT INTO `basic_code_library` VALUES ('26', '3', '锁盘', '7');
INSERT INTO `basic_code_library` VALUES ('27', '4', '特盘', '7');
INSERT INTO `basic_code_library` VALUES ('28', '1', '多层住宅', '8');
INSERT INTO `basic_code_library` VALUES ('29', '2', '小高层', '8');
INSERT INTO `basic_code_library` VALUES ('30', '3', '高层住宅', '8');
INSERT INTO `basic_code_library` VALUES ('31', '4', '公寓', '8');
INSERT INTO `basic_code_library` VALUES ('32', '5', '商铺', '8');
INSERT INTO `basic_code_library` VALUES ('33', '6', '写字楼', '8');
INSERT INTO `basic_code_library` VALUES ('34', '7', '商住楼', '8');
INSERT INTO `basic_code_library` VALUES ('35', '8', '独栋别墅', '8');
INSERT INTO `basic_code_library` VALUES ('36', '9', '联排别墅', '8');
INSERT INTO `basic_code_library` VALUES ('37', '10', '叠加别墅', '8');
INSERT INTO `basic_code_library` VALUES ('38', '11', '双拼别墅', '8');
INSERT INTO `basic_code_library` VALUES ('39', '12', '多层复式', '8');
INSERT INTO `basic_code_library` VALUES ('40', '13', '民房', '8');
INSERT INTO `basic_code_library` VALUES ('41', '14', '洋房', '8');
INSERT INTO `basic_code_library` VALUES ('42', '15', '四合院', '8');
INSERT INTO `basic_code_library` VALUES ('43', '16', '厂房', '8');
INSERT INTO `basic_code_library` VALUES ('44', '17', '车库', '8');
INSERT INTO `basic_code_library` VALUES ('45', '18', '地皮', '8');
INSERT INTO `basic_code_library` VALUES ('46', '19', '其他', '8');
INSERT INTO `basic_code_library` VALUES ('47', '1', '个人产权', '9');
INSERT INTO `basic_code_library` VALUES ('48', '2', '单位产权', '9');
INSERT INTO `basic_code_library` VALUES ('49', '3', '售后产权', '9');
INSERT INTO `basic_code_library` VALUES ('50', '4', '家庭成员共有', '9');
INSERT INTO `basic_code_library` VALUES ('51', '5', '使用权', '9');
INSERT INTO `basic_code_library` VALUES ('52', '6', '小产权', '9');
INSERT INTO `basic_code_library` VALUES ('53', '7', '协议房', '9');
INSERT INTO `basic_code_library` VALUES ('54', '8', '私产', '9');
INSERT INTO `basic_code_library` VALUES ('55', '9', '公产', '9');
INSERT INTO `basic_code_library` VALUES ('56', '10', '合同发票', '9');
INSERT INTO `basic_code_library` VALUES ('57', '11', '三联单', '9');
INSERT INTO `basic_code_library` VALUES ('58', '12', '其他', '9');
INSERT INTO `basic_code_library` VALUES ('59', '1', '来电', '10');
INSERT INTO `basic_code_library` VALUES ('60', '2', '来访', '10');
INSERT INTO `basic_code_library` VALUES ('61', '3', '中介', '10');
INSERT INTO `basic_code_library` VALUES ('62', '4', '朋友', '10');
INSERT INTO `basic_code_library` VALUES ('63', '5', '扫街', '10');
INSERT INTO `basic_code_library` VALUES ('64', '6', '网络', '10');
INSERT INTO `basic_code_library` VALUES ('65', '7', '独家', '10');
INSERT INTO `basic_code_library` VALUES ('66', '8', '传单', '10');
INSERT INTO `basic_code_library` VALUES ('67', '9', '导入', '10');
INSERT INTO `basic_code_library` VALUES ('68', '10', '其他', '10');
INSERT INTO `basic_code_library` VALUES ('69', '1', '框架', '11');
INSERT INTO `basic_code_library` VALUES ('70', '2', '砖混', '11');
INSERT INTO `basic_code_library` VALUES ('71', '3', '剪力', '11');
INSERT INTO `basic_code_library` VALUES ('72', '4', '钢混', '11');
INSERT INTO `basic_code_library` VALUES ('73', '5', '木混', '11');
INSERT INTO `basic_code_library` VALUES ('74', '6', '砖木', '11');
INSERT INTO `basic_code_library` VALUES ('75', '7', '其他', '11');
INSERT INTO `basic_code_library` VALUES ('76', '1', '水', '12');
INSERT INTO `basic_code_library` VALUES ('77', '2', '电', '12');
INSERT INTO `basic_code_library` VALUES ('78', '3', '煤气/天然气', '12');
INSERT INTO `basic_code_library` VALUES ('79', '4', '有线电视', '12');
INSERT INTO `basic_code_library` VALUES ('80', '5', '冰箱', '12');
INSERT INTO `basic_code_library` VALUES ('81', '6', '洗衣机', '12');
INSERT INTO `basic_code_library` VALUES ('82', '7', '空调', '12');
INSERT INTO `basic_code_library` VALUES ('83', '8', '微波炉', '12');
INSERT INTO `basic_code_library` VALUES ('84', '9', '热水器', '12');
INSERT INTO `basic_code_library` VALUES ('85', '10', '暖气', '12');
INSERT INTO `basic_code_library` VALUES ('86', '11', '宽带', '12');
INSERT INTO `basic_code_library` VALUES ('87', '12', '电话', '12');
INSERT INTO `basic_code_library` VALUES ('88', '13', '电梯', '12');
INSERT INTO `basic_code_library` VALUES ('89', '14', '储藏/地下室', '12');
INSERT INTO `basic_code_library` VALUES ('90', '15', '灶具', '12');
INSERT INTO `basic_code_library` VALUES ('91', '16', '家具', '12');
INSERT INTO `basic_code_library` VALUES ('92', '17', '露台/花园', '12');
INSERT INTO `basic_code_library` VALUES ('93', '18', '停车位', '12');
INSERT INTO `basic_code_library` VALUES ('94', '19', '物业管理', '12');
INSERT INTO `basic_code_library` VALUES ('95', '20', '商务中心', '12');
INSERT INTO `basic_code_library` VALUES ('96', '21', '健身设备', '12');
INSERT INTO `basic_code_library` VALUES ('97', '1', '按揭', '13');
INSERT INTO `basic_code_library` VALUES ('98', '2', '全款', '13');
INSERT INTO `basic_code_library` VALUES ('99', '1', '正常', '14');
INSERT INTO `basic_code_library` VALUES ('100', '2', '推荐', '14');
INSERT INTO `basic_code_library` VALUES ('101', '3', '急售', '14');
INSERT INTO `basic_code_library` VALUES ('102', '4', '待审', '14');
INSERT INTO `basic_code_library` VALUES ('103', '5', '暂不售', '14');
INSERT INTO `basic_code_library` VALUES ('104', '6', '电话无效', '14');
INSERT INTO `basic_code_library` VALUES ('105', '7', '成交', '14');
INSERT INTO `basic_code_library` VALUES ('106', '8', '已卖', '14');
INSERT INTO `basic_code_library` VALUES ('107', '9', '无效', '14');
INSERT INTO `basic_code_library` VALUES ('108', '1', '一口价', '15');
INSERT INTO `basic_code_library` VALUES ('109', '2', '大概价', '15');
INSERT INTO `basic_code_library` VALUES ('110', '3', '有双税', '15');
INSERT INTO `basic_code_library` VALUES ('111', '4', '无双税', '15');
INSERT INTO `basic_code_library` VALUES ('112', '5', '有营业税', '15');
INSERT INTO `basic_code_library` VALUES ('113', '6', '无营业税', '15');
INSERT INTO `basic_code_library` VALUES ('114', '1', '随时', '16');
INSERT INTO `basic_code_library` VALUES ('115', '2', '预约', '16');
INSERT INTO `basic_code_library` VALUES ('116', '3', '钥匙', '16');
INSERT INTO `basic_code_library` VALUES ('117', '1', '普通客户', '17');
INSERT INTO `basic_code_library` VALUES ('118', '2', '潜在客户', '17');
INSERT INTO `basic_code_library` VALUES ('119', '3', 'VIP客户', '17');
INSERT INTO `basic_code_library` VALUES ('120', '1', 'QQ', '18');
INSERT INTO `basic_code_library` VALUES ('121', '2', '电话', '18');
INSERT INTO `basic_code_library` VALUES ('122', '3', '短信', '18');
INSERT INTO `basic_code_library` VALUES ('123', '4', '来访', '18');
INSERT INTO `basic_code_library` VALUES ('124', '5', '拜访', '18');
INSERT INTO `basic_code_library` VALUES ('125', '6', '约看', '18');
INSERT INTO `basic_code_library` VALUES ('126', '7', '看房', '18');
INSERT INTO `basic_code_library` VALUES ('127', '8', '签约', '18');
INSERT INTO `basic_code_library` VALUES ('128', '9', '续约', '18');
INSERT INTO `basic_code_library` VALUES ('129', '10', '重激活', '18');
INSERT INTO `basic_code_library` VALUES ('130', '11', '网络', '18');
INSERT INTO `basic_code_library` VALUES ('131', '12', '传单', '18');
INSERT INTO `basic_code_library` VALUES ('132', '13', '实勘', '18');
INSERT INTO `basic_code_library` VALUES ('133', '14', '其他', '18');
INSERT INTO `basic_code_library` VALUES ('134', '1', '普通客户', '19');
INSERT INTO `basic_code_library` VALUES ('135', '2', '潜在客户', '19');
INSERT INTO `basic_code_library` VALUES ('136', '3', 'VIP客户', '19');
INSERT INTO `basic_code_library` VALUES ('137', '1', '正常', '20');
INSERT INTO `basic_code_library` VALUES ('138', '2', '急求', '20');
INSERT INTO `basic_code_library` VALUES ('139', '3', '刚需', '20');
INSERT INTO `basic_code_library` VALUES ('140', '4', '投资', '20');
INSERT INTO `basic_code_library` VALUES ('141', '5', '暂缓', '20');
INSERT INTO `basic_code_library` VALUES ('142', '6', '成交', '20');
INSERT INTO `basic_code_library` VALUES ('143', '7', '已找', '20');
INSERT INTO `basic_code_library` VALUES ('144', '8', '无效', '20');
INSERT INTO `basic_code_library` VALUES ('145', '1', '私客', '21');
INSERT INTO `basic_code_library` VALUES ('146', '2', '公客', '21');
INSERT INTO `basic_code_library` VALUES ('147', '1', '公积金贷款', '22');
INSERT INTO `basic_code_library` VALUES ('148', '2', '商业贷款', '22');
INSERT INTO `basic_code_library` VALUES ('149', '3', '组合贷款', '22');
INSERT INTO `basic_code_library` VALUES ('150', '4', '全款', '22');
INSERT INTO `basic_code_library` VALUES ('151', '5', '其他', '22');
INSERT INTO `basic_code_library` VALUES ('152', '1', '二手房', '23');
INSERT INTO `basic_code_library` VALUES ('153', '2', '租房', '23');
INSERT INTO `basic_code_library` VALUES ('154', '3', '新房', '23');
INSERT INTO `basic_code_library` VALUES ('155', '1', '房源', '24');
INSERT INTO `basic_code_library` VALUES ('156', '2', '客源', '24');
INSERT INTO `basic_code_library` VALUES ('157', '1', '综合', '25');
INSERT INTO `basic_code_library` VALUES ('158', '2', '房源', '25');
INSERT INTO `basic_code_library` VALUES ('159', '3', '客源', '25');
INSERT INTO `basic_code_library` VALUES ('160', '4', '看房', '25');
INSERT INTO `basic_code_library` VALUES ('161', '5', '跟进', '25');
INSERT INTO `basic_code_library` VALUES ('162', '6', '签约', '25');
INSERT INTO `basic_code_library` VALUES ('163', '7', '办证', '25');
INSERT INTO `basic_code_library` VALUES ('164', '8', '按揭', '25');
INSERT INTO `basic_code_library` VALUES ('165', '9', '交房', '25');
INSERT INTO `basic_code_library` VALUES ('166', '10', '汇报', '25');
INSERT INTO `basic_code_library` VALUES ('167', '11', '收租', '25');
INSERT INTO `basic_code_library` VALUES ('168', '1', '待执行', '26');
INSERT INTO `basic_code_library` VALUES ('169', '2', '执行中', '26');
INSERT INTO `basic_code_library` VALUES ('170', '3', '已完成', '26');
INSERT INTO `basic_code_library` VALUES ('171', '4', '已取消', '26');
INSERT INTO `basic_code_library` VALUES ('172', '1', '看房费', '27');
INSERT INTO `basic_code_library` VALUES ('173', '2', '违约金', '27');
INSERT INTO `basic_code_library` VALUES ('174', '3', '手续费', '27');
INSERT INTO `basic_code_library` VALUES ('175', '4', '房源', '27');
INSERT INTO `basic_code_library` VALUES ('176', '5', '客源', '27');
INSERT INTO `basic_code_library` VALUES ('177', '6', '签独家', '27');
INSERT INTO `basic_code_library` VALUES ('178', '7', '拿钥匙', '27');
INSERT INTO `basic_code_library` VALUES ('179', '8', '转介绍', '27');
INSERT INTO `basic_code_library` VALUES ('180', '9', '拍照片视频', '27');
INSERT INTO `basic_code_library` VALUES ('181', '10', '完善信息', '27');
INSERT INTO `basic_code_library` VALUES ('182', '11', '其他', '27');
INSERT INTO `basic_code_library` VALUES ('183', 'M', '男', '28');
INSERT INTO `basic_code_library` VALUES ('184', 'F', '女', '28');

-- ----------------------------
-- Table structure for `basic_department`
-- ----------------------------
DROP TABLE IF EXISTS `basic_department`;
CREATE TABLE `basic_department` (
  `uid` int(11) NOT NULL auto_increment,
  `deptId` varchar(20) default NULL,
  `parentDept` int(11) default NULL,
  `level` int(11) default NULL,
  `deptName` varchar(50) default NULL,
  `directLeader` int(11) default NULL,
  `status` int(11) default NULL,
  `phoneNo` varchar(20) default NULL,
  `address` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `FK1D78FC039212483D` (`level`),
  KEY `FK1D78FC036161388E` (`directLeader`),
  KEY `FK1D78FC0356BE7CAB` (`status`),
  KEY `FK1D78FC03EF35B312` (`parentDept`),
  CONSTRAINT `FK1D78FC0356BE7CAB` FOREIGN KEY (`status`) REFERENCES `basic_code_library` (`uid`),
  CONSTRAINT `FK1D78FC036161388E` FOREIGN KEY (`directLeader`) REFERENCES `basic_user` (`uid`),
  CONSTRAINT `FK1D78FC039212483D` FOREIGN KEY (`level`) REFERENCES `basic_code_library` (`uid`),
  CONSTRAINT `FK1D78FC03EF35B312` FOREIGN KEY (`parentDept`) REFERENCES `basic_department` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_department
-- ----------------------------
INSERT INTO `basic_department` VALUES ('1', '1', null, '1', '华润房产', null, '2', null, null, null);
INSERT INTO `basic_department` VALUES ('19', '5', '1', '2', '北碚门店', null, '2', null, null, null);
INSERT INTO `basic_department` VALUES ('21', '9', '1', '2', '九龙坡门店', null, '2', null, null, null);
INSERT INTO `basic_department` VALUES ('22', '12', '1', '2', '南坪门店', null, '2', null, null, null);
INSERT INTO `basic_department` VALUES ('23', '11', '1', '2', '渝北门店', '6', '2', '13000000001', '渝北中心城', '无备注');
INSERT INTO `basic_department` VALUES ('24', '8', '1', '2', '江北门店', null, '2', null, null, null);
INSERT INTO `basic_department` VALUES ('25', '14', '1', '2', '沙坪坝门店', null, '2', null, null, null);

-- ----------------------------
-- Table structure for `basic_group`
-- ----------------------------
DROP TABLE IF EXISTS `basic_group`;
CREATE TABLE `basic_group` (
  `uid` int(11) NOT NULL auto_increment,
  `groupId` varchar(20) default NULL,
  `groupName` varchar(50) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `FKE27FD32E56BE7CAB` (`status`),
  CONSTRAINT `FKE27FD32E56BE7CAB` FOREIGN KEY (`status`) REFERENCES `basic_code_library` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_group
-- ----------------------------
INSERT INTO `basic_group` VALUES ('1', 'admin', '管理员组', '2');

-- ----------------------------
-- Table structure for `basic_group_role`
-- ----------------------------
DROP TABLE IF EXISTS `basic_group_role`;
CREATE TABLE `basic_group_role` (
  `c_group` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY  (`c_group`,`role`),
  KEY `FK375B32E779AA4DB1` (`c_group`),
  KEY `FK375B32E7243FBF7D` (`role`),
  CONSTRAINT `FK375B32E7243FBF7D` FOREIGN KEY (`role`) REFERENCES `basic_role` (`uid`),
  CONSTRAINT `FK375B32E779AA4DB1` FOREIGN KEY (`c_group`) REFERENCES `basic_group` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_group_role
-- ----------------------------

-- ----------------------------
-- Table structure for `basic_group_user`
-- ----------------------------
DROP TABLE IF EXISTS `basic_group_user`;
CREATE TABLE `basic_group_user` (
  `c_group` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY  (`user`,`c_group`),
  KEY `FK375C9E3C79AA4DB1` (`c_group`),
  KEY `FK375C9E3C24429627` (`user`),
  CONSTRAINT `FK375C9E3C24429627` FOREIGN KEY (`user`) REFERENCES `basic_user` (`uid`),
  CONSTRAINT `FK375C9E3C79AA4DB1` FOREIGN KEY (`c_group`) REFERENCES `basic_group` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_group_user
-- ----------------------------

-- ----------------------------
-- Table structure for `basic_menu`
-- ----------------------------
DROP TABLE IF EXISTS `basic_menu`;
CREATE TABLE `basic_menu` (
  `uid` int(11) NOT NULL auto_increment,
  `orderNo` int(11) default NULL,
  `text` varchar(20) default NULL,
  `url` varchar(200) default NULL,
  `showTree` bit(1) default NULL,
  `parentMenu` int(11) default NULL,
  `valid` bit(1) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `FKBCFE66D0ACFEF61D` (`parentMenu`),
  CONSTRAINT `FKBCFE66D0ACFEF61D` FOREIGN KEY (`parentMenu`) REFERENCES `basic_menu` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_menu
-- ----------------------------
INSERT INTO `basic_menu` VALUES ('1', '1010', '菜单列表', '', '\0', null, '');
INSERT INTO `basic_menu` VALUES ('2', '1020', '门店/员工管理', '', '\0', '1', '');
INSERT INTO `basic_menu` VALUES ('3', '1030', '系统管理', '', '\0', '1', '');
INSERT INTO `basic_menu` VALUES ('4', '1040', '开发工具', '', '\0', '1', '');
INSERT INTO `basic_menu` VALUES ('5', '1050', '门店管理', '/userManage/departmentAction!getAllNodes.action?link=/userManage/department.jsp', '', '2', '');
INSERT INTO `basic_menu` VALUES ('6', '1060', '员工管理', '/userManage/departmentAction!getAllNodes.action?link=/userManage/user.jsp', '', '2', '');
INSERT INTO `basic_menu` VALUES ('7', '1070', '组管理', '/userManage/group.jsp', '\0', '2', '\0');
INSERT INTO `basic_menu` VALUES ('8', '1080', '角色管理', '/userManage/role.jsp', '\0', '2', '');
INSERT INTO `basic_menu` VALUES ('9', '1117', '权限管理', '/userManage/privilege.jsp', '\0', '4', '');
INSERT INTO `basic_menu` VALUES ('10', '1100', '菜单管理', '/systemManage/menu.jsp', '\0', '4', '');
INSERT INTO `basic_menu` VALUES ('11', '1110', '字典管理', '/systemManage/codeCatalog.jsp', '\0', '4', '');
INSERT INTO `basic_menu` VALUES ('12', '1120', '系统通知', '/systemManage/notice.jsp', '\0', '3', '');
INSERT INTO `basic_menu` VALUES ('13', '1130', '刷新缓存', '/systemManage/refreshSysCache.jsp', '\0', '4', '');
INSERT INTO `basic_menu` VALUES ('14', '1125', '在线人员列表', '/systemManage/onlineUserList.jsp', '\0', '3', '');
INSERT INTO `basic_menu` VALUES ('15', '2010', '房源管理', '', '', '1', '');
INSERT INTO `basic_menu` VALUES ('16', '2011', '房源信息', '/houseManage/houseMessage.jsp', '\0', '15', '');
INSERT INTO `basic_menu` VALUES ('17', '2012', '业主信息', '/houseManage/ownerMessage.jsp', '\0', '15', '');
INSERT INTO `basic_menu` VALUES ('18', '2020', '客源管理', '', '', '1', '');
INSERT INTO `basic_menu` VALUES ('19', '2021', '选房条件', '/customerManage/chooseCondition.jsp', '\0', '18', '');
INSERT INTO `basic_menu` VALUES ('20', '2022', '客户信息', '/customerManage/customerMessage.jsp', '\0', '18', '');
INSERT INTO `basic_menu` VALUES ('21', '2030', '业务管理', '', '', '1', '');
INSERT INTO `basic_menu` VALUES ('22', '2031', '合同信息', '/businessManage/contractMessage.jsp', '\0', '21', '');
INSERT INTO `basic_menu` VALUES ('23', '2032', '合同任务', '/businessManage/contracTask.jsp', '\0', '21', '');
INSERT INTO `basic_menu` VALUES ('24', '2033', '利润分成', '/businessManage/resultDistribute.jsp', '\0', '21', '');
INSERT INTO `basic_menu` VALUES ('25', '2034', '跟进记录', '/businessManage/traceRecord.jsp', '\0', '21', '');
INSERT INTO `basic_menu` VALUES ('29', '11', '11', '/menuTree.jsp?menuType=test', '', '1', '');

-- ----------------------------
-- Table structure for `basic_menu_role`
-- ----------------------------
DROP TABLE IF EXISTS `basic_menu_role`;
CREATE TABLE `basic_menu_role` (
  `menu` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY  (`menu`,`role`),
  KEY `FK28719485BBBC5273` (`menu`),
  KEY `FK28719485243FBF7D` (`role`),
  CONSTRAINT `FK28719485243FBF7D` FOREIGN KEY (`role`) REFERENCES `basic_role` (`uid`),
  CONSTRAINT `FK28719485BBBC5273` FOREIGN KEY (`menu`) REFERENCES `basic_menu` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_menu_role
-- ----------------------------
INSERT INTO `basic_menu_role` VALUES ('1', '1');
INSERT INTO `basic_menu_role` VALUES ('2', '1');
INSERT INTO `basic_menu_role` VALUES ('3', '1');
INSERT INTO `basic_menu_role` VALUES ('4', '1');
INSERT INTO `basic_menu_role` VALUES ('5', '1');
INSERT INTO `basic_menu_role` VALUES ('6', '1');
INSERT INTO `basic_menu_role` VALUES ('7', '1');
INSERT INTO `basic_menu_role` VALUES ('8', '1');
INSERT INTO `basic_menu_role` VALUES ('9', '1');
INSERT INTO `basic_menu_role` VALUES ('10', '1');
INSERT INTO `basic_menu_role` VALUES ('11', '1');
INSERT INTO `basic_menu_role` VALUES ('12', '1');
INSERT INTO `basic_menu_role` VALUES ('13', '1');
INSERT INTO `basic_menu_role` VALUES ('14', '1');
INSERT INTO `basic_menu_role` VALUES ('15', '1');
INSERT INTO `basic_menu_role` VALUES ('15', '2');
INSERT INTO `basic_menu_role` VALUES ('16', '1');
INSERT INTO `basic_menu_role` VALUES ('16', '2');
INSERT INTO `basic_menu_role` VALUES ('17', '1');
INSERT INTO `basic_menu_role` VALUES ('17', '2');
INSERT INTO `basic_menu_role` VALUES ('18', '1');
INSERT INTO `basic_menu_role` VALUES ('18', '2');
INSERT INTO `basic_menu_role` VALUES ('19', '1');
INSERT INTO `basic_menu_role` VALUES ('19', '2');
INSERT INTO `basic_menu_role` VALUES ('20', '1');
INSERT INTO `basic_menu_role` VALUES ('20', '2');
INSERT INTO `basic_menu_role` VALUES ('21', '1');
INSERT INTO `basic_menu_role` VALUES ('21', '2');
INSERT INTO `basic_menu_role` VALUES ('22', '1');
INSERT INTO `basic_menu_role` VALUES ('22', '2');
INSERT INTO `basic_menu_role` VALUES ('23', '1');
INSERT INTO `basic_menu_role` VALUES ('23', '2');
INSERT INTO `basic_menu_role` VALUES ('24', '1');
INSERT INTO `basic_menu_role` VALUES ('24', '2');
INSERT INTO `basic_menu_role` VALUES ('25', '1');
INSERT INTO `basic_menu_role` VALUES ('25', '2');
INSERT INTO `basic_menu_role` VALUES ('29', '1');

-- ----------------------------
-- Table structure for `basic_notice`
-- ----------------------------
DROP TABLE IF EXISTS `basic_notice`;
CREATE TABLE `basic_notice` (
  `uid` int(11) NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `filePath` varchar(100) default NULL,
  `startDate` varchar(10) default NULL,
  `endDate` varchar(10) default NULL,
  `noticeDeptsJson` varchar(100) default NULL,
  `publishPerson` int(11) default NULL,
  `createDate` varchar(10) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `FK79445009CCBB9B80` (`publishPerson`),
  CONSTRAINT `FK79445009CCBB9B80` FOREIGN KEY (`publishPerson`) REFERENCES `basic_user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_notice
-- ----------------------------
INSERT INTO `basic_notice` VALUES ('6', '说三道四的', '/WEB-INF/data/notice/三体全集.txt', '2014-06-05', '2014-07-17', '1', '1', '2014-04-17');
INSERT INTO `basic_notice` VALUES ('7', '说三道四的', '/WEB-INF/data/notice/新建 文本文档.txt', '2014-04-17', '2014-05-17', '1', '1', '2014-04-17');
INSERT INTO `basic_notice` VALUES ('8', '11111111111到达地', null, '2014-04-25', '2014-05-25', '1', '6', '2014-04-25');

-- ----------------------------
-- Table structure for `basic_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `basic_privilege`;
CREATE TABLE `basic_privilege` (
  `uid` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `operate` varchar(255) default NULL,
  `className` varchar(255) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_privilege
-- ----------------------------
INSERT INTO `basic_privilege` VALUES ('1', '新增机构权限', 'add', 'com.lxq.platform.userManage.pojo.Department');
INSERT INTO `basic_privilege` VALUES ('2', '删除机构权限', 'delete', 'com.lxq.platform.userManage.pojo.Department');
INSERT INTO `basic_privilege` VALUES ('3', '更新机构权限', 'update', 'com.lxq.platform.userManage.pojo.Department');
INSERT INTO `basic_privilege` VALUES ('4', '查询机构权限', 'query', 'com.lxq.platform.userManage.pojo.Department');
INSERT INTO `basic_privilege` VALUES ('5', '所有机构操作权限', 'all', 'com.lxq.platform.userManage.pojo.Department');
INSERT INTO `basic_privilege` VALUES ('6', '新增用户权限', 'add', 'com.lxq.platform.userManage.pojo.User');
INSERT INTO `basic_privilege` VALUES ('7', '删除用户权限', 'delete', 'com.lxq.platform.userManage.pojo.User');
INSERT INTO `basic_privilege` VALUES ('8', '更新用户权限', 'update', 'com.lxq.platform.userManage.pojo.User');
INSERT INTO `basic_privilege` VALUES ('9', '查询用户权限', 'query', 'com.lxq.platform.userManage.pojo.User');
INSERT INTO `basic_privilege` VALUES ('10', '所有用户操作权限', 'all', 'com.lxq.platform.userManage.pojo.User');
INSERT INTO `basic_privilege` VALUES ('11', '新增角色权限', 'add', 'com.lxq.platform.userManage.pojo.Role');
INSERT INTO `basic_privilege` VALUES ('12', '删除角色权限', 'delete', 'com.lxq.platform.userManage.pojo.Role');
INSERT INTO `basic_privilege` VALUES ('13', '更新角色权限', 'update', 'com.lxq.platform.userManage.pojo.Role');
INSERT INTO `basic_privilege` VALUES ('14', '查询角色权限', 'query', 'com.lxq.platform.userManage.pojo.Role');
INSERT INTO `basic_privilege` VALUES ('15', '所有角色操作权限', 'all', 'com.lxq.platform.userManage.pojo.Role');
INSERT INTO `basic_privilege` VALUES ('16', '新增组权限', 'add', 'com.lxq.platform.userManage.pojo.Group');
INSERT INTO `basic_privilege` VALUES ('17', '删除组权限', 'delete', 'com.lxq.platform.userManage.pojo.Group');
INSERT INTO `basic_privilege` VALUES ('18', '更新组权限', 'update', 'com.lxq.platform.userManage.pojo.Group');
INSERT INTO `basic_privilege` VALUES ('19', '查询组权限', 'query', 'com.lxq.platform.userManage.pojo.Group');
INSERT INTO `basic_privilege` VALUES ('20', '所有组操作权限', 'all', 'com.lxq.platform.userManage.pojo.Group');
INSERT INTO `basic_privilege` VALUES ('21', '新增权限权信息权限', 'add', 'com.lxq.platform.userManage.pojo.Privilege');
INSERT INTO `basic_privilege` VALUES ('22', '删除权限权信息权限', 'delete', 'com.lxq.platform.userManage.pojo.Privilege');
INSERT INTO `basic_privilege` VALUES ('23', '更新权限权信息权限', 'update', 'com.lxq.platform.userManage.pojo.Privilege');
INSERT INTO `basic_privilege` VALUES ('24', '查询权限权信息权限', 'query', 'com.lxq.platform.userManage.pojo.Privilege');
INSERT INTO `basic_privilege` VALUES ('25', '所有权限权信息操作权限', 'all', 'com.lxq.platform.userManage.pojo.Privilege');
INSERT INTO `basic_privilege` VALUES ('26', '新增菜单权限', 'add', 'com.lxq.platform.systemManage.pojo.Menu');
INSERT INTO `basic_privilege` VALUES ('27', '删除菜单权限', 'delete', 'com.lxq.platform.systemManage.pojo.Menu');
INSERT INTO `basic_privilege` VALUES ('28', '更新菜单权限', 'update', 'com.lxq.platform.systemManage.pojo.Menu');
INSERT INTO `basic_privilege` VALUES ('29', '查询菜单权限', 'query', 'com.lxq.platform.systemManage.pojo.Menu');
INSERT INTO `basic_privilege` VALUES ('30', '所有菜单操作权限', 'all', 'com.lxq.platform.systemManage.pojo.Menu');
INSERT INTO `basic_privilege` VALUES ('31', '新增字典权限', 'add', 'com.lxq.platform.systemManage.pojo.CodeCatalog');
INSERT INTO `basic_privilege` VALUES ('32', '删除字典目录权限', 'delete', 'com.lxq.platform.systemManage.pojo.CodeCatalog');
INSERT INTO `basic_privilege` VALUES ('33', '更新字典目录权限', 'update', 'com.lxq.platform.systemManage.pojo.CodeCatalog');
INSERT INTO `basic_privilege` VALUES ('34', '查询字典目录权限', 'query', 'com.lxq.platform.systemManage.pojo.CodeCatalog');
INSERT INTO `basic_privilege` VALUES ('35', '所有字典目录操作权限', 'all', 'com.lxq.platform.systemManage.pojo.CodeCatalog');
INSERT INTO `basic_privilege` VALUES ('36', '新增字典内容权限', 'add', 'com.lxq.platform.systemManage.pojo.CodeLibrary');
INSERT INTO `basic_privilege` VALUES ('37', '删除字典内容权限', 'delete', 'com.lxq.platform.systemManage.pojo.CodeLibrary');
INSERT INTO `basic_privilege` VALUES ('38', '更新字典内容权限', 'update', 'com.lxq.platform.systemManage.pojo.CodeLibrary');
INSERT INTO `basic_privilege` VALUES ('39', '查询字典内容权限', 'query', 'com.lxq.platform.systemManage.pojo.CodeLibrary');
INSERT INTO `basic_privilege` VALUES ('40', '所有字典内容操作权限', 'all', 'com.lxq.platform.systemManage.pojo.CodeLibrary');
INSERT INTO `basic_privilege` VALUES ('41', '新增流程目录管理权限', 'add', 'com.lxq.platform.flowManage.pojo.FlowCatalog');
INSERT INTO `basic_privilege` VALUES ('42', '删除流程目录管理权限', 'delete', 'com.lxq.platform.flowManage.pojo.FlowCatalog');
INSERT INTO `basic_privilege` VALUES ('43', '更新流程目录管理权限', 'update', 'com.lxq.platform.flowManage.pojo.FlowCatalog');
INSERT INTO `basic_privilege` VALUES ('44', '查询流程目录管理权限', 'query', 'com.lxq.platform.flowManage.pojo.FlowCatalog');
INSERT INTO `basic_privilege` VALUES ('45', '所有流程目录管理权限', 'all', 'com.lxq.platform.flowManage.pojo.FlowCatalog');
INSERT INTO `basic_privilege` VALUES ('46', '新增流程模板管理权限', 'add', 'com.lxq.platform.flowManage.pojo.FlowModel');
INSERT INTO `basic_privilege` VALUES ('47', '删除流程模板管理权限', 'delete', 'com.lxq.platform.flowManage.pojo.FlowModel');
INSERT INTO `basic_privilege` VALUES ('48', '更新流程模板管理权限', 'update', 'com.lxq.platform.flowManage.pojo.FlowModel');
INSERT INTO `basic_privilege` VALUES ('49', '查询流程模板管理权限', 'query', 'com.lxq.platform.flowManage.pojo.FlowModel');
INSERT INTO `basic_privilege` VALUES ('50', '所有流程模板管理权限', 'all', 'com.lxq.platform.flowManage.pojo.FlowModel');
INSERT INTO `basic_privilege` VALUES ('52', '新增系统通知管理权限', 'add', 'com.lxq.platform.systemManage.pojo.Notice');
INSERT INTO `basic_privilege` VALUES ('53', '删除系统通知管理权限', 'delete', 'com.lxq.platform.systemManage.pojo.Notice');
INSERT INTO `basic_privilege` VALUES ('54', '更新系统通知管理权限', 'update', 'com.lxq.platform.systemManage.pojo.Notice');
INSERT INTO `basic_privilege` VALUES ('55', '查询系统通知管理权限', 'query', 'com.lxq.platform.systemManage.pojo.Notice');
INSERT INTO `basic_privilege` VALUES ('56', '所有系统通知管理权限', 'all', 'com.lxq.platform.systemManage.pojo.Notice');
INSERT INTO `basic_privilege` VALUES ('57', '增加期次权限', 'add', 'com.lxq.platform.goalManage.pojo.DateBatch');
INSERT INTO `basic_privilege` VALUES ('58', '删除期次权限', 'delete', 'com.lxq.platform.goalManage.pojo.DateBatch');
INSERT INTO `basic_privilege` VALUES ('59', '更新期次权限', 'update', 'com.lxq.platform.goalManage.pojo.DateBatch');
INSERT INTO `basic_privilege` VALUES ('60', '查询期次权限', 'query', 'com.lxq.platform.goalManage.pojo.DateBatch');
INSERT INTO `basic_privilege` VALUES ('61', '所有期次权限', 'all', 'com.lxq.platform.goalManage.pojo.DateBatch');
INSERT INTO `basic_privilege` VALUES ('62', '增加审批管理权限', 'add', 'com.lxq.platform.goalManage.pojo.ApprovePostil');
INSERT INTO `basic_privilege` VALUES ('63', '删除审批管理权限', 'delete', 'com.lxq.platform.goalManage.pojo.ApprovePostil');
INSERT INTO `basic_privilege` VALUES ('64', '更新审批管理权限', 'update', 'com.lxq.platform.goalManage.pojo.ApprovePostil');
INSERT INTO `basic_privilege` VALUES ('65', '查询审批管理权限', 'query', 'com.lxq.platform.goalManage.pojo.ApprovePostil');
INSERT INTO `basic_privilege` VALUES ('66', '所有审批管理权限', 'all', 'com.lxq.platform.goalManage.pojo.ApprovePostil');
INSERT INTO `basic_privilege` VALUES ('67', '增加目标管理权限', 'add', 'com.lxq.platform.goalManage.pojo.PerformanceGoal');
INSERT INTO `basic_privilege` VALUES ('68', '删除目标管理权限', 'delete', 'com.lxq.platform.goalManage.pojo.PerformanceGoal');
INSERT INTO `basic_privilege` VALUES ('69', '更新目标管理权限', 'update', 'com.lxq.platform.goalManage.pojo.PerformanceGoal');
INSERT INTO `basic_privilege` VALUES ('70', '查询目标管理权限', 'query', 'com.lxq.platform.goalManage.pojo.PerformanceGoal');
INSERT INTO `basic_privilege` VALUES ('71', '所有目标管理权限', 'all', 'com.lxq.platform.goalManage.pojo.PerformanceGoal');
INSERT INTO `basic_privilege` VALUES ('74', '增加角色权限管理权限', 'add', 'com.lxq.platform.userManage.pojo.RolePrivilege');
INSERT INTO `basic_privilege` VALUES ('75', '删除角色权限管理权限', 'delete', 'com.lxq.platform.userManage.pojo.RolePrivilege');
INSERT INTO `basic_privilege` VALUES ('76', '更新角色权限管理权限', 'update', 'com.lxq.platform.userManage.pojo.RolePrivilege');
INSERT INTO `basic_privilege` VALUES ('77', '查询角色权限管理权限', 'query', 'com.lxq.platform.userManage.pojo.RolePrivilege');
INSERT INTO `basic_privilege` VALUES ('78', '所有角色权限管理权限', 'all', 'com.lxq.platform.userManage.pojo.RolePrivilege');
INSERT INTO `basic_privilege` VALUES ('79', '增加菜单角色管理权限', 'add', 'com.lxq.platform.systemManage.pojo.MenuRole');
INSERT INTO `basic_privilege` VALUES ('80', '删除菜单角色管理权限', 'delete', 'com.lxq.platform.systemManage.pojo.MenuRole');
INSERT INTO `basic_privilege` VALUES ('81', '更新菜单角色管理权限', 'update', 'com.lxq.platform.systemManage.pojo.MenuRole');
INSERT INTO `basic_privilege` VALUES ('82', '查询菜单角色管理权限', 'query', 'com.lxq.platform.systemManage.pojo.MenuRole');
INSERT INTO `basic_privilege` VALUES ('83', '所有菜单角色管理权限', 'all', 'com.lxq.platform.systemManage.pojo.MenuRole');
INSERT INTO `basic_privilege` VALUES ('89', '增加用户角色管理权限', 'add', 'com.lxq.platform.userManage.pojo.UserRole');
INSERT INTO `basic_privilege` VALUES ('90', '删除用户角色管理权限', 'delete', 'com.lxq.platform.userManage.pojo.UserRole');
INSERT INTO `basic_privilege` VALUES ('91', '更新用户角色管理权限', 'update', 'com.lxq.platform.userManage.pojo.UserRole');
INSERT INTO `basic_privilege` VALUES ('92', '查询用户角色管理权限', 'query', 'com.lxq.platform.userManage.pojo.UserRole');
INSERT INTO `basic_privilege` VALUES ('93', '所有用户角色管理权限', 'all', 'com.lxq.platform.userManage.pojo.UserRole');

-- ----------------------------
-- Table structure for `basic_role`
-- ----------------------------
DROP TABLE IF EXISTS `basic_role`;
CREATE TABLE `basic_role` (
  `uid` int(11) NOT NULL auto_increment,
  `roleId` varchar(20) default NULL,
  `roleName` varchar(50) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `FKBD00D1E756BE7CAB` (`status`),
  CONSTRAINT `FKBD00D1E756BE7CAB` FOREIGN KEY (`status`) REFERENCES `basic_code_library` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_role
-- ----------------------------
INSERT INTO `basic_role` VALUES ('1', 'admin', '系统管理员', '2');
INSERT INTO `basic_role` VALUES ('2', '100', '客户经理', '2');

-- ----------------------------
-- Table structure for `basic_role_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `basic_role_privilege`;
CREATE TABLE `basic_role_privilege` (
  `role` int(11) NOT NULL,
  `privilege` int(11) NOT NULL,
  PRIMARY KEY  (`role`,`privilege`),
  KEY `FKD688CE5994D6A171` (`privilege`),
  KEY `FKD688CE59243FBF7D` (`role`),
  CONSTRAINT `FKD688CE59243FBF7D` FOREIGN KEY (`role`) REFERENCES `basic_role` (`uid`),
  CONSTRAINT `FKD688CE5994D6A171` FOREIGN KEY (`privilege`) REFERENCES `basic_privilege` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_role_privilege
-- ----------------------------
INSERT INTO `basic_role_privilege` VALUES ('1', '5');
INSERT INTO `basic_role_privilege` VALUES ('1', '10');
INSERT INTO `basic_role_privilege` VALUES ('1', '15');
INSERT INTO `basic_role_privilege` VALUES ('1', '20');
INSERT INTO `basic_role_privilege` VALUES ('1', '25');
INSERT INTO `basic_role_privilege` VALUES ('1', '30');
INSERT INTO `basic_role_privilege` VALUES ('1', '35');
INSERT INTO `basic_role_privilege` VALUES ('1', '40');
INSERT INTO `basic_role_privilege` VALUES ('1', '56');
INSERT INTO `basic_role_privilege` VALUES ('1', '61');
INSERT INTO `basic_role_privilege` VALUES ('1', '66');
INSERT INTO `basic_role_privilege` VALUES ('1', '71');
INSERT INTO `basic_role_privilege` VALUES ('2', '71');
INSERT INTO `basic_role_privilege` VALUES ('1', '78');
INSERT INTO `basic_role_privilege` VALUES ('1', '83');
INSERT INTO `basic_role_privilege` VALUES ('1', '93');

-- ----------------------------
-- Table structure for `basic_user`
-- ----------------------------
DROP TABLE IF EXISTS `basic_user`;
CREATE TABLE `basic_user` (
  `uid` int(11) NOT NULL auto_increment,
  `userId` varchar(20) default NULL,
  `userName` varchar(50) default NULL,
  `password` varchar(50) default NULL,
  `belongDept` int(11) default NULL,
  `status` int(11) default NULL,
  `loginNum` int(11) default NULL,
  `phonenumber` varchar(30) default NULL,
  `email` varchar(40) default NULL,
  PRIMARY KEY  (`uid`),
  KEY `FKBD023D3C85435127` (`belongDept`),
  KEY `FKBD023D3C56BE7CAB` (`status`),
  CONSTRAINT `FKBD023D3C56BE7CAB` FOREIGN KEY (`status`) REFERENCES `basic_code_library` (`uid`),
  CONSTRAINT `FKBD023D3C85435127` FOREIGN KEY (`belongDept`) REFERENCES `basic_department` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_user
-- ----------------------------
INSERT INTO `basic_user` VALUES ('1', 'admin', '系统管理员', 'ef73781effc5774100f87fe2f437a435', '1', '2', '824', '15325427215', '系统管理员');
INSERT INTO `basic_user` VALUES ('6', 'user', 'user', 'ef73781effc5774100f87fe2f437a435', '1', '2', '137', '15325427215', 'user@sohu.com');
INSERT INTO `basic_user` VALUES ('31', '葛敏', '葛敏', 'ef73781effc5774100f87fe2f437a435', '19', '2', '66', '15325427215', '葛敏');

-- ----------------------------
-- Table structure for `basic_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `basic_user_role`;
CREATE TABLE `basic_user_role` (
  `user` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY  (`user`,`role`),
  KEY `FK97AEE199243FBF7D` (`role`),
  KEY `FK97AEE19924429627` (`user`),
  CONSTRAINT `FK97AEE199243FBF7D` FOREIGN KEY (`role`) REFERENCES `basic_role` (`uid`),
  CONSTRAINT `FK97AEE19924429627` FOREIGN KEY (`user`) REFERENCES `basic_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_user_role
-- ----------------------------
INSERT INTO `basic_user_role` VALUES ('1', '1');
INSERT INTO `basic_user_role` VALUES ('6', '2');

-- ----------------------------
-- Table structure for `choose_condition`
-- ----------------------------
DROP TABLE IF EXISTS `choose_condition`;
CREATE TABLE `choose_condition` (
  `uid` int(11) NOT NULL auto_increment COMMENT '主键',
  `customerNo` varchar(254) default NULL COMMENT '客源编号',
  `county` varchar(254) default NULL COMMENT '需求区县',
  `zone` varchar(254) default NULL COMMENT '需求小区',
  `plate` varchar(254) default NULL COMMENT '需求板块',
  `street` varchar(254) default NULL COMMENT '主要街道',
  `buildType` varchar(254) default NULL COMMENT '客盘类型',
  `houseArea` varchar(254) default NULL COMMENT '房屋面积',
  `floor` varchar(254) default NULL COMMENT '楼层',
  `customerStatus` varchar(254) default NULL COMMENT '客源状态',
  `sourceType` varchar(254) default NULL COMMENT '房源类型',
  `houseType` varchar(254) default NULL COMMENT '户型',
  `decorateDegree` varchar(254) default NULL COMMENT '装修程度',
  `direction` varchar(254) default NULL COMMENT '房屋朝向',
  `rightType` varchar(254) default NULL COMMENT '产权类型',
  `buildArea` varchar(254) default NULL COMMENT '建筑年代',
  `source` varchar(254) default NULL COMMENT '来源',
  `traffic` varchar(254) default NULL COMMENT '交通状况',
  `remark` varchar(254) default NULL COMMENT '客源备注',
  `totalPrice` varchar(254) default NULL COMMENT '总价格',
  `unitPrice` varchar(254) default NULL COMMENT '单价',
  `payMode` varchar(254) default NULL COMMENT '付款方式',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='选房条件';

-- ----------------------------
-- Records of choose_condition
-- ----------------------------
INSERT INTO `choose_condition` VALUES ('2', '2', '111事实上', '222', '333', '444', '148', '11', '11', '140', '32', '11', '22', '12', '50', '11', '62', '11', '11', '11', '11', '150');

-- ----------------------------
-- Table structure for `contrac_task`
-- ----------------------------
DROP TABLE IF EXISTS `contrac_task`;
CREATE TABLE `contrac_task` (
  `uid` int(11) NOT NULL auto_increment COMMENT '主键',
  `contracNo` varchar(254) default NULL COMMENT '合同编号',
  `taskType` varchar(254) default NULL COMMENT '任务类型',
  `taskStatus` varchar(254) default NULL COMMENT '任务状态',
  `executePerson` varchar(254) default NULL COMMENT '执行人',
  `createPerson` varchar(254) default NULL COMMENT '创建人',
  `startTime` varchar(254) default NULL COMMENT '开始时间',
  `endTime` varchar(254) default NULL COMMENT '结束时间',
  `taskContent` varchar(254) default NULL COMMENT '任务内容',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='合同任务信息';

-- ----------------------------
-- Records of contrac_task
-- ----------------------------
INSERT INTO `contrac_task` VALUES ('2', '2', '166', '174', '1', '1', '1', '1', '1');
INSERT INTO `contrac_task` VALUES ('3', '3', '164', '171', '1', '1', '1', '1', '1');
INSERT INTO `contrac_task` VALUES ('4', '2', '166', '173', '111', '111', '11', '11', '11');

-- ----------------------------
-- Table structure for `contract_message`
-- ----------------------------
DROP TABLE IF EXISTS `contract_message`;
CREATE TABLE `contract_message` (
  `uid` int(11) NOT NULL auto_increment COMMENT '主键',
  `contracNo` varchar(254) default NULL COMMENT '合同编号',
  `businessType` varchar(254) default NULL COMMENT '业务类型',
  `houseNo` varchar(254) default NULL COMMENT '房源编号',
  `customerNo` varchar(254) default NULL COMMENT '客源编号',
  `contractSum` varchar(254) default NULL COMMENT '合同金额',
  `signDate` varchar(254) default NULL COMMENT '签定日期',
  `signPerson` varchar(254) default NULL COMMENT '签约人员',
  `inputPerson` varchar(254) default NULL COMMENT '登记人',
  `ownerName` varchar(254) default NULL COMMENT '业主姓名',
  `ownerPhone` varchar(254) default NULL COMMENT '业主电话',
  `ownerIdentityCard` varchar(254) default NULL COMMENT '业主身份证号',
  `ownerIDScanCopy` varchar(254) default NULL COMMENT '业主身份证扫描件',
  `ownerAddress` varchar(254) default NULL COMMENT '业主联系地址',
  `ownerCommission` varchar(254) default NULL COMMENT '业主佣金',
  `customerCommission` varchar(254) default NULL COMMENT '客户佣金',
  `attachItem` varchar(254) default NULL COMMENT '附加条款',
  `remark` varchar(254) default NULL COMMENT '备注信息',
  `contractScanCopy` varchar(254) default NULL COMMENT '合同扫描件',
  `approveOpinion` varchar(254) default NULL COMMENT '审核意见',
  `inputDate` varchar(254) default NULL COMMENT '登记日期',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='合同信息';

-- ----------------------------
-- Records of contract_message
-- ----------------------------
INSERT INTO `contract_message` VALUES ('2', '11', '154', '11', '11', '111', '11', '111', '11', '111', '111', '111', '111', '11', '11', '11', '11', '11', '11', '1', '1');
INSERT INTO `contract_message` VALUES ('3', '22', '153', '11', '11', '111', '11', '111', '11', '111', '111', '111', '111', '11', '11', '11', '11', '11', '11', '1', '1');

-- ----------------------------
-- Table structure for `customer_message`
-- ----------------------------
DROP TABLE IF EXISTS `customer_message`;
CREATE TABLE `customer_message` (
  `uid` int(11) NOT NULL auto_increment COMMENT '主键',
  `customerNo` varchar(254) default NULL COMMENT '客户编号',
  `name` varchar(254) default NULL COMMENT '客户姓名',
  `gender` varchar(254) default NULL COMMENT '客户性别',
  `phone` varchar(254) default NULL COMMENT '联系电话',
  `customerType` varchar(254) default NULL COMMENT '客户类型',
  `identityCard` varchar(254) default NULL COMMENT '身份证号',
  `IDScanCopy` varchar(254) default NULL COMMENT '身份证扫描件',
  `rmark` varchar(254) default NULL COMMENT '客户备注',
  `address` varchar(254) default NULL COMMENT '客户联系地址',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='客户信息';

-- ----------------------------
-- Records of customer_message
-- ----------------------------
INSERT INTO `customer_message` VALUES ('2', '11', '11', '186', '11', '137', '11', '11', '11', '11');

-- ----------------------------
-- Table structure for `house_message`
-- ----------------------------
DROP TABLE IF EXISTS `house_message`;
CREATE TABLE `house_message` (
  `uid` int(11) NOT NULL auto_increment COMMENT '主键',
  `payMode` varchar(254) default NULL COMMENT '付款方式',
  `city` varchar(254) default NULL COMMENT '城市',
  `county` varchar(254) default NULL COMMENT '区县',
  `zone` varchar(254) default NULL COMMENT '小区（街道）',
  `buildNo` varchar(254) default NULL COMMENT '栋号',
  `unitNo` varchar(254) default NULL COMMENT '单元号',
  `allFloor` varchar(254) default NULL COMMENT '总层',
  `floor` varchar(254) default NULL COMMENT '楼层',
  `doorNo` varchar(254) default NULL COMMENT '门牌号',
  `direction` varchar(254) default NULL COMMENT '朝向',
  `buildYear` varchar(254) default NULL COMMENT '建造年代',
  `houseType` varchar(254) default NULL COMMENT '房型',
  `decorateDegree` varchar(254) default NULL COMMENT '装修程度',
  `property` varchar(254) default NULL COMMENT '性质',
  `buildType` varchar(254) default NULL COMMENT '房产类型',
  `rightType` varchar(254) default NULL COMMENT '产权类型',
  `rightYear` varchar(254) default NULL COMMENT '产权年限',
  `buildArea` varchar(254) default NULL COMMENT '建筑面积',
  `useArea` varchar(254) default NULL COMMENT '使用面积',
  `source` varchar(254) default NULL COMMENT '来源',
  `structure` varchar(254) default NULL COMMENT '结构',
  `license` varchar(254) default NULL COMMENT '产证',
  `facility` varchar(254) default NULL COMMENT '设施',
  `traffic` varchar(254) default NULL COMMENT '交通情况',
  `pubilcRemark` varchar(254) default NULL COMMENT '公开备注',
  `privateRemark` varchar(254) default NULL COMMENT '保密备注',
  `keyNo` varchar(254) default NULL COMMENT '钥匙编号',
  `garageDesc` varchar(254) default NULL COMMENT '车库说明',
  `totalPrice` varchar(254) default NULL COMMENT '总价',
  `publishTime` varchar(254) default NULL COMMENT '发布时间',
  `houseNo` varchar(254) default NULL COMMENT '房源编号',
  `status` varchar(254) default NULL COMMENT '状态',
  `priceCondition` varchar(254) default NULL COMMENT '价格条件',
  `viewMethod` varchar(254) default NULL COMMENT '看房方式',
  `unitPrice` varchar(254) default NULL COMMENT '单价',
  `updateTime` varchar(254) default NULL COMMENT '更新时间',
  `createPerson` varchar(254) default NULL COMMENT '创建人',
  `housePicture` varchar(254) default NULL COMMENT '房源图片',
  `ownerMessage` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='房源信息';

-- ----------------------------
-- Records of house_message
-- ----------------------------
INSERT INTO `house_message` VALUES ('3', '100', '222', '333', '444', '555', '111', '222', '111', '11', '13', '111', '31', '24', '29', '41', '58', '11', '11', '111', '65', '74', '11', '90,85,89,87,82,81', '11', '11', '11', '11', '11', '11', '11', '11', '103', '113', '118', '111', '11', '11', '11', '2');
INSERT INTO `house_message` VALUES ('4', '100', '22', '2', '2', '2', '2', '2', '1111', '2', '21', '2', '43', '22', '28', '43', '59', '2', '2', '2', '62', '72', '2', '90,89,88,87', 'sdfasdf', '2', '2', '2', '2', '2', '2', '2', '103', '112', '118', '2', '2', '2', '2', '2');

-- ----------------------------
-- Table structure for `owner_message`
-- ----------------------------
DROP TABLE IF EXISTS `owner_message`;
CREATE TABLE `owner_message` (
  `uid` int(11) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(254) default NULL COMMENT '姓名',
  `gender` varchar(254) default NULL COMMENT '性别',
  `ownerType` varchar(254) default NULL COMMENT '业主类型',
  `phone` varchar(254) default NULL COMMENT '电话',
  `identityCard` varchar(254) default NULL COMMENT '身份证号码',
  `IDScanCopy` varchar(254) default NULL COMMENT '身份证扫描件',
  `ownerMemo` varchar(254) default NULL COMMENT '业主备注',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='业主信息';

-- ----------------------------
-- Records of owner_message
-- ----------------------------
INSERT INTO `owner_message` VALUES ('2', '111', '186', '121', '111', '111', '111', '111');

-- ----------------------------
-- Table structure for `remind`
-- ----------------------------
DROP TABLE IF EXISTS `remind`;
CREATE TABLE `remind` (
  `uid` int(11) NOT NULL auto_increment,
  `content` varchar(254) default NULL,
  `startTime` varchar(30) default NULL,
  `endTime` varchar(30) default NULL,
  `owner` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remind
-- ----------------------------
INSERT INTO `remind` VALUES ('3', '111', '2014-06-19', '2014-06-19', '1');

-- ----------------------------
-- Table structure for `result_distribute`
-- ----------------------------
DROP TABLE IF EXISTS `result_distribute`;
CREATE TABLE `result_distribute` (
  `uid` int(11) NOT NULL auto_increment COMMENT '主键',
  `contracNo` varchar(254) default NULL COMMENT '合同编号',
  `commissionSum` varchar(254) default NULL COMMENT '佣金总额',
  `validResult` varchar(254) default NULL COMMENT '可分业绩',
  `resultOwner` varchar(254) default NULL COMMENT '业绩归属人',
  `resultRatio` varchar(254) default NULL COMMENT '分成比例',
  `resultDate` varchar(254) default NULL COMMENT '业绩日期',
  `distributeDesc` varchar(254) default NULL COMMENT '分成说明',
  `resultType` varchar(254) default NULL COMMENT '业绩类型',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='业绩分成表';

-- ----------------------------
-- Records of result_distribute
-- ----------------------------
INSERT INTO `result_distribute` VALUES ('2', '11', '1', '1', '1', '1', '1', '1', '175');
INSERT INTO `result_distribute` VALUES ('3', '22', '1', '1', '1', '1', '1', '1', '183');

-- ----------------------------
-- Table structure for `trace_record`
-- ----------------------------
DROP TABLE IF EXISTS `trace_record`;
CREATE TABLE `trace_record` (
  `uid` int(11) NOT NULL auto_increment COMMENT '主键',
  `traceType` varchar(254) default NULL COMMENT '跟进类型',
  `businessType` varchar(254) default NULL COMMENT '业务类型',
  `traceDesc` varchar(254) default NULL COMMENT '跟进说明',
  `tracePerson` varchar(254) default NULL COMMENT '跟进人',
  `traceTime` varchar(254) default NULL COMMENT '跟进时间',
  `traceObj` int(11) default NULL COMMENT '跟进对象编号',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='跟进记录';

-- ----------------------------
-- Records of trace_record
-- ----------------------------
INSERT INTO `trace_record` VALUES ('3', '124', '159', '1', '1', '1', '1');
INSERT INTO `trace_record` VALUES ('4', '125', '158', '1', '1', '1', '1');
INSERT INTO `trace_record` VALUES ('5', '128', '158', '1111', '22222', '2222222', '2');

-- ----------------------------
-- Function structure for `func_getStr`
-- ----------------------------
DROP FUNCTION IF EXISTS `func_getStr`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_getStr`(f_string varchar(254)) RETURNS varchar(255) CHARSET utf8
BEGIN
DECLARE outer_begin int default 1;
DECLARE inner_begin int default 1;
DECLARE v_count int default 1;
DECLARE substr_code varchar(254) default '';
DECLARE substr varchar(254) default '';
DECLARE result varchar(254) default '';

while length(substring_index(f_string,',',v_count)) < length(f_string)
do
    set inner_begin = length(substring_index(f_string,',',v_count));
    set substr_code = SUBSTR(f_string,outer_begin,inner_begin-outer_begin+1);
    select text into  substr from basic_code_library where uid=substr_code;
    set outer_begin = inner_begin + 2;
    set v_count = v_count + 1;
    set result = concat(result,substr,', ');
end while;
    set substr_code = concat(result,SUBSTR(f_string,outer_begin,length(f_string)));
    select text into substr from basic_code_library where uid=substr_code;
    set result = concat(result,substr);
return result;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getCodeNo`
-- ----------------------------
DROP FUNCTION IF EXISTS `getCodeNo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCodeNo`(in_codeCatalogUid int) RETURNS varchar(20) CHARSET utf8
begin
    declare out_codeNo varchar(20);
    
    select codeNo into out_codeNo from basic_code_catalog where uid=in_codeCatalogUid;
   
    return out_codeNo;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getDeptId`
-- ----------------------------
DROP FUNCTION IF EXISTS `getDeptId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDeptId`(in_deptUid int) RETURNS varchar(20) CHARSET utf8
begin
    declare out_deptId varchar(20);
    
    select deptId into out_deptId from basic_department where uid=in_deptUid;    
    return out_deptId;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getDeptName`
-- ----------------------------
DROP FUNCTION IF EXISTS `getDeptName`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDeptName`(in_deptUid int) RETURNS varchar(50) CHARSET utf8
begin
    declare out_deptName varchar(50);
    
    select deptName into out_deptName from basic_department where uid=in_deptUid;
    
    return out_deptName;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getItemText`
-- ----------------------------
DROP FUNCTION IF EXISTS `getItemText`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getItemText`(in_codeLibraryUid int) RETURNS varchar(30) CHARSET utf8
begin
    declare out_text varchar(30);
    select text into out_text from basic_code_library where uid=in_codeLibraryUid;
      
    return out_text;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getItemValue`
-- ----------------------------
DROP FUNCTION IF EXISTS `getItemValue`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getItemValue`(in_codeLibraryUid int) RETURNS varchar(30) CHARSET utf8
begin
    declare out_value varchar(30);
    select value into out_value from basic_code_library where uid=in_codeLibraryUid;
      
    return out_value;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getParentDept`
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentDept`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getParentDept`(in_deptUid int) RETURNS int(11)
begin
    declare out_parentDeptUid int;
    
    select parentDept into out_parentDeptUid from basic_department where uid=in_deptUid;
   
    return out_parentDeptUid;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getRoleId`
-- ----------------------------
DROP FUNCTION IF EXISTS `getRoleId`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getRoleId`(in_roleUid int) RETURNS varchar(20) CHARSET utf8
begin
    declare out_roleId varchar(20);
    
    select roleId into out_roleId from basic_role where uid=in_roleUid;
   
    return out_roleId;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getUserBelongDept`
-- ----------------------------
DROP FUNCTION IF EXISTS `getUserBelongDept`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getUserBelongDept`(in_userUid int) RETURNS int(11)
begin
    declare out_deptUid int;
    
    select belongDept into out_deptUid from basic_user where uid=in_userUid;
   
    return out_deptUid;
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getUserName`
-- ----------------------------
DROP FUNCTION IF EXISTS `getUserName`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getUserName`(in_userUid int) RETURNS varchar(50) CHARSET utf8
begin
    declare out_userName varchar(50);
    
    select userName into out_userName from basic_user where uid=in_userUid;
    
    return out_userName;
end
;;
DELIMITER ;
