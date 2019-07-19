

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for a_baseinfo_company
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_company`;
CREATE TABLE `a_baseinfo_company` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `CompanyName` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司名称',
  `Identifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '统一社会信用代码',
  `Address` int(6) NOT NULL COMMENT '注册地行政区划代码',
  `BusinessScope` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '经营范围',
  `ContactAddress` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '通信地址',
  `EconomicType` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '经营业户经济类',
  `RegCapital` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '注册资本',
  `LegalName` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '法人代表姓名',
  `LegalID` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '法人代农身份证号',
  `LegalPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '法人代表电话',
  `LegalPhoto` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '法人代表身份证扫描 件文件编号',
  `State` tinyint(1) NOT NULL COMMENT '0有效1无效',
  `Flag` tinyint(1) NOT NULL COMMENT '1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_companyfare
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_companyfare`;
CREATE TABLE `a_baseinfo_companyfare` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) NOT NULL COMMENT '行政区划代码',
  `FareType` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '运价类型编码',
  `FareTypeNote` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '运价类型说明',
  `FareValidOn` bigint(14) NOT NULL COMMENT '运价有效期起',
  `FareValidOff` bigint(14) NOT NULL COMMENT '运价有效期止',
  `StartFare` int(10) NOT NULL COMMENT '起步价  单位:元',
  `StartMile` int(10) NOT NULL COMMENT '起步里程  单位:km',
  `UnitPricePerMile` int(10) NOT NULL COMMENT '计程单价(按公里)  单位:元',
  `UnitPricePerMinute` int(10) NOT NULL COMMENT '计时单价(按分钟)  单位:元',
  `UpPrice` int(10) DEFAULT NULL COMMENT '单程加价单价  单位:元',
  `UpPriceStartMile` int(10) DEFAULT NULL COMMENT '单程加价公里  单位:km',
  `MorningPeakTimeOn` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '营运早高峰时间起',
  `MorningPeakTimeOff` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '营运早高峰时间止',
  `EveningPeakTimeOn` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '营运晚高峰时间起',
  `EveningPeakTimeOff` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '营运晚高峰时间止',
  `OtherPeakTimeOn` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '其他营运高峰时间起',
  `OtherPeakTimeOff` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '其他营运高峰时间止',
  `PeakUnitPrice` int(10) NOT NULL COMMENT '高峰时间单程加价单价  单位:元',
  `PeakPriceStartMile` int(10) NOT NULL COMMENT '高峰时间里程加价公里  单位:km',
  `LowSpeedPricePerMinute` int(10) DEFAULT NULL COMMENT '低速计时加价(按分钟)  单位:元',
  `NightPricePerMile` int(10) DEFAULT NULL COMMENT '夜间费(按公里)  单位:元',
  `NightPricePerMinute` int(10) DEFAULT NULL COMMENT '夜间费(按分钟)  单位:元',
  `OtherPrice` int(10) DEFAULT NULL COMMENT '其他加价金额  单位:元',
  `State` int(1) NOT NULL COMMENT '状态(0.有效/1.失效)',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  `Flag` int(1) NOT NULL COMMENT '1新增2更新3删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_companypay
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_companypay`;
CREATE TABLE `a_baseinfo_companypay` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT '编号',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `PayName` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '银行或者非银行支付机构名称',
  `PayId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '非银行支付机构支付业务许可证编号',
  `PayType` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '支付业务类型',
  `PayScope` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '业务覆盖范围',
  `PrepareBank` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '备付金存管银行',
  `CountDate` int(10) NOT NULL COMMENT '结算周期',
  `State` tinyint(1) NOT NULL COMMENT '状态',
  `Flag` tinyint(1) NOT NULL COMMENT '1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_companypermit
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_companypermit`;
CREATE TABLE `a_baseinfo_companypermit` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` bigint(6) DEFAULT NULL COMMENT '许可地行政区域代码',
  `Certificate` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '网络预约出租汽车经营许可证号',
  `OperationArea` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '经营区域',
  `OwnerName` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司名称',
  `Organization` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发证机构名称',
  `StartDate` bigint(8) DEFAULT NULL COMMENT '有效期起',
  `StopDate` bigint(8) DEFAULT NULL COMMENT '有效期止',
  `CertifyDate` bigint(8) DEFAULT NULL COMMENT '初次发证日期',
  `State` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '证照状态',
  `Flag` tinyint(1) NOT NULL COMMENT '1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_companyservice
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_companyservice`;
CREATE TABLE `a_baseinfo_companyservice` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) NOT NULL COMMENT '行政区划代码',
  `ServiceName` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '服务机构名称',
  `ServiceNo` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '服务机构代科',
  `DetailAddress` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '服务机构地址',
  `ResponsibleName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '服务机构负责人姓名',
  `ResponsiblePhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '负责人联系电话',
  `ManagerName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '服务机构管理人姓名',
  `ManagerPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '管理人联系电话',
  `ContactPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '服务机构紧急联系电 话',
  `MailAddress` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '行政文书送达邮寄地址',
  `CreateDate` bigint(8) NOT NULL COMMENT '服务机构设立日期',
  `State` tinyint(1) NOT NULL COMMENT '状态：0有效1失效',
  `Flag` tinyint(1) NOT NULL COMMENT '1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_companystat
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_companystat`;
CREATE TABLE `a_baseinfo_companystat` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `VehicleNum` bigint(64) DEFAULT NULL COMMENT '平台注册网约车辆数',
  `DriverNum` bigint(65) DEFAULT NULL COMMENT '平台注册驾驶员数',
  `Flag` int(1) NOT NULL COMMENT '操作标识(1.新增/2.更新/3.删除)',
  `UpdateTime` bigint(14) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_driver
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_driver`;
CREATE TABLE `a_baseinfo_driver` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) DEFAULT NULL COMMENT '注册地行政区划代码',
  `DriverName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶员姓名',
  `DriverPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员手机',
  `DriverGender` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员性别  1男2女',
  `DriverBirthday` int(8) DEFAULT NULL COMMENT '出生曰期',
  `DriverNationality` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '国箝',
  `DriverNation` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员民族',
  `DriverMaritalStatus` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员婚姻状况',
  `DriverLanguageLevel` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员外语能力',
  `DriverEducation` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员学历',
  `DriverCensus` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '户口获记机关名称',
  `DriverAddress` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '户口住址或长住地址',
  `DriverContactAddress` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员通信地址',
  `PhotoId` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员照片文件编号',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证号',
  `LicensePhotoId` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证扫描件 文件编号',
  `DriverType` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '准驾车迆',
  `GetDriverLicenseDate` int(8) NOT NULL COMMENT '初次领取驾驶证曰期',
  `DriverLicenseOn` int(8) NOT NULL COMMENT '驾驶证有效期限起',
  `DriverLicenseOff` int(8) NOT NULL COMMENT '驾驶证有效期限止',
  `TaxiDriver` int(1) NOT NULL COMMENT '是否巡游出租汽车驾 驶员1是2否',
  `CertificateNo` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '网络预约出租汽车驾 驶员资格证号',
  `NetworkCarIssueOrganization` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '网络预约出租汽车驾 驶员证发证机构',
  `NetworkCarIssueDate` int(8) NOT NULL COMMENT '资格证发证日期',
  `GetNetworkCarProofDate` int(8) NOT NULL COMMENT '初次领取资格证日期',
  `NetworkCarProofOn` int(8) NOT NULL COMMENT '资格证有效起始日期',
  `NetworkCarProofOff` int(8) NOT NULL COMMENT '资格证有效截止日期',
  `RegisterDate` int(8) NOT NULL COMMENT '报备日期',
  `FullTimeDriver` int(1) NOT NULL COMMENT '是否专职驾驶员1:是2否',
  `InDriverBlacklist` int(1) NOT NULL COMMENT '是否在驾驶员黑名单内 1：是0：否',
  `CommercialType` int(1) NOT NULL COMMENT '服务类型1网络预约出租汽车2巡游出租汽车3私人小客车合乘',
  `ContractCompany` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员合同(或协议） 签署公司',
  `ContractOn` int(8) NOT NULL COMMENT '合同(或协议)有效期 起',
  `ContractOff` int(8) NOT NULL COMMENT '合同(或协议)有效期 止',
  `EmergencyContact` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '紧急情况联系人',
  `EmergencyContactPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '紧急情况联系人电话',
  `EmergencyContactAddress` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '紧急情况联系人通信 地址',
  `State` int(1) NOT NULL COMMENT '状态1有效2失效',
  `Flag` int(1) NOT NULL COMMENT '操作标识1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_driverapp
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_driverapp`;
CREATE TABLE `a_baseinfo_driverapp` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) DEFAULT NULL COMMENT '注册地行政区划代码',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证号',
  `DriverPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员手机号',
  `NetType` int(1) NOT NULL COMMENT '手机运营商1中国联通2中国移动3中国电信4其他',
  `AppVersion` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '使用APP版本号',
  `MapType` int(1) NOT NULL COMMENT '使用地图类型1百度地图2高德地图3其他',
  `State` int(1) NOT NULL COMMENT '状态0有效1失效',
  `Flag` int(1) NOT NULL COMMENT '搡作标识1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_drivereducate
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_drivereducate`;
CREATE TABLE `a_baseinfo_drivereducate` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(11) NOT NULL COMMENT '注册地区行政编码',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证号',
  `CourseName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员培训课程名称 ',
  `CourseDate` int(8) NOT NULL COMMENT '培训课程日期',
  `StartTime` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '培训开始时间',
  `StopTime` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '培训结束时间',
  `Duration` int(10) NOT NULL COMMENT '培训时长',
  `Flag` int(3) NOT NULL COMMENT '操作标识：1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_driverstat
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_driverstat`;
CREATE TABLE `a_baseinfo_driverstat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) DEFAULT NULL COMMENT '注册地区行政区划代码',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证编号',
  `Cycle` int(6) NOT NULL COMMENT '统计周期',
  `OrderCount` int(10) NOT NULL COMMENT '完成订单次数',
  `TrafficViolationCount` int(32) NOT NULL COMMENT '交通违章次数',
  `ComplainedCount` int(32) NOT NULL COMMENT '被投诉次数',
  `Flag` int(1) NOT NULL COMMENT '操作标识1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_passenger
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_passenger`;
CREATE TABLE `a_baseinfo_passenger` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `RegisterDate` int(8) NOT NULL COMMENT '注册日期',
  `PassengerPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '乘客手机号码',
  `PassengerName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '乘客称谓',
  `PassengerGender` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '乘客性别  1男2女',
  `State` int(1) NOT NULL COMMENT '状态0有效1失效',
  `Flag` int(1) NOT NULL COMMENT '操作标识1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_vehicle`;
