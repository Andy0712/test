city/*
 Navicat Premium Data Transfer

 Source Server         : aaa
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : bms

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 14/01/2021 17:34:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_base_data
-- ----------------------------
DROP TABLE IF EXISTS `s_base_data`;
CREATE TABLE `s_base_data` (
  `id` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `TYPECODE` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '类别',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `ORDERNUM` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '顺序',
  `SINGLEPRICE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单价（简易业务用，后续可能换其他表存）',
  `crtuser` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '录入人员',
  `crtdate` datetime DEFAULT NULL COMMENT '录入日期',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_customer
-- ----------------------------
DROP TABLE IF EXISTS `s_customer`;
CREATE TABLE `s_customer` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `CustomerID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户号',
  `CustomerName` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户名称',
  `CustomerType` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位/个人客户标识:COMPANY:单位标识，PERSON:个人标识',
  `Contacts1` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人1',
  `Phone1` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话1',
  `MobilePhone1` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机1',
  `Email1` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'email1',
  `Address` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `ShippingAddress` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '送货地址',
  `SalesID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售人员代码',
  `SalesName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '销售人员姓名',
  `CustomerFirstInquiryMethod` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户首次询价方式（0-电话、1-email、2-上门）',
  `Contacts2` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人2',
  `Phone2` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话2',
  `MobilePhone2` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机2',
  `Email2` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Email2',
  `Fax` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传真',
  `URL` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'URL',
  `Industry` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '行业',
  `IsBlack` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户黑名单标记（0-无，1-有）',
  `CustomerLevel` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户品质分级，信用状况有欠款：五级\r\n无欠款订单金额总计：>=100为四级\r\n无欠款订单金额总计：>=500为三级\r\n无欠款订单金额总计：>=1000为二级\r\n无欠款订单金额总计：>=10000一级',
  `IntroducerName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '介绍人姓名',
  `IntroducerPhone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '介绍人联系方式',
  `IntroducerCompany` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '介绍公司',
  `IntroducerCompanyPhone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '介绍公司联系方式',
  `Amountpaid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '已付金额',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `CrtDate` datetime NOT NULL COMMENT '创建时间',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `MdfDate` datetime NOT NULL COMMENT '修改时间',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for s_finishing_cost_table
-- ----------------------------
DROP TABLE IF EXISTS `s_finishing_cost_table`;
CREATE TABLE `s_finishing_cost_table` (
  `id` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `finishing_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '后处理部分名称',
  `salary_per_hour` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '每小时工资',
  `factor_of_labour_cost` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '劳动力成本因素',
  `labour_cost` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '人工成本',
  `factor_of_device_cost` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '设备成本因素',
  `device_cost` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '设备成本',
  `total_cost_per_hour` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '总成本（每小时）',
  `crtuser` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '录入人员',
  `crtdate` datetime DEFAULT NULL COMMENT '录入日期',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_finishing_discount_table
-- ----------------------------
DROP TABLE IF EXISTS `s_finishing_discount_table`;
CREATE TABLE `s_finishing_discount_table` (
  `id` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `finishing_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '后处理部分名称',
  `code` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '编号',
  `discount` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '折扣',
  `crtuser` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '录入人员',
  `crtdate` datetime DEFAULT NULL COMMENT '录入日期',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_invoice
-- ----------------------------
DROP TABLE IF EXISTS `s_invoice`;
CREATE TABLE `s_invoice` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `BranchId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构ID',
  `OrderID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `InvoiceNumber` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '发票号',
  `Subtotal` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '税前金额',
  `GST` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '增值税',
  `Total` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '总金额',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `CrtDate` datetime DEFAULT NULL COMMENT '创建时间',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `MdfDate` datetime DEFAULT NULL COMMENT '修改日期',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for s_material
-- ----------------------------
DROP TABLE IF EXISTS `s_material`;
CREATE TABLE `s_material` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `MaterialId` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '原材料ID',
  `MaterialName` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '原材料名称',
  `Threshold` int(11) NOT NULL COMMENT '库存阀值',
  `MaterialTypeId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料类别ID',
  `MaterialTypeName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料类别Name',
  `MaterialAttributeId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '属性ID',
  `MaterialAttributeName` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '属性名称',
  `MaterialAttributeVal` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '属性值',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `CrtDate` datetime NOT NULL COMMENT '创建日期',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `MdfDate` datetime NOT NULL COMMENT '修改日期',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for s_product_order
-- ----------------------------
DROP TABLE IF EXISTS `s_product_order`;
CREATE TABLE `s_product_order` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `QuotationID` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '报价单号',
  `ProcessingOrderno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '加工单号',
  `SubOrderState` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '加工单状态\n0-生成报价单\n1-待交定金\n2-提交生产确认\n3-生成订单\n4-待缴费\n5-欠缴\n\n6-进入生产\n7-待分配\n8-待生产\n9-已生产\n10-完成生产\n11-递送\n12-作废',
  `StartDate` datetime DEFAULT NULL COMMENT '期望开始时间',
  `EndDate` datetime DEFAULT NULL COMMENT '期望结束时间',
  `ExpectStartDate` datetime DEFAULT NULL COMMENT '预计开始时间',
  `ExpectEndDate` datetime DEFAULT NULL COMMENT '预计结束时间',
  `IsOurUnit` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否本单位Y:是，N:否',
  `BranchID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '加工branch',
  `IsOutside` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否外部单位加工：Y:是，N:否',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `CrtDate` datetime NOT NULL COMMENT '创建时间',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `MdfDate` datetime NOT NULL COMMENT '修改时间',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ProcessingOrderno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='加工单表';

-- ----------------------------
-- Table structure for s_product_service
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service`;
CREATE TABLE `s_product_service` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `productsernum` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品流水号',
  `processingorderno` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '加工单号（为空）',
  `productname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品（服务）名称',
  `productno` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品（服务）代码',
  `productdescribe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品描述',
  `category` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类别',
  `compositioncategory` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组成类别',
  `productcategory` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品（服务）类别（业务类型）  0-一般业务 1-简易业务',
  `productsize` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品尺寸',
  `productnum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品数量',
  `metalcolor` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'metal color',
  `materialsize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料尺寸',
  `materialtype` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料类型',
  `materialname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料名称',
  `digitalprinting` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无数字打印',
  `printtype` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印类型',
  `printdiscountrate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印折扣率',
  `printblackwhite` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印黑白数量',
  `printcolor` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印彩色数量',
  `printcountdiscountrate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印计数折扣率',
  `printquotation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印报价',
  `systemprintdiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系统打印折扣',
  `printlabordiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印人工折扣',
  `singlestandardprice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单项产品标准价格（暂时没用）',
  `discountrate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣率',
  `singlediscountprice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单项产品折扣价格（暂时没用）',
  `singleproductquantity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单项产品数量（暂时没用）',
  `gst` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'GST 税（暂时没用）',
  `productpicturepath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品制作图片路径',
  `proconfirmationmark` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生产确认标记 0-待确认 1-已确认 2-无需确认',
  `proconfirmationdescript` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生产确认描述',
  `productopinions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生产确认意见（反馈意见）',
  `profeedbackperson` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生产反馈人id（生产人员）',
  `profeedbackdate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生产反馈日期',
  `profeedbackresultdescript` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生产反馈结果描述',
  `clientcode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '委托单位代码',
  `clientname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '委托单位名称',
  `entrustedunitcode` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '受托单位代码',
  `entrustedunitname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '受托单位名称',
  `standardquotation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价（产品服务定义页展示，不含递送价格）',
  `deliveryprice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '递送价格',
  `internalproservicequotation` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内部产品服务报价（暂时没用）',
  `internalquotationdiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内部报价折扣（暂时没用）',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建日期',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效 0-无效 1-有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注（生产人员备注）',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail`;
CREATE TABLE `s_product_service_detail` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `processingorderno` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '加工单号（为空）',
  `productno` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品代码',
  `compositioncategory` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组成类别',
  `serialnumber` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '序号',
  `partname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部件名称',
  `productdescribe` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品描述',
  `productSize` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品尺寸',
  `customProductWidth` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '自定义产品 width',
  `customProductHeight` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '自定义产品 height',
  `nUpOnSra3` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'n up on SRA3',
  `productnum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品数量',
  `numPagePerBook` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '每本张数',
  `rawMaterialType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料种类',
  `rawMaterialNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料数量',
  `metallicColor` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Metallic color',
  `offse` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Offse有无 0-无 1-有',
  `offsetPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Offset进价',
  `offsetQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Offset报价',
  `offsetDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Offset折扣',
  `offsetExtraInformation` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Offset-Extra Information',
  `otherServices` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无 Other Services（其他服务）',
  `servicesDescription` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '其他服务-服务描述',
  `servicesPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '其他服务-服务价格',
  `materialid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料ID',
  `materialname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料名称',
  `materialattribute` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料属性',
  `materialnumber` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料数量',
  `metalcolor` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'metal color',
  `materialsize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料尺寸',
  `materialtype` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '原材料类型',
  `printtype` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '打印类型',
  `unitprice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单价',
  `totalamount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合计金额',
  `discountrate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣率',
  `standardprice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标准价格',
  `discountprice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣价格',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_componentbase
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_componentbase`;
CREATE TABLE `s_product_service_detail_componentbase` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `metallicColor` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Metallic color',
  `baseSheets` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Base Sheets',
  `materialPaperSize` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper size',
  `materialPaperType` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper type',
  `materialPaperWeight` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper weight',
  `materialQuantity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Quantity',
  `digitalPrinting` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Digital printing',
  `printingType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Printing Type',
  `quotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价',
  `discount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_componentbwinner
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_componentbwinner`;
CREATE TABLE `s_product_service_detail_componentbwinner` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `jointSides` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Joint Sides',
  `blackWhiteSides` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'B&W Sides',
  `blackWhiteInnerSheets` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'B&W Inner Sheets',
  `materialPaperSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper size',
  `materialPaperType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper type',
  `materialPaperWeight` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper weight',
  `materialQuantity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Quantity',
  `digitalPrinting` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Digital printing',
  `printingType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Printing Type',
  `quotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价',
  `discount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_componentcolorinner
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_componentcolorinner`;
CREATE TABLE `s_product_service_detail_componentcolorinner` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `metallicColor` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Metallic color',
  `metallicColorSides` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Metallic color Sides',
  `totalColorSides` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Total Color Sides',
  `metallicJointSides` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Metallic Joint Sides',
  `jointSides` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Joint Sides',
  `colorInnerSheets` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Inner Sheets(Color Inner Sheets)',
  `materialPaperSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper size',
  `materialPaperType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper type',
  `materialPaperWeight` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper weight',
  `materialQuantity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Quantity',
  `digitalPrinting` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Digital printing',
  `printingType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Printing Type',
  `quotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价',
  `discount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_componentcover
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_componentcover`;
CREATE TABLE `s_product_service_detail_componentcover` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `metallicColor` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Metallic color',
  `coverAndBackSides` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Cover and Back Sides',
  `jointSides` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Joint Sides',
  `coverSheets` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Cover Sheets',
  `quantity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Quantity',
  `materialPaperSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper size',
  `materialPaperType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper type',
  `paperSpecialType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Paper Special Type',
  `materialPaperWeight` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Paper weight',
  `materialQuantity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Material-Quantity',
  `digitalPrinting` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Digital printing',
  `printingType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Printing Type',
  `quotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价',
  `discount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_design
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_design`;
CREATE TABLE `s_product_service_detail_design` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `design` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Design有无',
  `designWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Design-工作时长',
  `designQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Design-报价',
  `designDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Design-折扣',
  `designDescription` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Design Description',
  `layout` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Layout有无',
  `layoutWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Layout-工作时长',
  `layoutQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Layout-报价',
  `layoutDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Layout-折扣',
  `layoutDescription` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Layout Description',
  `fileScanning` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'File scanning有无',
  `fileScanningWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'File scanning-工作时长',
  `fileScanningQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'File scanning-报价',
  `fileScanningDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'File scanning-折扣',
  `sortOut` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Sort out有无',
  `sortOutWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Sort out-工作时长',
  `sortOutQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Sort out-报价',
  `sortOutDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Sort out -折扣',
  `sortOutDescription` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Sort out -描述',
  `numberLayout` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Number layout有无',
  `numberLayoutWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Number layout -工作时长',
  `numberLayoutQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Number layout-报价',
  `numberLayoutDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Number layout-折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_finishingbase
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_finishingbase`;
CREATE TABLE `s_product_service_detail_finishingbase` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `trimming` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Trimming',
  `trimmingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-切割工作量',
  `trimmingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-报价',
  `trimmingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-折扣',
  `creasing` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Creasing',
  `creasingType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕类别',
  `creasingNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕数',
  `creasingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕工作量',
  `creasingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-报价',
  `creasingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-折扣',
  `laminationRoll` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Lamination(roll)',
  `laminationRollSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜尺寸',
  `laminationRollType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜类别',
  `laminationRollWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜工作量',
  `laminationRollQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-报价',
  `laminationRollDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-折扣',
  `dieCut` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Die cut',
  `dieCutPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-进价',
  `dieCutQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-报价',
  `dieCutDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-折扣',
  `foil` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Foil',
  `foilPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-进价',
  `foilQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-报价',
  `foilDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-折扣',
  `uv` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无UV',
  `uvPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-进价',
  `uvQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-报价',
  `uvDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_finishingcover
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_finishingcover`;
CREATE TABLE `s_product_service_detail_finishingcover` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `trimming` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Trimming',
  `trimmingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-切割工作量',
  `trimmingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-报价',
  `trimmingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-折扣',
  `creasing` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Creasing',
  `creasingType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕类别',
  `creasingNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕数',
  `creasingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕工作量',
  `creasingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-报价',
  `creasingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-折扣',
  `folding` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Folding',
  `foldingType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Folding-折叠类别',
  `foldingNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Folding-折叠数',
  `foldingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Folding-折叠工作量',
  `foldingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Folding-折叠报价',
  `foldingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Folding-折叠折扣',
  `laminationPouch` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Lamination(pouch)',
  `laminationPouchSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(pouch) -袋装尺寸',
  `laminationPouchType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(pouch) -袋装类别',
  `laminationPouchWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(pouch) -袋装工作量',
  `laminationPouchQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(pouch) -袋装报价',
  `laminationPouchDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(pouch) -袋装折扣',
  `laminationRoll` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Lamination(roll)',
  `laminationRollSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜尺寸',
  `laminationRollType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜类别',
  `laminationRollWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜工作量',
  `laminationRollQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-报价',
  `laminationRollDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-折扣',
  `dieCut` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Die cut',
  `dieCutPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-进价',
  `dieCutQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-报价',
  `dieCutDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-折扣',
  `foil` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Foil',
  `foilPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-进价',
  `foilQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-报价',
  `foilDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-折扣',
  `uv` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无UV',
  `uvPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-进价',
  `uvQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-报价',
  `uvDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-折扣',
  `glueAttachment` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Glue attachment',
  `wrapPackage` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Wrap package',
  `wrapPackagePurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wrap package -进价',
  `wrapPackageQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wrap package -报价',
  `wrapPackageDescribe` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wrap package -描述',
  `staple` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无staple',
  `stapleNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Staple-钉数',
  `stapleWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Staple-工作量',
  `stapleQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Staple-报价',
  `stapleDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Staple-折扣',
  `perforation` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Perforation',
  `perforationType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perforation-穿孔类别',
  `perforationNum` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perforation-线数',
  `perforationWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perforation-穿孔工作量',
  `perforationQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perforation-报价',
  `perforationDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perforation-折扣',
  `padding` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Padding',
  `paddingSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Padding-记事本尺寸',
  `paddingThickness` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Padding-厚度',
  `paddingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Padding-胶粘工作量',
  `paddingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Padding-报价',
  `paddingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Padding-折扣',
  `hardCover` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无hardCover',
  `hardCoverSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hard cover -精装尺寸',
  `hardCoverThickness` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hard cover -精装厚度',
  `hardCoverWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hard cover -精装工作量',
  `hardCoverQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hard cover -报价',
  `hardCoverDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hard cover -折扣',
  `screwBinding` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Screw binding',
  `screwBindingSize` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Screw binding-精装尺寸',
  `screwBindingNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Screw binding-精装孔数',
  `screwBindingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Screw binding-装订工作量',
  `screwBindingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Screw binding-报价',
  `screwBindingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Screw binding-折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建日期',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_finishinginner
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_finishinginner`;
CREATE TABLE `s_product_service_detail_finishinginner` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `trimming` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Trimming',
  `trimmingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-切割工作量',
  `trimmingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-报价',
  `trimmingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Trimming-折扣',
  `creasing` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Creasing',
  `creasingType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕类别',
  `creasingNum` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕数',
  `creasingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-压痕工作量',
  `creasingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-报价',
  `creasingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Creasing-折扣',
  `laminationRoll` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Lamination(roll)',
  `laminationRollSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜尺寸',
  `laminationRollType` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜类别',
  `laminationRollWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-过膜工作量',
  `laminationRollQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-报价',
  `laminationRollDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Lamination(roll)-折扣',
  `dieCut` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Die cut',
  `dieCutPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-进价',
  `dieCutQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-报价',
  `dieCutDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Die cut-折扣',
  `foil` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Foil',
  `foilPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-进价',
  `foilQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-报价',
  `foilDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Foil-折扣',
  `uv` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无UV',
  `uvPurchasePrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-进价',
  `uvQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-报价',
  `uvDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'UV-折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建日期',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_product_service_detail_finishingwhole
-- ----------------------------
DROP TABLE IF EXISTS `s_product_service_detail_finishingwhole`;
CREATE TABLE `s_product_service_detail_finishingwhole` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `quotationid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `orderid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `saddleStitched` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Saddle stitched（马鞍缝）',
  `saddleStitchedWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Saddle stitched-装订工作量',
  `saddleStitchedQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Saddle stitched-报价',
  `saddleStitchedDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Saddle stitched-折扣',
  `wireBinding` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Wire binding（钢丝捆扎））',
  `wireBindingBinding` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wire binding-Binding 规格',
  `wireBindingCircleSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wire binding-圈大小',
  `wireBindingWire` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wire binding-Wire',
  `wireBindingPvcCover` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wire binding-PVC Cover',
  `wireBindingLeathergain` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wire binding-Leathergain',
  `wireBindingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wire binding-Binding 工作量',
  `wireBindingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wire binding-报价',
  `wireBindingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Wire binding-折扣',
  `halfCycleCutting` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Half cycle cutting（半圆切割）',
  `halfCycleCuttingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Half cycle cutting-工作量',
  `halfCycleCuttingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Half cycle cutting-报价',
  `halfCycleCuttingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Half cycle cutting-折扣',
  `perfectPurGlue` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Perfect PUR Glue binding（PUR胶订）',
  `perfectPurGlueSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perfect PUR Glue binding-胶装尺寸',
  `perfectPurGlueThickness` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perfect PUR Glue binding-胶装厚度',
  `perfectPurGlueWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perfect PUR Glue binding-胶装工作量',
  `perfectPurGlueQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perfect PUR Glue binding-胶装报价',
  `perfectPurGlueDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Perfect PUR Glue binding-胶装折扣',
  `plasticBinding` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '有无Plastic binding（塑料装订）',
  `plasticBindingSpecs` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Plastic binding-Binding规格',
  `plasticBindingCircleSize` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Plastic binding-圈大小',
  `plasticBindingPvc` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Plastic binding-PVC',
  `plasticBindingLeathergain` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Plastic binding-Leathergain',
  `plasticBindingWorkload` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Plastic binding-Binding工作量',
  `plasticBindingQuotedPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Plastic binding-报价',
  `plasticBindingDiscount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Plastic binding-折扣',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建日期',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for s_purchase
-- ----------------------------
DROP TABLE IF EXISTS `s_purchase`;
CREATE TABLE `s_purchase` (
  `serno` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'serno',
  `PurchaseId` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '采购ID',
  `BranchId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构ID',
  `MaterialId` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '原材料ID',
  `MaterialName` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '原材料名称',
  `Number` int(11) DEFAULT NULL COMMENT '采购数量',
  `Price` double(10,2) DEFAULT NULL COMMENT '采购单价',
  `Type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '属性类别',
  `InvoiceNumber` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Invoice代码',
  `Supplier` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商',
  `PurchaseDate` date DEFAULT NULL COMMENT '采购日期',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `CrtDate` datetime NOT NULL COMMENT '创建日期',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `MdfDate` datetime NOT NULL COMMENT '修改日期',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PurchaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for s_quotation_order
-- ----------------------------
DROP TABLE IF EXISTS `s_quotation_order`;
CREATE TABLE `s_quotation_order` (
  `QuotationID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '报价单号',
  `OrderID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号（为空）',
  `CustomerID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户号（可空）',
  `CompanyName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位名称',
  `BusinessType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '业务类型 0-一般业务 1-简易业务',
  `DepositMark` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订金标记 0-不需要支付定金 1-需要支付定金',
  `DepositAmount` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订金金额',
  `DepositRatio` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订金比例',
  `DepositPamentType` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订金支付状态 0-未支付 1-已支付',
  `DepositPamentMode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订金付款方式，可选范围：0-现金、1-转账、2-EFTpos、3-信用卡',
  `ApprovalResults` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审批结果 0-待审批 1-审批通过 2-审批不通过',
  `ApprovalOpinions` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审批意见',
  `RequestApprovalDescription` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '请求审批描述',
  `ApprovalMark` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审批标志 0-未超阈值不需审批 1-超出阈值需要审批',
  `ApprovalTime` datetime DEFAULT NULL COMMENT '审批时间',
  `Approver` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审批人id',
  `ApprovalRemarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '审批备注',
  `QuotationState` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单状态（暂时 后续可能删除此字段）\r\n0-报价单未生成订单 \r\n1-报价单已生成订单\r\n2-已支付订单\r\n',
  `OrderState` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单总体状态 \r\n0-生成报价单\r\n1-待交定金\r\n2-提交生产确认\r\n3-生成订单\r\n4-待缴费\r\n5-欠缴\r\n\n6-进入生产\r\n7-待分配\r\n8-待生产\r\n9-已生产\r\n10-完成生产\r\n11-递送\n12-作废',
  `QuotationStandardQuotation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单标准报价',
  `DiscountRate` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣率',
  `DiscountQuotation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '折扣报价',
  `ThresholdPrice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '阈值价格',
  `GST` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '税金，订单金额*15%',
  `SubtractSmallChange` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '抹零金额',
  `AmountDue` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '应付金额，报价+税额-抹零',
  `AmountOfArrears` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '欠费金额',
  `Amountpaid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '已付金额',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '录入人员（订单生成人员）',
  `crtdate` datetime NOT NULL COMMENT '报价单日期',
  `OrderDate` datetime DEFAULT NULL COMMENT '订单日期（订单生成日期）',
  `ProductionProcesses` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工序',
  `SaleID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'sale代码',
  `SaleName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'sale姓名',
  `BranchID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'branch代码',
  `BranchName` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'branch名称',
  `CancelReason` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作废原因',
  `CancelUser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单作废人',
  `CancelDate` datetime DEFAULT NULL COMMENT '订单作废日期',
  `mdfdate` datetime DEFAULT NULL COMMENT '修改日期',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `dataflag` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否有效 0-无效 1-有效',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`QuotationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='报价单表';

-- ----------------------------
-- Table structure for s_receive_pay
-- ----------------------------
DROP TABLE IF EXISTS `s_receive_pay`;
CREATE TABLE `s_receive_pay` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `RPID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '收付费ID',
  `QuotationID` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '报价单号',
  `BranchID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构ID',
  `CustomerID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户号',
  `InvoiceNumber` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票号',
  `Type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'PAY:应付，RECE:应收',
  `PayState` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '付款状态：0-未付 1-部分付 2-已付',
  `PayNumber` int(11) DEFAULT NULL COMMENT '第几次缴费',
  `AmountDue` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '应付金额（总金额）',
  `Amountpaid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '已付金额',
  `AmountOfArrears` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '欠费金额',
  `AmountOfPay` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '本次支付金额',
  `DepositPamentMode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '付款方式0-现金、1-转账、2-银行卡',
  `GenerateDate` datetime DEFAULT NULL COMMENT '生成日期',
  `Payer` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '付款方、收款方：客户:CUSTOMER，机构:BRANCH',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `CrtDate` datetime NOT NULL COMMENT '创建日期',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `MdfDate` datetime NOT NULL COMMENT '修改日期',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`RPID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='收付费表';

-- ----------------------------
-- Table structure for s_receive_pay_detail
-- ----------------------------
DROP TABLE IF EXISTS `s_receive_pay_detail`;
CREATE TABLE `s_receive_pay_detail` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `RPID` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '收付费ID',
  `QuotationID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '报价单号',
  `InvoiceNumber` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发票号',
  `PayNumber` int(11) DEFAULT NULL COMMENT '第几次缴费',
  `AmountDue` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '应付金额（总金额）',
  `Amountpaid` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '已付金额',
  `AmountOfArrears` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '欠费金额',
  `AmountOfPay` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '本次支付金额',
  `DepositPamentMode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '付款方式0-现金、1-转账、2-EFTpos、3-信用卡',
  `GenerateDate` datetime DEFAULT NULL COMMENT '生成日期',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `CrtDate` datetime NOT NULL COMMENT '创建日期',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `MdfDate` datetime NOT NULL COMMENT '修改日期',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for s_stock
-- ----------------------------
DROP TABLE IF EXISTS `s_stock`;
CREATE TABLE `s_stock` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `StockId` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '库存ID',
  `BranchID` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构ID',
  `MaterialId` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '原材料ID',
  `MaterialName` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '原材料名称',
  `Status` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '库存状态：ABUNT:充足，WARN:预警',
  `Number` int(10) DEFAULT NULL COMMENT '库存数量',
  `BeforeNumber` int(11) DEFAULT NULL COMMENT '修改前库存数量',
  `Threshold` int(11) DEFAULT NULL COMMENT '库存阀值',
  `Difference` int(11) DEFAULT NULL COMMENT '差值',
  `Price` double(10,2) DEFAULT NULL COMMENT '库存价格',
  `Reason` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改原因',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `CrtDate` datetime NOT NULL COMMENT '创建日期',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `MdfDate` datetime NOT NULL COMMENT '修改日期',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`StockId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for s_stock_transfer
-- ----------------------------
DROP TABLE IF EXISTS `s_stock_transfer`;
CREATE TABLE `s_stock_transfer` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `TransferId` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '调拨ID',
  `BranchId` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构id',
  `MaterialId` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '原材料ID',
  `MaterialName` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '原材料名称',
  `Number` int(11) DEFAULT NULL COMMENT '调拨数量',
  `Price` double(10,2) DEFAULT NULL COMMENT '原材料单价',
  `AmountDue` double(10,2) DEFAULT NULL COMMENT '合计价格',
  `InvoiceNumber` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Invoice代码',
  `TransferDate` datetime DEFAULT NULL COMMENT '调拨日期',
  `DataFlag` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `CrtUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `CrtDate` datetime NOT NULL COMMENT '创建日期',
  `MdfUser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `MdfDate` datetime NOT NULL COMMENT '修改日期',
  `Memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for sys_enum
-- ----------------------------
DROP TABLE IF EXISTS `sys_enum`;
CREATE TABLE `sys_enum` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `enumcode` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '枚举编码',
  `enumname` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '枚举名称',
  `enumparent` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '上级编码',
  `dataflag` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `crtdate` datetime NOT NULL COMMENT '创建时间',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `mdfdate` datetime NOT NULL COMMENT '修改时间',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_branch
-- ----------------------------
DROP TABLE IF EXISTS `t_branch`;
CREATE TABLE `t_branch` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'serno',
  `branchid` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构编码',
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构名称',
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构地址',
  `city` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '城市',
  `zipcode` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构邮编',
  `phone` char(18) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构电话',
  `fax` char(18) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构传真',
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT 'EMail',
  `webaddress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '网址',
  `satrapname` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构负责人',
  `bankaccno1` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '银行账号1',
  `bankaccno2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行账号2',
  `bankaccno3` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行账号3',
  `bankaccname1` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '银行户名1',
  `bankaccname2` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行户名2',
  `bankaccname3` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行户名3',
  `bankacc1` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '开户行1',
  `bankacc2` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开户行2',
  `bankacc3` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开户行3',
  `gstno` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT 'GST',
  `comgrade` char(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构级别1-总公司、2-分支机构',
  `comareatype` char(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '机构地区类型',
  `upcomcode` char(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '上级管理机构',
  `comstate` char(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '机构状态',
  `setupdate` date DEFAULT NULL COMMENT '开业日期',
  `backoutdate` date DEFAULT NULL COMMENT '撤销日期',
  `dataflag` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `crtdate` datetime NOT NULL COMMENT '创建日期',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `mdfdate` datetime NOT NULL COMMENT '修改日期',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`branchid`,`serno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '访问地址',
  `httpmethod` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'get/post',
  `ip` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ip地址',
  `classmethod` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类名方法名',
  `requestargs` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入参',
  `requestbody` text COLLATE utf8_unicode_ci COMMENT '入参值',
  `responsebody` text COLLATE utf8_unicode_ci COMMENT '返回参数',
  `spendtime` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '耗时'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `menuno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单编码',
  `menuname` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单名称',
  `menudesc` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '菜单描述',
  `menutype` char(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单类型：menu:菜单，button:按钮',
  `menuurl` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'url',
  `menulevel` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单级别：1、2、3、4、5',
  `menuparent` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '上级菜单编码',
  `sequence` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '序列',
  `isvisible` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否可见',
  `dataflag` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建时间',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `mdfdate` datetime NOT NULL COMMENT '修改时间',
  `memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`menuno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `roleno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称',
  `roledesc` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色描述',
  `rolestatus` char(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色状态范围：01-有效、02-无效',
  `dataflag` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `crtdate` datetime NOT NULL COMMENT '创建日期',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `mdfdate` datetime NOT NULL COMMENT '修改日期',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`roleno`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `roleno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  `menuno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '菜单编码',
  `dataflag` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建日期',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `mdfdate` datetime NOT NULL COMMENT '修改日期',
  `memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户代码',
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名称',
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '姓名',
  `sex` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '性别',
  `branchid` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '所属机构',
  `birthday` date NOT NULL COMMENT '出生年月',
  `country` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '国籍',
  `celler` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系电话',
  `mobile` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '手机',
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '电子邮件',
  `entrydate` date NOT NULL COMMENT '入司日期',
  `position` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '职位',
  `status` char(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '状态',
  `type` char(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '性质',
  `worktime` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '一周工作时长',
  `starttime` date NOT NULL COMMENT '开始时间',
  `endtime` date NOT NULL COMMENT '结束时间',
  `grade` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT '学历 \r\n01-小学 \r\n02-初中 \r\n03-高中 \r\n04-专科 \r\n05-本科\r\n06-研究生\r\n07-博士及以上',
  `ird` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT 'IRD号码',
  `account` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '银行账户',
  `salary` decimal(10,2) DEFAULT NULL COMMENT '薪资',
  `expiretime` date DEFAULT NULL COMMENT '离职日期',
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `dataflag` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建时间',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `mdfdate` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`userno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `serno` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户编码',
  `roleno` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色编码',
  `dataflag` char(1) COLLATE utf8_unicode_ci NOT NULL COMMENT '是否有效',
  `crtuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '创建人',
  `crtdate` datetime NOT NULL COMMENT '创建时间',
  `mdfuser` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '修改人',
  `mdfdate` datetime NOT NULL COMMENT '修改时间',
  `memo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`serno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
