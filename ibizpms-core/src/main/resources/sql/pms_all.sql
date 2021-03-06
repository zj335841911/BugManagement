SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ibzcfg
-- ----------------------------
DROP TABLE IF EXISTS `ibzcfg`;
CREATE TABLE `ibzcfg`  (
  `CFGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SYSTEMID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `CFGTYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `TARGETTYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `USERID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `CFG` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '??????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`CFGID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ibzdataaudit
-- ----------------------------
DROP TABLE IF EXISTS `ibzdataaudit`;
CREATE TABLE `ibzdataaudit`  (
  `DATAAUDITID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OPPERSONID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `OPPERSONNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `AUDITTYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `OPTIME` date NULL DEFAULT NULL COMMENT '????????????',
  `IPADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `AUDITOBJECTDATA` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????????????????',
  `AUDITOBJECT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????????????????',
  `AUDITINFO` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `ISDATACHANGED` int(11) NULL DEFAULT NULL COMMENT '??????????????????????????????',
  PRIMARY KEY (`DATAAUDITID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ibzfile
-- ----------------------------
DROP TABLE IF EXISTS `ibzfile`;
CREATE TABLE `ibzfile`  (
  `FILEID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FILEPATH` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FOLDER` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATEDATE` date NULL DEFAULT NULL,
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UPDATEDATE` date NULL DEFAULT NULL,
  `FILEEXT` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FILESIZE` int(11) NULL DEFAULT NULL,
  `DIGESTCODE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OWNERTYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OWNERID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MEMO` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESERVER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`FILEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ibzuser
-- ----------------------------
DROP TABLE IF EXISTS `ibzuser`;
CREATE TABLE `ibzuser`  (
  `USERID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PERSONNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERCODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LOGINNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DOMAINS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MDEPTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MDEPTCODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MDEPTNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BCODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `POSTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `POSTCODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `POSTNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORGCODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ORGNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NICKNAME` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESERVER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERICON` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SEX` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BIRTHDAY` date NULL DEFAULT NULL,
  `CERTCODE` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADDR` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `THEME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FONTSIZE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LANG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MEMO` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SUPERUSER` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`USERID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_dynadashboard
-- ----------------------------
DROP TABLE IF EXISTS `t_dynadashboard`;
CREATE TABLE `t_dynadashboard`  (
  `USERID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `DYNADASHBOARDID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `DYNADASHBOARDNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `MODELID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `APPID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `MODEL` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '??????',
  PRIMARY KEY (`DYNADASHBOARDID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_keyword
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_keyword`;
CREATE TABLE `t_ibizpro_keyword`  (
  `IBIZPRO_KEYWORDID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????????????',
  `IBIZPRO_KEYWORDNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`IBIZPRO_KEYWORDID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '?????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_message
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_message`;
CREATE TABLE `t_ibizpro_message`  (
  `IBIZPRO_MESSAGENAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `IBIZPRO_MESSAGEID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `SUBJECT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `CONTENT` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '??????',
  `TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ISLINK` int(11) NULL DEFAULT NULL COMMENT '?????????????????????	',
  `ISSYNC` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `ISRETRY` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `RETRYTIMES` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `RETRYINTERVALTIME` int(11) NULL DEFAULT NULL COMMENT '??????????????????',
  `FROM` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '?????????',
  `TO` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '?????????',
  `CC` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '?????????',
  `BCC` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '???????????????',
  `PARAM` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  PRIMARY KEY (`IBIZPRO_MESSAGEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_messageobject
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_messageobject`;
CREATE TABLE `t_ibizpro_messageobject`  (
  `IBIZPRO_MESSAGEOBJECTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `IBIZPRO_MESSAGEOBJECTNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `OBJECTTYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `OBJECTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBIZPRO_MESSAGEOBJECTID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_messageproxy
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_messageproxy`;
CREATE TABLE `t_ibizpro_messageproxy`  (
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `IBIZPRO_MESSAGEPROXYID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `IBIZPRO_MESSAGEPROXYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `PARAM` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `LINKSUPPORTTYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `LINKURL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `LINKEXMSG` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `PLUGINID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBIZPRO_MESSAGEPROXYID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_messagesend
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_messagesend`;
CREATE TABLE `t_ibizpro_messagesend`  (
  `IBIZPRO_MESSAGESENDID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `IBIZPRO_MESSAGESENDNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `ISSEND` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `ISREAD` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `ISERROR` int(11) NULL DEFAULT NULL COMMENT '??????????????????',
  `ERRORMSG` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '?????????????????????????????????',
  `RETRYCOUNT` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `ISDONE` int(11) NULL DEFAULT NULL COMMENT '???????????????',
  `RECIVER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `SENDER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`IBIZPRO_MESSAGESENDID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_plugin
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_plugin`;
CREATE TABLE `t_ibizpro_plugin`  (
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `IBIZPRO_PLUGINNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `IBIZPRO_PLUGINID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `DOWNLOADURL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `TAG` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `VERSION` int(11) NULL DEFAULT NULL COMMENT '??????',
  `KEYWORD` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`IBIZPRO_PLUGINID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_productdaily
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_productdaily`;
CREATE TABLE `t_ibizpro_productdaily`  (
  `IBIZPRO_PRODUCTDAILYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `IBIZPRO_PRODUCTDAILYID` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '??????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `PO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `PRODUCT` bigint(8) UNSIGNED NULL DEFAULT NULL COMMENT '??????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '??????',
  `TASKS` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `TOTALESTIMATES` double NULL DEFAULT NULL COMMENT '?????????',
  `BEGIN` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `END` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBIZPRO_PRODUCTDAILYID`) USING BTREE,
  INDEX `F9095C63C139531A07`(`PRODUCT`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_productmonthly
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_productmonthly`;
CREATE TABLE `t_ibizpro_productmonthly`  (
  `IBIZPRO_PRODUCTMONTHLYID` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '??????????????????',
  `IBIZPRO_PRODUCTMONTHLYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `PRODUCT` bigint(8) UNSIGNED NULL DEFAULT NULL COMMENT '????????????',
  `TOTALESTIMATES` double NULL DEFAULT NULL COMMENT '?????????',
  `TASKS` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '??????',
  `YEAR_MONTH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`IBIZPRO_PRODUCTMONTHLYID`) USING BTREE,
  INDEX `F41D6ED435CA8E3EDF`(`PRODUCT`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_productweekly
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_productweekly`;
CREATE TABLE `t_ibizpro_productweekly`  (
  `TOTALESTIMATES` double NULL DEFAULT NULL COMMENT '?????????',
  `TASKS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `PO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '??????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `IBIZPRO_PRODUCTDAILYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `IBIZPRO_PRODUCTWEEKLYID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '??????????????????',
  `PRODUCT` bigint(8) UNSIGNED NULL DEFAULT NULL COMMENT '??????',
  `BEGINDATESTATS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ENDDATESTATS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBIZPRO_PRODUCTWEEKLYID`) USING BTREE,
  INDEX `F58DB8C6F9A07CC107`(`PRODUCT`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_projectdaily
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_projectdaily`;
CREATE TABLE `t_ibizpro_projectdaily`  (
  `IBIZPRO_PROJECTDAILYID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `IBIZPRO_PROJECTDAILYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `PROJECT` bigint(8) UNSIGNED NULL DEFAULT NULL COMMENT '????????????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '??????',
  `TASKS` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `TOTALESTIMATES` double NULL DEFAULT NULL COMMENT '?????????',
  `PM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `BEGIN` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `END` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBIZPRO_PROJECTDAILYID`) USING BTREE,
  INDEX `F66DEA26CB54BFB9E9`(`PROJECT`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_projectmonthly
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_projectmonthly`;
CREATE TABLE `t_ibizpro_projectmonthly`  (
  `IBIZPRO_PROJECTMONTHLYID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `IBIZPRO_PROJECTMONTHLYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `PROJECT` bigint(8) UNSIGNED NULL DEFAULT NULL COMMENT '????????????',
  `TOTALESTIMATES` double NULL DEFAULT NULL COMMENT '?????????',
  `TASKS` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '??????',
  `YEAR_MONTH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`IBIZPRO_PROJECTMONTHLYID`) USING BTREE,
  INDEX `F752EAF91D2F853A62`(`PROJECT`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_tag`;
CREATE TABLE `t_ibizpro_tag`  (
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `IBIZPRO_TAGNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `IBIZPRO_TAGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBIZPRO_TAGID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibizpro_todomessage
-- ----------------------------
DROP TABLE IF EXISTS `t_ibizpro_todomessage`;
CREATE TABLE `t_ibizpro_todomessage`  (
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CONTENT` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `SUBJECT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `FROM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `IBIZPRO_MESSAGEID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????',
  `IBIZPRO_MESSAGENAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `TO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `ISREAD` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `PARAM` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `SENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBIZPRO_MESSAGEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ToDo??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_agent
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_agent`;
CREATE TABLE `t_ibz_agent`  (
  `IBZ_AGENTID` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `IBZ_AGENTNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `AGENTUSER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `AGENTBEGIN` datetime(0) NULL DEFAULT NULL COMMENT '??????????????????',
  `AGENTEND` datetime(0) NULL DEFAULT NULL COMMENT '??????????????????',
  `CREATEMANNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`IBZ_AGENTID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_daily
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_daily`;
CREATE TABLE `t_ibz_daily`  (
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `IBZ_DAILYID` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `IBZ_DAILYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `DATE` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '??????',
  `ACCOUNT` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `WORKTODAY` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `MAILTO` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `TODAYTASK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ISSUBMIT` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `PLANSTOMORROW` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `TOMORROWPLANSTASK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `REPORTTO` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `COMMENT` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `CREATEMANNAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `UPDATEMANNAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `REPORTSTATUS` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `SUBMITTIME` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '????????????',
  PRIMARY KEY (`IBZ_DAILYID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2380 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_favorites
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_favorites`;
CREATE TABLE `t_ibz_favorites`  (
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `IBZ_FAVORITESID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `IBZ_FAVORITESNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL,
  `OBJECTID` int(11) NULL DEFAULT NULL COMMENT '??????????????????',
  `ACCOUNT` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`IBZ_FAVORITESID`) USING BTREE,
  INDEX `TYPE_ACCOUNT_OBJECTID`(`TYPE`, `ACCOUNT`, `OBJECTID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_monthly
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_monthly`;
CREATE TABLE `t_ibz_monthly`  (
  `IBZ_MONTHLYID` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `IBZ_MONTHLYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '??????',
  `ACCOUNT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `WORKTHISMONTH` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `PLANSNEXTMONTH` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `REPORTTO` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `MAILTO` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `COMMENT` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `THISMONTHTASK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `NEXTMONTHPLANSTASK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `ISSUBMIT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMANNAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `REPORTSTATUS` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `CREATEMANNAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `SUBMITTIME` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBZ_MONTHLYID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_plantemplet
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_plantemplet`;
CREATE TABLE `t_ibz_plantemplet`  (
  `IBZ_PLANTEMPLETID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `IBZ_PLANTEMPLETNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `PLANS` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `PRODUCT` bigint(20) NULL DEFAULT NULL COMMENT '??????',
  `ACL` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `CREATEMANNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`IBZ_PLANTEMPLETID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_plantempletdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_plantempletdetail`;
CREATE TABLE `t_ibz_plantempletdetail`  (
  `IBZ_PLANTEMPLETDETAILID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `IBZ_PLANTEMPLETDETAILNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `PLANTEMPLETID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `PLANCODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ORDER` int(11) NULL DEFAULT NULL COMMENT '??????',
  `DESC` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `EXPECT` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '??????',
  `TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`IBZ_PLANTEMPLETDETAILID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_productlife
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_productlife`;
CREATE TABLE `t_ibz_productlife`  (
  `BRANCH` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????/??????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `IBZ_PRODUCTLIFENAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `PRODUCT` int(11) NULL DEFAULT NULL COMMENT '??????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `PARENT` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `YEAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `TYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `MARKER` int(11) NULL DEFAULT NULL COMMENT '?????????',
  `BEGIN` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `IBZ_PRODUCTLIFEID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `END` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBZ_PRODUCTLIFEID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_report_role_config
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_report_role_config`;
CREATE TABLE `t_ibz_report_role_config`  (
  `IBZ_REPORT_ROLE_CONFIGNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `IBZ_REPORT_ROLE_CONFIGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `REPORT_ROLE` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`IBZ_REPORT_ROLE_CONFIGID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_reportly
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_reportly`;
CREATE TABLE `t_ibz_reportly`  (
  `IBZ_REPORTLYID` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `IBZ_REPORTLYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CONTENT` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `REPORTTO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `MAILTO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `ISSUBMIT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `SUBMITTIME` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `ACCOUNT` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `REPORTSTATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`IBZ_REPORTLYID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_systpl
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_systpl`;
CREATE TABLE `t_ibz_systpl`  (
  `IBZ_SYSTPLID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `IBZ_SYSTPLNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL,
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`IBZ_SYSTPLID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_top
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_top`;
CREATE TABLE `t_ibz_top`  (
  `IBZ_TOPID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `IBZ_TOPNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL,
  `TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `OBJECTID` int(11) NULL DEFAULT NULL COMMENT '??????????????????',
  `OBJECTORDER` int(11) NULL DEFAULT NULL COMMENT '??????',
  `ACCOUNT` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBZ_TOPID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibz_weekly
-- ----------------------------
DROP TABLE IF EXISTS `t_ibz_weekly`;
CREATE TABLE `t_ibz_weekly`  (
  `IBZ_WEEKLYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `IBZ_WEEKLYID` bigint(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `ACCOUNT` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `MAILTO` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `ISSUBMIT` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `REPORTTO` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `COMMENT` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '??????',
  `WORKTHISWEEK` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `PLANNEXTWEEK` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `THISWEEKTASK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `NEXTWEEKTASK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `UPDATEMANNAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `CREATEMANNAME` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `REPORTSTATUS` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `SUBMITTIME` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBZ_WEEKLYID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 615 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibzpro_config
-- ----------------------------
DROP TABLE IF EXISTS `t_ibzpro_config`;
CREATE TABLE `t_ibzpro_config`  (
  `IBZPRO_CONFIGNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????????????????',
  `IBZPRO_CONFIGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '?????????????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `SCOPE` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `GROUP` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `VAILD` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `MEMO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `MANAGEMENTSTATUS` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBZPRO_CONFIGID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibzpro_projectweekly
-- ----------------------------
DROP TABLE IF EXISTS `t_ibzpro_projectweekly`;
CREATE TABLE `t_ibzpro_projectweekly`  (
  `IBZPRO_PROJECTWEEKLYNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `IBZPRO_PROJECTWEEKLYID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `PM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `TOTALESTIMATES` double NULL DEFAULT NULL COMMENT '?????????',
  `TASKS` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `DATE` datetime(0) NULL DEFAULT NULL COMMENT '??????',
  `PROJECT` bigint(8) UNSIGNED NULL DEFAULT NULL COMMENT '????????????',
  `WEEK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `YEAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `MONTH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `BEGINDATESTATS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ENDDATESTATS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`IBZPRO_PROJECTWEEKLYID`) USING BTREE,
  INDEX `FA9A870079F6BCF22A`(`PROJECT`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibzpro_system
-- ----------------------------
DROP TABLE IF EXISTS `t_ibzpro_system`;
CREATE TABLE `t_ibzpro_system`  (
  `IBZPRO_SYSTEMID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `IBZPRO_SYSTEMNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`IBZPRO_SYSTEMID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_ibzpro_systpl
-- ----------------------------
DROP TABLE IF EXISTS `t_ibzpro_systpl`;
CREATE TABLE `t_ibzpro_systpl`  (
  `IBZPRO_SYSTPLID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `IBZPRO_SYSTPLNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL,
  `PUBLIC` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `IBIZ_SOURCEOBJECT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `CONTENT` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `TPLTYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IBIZ????????????',
  `FILE` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT 'id',
  PRIMARY KEY (`IBZPRO_SYSTPLID`) USING BTREE,
  INDEX `FFD0FBE185A072627C`(`FILE`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_update_features
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_update_features`;
CREATE TABLE `t_sys_update_features`  (
  `SYS_UPDATE_FEATURESNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `SYS_UPDATE_FEATURESID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `SYS_UPDATE_LOGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `UPFEATURES` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `FEATURESDESC` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `DISPLAYORDER` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `SYS_UPDATE_LOG` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  PRIMARY KEY (`SYS_UPDATE_FEATURESID`) USING BTREE,
  INDEX `F4E719C7322A682CBD`(`SYS_UPDATE_LOG`) USING BTREE,
  INDEX `F4F285C7ACBBE2262F`(`SYS_UPDATE_LOGID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_update_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_update_log`;
CREATE TABLE `t_sys_update_log`  (
  `SYS_UPDATE_LOGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `SYS_UPDATE_LOGNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `UPDESC` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `LATESTUPDATE` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `UPDATEBRANCH` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`SYS_UPDATE_LOGID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_taskmsgrecord
-- ----------------------------
DROP TABLE IF EXISTS `t_taskmsgrecord`;
CREATE TABLE `t_taskmsgrecord`  (
  `TASKMSGRECORDID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????????????????',
  `CREATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `TASKMSGRECORDNAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????????????????',
  `ENABLE` int(11) NULL DEFAULT NULL COMMENT '??????????????????',
  `UPDATEDATE` datetime(0) NULL DEFAULT NULL,
  `UPDATEMAN` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `TASKUSERID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `APPTASKID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????????????????',
  `TASKTYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `MEMO` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `DATAID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`TASKMSGRECORDID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_action
-- ----------------------------
DROP TABLE IF EXISTS `zt_action`;
CREATE TABLE `zt_action`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `objectType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `objectID` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `product` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `project` mediumint(9) NOT NULL,
  `actor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `action` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `date` datetime(0) NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `read` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `date`(`date`) USING BTREE,
  INDEX `actor`(`actor`) USING BTREE,
  INDEX `project`(`project`) USING BTREE,
  INDEX `objectID_OBJECTTYPE`(`objectID`, `objectType`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 67502 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_block
-- ----------------------------
DROP TABLE IF EXISTS `zt_block`;
CREATE TABLE `zt_block`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `source` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `block` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `grid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `height` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `hidden` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `accountModuleOrder`(`account`, `module`, `order`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_branch
-- ----------------------------
DROP TABLE IF EXISTS `zt_branch`;
CREATE TABLE `zt_branch`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` smallint(5) UNSIGNED NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_bug
-- ----------------------------
DROP TABLE IF EXISTS `zt_bug`;
CREATE TABLE `zt_bug`  (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `branch` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `module` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `plan` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `story` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `storyVersion` smallint(6) NOT NULL DEFAULT 1,
  `task` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `toTask` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `toStory` mediumint(8) NOT NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `severity` tinyint(4) NOT NULL DEFAULT 0,
  `pri` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `os` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `browser` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `hardware` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `found` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `steps` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('active','resolved','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'active',
  `subStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `color` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `activatedCount` smallint(6) NOT NULL,
  `activatedDate` datetime(0) NOT NULL,
  `mailto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `openedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `openedDate` datetime(0) NOT NULL,
  `openedBuild` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `assignedTo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `assignedDate` datetime(0) NOT NULL,
  `deadline` date NOT NULL,
  `resolvedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `resolution` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `resolvedBuild` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `resolvedDate` datetime(0) NOT NULL,
  `closedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `closedDate` datetime(0) NOT NULL,
  `duplicateBug` mediumint(8) UNSIGNED NOT NULL,
  `linkBug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `case` mediumint(8) UNSIGNED NOT NULL,
  `caseVersion` smallint(6) NOT NULL DEFAULT 1,
  `result` mediumint(8) UNSIGNED NOT NULL,
  `repo` mediumint(8) UNSIGNED NOT NULL,
  `entry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lines` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `v1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `v2` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repoType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `testtask` mediumint(8) UNSIGNED NOT NULL,
  `lastEditedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `lastEditedDate` datetime(0) NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `project`(`project`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `plan`(`plan`) USING BTREE,
  INDEX `story`(`story`) USING BTREE,
  INDEX `case`(`case`) USING BTREE,
  INDEX `assignedTo`(`assignedTo`) USING BTREE,
  INDEX `FBC549EB20D0091CA8`(`toStory`) USING BTREE,
  INDEX `F2D9B199EFCE9D11C9`(`entry`) USING BTREE,
  INDEX `FE9BAFE0B99BFA950C`(`toTask`) USING BTREE,
  INDEX `F2F5AE3C453BA66928`(`module`) USING BTREE,
  INDEX `FE78608389B0F8256E`(`branch`) USING BTREE,
  INDEX `F2121957B58E9AC70E`(`duplicateBug`) USING BTREE,
  INDEX `FADCD439791EF71575`(`repo`) USING BTREE,
  INDEX `F35B0FF93CF3498B28`(`task`) USING BTREE,
  INDEX `F2AAA7501573EA258E`(`testtask`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_build
-- ----------------------------
DROP TABLE IF EXISTS `zt_build`;
CREATE TABLE `zt_build`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `branch` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scmPath` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filePath` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `stories` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bugs` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `builder` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `CREATEBUGCNT` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '?????????bug',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `project`(`project`) USING BTREE,
  INDEX `F8A46A551C9DC16F40`(`branch`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_burn
-- ----------------------------
DROP TABLE IF EXISTS `zt_burn`;
CREATE TABLE `zt_burn`  (
  `project` mediumint(8) UNSIGNED NOT NULL,
  `task` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `estimate` float NOT NULL,
  `left` float NOT NULL,
  `consumed` float NOT NULL,
  PRIMARY KEY (`project`, `date`, `task`) USING BTREE,
  INDEX `F50C7A44EC35D2C2C5`(`task`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_case
-- ----------------------------
DROP TABLE IF EXISTS `zt_case`;
CREATE TABLE `zt_case`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `branch` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `lib` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `module` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `path` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `story` mediumint(30) UNSIGNED NOT NULL DEFAULT 0,
  `storyVersion` smallint(6) NOT NULL DEFAULT 1,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `precondition` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pri` tinyint(3) UNSIGNED NOT NULL DEFAULT 3,
  `type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `auto` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no',
  `frame` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `howRun` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scriptedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scriptedDate` date NOT NULL,
  `scriptStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scriptLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `subStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `color` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `frequency` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `order` tinyint(30) UNSIGNED NOT NULL DEFAULT 0,
  `openedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `openedDate` datetime(0) NOT NULL,
  `reviewedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reviewedDate` date NOT NULL,
  `lastEditedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `lastEditedDate` datetime(0) NOT NULL,
  `version` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `linkCase` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fromBug` mediumint(8) UNSIGNED NOT NULL,
  `fromCaseID` mediumint(8) UNSIGNED NOT NULL,
  `fromCaseVersion` mediumint(8) UNSIGNED NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `lastRunner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastRunDate` datetime(0) NOT NULL,
  `lastRunResult` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `story`(`story`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `FC94FB7363E9E779B1`(`fromCaseID`) USING BTREE,
  INDEX `F5BDF27B698BD5339F`(`branch`) USING BTREE,
  INDEX `F30260955C984B92AD`(`fromBug`) USING BTREE,
  INDEX `FDDBEF4CB165D6CF31`(`lib`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_casestep
-- ----------------------------
DROP TABLE IF EXISTS `zt_casestep`;
CREATE TABLE `zt_casestep`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `case` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `version` smallint(3) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'step',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expect` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case`(`case`) USING BTREE,
  INDEX `version`(`version`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_company
-- ----------------------------
DROP TABLE IF EXISTS `zt_company`;
CREATE TABLE `zt_company`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` char(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zipcode` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` char(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `backyard` char(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guest` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `admins` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_compile
-- ----------------------------
DROP TABLE IF EXISTS `zt_compile`;
CREATE TABLE `zt_compile`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job` mediumint(8) UNSIGNED NOT NULL,
  `queue` mediumint(8) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `atTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `testtask` mediumint(8) UNSIGNED NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `updateDate` datetime(0) NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_config
-- ----------------------------
DROP TABLE IF EXISTS `zt_config`;
CREATE TABLE `zt_config`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `section` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `key` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`owner`, `module`, `section`, `key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_cron
-- ----------------------------
DROP TABLE IF EXISTS `zt_cron`;
CREATE TABLE `zt_cron`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `m` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `h` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dom` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dow` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `command` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `buildin` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastTime` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lastTime`(`lastTime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_dept
-- ----------------------------
DROP TABLE IF EXISTS `zt_dept`;
CREATE TABLE `zt_dept`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `path` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `grade` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` smallint(4) UNSIGNED NOT NULL DEFAULT 0,
  `position` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `function` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `manager` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  INDEX `path`(`path`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_doc
-- ----------------------------
DROP TABLE IF EXISTS `zt_doc`;
CREATE TABLE `zt_doc`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL,
  `lib` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `views` smallint(5) UNSIGNED NOT NULL,
  `collector` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedDate` datetime(0) NOT NULL,
  `editedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editedDate` datetime(0) NOT NULL,
  `acl` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'open',
  `groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `users` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` smallint(5) UNSIGNED NOT NULL DEFAULT 1,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `project`(`project`) USING BTREE,
  INDEX `lib`(`lib`) USING BTREE,
  INDEX `module`(`module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_doccontent
-- ----------------------------
DROP TABLE IF EXISTS `zt_doccontent`;
CREATE TABLE `zt_doccontent`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `doc` mediumint(8) UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `digest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `files` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `doc_version`(`doc`, `version`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_doclib
-- ----------------------------
DROP TABLE IF EXISTS `zt_doclib`;
CREATE TABLE `zt_doclib`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acl` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'open',
  `groups` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `users` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `main` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `collector` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` tinyint(5) UNSIGNED NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `MDEPTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ORGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `project`(`project`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_effort
-- ----------------------------
DROP TABLE IF EXISTS `zt_effort`;
CREATE TABLE `zt_effort`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `todo` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `date` date NOT NULL,
  `begin` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `end` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `type` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `idvalue` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user`(`user`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_entry
-- ----------------------------
DROP TABLE IF EXISTS `zt_entry`;
CREATE TABLE `zt_entry`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `freePasswd` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `calledTime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `editedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editedDate` datetime(0) NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_extension
-- ----------------------------
DROP TABLE IF EXISTS `zt_extension`;
CREATE TABLE `zt_extension`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `license` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'extension',
  `site` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zentaoCompatible` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `installedTime` datetime(0) NOT NULL,
  `depends` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dirs` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `files` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `installedTime`(`installedTime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_file
-- ----------------------------
DROP TABLE IF EXISTS `zt_file`;
CREATE TABLE `zt_file`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pathname` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extension` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `objectType` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `objectID` mediumint(9) NOT NULL,
  `addedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `addedDate` datetime(0) NOT NULL,
  `downloads` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `objectType`(`objectType`) USING BTREE,
  INDEX `objectID`(`objectID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12759 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_group
-- ----------------------------
DROP TABLE IF EXISTS `zt_group`;
CREATE TABLE `zt_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `acl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_grouppriv
-- ----------------------------
DROP TABLE IF EXISTS `zt_grouppriv`;
CREATE TABLE `zt_grouppriv`  (
  `group` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `module` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `method` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  UNIQUE INDEX `group`(`group`, `module`, `method`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_history
-- ----------------------------
DROP TABLE IF EXISTS `zt_history`;
CREATE TABLE `zt_history`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `field` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `old` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `new` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `diff` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `action`(`action`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 166545 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_im_chat
-- ----------------------------
DROP TABLE IF EXISTS `zt_im_chat`;
CREATE TABLE `zt_im_chat`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'group',
  `admins` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `committers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `subject` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `public` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `createdBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `createdDate` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `editedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `editedDate` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `lastActiveTime` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `dismissDate` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gid`(`gid`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `public`(`public`) USING BTREE,
  INDEX `createdBy`(`createdBy`) USING BTREE,
  INDEX `editedBy`(`editedBy`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_im_chatuser
-- ----------------------------
DROP TABLE IF EXISTS `zt_im_chatuser`;
CREATE TABLE `zt_im_chatuser`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cgid` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user` mediumint(8) NOT NULL DEFAULT 0,
  `order` smallint(5) NOT NULL DEFAULT 0,
  `star` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `hide` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `mute` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `freeze` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `join` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `quit` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `category` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `chatuser`(`cgid`, `user`) USING BTREE,
  INDEX `cgid`(`cgid`) USING BTREE,
  INDEX `user`(`user`) USING BTREE,
  INDEX `order`(`order`) USING BTREE,
  INDEX `star`(`star`) USING BTREE,
  INDEX `hide`(`hide`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_im_client
-- ----------------------------
DROP TABLE IF EXISTS `zt_im_client`;
CREATE TABLE `zt_im_client`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `changeLog` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `strategy` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `downloads` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `createdBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `editedDate` datetime(0) NOT NULL,
  `editedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` enum('released','wait') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'wait',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_im_conference
-- ----------------------------
DROP TABLE IF EXISTS `zt_im_conference`;
CREATE TABLE `zt_im_conference`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cgid` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` enum('closed','open') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'closed',
  `participants` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openedBy` mediumint(8) NOT NULL DEFAULT 0,
  `openedDate` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_im_conferenceaction
-- ----------------------------
DROP TABLE IF EXISTS `zt_im_conferenceaction`;
CREATE TABLE `zt_im_conferenceaction`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid` char(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` enum('create','join','leave','close') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'create',
  `user` mediumint(8) NOT NULL DEFAULT 0,
  `date` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_im_message
-- ----------------------------
DROP TABLE IF EXISTS `zt_im_message`;
CREATE TABLE `zt_im_message`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cgid` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `date` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `order` bigint(8) UNSIGNED NOT NULL,
  `type` enum('normal','broadcast','notify') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contentType` enum('text','plain','emotion','image','file','object','code') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'text',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mgid`(`gid`) USING BTREE,
  INDEX `mcgid`(`cgid`) USING BTREE,
  INDEX `muser`(`user`) USING BTREE,
  INDEX `mtype`(`type`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_im_messagestatus
-- ----------------------------
DROP TABLE IF EXISTS `zt_im_messagestatus`;
CREATE TABLE `zt_im_messagestatus`  (
  `user` mediumint(8) NOT NULL DEFAULT 0,
  `message` int(11) UNSIGNED NOT NULL,
  `status` enum('waiting','sent','readed','deleted') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'waiting',
  UNIQUE INDEX `user`(`user`, `message`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_im_queue
-- ----------------------------
DROP TABLE IF EXISTS `zt_im_queue`;
CREATE TABLE `zt_im_queue`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addDate` datetime(0) NOT NULL,
  `processDate` datetime(0) NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_jenkins
-- ----------------------------
DROP TABLE IF EXISTS `zt_jenkins`;
CREATE TABLE `zt_jenkins`  (
  `id` smallint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `editedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editedDate` datetime(0) NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_job
-- ----------------------------
DROP TABLE IF EXISTS `zt_job`;
CREATE TABLE `zt_job`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repo` mediumint(8) UNSIGNED NOT NULL,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `frame` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jkHost` mediumint(8) UNSIGNED NOT NULL,
  `jkJob` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `triggerType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `svnDir` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `atDay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `atTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createdBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `editedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editedDate` datetime(0) NOT NULL,
  `lastExec` datetime(0) NULL DEFAULT NULL,
  `lastStatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastTag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_lang
-- ----------------------------
DROP TABLE IF EXISTS `zt_lang`;
CREATE TABLE `zt_lang`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lang` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `section` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `system` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lang`(`lang`, `module`, `section`, `key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_log
-- ----------------------------
DROP TABLE IF EXISTS `zt_log`;
CREATE TABLE `zt_log`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `objectType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `objectID` mediumint(8) UNSIGNED NOT NULL,
  `action` mediumint(8) UNSIGNED NOT NULL,
  `date` datetime(0) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contentType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `objectType`(`objectType`) USING BTREE,
  INDEX `obejctID`(`objectID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_module
-- ----------------------------
DROP TABLE IF EXISTS `zt_module`;
CREATE TABLE `zt_module`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `root` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `branch` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `parent` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `path` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `grade` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `collector` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `short` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `MDEPTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ORGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `IBIZ_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IBIZ??????',
  `IBIZ_STORYTYPE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `root`(`root`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `path`(`path`) USING BTREE,
  INDEX `branch`(`branch`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_notify
-- ----------------------------
DROP TABLE IF EXISTS `zt_notify`;
CREATE TABLE `zt_notify`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `objectType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `objectID` mediumint(8) UNSIGNED NOT NULL,
  `action` mediumint(9) NOT NULL,
  `toList` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ccList` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `sendTime` datetime(0) NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'wait',
  `failReason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_oauth
-- ----------------------------
DROP TABLE IF EXISTS `zt_oauth`;
CREATE TABLE `zt_oauth`  (
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `providerType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `providerID` mediumint(8) UNSIGNED NOT NULL,
  INDEX `account`(`account`) USING BTREE,
  INDEX `providerType`(`providerType`) USING BTREE,
  INDEX `providerID`(`providerID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_product
-- ----------------------------
DROP TABLE IF EXISTS `zt_product`;
CREATE TABLE `zt_product`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `line` mediumint(8) NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `subStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acl` enum('open','private','custom') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'open',
  `whitelist` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `createdVersion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` mediumint(8) UNSIGNED NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `MDEPTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ORGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `IBIZ_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IBIZ??????',
  `SUPPROREPORT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `PRODUCTCLASS` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `orgname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `mdeptname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `acl`(`acl`) USING BTREE,
  INDEX `order`(`order`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_productplan
-- ----------------------------
DROP TABLE IF EXISTS `zt_productplan`;
CREATE TABLE `zt_productplan`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `branch` mediumint(8) UNSIGNED NOT NULL,
  `parent` mediumint(9) NULL DEFAULT 0,
  `title` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `begin` date NULL DEFAULT NULL,
  `end` date NULL DEFAULT NULL,
  `order` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `STATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ENDACT` datetime(0) NULL DEFAULT NULL COMMENT '??????????????????',
  `BEGINACT` datetime(0) NULL DEFAULT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `end`(`end`) USING BTREE,
  INDEX `branch`(`branch`) USING BTREE,
  INDEX `DELETE_PARENT_PRODUCT_STA_TITLE`(`deleted`, `parent`, `product`, `STATUS`, `title`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 187 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_project
-- ----------------------------
DROP TABLE IF EXISTS `zt_project`;
CREATE TABLE `zt_project`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `isCat` enum('1','0') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `catID` mediumint(8) UNSIGNED NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sprint',
  `parent` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `days` smallint(5) UNSIGNED NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `statge` enum('1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `pri` enum('1','2','3','4') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `openedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `openedDate` datetime(0) NOT NULL,
  `openedVersion` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `closedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `closedDate` datetime(0) NULL DEFAULT NULL,
  `canceledBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `canceledDate` datetime(0) NULL DEFAULT NULL,
  `PO` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `PM` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `QD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `RD` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `team` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `acl` enum('open','private','custom') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'open',
  `whitelist` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` mediumint(8) UNSIGNED NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `MDEPTID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `ORGID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `SUPPROREPORT` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `PMSEEPROJECTINFO` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '??????????????????',
  `MDEPTNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `ORGNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  INDEX `begin`(`begin`) USING BTREE,
  INDEX `end`(`end`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `acl`(`acl`) USING BTREE,
  INDEX `order`(`order`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_projectproduct
-- ----------------------------
DROP TABLE IF EXISTS `zt_projectproduct`;
CREATE TABLE `zt_projectproduct`  (
  `project` mediumint(8) UNSIGNED NOT NULL,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `branch` mediumint(8) UNSIGNED NOT NULL,
  `plan` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`project`, `product`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `plan`(`plan`) USING BTREE,
  INDEX `branch`(`branch`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_projectstory
-- ----------------------------
DROP TABLE IF EXISTS `zt_projectstory`;
CREATE TABLE `zt_projectstory`  (
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `story` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `version` smallint(6) NOT NULL DEFAULT 1,
  `order` smallint(6) UNSIGNED NOT NULL,
  UNIQUE INDEX `project`(`project`, `story`) USING BTREE,
  INDEX `story`(`story`) USING BTREE,
  INDEX `product`(`product`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_relation
-- ----------------------------
DROP TABLE IF EXISTS `zt_relation`;
CREATE TABLE `zt_relation`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `program` mediumint(8) NOT NULL,
  `product` mediumint(8) NOT NULL,
  `project` mediumint(8) NOT NULL,
  `AType` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AID` mediumint(8) NOT NULL,
  `AVersion` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `relation` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BType` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BID` mediumint(8) NOT NULL,
  `BVersion` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `extra` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `relation`(`relation`, `AType`, `BType`, `AID`, `BID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_release
-- ----------------------------
DROP TABLE IF EXISTS `zt_release`;
CREATE TABLE `zt_release`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `branch` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `build` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `marker` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `stories` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bugs` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `leftBugs` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal',
  `subStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `build`(`build`) USING BTREE,
  INDEX `branch`(`branch`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_repo
-- ----------------------------
DROP TABLE IF EXISTS `zt_repo`;
CREATE TABLE `zt_repo`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prefix` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `encoding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SCM` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commits` mediumint(8) UNSIGNED NOT NULL,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `encrypt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'plain',
  `acl` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `synced` tinyint(1) NOT NULL DEFAULT 0,
  `lastSync` datetime(0) NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_repobranch
-- ----------------------------
DROP TABLE IF EXISTS `zt_repobranch`;
CREATE TABLE `zt_repobranch`  (
  `repo` mediumint(8) UNSIGNED NOT NULL,
  `revision` mediumint(8) UNSIGNED NOT NULL,
  `branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `repo_revision_branch`(`repo`, `revision`, `branch`) USING BTREE,
  INDEX `branch`(`branch`) USING BTREE,
  INDEX `revision`(`revision`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_repofiles
-- ----------------------------
DROP TABLE IF EXISTS `zt_repofiles`;
CREATE TABLE `zt_repofiles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `repo` mediumint(8) UNSIGNED NOT NULL,
  `revision` mediumint(8) UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `path`(`path`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  INDEX `repo`(`repo`) USING BTREE,
  INDEX `revision`(`revision`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_repohistory
-- ----------------------------
DROP TABLE IF EXISTS `zt_repohistory`;
CREATE TABLE `zt_repohistory`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `repo` mediumint(9) NOT NULL,
  `revision` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commit` mediumint(8) UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `committer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `repo`(`repo`) USING BTREE,
  INDEX `revision`(`revision`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_score
-- ----------------------------
DROP TABLE IF EXISTS `zt_score`;
CREATE TABLE `zt_score`  (
  `id` bigint(12) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `method` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `before` int(11) NOT NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `after` int(11) NOT NULL DEFAULT 0,
  `time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `model`(`module`) USING BTREE,
  INDEX `method`(`method`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_story
-- ----------------------------
DROP TABLE IF EXISTS `zt_story`;
CREATE TABLE `zt_story`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent` mediumint(9) NULL DEFAULT 0,
  `product` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `branch` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `module` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `plan` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `source` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sourceNote` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fromBug` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'story',
  `pri` tinyint(3) UNSIGNED NULL DEFAULT 3,
  `estimate` float UNSIGNED NULL DEFAULT NULL,
  `status` enum('','changed','active','draft','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `subStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `color` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage` enum('','wait','planned','projected','developing','developed','testing','tested','verified','released','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'wait',
  `stagedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mailto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `openedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openedDate` datetime(0) NULL DEFAULT NULL,
  `assignedTo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `assignedDate` datetime(0) NULL DEFAULT NULL,
  `lastEditedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `lastEditedDate` datetime(0) NULL DEFAULT NULL,
  `reviewedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reviewedDate` date NULL DEFAULT NULL,
  `closedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `closedDate` datetime(0) NULL DEFAULT NULL,
  `closedReason` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `toBug` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `childStories` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkStories` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duplicateStory` mediumint(8) UNSIGNED NULL DEFAULT NULL,
  `version` smallint(6) NULL DEFAULT 1,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `IBIZ_SOURCEOBJECT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `IBIZ_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IBIZ??????',
  `SOURCEOBJECT` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `SOURCEID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `IBIZ_SOURCENAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `IBIZ_SOURCEID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `SOURCENAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
  `STORYPOINTS` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
  `STORYLATESTFINISHEDDATE` datetime(0) NULL DEFAULT NULL COMMENT '????????????????????????',
  `STORYPROVIDEDATE` datetime(0) NULL DEFAULT NULL COMMENT '??????????????????',
  `STORYPROVIDER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `assignedTo`(`assignedTo`) USING BTREE,
  INDEX `fromBug`(`fromBug`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `duplicateStory`(`duplicateStory`) USING BTREE,
  INDEX `branch`(`branch`) USING BTREE,
  INDEX `toBug`(`toBug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_storyspec
-- ----------------------------
DROP TABLE IF EXISTS `zt_storyspec`;
CREATE TABLE `zt_storyspec`  (
  `story` mediumint(9) NOT NULL,
  `version` smallint(6) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `spec` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `verify` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `story`(`story`, `version`) USING BTREE,
  FULLTEXT INDEX `fulltitle_spec_storyspec`(`spec`)
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_storystage
-- ----------------------------
DROP TABLE IF EXISTS `zt_storystage`;
CREATE TABLE `zt_storystage`  (
  `story` mediumint(8) UNSIGNED NOT NULL,
  `branch` mediumint(8) UNSIGNED NOT NULL,
  `stage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stagedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `story_branch`(`story`, `branch`) USING BTREE,
  INDEX `story`(`story`) USING BTREE,
  INDEX `branch`(`branch`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_suitecase
-- ----------------------------
DROP TABLE IF EXISTS `zt_suitecase`;
CREATE TABLE `zt_suitecase`  (
  `suite` mediumint(8) UNSIGNED NOT NULL,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `case` mediumint(8) UNSIGNED NOT NULL,
  `version` smallint(5) UNSIGNED NOT NULL,
  UNIQUE INDEX `suitecase`(`suite`, `case`) USING BTREE,
  INDEX `product`(`product`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_task
-- ----------------------------
DROP TABLE IF EXISTS `zt_task`;
CREATE TABLE `zt_task`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent` mediumint(8) NOT NULL DEFAULT 0,
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `module` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `story` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `storyVersion` smallint(6) NOT NULL DEFAULT 1,
  `fromBug` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pri` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `estimate` float UNSIGNED NULL DEFAULT NULL,
  `consumed` float UNSIGNED NULL DEFAULT NULL,
  `left` float UNSIGNED NULL DEFAULT NULL,
  `deadline` date NULL DEFAULT NULL,
  `status` enum('wait','doing','done','pause','cancel','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'wait',
  `subStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `color` char(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mailto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `openedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `openedDate` datetime(0) NULL DEFAULT NULL,
  `assignedTo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignedDate` datetime(0) NULL DEFAULT NULL,
  `estStarted` date NULL DEFAULT NULL,
  `realStarted` date NULL DEFAULT NULL,
  `finishedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finishedDate` datetime(0) NULL DEFAULT NULL,
  `finishedList` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `canceledBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `canceledDate` datetime(0) NULL DEFAULT NULL,
  `closedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `closedDate` datetime(0) NULL DEFAULT NULL,
  `closedReason` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastEditedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastEditedDate` datetime(0) NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `TASKSPECIES` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `CONFIG_WEEK` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '??????????????????',
  `CONFIG_BEFOREDAYS` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `CONFIG_TYPE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `CONFIG_MONTH` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `PLAN` bigint(8) UNSIGNED NULL DEFAULT NULL COMMENT '??????',
  `CONFIG_BEGIN` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CYCLE` int(11) NULL DEFAULT NULL COMMENT '??????',
  `CONFIG_END` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `CONFIG_DAY` int(11) NULL DEFAULT NULL COMMENT '????????????',
  `IDVALUE` bigint(8) NULL DEFAULT NULL COMMENT '????????????',
  `ASSIGN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `INPUTCOST` double NULL DEFAULT NULL COMMENT '????????????',
  `ORDERNUM` int(11) NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `DELETE_PAR_STA_PROJECT`(`deleted`, `parent`, `status`, `project`) USING BTREE,
  INDEX `project`(`project`) USING BTREE,
  INDEX `story`(`story`) USING BTREE,
  INDEX `assignedTo`(`assignedTo`) USING BTREE,
  INDEX `F5F24CBB172AF38F63`(`PLAN`) USING BTREE,
  INDEX `module`(`module`) USING BTREE,
  INDEX `parent`(`parent`) USING BTREE,
  INDEX `fromBug`(`fromBug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22032 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_taskestimate
-- ----------------------------
DROP TABLE IF EXISTS `zt_taskestimate`;
CREATE TABLE `zt_taskestimate`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `date` date NOT NULL,
  `left` float UNSIGNED NOT NULL DEFAULT 0,
  `consumed` float UNSIGNED NOT NULL,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `work` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EVALUATIONCOST` double NULL DEFAULT NULL COMMENT '????????????',
  `INPUTCOST` double NULL DEFAULT NULL COMMENT '????????????',
  `EVALUATIONTIME` double NULL DEFAULT NULL COMMENT '????????????',
  `EVALUATIONSTATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `EVALUATIONDESC` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '????????????',
  `MONTHNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  `FILES` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
  `MINDATE` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '????????????????????????',
  `MAXDATE` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '????????????????????????',
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `task`(`task`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7038 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_team
-- ----------------------------
DROP TABLE IF EXISTS `zt_team`;
CREATE TABLE `zt_team`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `root` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('project','task','product') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'project',
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `limited` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no',
  `join` date NOT NULL DEFAULT '1970-01-01',
  `days` smallint(5) UNSIGNED NOT NULL,
  `hours` float(2, 1) UNSIGNED NOT NULL DEFAULT 0.0,
  `estimate` decimal(12, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `consumed` decimal(12, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `left` decimal(12, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `order` tinyint(3) NOT NULL DEFAULT 0,
  `TEAMSTATUS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
  `END` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `LEADINGCADRE` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_root`(`type`, `root`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 636 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_testreport
-- ----------------------------
DROP TABLE IF EXISTS `zt_testreport`;
CREATE TABLE `zt_testreport`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL,
  `tasks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `builds` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `owner` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `members` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stories` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bugs` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cases` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `report` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `objectType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `objectID` mediumint(8) UNSIGNED NOT NULL,
  `createdBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `project`(`project`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_testresult
-- ----------------------------
DROP TABLE IF EXISTS `zt_testresult`;
CREATE TABLE `zt_testresult`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `run` mediumint(8) UNSIGNED NOT NULL,
  `case` mediumint(8) UNSIGNED NOT NULL,
  `version` smallint(5) UNSIGNED NOT NULL,
  `job` mediumint(8) UNSIGNED NOT NULL,
  `compile` mediumint(8) UNSIGNED NOT NULL,
  `caseResult` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stepResults` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastRunner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime(0) NOT NULL,
  `duration` float NOT NULL,
  `xml` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `case`(`case`) USING BTREE,
  INDEX `version`(`version`) USING BTREE,
  INDEX `run`(`run`) USING BTREE,
  INDEX `job`(`job`) USING BTREE,
  INDEX `compile`(`compile`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_testrun
-- ----------------------------
DROP TABLE IF EXISTS `zt_testrun`;
CREATE TABLE `zt_testrun`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `case` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `version` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `assignedTo` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `lastRunner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastRunDate` datetime(0) NOT NULL,
  `lastRunResult` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `task`(`task`, `case`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_testsuite
-- ----------------------------
DROP TABLE IF EXISTS `zt_testsuite`;
CREATE TABLE `zt_testsuite`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `addedDate` datetime(0) NOT NULL,
  `lastEditedBy` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lastEditedDate` datetime(0) NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_testtask
-- ----------------------------
DROP TABLE IF EXISTS `zt_testtask`;
CREATE TABLE `zt_testtask`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product` mediumint(8) UNSIGNED NOT NULL,
  `project` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `build` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pri` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `mailto` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `report` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('blocked','doing','wait','done') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'wait',
  `auto` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no',
  `subStatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product`(`product`) USING BTREE,
  INDEX `build`(`build`) USING BTREE,
  INDEX `project`(`project`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_todo
-- ----------------------------
DROP TABLE IF EXISTS `zt_todo`;
CREATE TABLE `zt_todo`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `begin` smallint(4) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `end` smallint(4) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  `type` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cycle` tinyint(3) UNSIGNED NULL DEFAULT 0,
  `idvalue` mediumint(8) UNSIGNED NULL DEFAULT 0,
  `pri` tinyint(3) UNSIGNED NULL DEFAULT NULL,
  `name` char(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` enum('wait','doing','done','closed') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'wait',
  `private` tinyint(1) NULL DEFAULT NULL,
  `config` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignedTo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `assignedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `assignedDate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `finishedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `finishedDate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `closedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `closedDate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `COST` decimal(10, 2) NULL DEFAULT NULL COMMENT '??????',
  `CONSUMED` double NULL DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `assignedTo`(`assignedTo`) USING BTREE,
  INDEX `finishedBy`(`finishedBy`) USING BTREE,
  INDEX `date`(`date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_user
-- ----------------------------
DROP TABLE IF EXISTS `zt_user`;
CREATE TABLE `zt_user`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dept` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `nickname` char(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `commiter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '1970-01-01',
  `gender` enum('f','m') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'f',
  `email` char(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `skype` char(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `qq` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mobile` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `phone` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `weixin` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `dingding` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `slack` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `whatsapp` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` char(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `zipcode` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '1970-01-01',
  `visits` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `ip` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fails` tinyint(5) NOT NULL DEFAULT 0,
  `locked` datetime(0) NOT NULL DEFAULT '1970-01-01 00:00:00',
  `ranzhi` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT 0,
  `scoreLevel` int(11) NOT NULL DEFAULT 0,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `clientStatus` enum('online','away','busy','offline') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'offline',
  `clientLang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE,
  INDEX `dept`(`dept`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `commiter`(`commiter`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_usercontact
-- ----------------------------
DROP TABLE IF EXISTS `zt_usercontact`;
CREATE TABLE `zt_usercontact`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `listName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userList` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `zt_usergroup`;
CREATE TABLE `zt_usergroup`  (
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `group` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  UNIQUE INDEX `account`(`account`, `group`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zt_userquery
-- ----------------------------
DROP TABLE IF EXISTS `zt_userquery`;
CREATE TABLE `zt_userquery`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `module` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `form` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sql` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shortcut` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE,
  INDEX `module`(`module`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_usertpl
-- ----------------------------
DROP TABLE IF EXISTS `zt_usertpl`;
CREATE TABLE `zt_usertpl`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `public` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account`(`account`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_userview
-- ----------------------------
DROP TABLE IF EXISTS `zt_userview`;
CREATE TABLE `zt_userview`  (
  `account` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `products` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `projects` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zt_webhook
-- ----------------------------
DROP TABLE IF EXISTS `zt_webhook`;
CREATE TABLE `zt_webhook`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contentType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'application/json',
  `sendType` enum('sync','async') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'sync',
  `products` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `projects` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `params` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `actions` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createdDate` datetime(0) NOT NULL,
  `editedBy` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `editedDate` datetime(0) NOT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