CREATE TABLE `a_baseinfo_vehicle` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) NOT NULL COMMENT '车辆所在城市',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `PlateColor` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车牌颜色',
  `Seats` int(11) NOT NULL COMMENT '核定栽客位',
  `Brand` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆厂牌',
  `Model` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆型号',
  `VehicleType` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆类型',
  `OwnerName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆所有人',
  `VehicleColor` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车身颜色',
  `EngineId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发动机号',
  `VIN` varchar(17) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆VIN码',
  `CertifyDateA` int(8) NOT NULL COMMENT '车辆注册日期',
  `FuelType` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆燃料类',
  `EngineDisplace` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发动机排量  单位:毫升',
  `PhotoId` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆照片文件编号',
  `Certificate` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '运输证字号',
  `TransAgency` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆运输证发证机构',
  `TransArea` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆经营区域',
  `TransDateStart` int(8) NOT NULL COMMENT '车辆运输证有效期起',
  `TransDateStop` int(8) NOT NULL COMMENT '车辆运输证有效期止',
  `CertifyDateB` int(8) NOT NULL COMMENT '车辆初次登记日期',
  `FixState` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆检修状态  0未检修1已检修2未知',
  `NextFixDate` int(8) NOT NULL COMMENT '车辆下次年检时间',
  `CheckState` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆年度审验状态',
  `FeePrintId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发票打印设备序列号',
  `GPSBrand` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '卫星定位装置品牌',
  `GPSModel` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '卫星定位装置型号',
  `GPSIMEI` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '卫星定位装置IMFJ 号',
  `GPSInstallDate` int(8) NOT NULL COMMENT '卫星定位设备安装曰期',
  `RegisterDate` int(8) NOT NULL COMMENT '报备日期',
  `CommercialType` int(3) NOT NULL COMMENT '服务类型：1网络预约出租车2巡游出租取车3私人小客车合乘',
  `FareType` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '运价类型编码',
  `State` int(3) NOT NULL COMMENT '状态：0有效1无效',
  `Flag` int(3) NOT NULL COMMENT '1新增2更新3删除',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_vehicleinsurance
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_vehicleinsurance`;
CREATE TABLE `a_baseinfo_vehicleinsurance` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号码',
  `InsurCom` varchar(65) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '保险公司名称',
  `InsurNum` varchar(65) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '保险号',
  `InsurType` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '保险类型',
  `InsurCount` int(10) NOT NULL COMMENT '保险金额  单位:元',
  `InsurEff` int(8) NOT NULL COMMENT '保险生效时间',
  `InsurExp` int(8) NOT NULL COMMENT '保险到期时间',
  `Flag` tinyint(1) NOT NULL COMMENT '操作标识(1.新增/2.更新/3.删除)',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_baseinfo_vehicletotalmile
-- ----------------------------
DROP TABLE IF EXISTS `a_baseinfo_vehicletotalmile`;
CREATE TABLE `a_baseinfo_vehicletotalmile` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) NOT NULL COMMENT '注册地行政区域划代码',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `TotalMile` bigint(64) NOT NULL COMMENT '行驶总里程  单位:km',
  `Flag` tinyint(1) NOT NULL COMMENT '操作标识(1.新增/2.更新/3.删除)',
  `UpdateTime` bigint(14) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_operate_arrive
-- ----------------------------
DROP TABLE IF EXISTS `a_operate_arrive`;
CREATE TABLE `a_operate_arrive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `DestLongitude` int(10) NOT NULL COMMENT '车辆到达经度',
  `DestLatitude` int(10) NOT NULL COMMENT '车辆到达纬度',
  `Encrypt` tinyint(1) NOT NULL COMMENT '坐标加密标识  1:GCJ—02测绘局标准 2:WGS84 GPS标准 3:BD—09 百度标准 4:CGCS2000 北斗标准 0:其他',
  `DestTime` bigint(14) NOT NULL COMMENT '下车时间',
  `DriveMile` int(10) NOT NULL COMMENT '载客里程  单位:km',
  `DriveTime` int(10) NOT NULL COMMENT '载客时间  单位:秒',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=785 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='经营到达请求表';

-- ----------------------------
-- Table structure for a_operate_depart
-- ----------------------------
DROP TABLE IF EXISTS `a_operate_depart`;
CREATE TABLE `a_operate_depart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证号',
  `FareType` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '运价类型编码',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `DepLongitude` int(10) NOT NULL COMMENT '车辆出发经度',
  `DepLatitude` int(10) NOT NULL COMMENT '车辆出发纬度',
  `Encrypt` int(1) NOT NULL COMMENT '坐标加密标识  1:GCJ—02测绘局标准 2:WGS84 GPS标准 3:BD—09 百度标准 4:CGCS2000 北斗标准 0:其他',
  `DepTime` bigint(14) NOT NULL COMMENT '上车时间',
  `WaitMile` int(10) NOT NULL COMMENT '空驶里程  单位:km',
  `WaitTime` int(10) NOT NULL COMMENT '等待时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=785 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='经营出发表';

-- ----------------------------
-- Table structure for a_operate_login
-- ----------------------------
DROP TABLE IF EXISTS `a_operate_login`;
CREATE TABLE `a_operate_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证号',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `LoginTime` bigint(14) NOT NULL COMMENT '车辆经哲上线时间',
  `Longitude` int(10) NOT NULL COMMENT '上线经度',
  `Latitude` int(10) NOT NULL COMMENT '上线纬度',
  `Encrypt` int(1) NOT NULL COMMENT '1:GCJ—02测绘简标准 2tWGS84 GPS 标准 3,BD—09百度标准 4:CGCS2000北斗标准 〇t其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3243 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='车辆经营上线请求表';

-- ----------------------------
-- Table structure for a_operate_logout
-- ----------------------------
DROP TABLE IF EXISTS `a_operate_logout`;
CREATE TABLE `a_operate_logout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证书',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `LogoutTime` bigint(14) NOT NULL COMMENT '车辆经营下线时间',
  `Longitude` int(10) NOT NULL COMMENT '下线经度',
  `Latitude` int(10) NOT NULL COMMENT '下线纬度',
  `Encrypt` tinyint(1) NOT NULL COMMENT '坐标加密标识  1:GCJ—02测绘局标准 2:WGS84 GPS标准 3:BD—09 百度标准 4:CGCS2000 北斗标准 0:其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='车辆经营下线';

-- ----------------------------
-- Table structure for a_operate_pay
-- ----------------------------
DROP TABLE IF EXISTS `a_operate_pay`;
CREATE TABLE `a_operate_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '网约车公司标识',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `OnArea` int(6) NOT NULL COMMENT '上车位置行政区划编号',
  `DriverName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶员姓名',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证号',
  `FareType` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '运价类塑编码',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `BookDepTime` bigint(14) NOT NULL COMMENT '预计上车时间',
  `WaitTime` int(10) NOT NULL COMMENT '等待时间  单位:秒',
  `DepLongitude` int(10) NOT NULL COMMENT '车辆出发经度',
  `DepLatitude` int(10) NOT NULL COMMENT '车辆出发纬度',
  `DepArea` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '上车地点',
  `DepTime` bigint(14) NOT NULL COMMENT '上车时间',
  `DestLongitude` int(10) NOT NULL COMMENT '车辆到达经度',
  `DestLatitude` int(10) NOT NULL COMMENT '车辆到达纬度',
  `DestArea` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '下车地点',
  `DestTime` bigint(14) NOT NULL COMMENT '下车时间',
  `BookModel` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '预定车型',
  `Model` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '实际使用车型',
  `DriveMile` int(10) NOT NULL COMMENT '载客里程  单位:km',
  `DriveTime` int(10) NOT NULL COMMENT '载客时间  单位:秒',
  `WaitMile` int(10) NOT NULL COMMENT '空驶里程  单位:km',
  `FactPrice` int(10) NOT NULL COMMENT '实收金额  单位:元',
  `Price` int(10) NOT NULL COMMENT '应收金額  单位:元',
  `CashPrice` int(10) NOT NULL COMMENT '现金支付金额  单位:元',
  `LineName` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '电子支付机构',
  `LinePrice` int(10) NOT NULL COMMENT '电子支付金额  单位:元',
  `PosName` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'POS机支付机构',
  `PosPrice` int(10) NOT NULL COMMENT 'POS机支付金額  单位:元',
  `BenfitPrice` int(10) NOT NULL COMMENT '优惠金额  单位:元',
  `BookTip` int(10) NOT NULL COMMENT '预约服务费  单位:元',
  `PassengerTip` int(10) NOT NULL COMMENT '附加费  单位:元',
  `PeakUpPrice` int(10) NOT NULL COMMENT '高峰时段时间加价金额  单位:元',
  `NightUpPrice` int(10) NOT NULL COMMENT '夜间时段里程加价金额  单位:元',
  `FarUpPrice` int(10) NOT NULL COMMENT '远程加价金额  单位:元',
  `OtherUpPrice` int(10) NOT NULL COMMENT '其他加价金额  单位:元',
  `PayState` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '结算状态：0：未结算，1：已结算，2：未知;',
  `PayTime` bigint(14) NOT NULL COMMENT '结算时间',
  `OrderMatchTime` bigint(14) NOT NULL COMMENT '订单完成时间',
  `InvoiceStatus` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '发票状态：0：未开票 ，1：已开票，2：未知;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=785 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='经营支付表';

-- ----------------------------
-- Table structure for a_order_cancel
-- ----------------------------
DROP TABLE IF EXISTS `a_order_cancel`;
CREATE TABLE `a_order_cancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) NOT NULL COMMENT '上传地点行政区域划代码',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `OrderTime` bigint(14) NOT NULL COMMENT '订单时间',
  `CancelTime` bigint(14) NOT NULL COMMENT '订单撤销时间',
  `Operator` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '撤销发起方(1.乘客/2.驾驶员/3.平台公司)',
  `CancelTypeCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '撤销类型代码(1.乘客提前撤销/2.驾驶员提前撤销/3.平台公司撤销/4.乘客违约撤销/5.驾驶员违约撤销)',
  `CancelReason` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '撤销或违约原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单撤销信息';

-- ----------------------------
-- Table structure for a_order_create
-- ----------------------------
DROP TABLE IF EXISTS `a_order_create`;
CREATE TABLE `a_order_create` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) NOT NULL COMMENT '发起地行政区划代码',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `DepartTime` bigint(14) NOT NULL COMMENT '预计用车时间',
  `OrderTime` bigint(14) NOT NULL COMMENT '订单发起时间',
  `PassengerNote` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '乘客备注',
  `Departure` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '预计出发地点详细地',
  `DepLongitude` int(10) NOT NULL COMMENT '预计出发地点经度',
  `DepLatitude` int(10) NOT NULL COMMENT '预计出发地点纬度',
  `Destination` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '预计目的地',
  `DestLongitude` int(10) NOT NULL COMMENT '预计目的地经度',
  `DestLatitude` int(10) NOT NULL COMMENT '预计目的地纬度',
  `Encrypt` tinyint(1) NOT NULL COMMENT '坐标加密标识  1:GCJ—02测绘局标准 2:WGS84 GPS标准 3:BD—09 百度标准 4:CGCS2000 北斗标准 0:其他',
  `FareType` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '运价类型编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单发起请求信息';

-- ----------------------------
-- Table structure for a_order_match
-- ----------------------------
DROP TABLE IF EXISTS `a_order_match`;
CREATE TABLE `a_order_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `Address` int(6) NOT NULL COMMENT '发起地行政区划代码',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `Longitude` int(10) NOT NULL COMMENT '车辆经度',
  `Latitude` int(10) NOT NULL COMMENT '车辆纬度',
  `Encrypt` int(1) NOT NULL COMMENT '1:GCJ—02测绘简标准 2tWGS84 GPS 标准 3,BD—09百度标准 4:CGCS2000北斗标准 0:其他',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证编号',
  `DriverPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '驾驶员手机号',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `DistributeTime` bigint(14) NOT NULL COMMENT '派单成功时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=785 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单成功表';

-- ----------------------------
-- Table structure for a_position_driver
-- ----------------------------
DROP TABLE IF EXISTS `a_position_driver`;
CREATE TABLE `a_position_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机动车驾驶证号',
  `DriverRegionCode` bigint(6) DEFAULT NULL COMMENT '行政区划代码',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `PositionTime` bigint(14) NOT NULL COMMENT '定位时间',
  `Longitude` int(10) NOT NULL COMMENT '经度',
  `Latitude` int(10) NOT NULL COMMENT '纬度',
  `Encrypt` int(10) NOT NULL COMMENT '坐标加密标识  1:GCJ—02测绘局标准 2:WGS84 GPS标准 3:BD—09 百度标准 4:CGCS2000 北斗标准 0:其他',
  `Direction` int(10) NOT NULL COMMENT '方向角',
  `Elevation` int(10) NOT NULL COMMENT '海拔高度  单位:米',
  `Speed` int(10) NOT NULL COMMENT '瞬时速度  单位:km/h',
  `BizStatus` int(10) NOT NULL COMMENT '营运状态  1:载客 2:接单 3:空驶 4:停运',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103559 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='驾驶员定位信息表';

-- ----------------------------
-- Table structure for a_position_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `a_position_vehicle`;
CREATE TABLE `a_position_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `VehicleNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '车辆号牌',
  `VehicleRegionCode` int(6) NOT NULL COMMENT '行政区划代码',
  `PositionTime` bigint(14) NOT NULL COMMENT '定位时间',
  `Longitude` int(10) NOT NULL COMMENT '经度',
  `Latitude` int(10) NOT NULL COMMENT '纬度',
  `Speed` int(10) NOT NULL COMMENT '瞬时速度  单位:km/h',
  `Direction` int(10) NOT NULL COMMENT '方向角',
  `Elevation` int(10) DEFAULT NULL COMMENT '海拔高度  单位:米',
  `Mileage` int(10) DEFAULT NULL COMMENT '行驶里程  单位:km',
  `Encrypt` int(10) NOT NULL COMMENT '坐标加密标识  1:GCJ—02 测绘局标准  2:WGS84 GPS标准  3:BD—09 百度标准  4:CGCS2000 北斗标准  0:其他',
  `WarnStatus` int(10) DEFAULT NULL COMMENT '预警状态',
  `VehStatus` int(10) NOT NULL COMMENT '车辆状态',
  `BizStatus` int(10) NOT NULL COMMENT '营运状态(1.载客/2.接单/3.空驶/4.停运)',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号  0非运营状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103559 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='车辆定位信息表';

-- ----------------------------
-- Table structure for a_rated_driver
-- ----------------------------
DROP TABLE IF EXISTS `a_rated_driver`;
CREATE TABLE `a_rated_driver` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证编号',
  `Level` int(10) NOT NULL COMMENT '服务质量信誉等级',
  `TestDate` int(8) NOT NULL COMMENT '服务质量信誉考核日期',
  `TestDepartment` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '服务质量信誉考核机构'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_rated_driverpunish
-- ----------------------------
DROP TABLE IF EXISTS `a_rated_driverpunish`;
CREATE TABLE `a_rated_driverpunish` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `LicenseId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '机动车驾驶证编号',
  `PunishTime` bigint(14) NOT NULL COMMENT '处罚时间',
  `PunishReason` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '处罚原因',
  `PunishResult` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '处罚结果'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_rated_passenger
-- ----------------------------
DROP TABLE IF EXISTS `a_rated_passenger`;
CREATE TABLE `a_rated_passenger` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `EvaluateTime` bigint(14) NOT NULL COMMENT '评价时间',
  `ServiceScore` int(10) NOT NULL COMMENT '服务满意度',
  `DriverScore` int(10) NOT NULL COMMENT '驾驶员满意度',
  `VehicleScore` int(10) NOT NULL COMMENT '车辆满意度',
  `Detail` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '评价内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for a_rated_passengercomplaint
-- ----------------------------
DROP TABLE IF EXISTS `a_rated_passengercomplaint`;
CREATE TABLE `a_rated_passengercomplaint` (
  `id` int(11) NOT NULL DEFAULT '0',
  `CompanyId` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '公司标识',
  `OrderId` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单号',
  `ComplaintTime` bigint(14) NOT NULL COMMENT '投诉时间',
  `Detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '投诉内容',
  `Result` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '处理结果'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
