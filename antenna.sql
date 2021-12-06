/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : antenna

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 06/12/2021 16:01:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`  (
  `carid` int(255) NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid` int(255) NOT NULL,
  `shopname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shoper` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(18, 2) NOT NULL,
  `sell` int(65) NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`carid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for loginuser
-- ----------------------------
DROP TABLE IF EXISTS `loginuser`;
CREATE TABLE `loginuser`  (
  `userid` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` double(255, 2) NOT NULL,
  `cometime` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of loginuser
-- ----------------------------
INSERT INTO `loginuser` VALUES (1, 'admin', '123456', '2264121649@qq.com', 0.00, '2021-10-19 14:22:01.000000');
INSERT INTO `loginuser` VALUES (2, 'test1', '666666', 'test1@666.com', 41218.00, '2021-11-23 13:21:10.811660');

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase`  (
  `purid` int(255) NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid` int(255) NOT NULL,
  `shopname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shoper` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(18, 2) NOT NULL,
  `sell` int(100) NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `receiving` int(2) NOT NULL,
  `creation_time` datetime(6) NOT NULL,
  `truename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`purid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase
-- ----------------------------
INSERT INTO `purchase` VALUES (111, 2, 'test1', 29, '罗技g703hero电竞游戏无线鼠标', '罗技G', 399.00, 1, 'LuoJ1.jpg', 0, '2021-11-19 17:57:40.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (112, 2, 'test1', 30, '罗技M90有线鼠标', '罗技G', 45.00, 1, 'LuoJ2.jpg', 0, '2021-11-19 17:57:53.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (113, 2, 'test1', 26, '七匹狼秋季夹克', '七匹狼', 519.00, 1, 'lang7jia.jpg', 0, '2021-11-19 17:57:53.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (114, 2, 'test1', 33, '花花公子男士外套韩版潮流', 'Septwolves/七匹狼', 269.00, 1, 'lang7jiake3.jpg', 0, '2021-11-19 17:58:07.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (115, 2, 'test1', 7, '华为Mate 40', 'Huawei/华为', 7038.00, 1, 'Huaweimate40.jpg', 0, '2021-11-19 17:58:07.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (116, 2, 'test1', 31, '七匹狼男装夹克立领潮流外套', 'Septwolves/七匹狼', 539.00, 1, 'lang7jiake1.jpg', 0, '2021-11-19 17:58:07.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (117, 2, 'test1', 1, 'DELL/戴尔 G15', 'Dell/戴尔', 6999.00, 1, 'tieerG15.jpg', 1, '2021-11-19 18:03:05.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (118, 2, 'test1', 1, 'DELL/戴尔 G15', 'Dell/戴尔', 6999.00, 1, 'tieerG15.jpg', 1, '2021-11-21 14:52:44.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (119, 2, 'test1', 1, 'DELL/戴尔 G15', 'Dell/戴尔', 6999.00, 1, 'tieerG15.jpg', 1, '2021-11-21 15:09:55.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (120, 2, 'test1', 26, '七匹狼秋季夹克', '七匹狼', 519.00, 1, 'lang7jia.jpg', 0, '2021-11-23 10:24:15.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (121, 2, 'test1', 24, '旺仔牛奶糖1000g', '旺旺', 37.00, 1, 'WWtang.jpg', 0, '2021-11-23 10:24:34.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (122, 2, 'test1', 24, '旺仔牛奶糖1000g', '旺旺', 37.00, 1, 'WWtang.jpg', 0, '2021-11-23 10:24:42.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (123, 2, 'test1', 24, '旺仔牛奶糖1000g', '旺旺', 37.00, 5, 'WWtang.jpg', 0, '2021-11-23 10:25:21.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (124, 2, 'test1', 24, '旺仔牛奶糖1000g', '旺旺', 37.00, 1, 'WWtang.jpg', 0, '2021-11-23 10:25:31.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (125, 2, 'test1', 24, '旺仔牛奶糖1000g', '旺旺', 37.00, 2, 'WWtang.jpg', 0, '2021-11-23 10:25:43.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (126, 2, 'test1', 1, 'Apple/苹果 iPhone 12', 'Apple/苹果', 5699.00, 1, 'apple12.jpg', 0, '2021-11-23 10:58:24.000000', '陈龙涛', '江西南昌', '19970034896');
INSERT INTO `purchase` VALUES (127, 2, 'test1', 3, 'Apple/苹果 iPhone 12', 'Apple/苹果', 5699.00, 3, 'apple12.jpg', 0, '2021-11-23 13:21:10.000000', '陈龙涛', '江西南昌', '19970034896');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop`  (
  `sid` int(255) NOT NULL AUTO_INCREMENT,
  `shopname` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type1` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type2` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shoper` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(18, 2) NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stock` int(255) NOT NULL,
  `hot` int(60) NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES (1, 'DELL/戴尔 G15', '全新工业设计 全新散热模组 暴风散热', '电子产品', '笔记本电脑', 'Dell/戴尔', 6999.00, '产品名称：Dell/戴尔 G 15品牌: Dell/戴尔型号: 15内存容量: 16G 32GB硬盘容量: 512G固态硬盘 1TB 固态硬盘CPU: 英特尔 酷睿 i5-11260H显存容量: 4G显卡类型: NVIDIA GeForce RTX3050操作系统: windows 10', 996, 6, 'tieerG15.jpg');
INSERT INTO `shop` VALUES (2, 'Lenovo联想拯救者Y7000P', '100%色域 全新游戏笔记本电脑', '电子产品', '笔记本电脑', 'Lenovo/联想', 8698.00, '产品名称：Lenovo/联想 拯救者 Y7000P 品牌: Lenovo/联想型号: R7000P 2021新款内存容量: 16G硬盘容量: 无机械硬盘 CPU: 英特尔 酷睿 i5-11400H显存容量: 4G显卡类型: NVIDIA GeForce RTX3050操作系统: windows 10', 1997, 60, 'LenovoY7000P.jpg');
INSERT INTO `shop` VALUES (3, '神舟战神Z8', 'RTX30系列 三星颗粒 五星售后', '电子产品', '笔记本电脑', 'Hasee/神舟', 6999.00, '产品名称：Hasee/神舟Z8 品牌: Hasee/神舟神舟系列型号: 神舟战神型号: Z8游戏本内存容量: 8GB 16G硬盘容量: 512G固态硬盘 1T机械硬盘 CPU: 英特尔 酷睿 i5-10200H显存容量: 6GB显卡类型: NVIDIA GeForce RTX3060', 997, 48, 'HaseeZ8.jpg');
INSERT INTO `shop` VALUES (4, '苹果MacBook', '全新正品 假一赔十', '电子产品', '笔记本电脑', 'Apple/苹果', 7999.00, '产品名称：Apple/苹果 Apple M1品牌: Apple/苹果型号: 13 英寸 MacBook Air内存容量: 8GB 统一内存 16GB 统一内存硬盘容量: 256GB 固态硬盘 512GB 固态硬盘 1TB 固态硬盘CPU: Apple M1显存容量: 8GB 统一内存显卡类型: 核芯显卡', 1498, 75, 'MacBook.jpg');
INSERT INTO `shop` VALUES (5, 'RedmiBook Pro 15', '2.5K屏 微米级一体精雕工艺', '电子产品', '笔记本电脑', 'MIUI/小米', 5799.00, '产品名称：便携式计算机产品名称：Xiaomi/小米 RedmiBook Pro 15 品牌: MIUI/小米型号: Pro 15内存容量: 16G硬盘容量: 512GB PCIe 固态硬盘CPU: 英特尔 酷睿 i5-11300H显存容量: 2GB显卡类型: NVIDIA MX450', 200, 40, 'redmi.jpg');
INSERT INTO `shop` VALUES (6, 'Apple/苹果 iPhone 12', '5G网络 双卡双待全国联保', '电子产品', '手机', 'Apple/苹果', 5699.00, 'Apple型号: iPhone 12机身颜色: 红色 白色 黑色 蓝色 绿色 紫色运行内存RAM: 4GB存储容量: 64GB 128GB 256GB网络模式: 5GCPU型号: 其他CPU型号: A14', 4493, 112, 'apple12.jpg');
INSERT INTO `shop` VALUES (7, '华为Mate 40', '送碎屏保 送影视会员 24期分期免息', '电子产品', '手机', 'Huawei/华为', 7038.00, '产品名称：Huawei/华为 P50 Pro华为型号: P50 Pro机身颜色: 拂晓粉 曜金黑 雪域白运行内存RAM: 8GB存储容量: 8+256GB 8+512GB 8+128GB网络模式: 双卡双待CPU型号: 麒麟9000', 1499, 46, 'Huaweimate40.jpg');
INSERT INTO `shop` VALUES (8, 'Apple/苹果iPhone 11 Pro', '咨询更优惠 套餐二送无线充 碎屏险', '电子产品', '手机', 'Apple/苹果', 4598.00, '产品名称：Apple/苹果 iPhone 11 ProApple型号: iPhone 11 Pro机身颜色: 苹果11白色 苹果11黑色 运行内存RAM: 4GB存储容量: 64GB 128GB 256GB 512GB网络模式: 双卡双待CPU型号: A13CPU型号: A13', 999, 75, 'apple11PRO.jpg');
INSERT INTO `shop` VALUES (9, 'Lenovo/联想小新Air14', '六核锐龙R5 金属外壳 指纹解锁', '电子产品', '笔记本电脑', 'Lenovo/联想', 4898.00, '产品名称：Lenovo/联想 小新 Air14品牌: Lenovo/联想型号: Air14 十代i5内存容量: 8GB 16G硬盘容量: 无机械硬盘CPU: AMD R5 5500U显存容量: 共享系统内存显卡类型: 核芯显卡', 2000, 88, 'LenovoAir14.jpg');
INSERT INTO `shop` VALUES (10, 'Lenovo/联想 拯救者R9000P', '【12期免息】【3系显卡】【2.5K高清屏】', '电子产品', '笔记本电脑', 'Lenovo/联想', 10498.00, '产品名称：Lenovo/联想 拯救者 R9000P品牌: Lenovo/联想型号: R9000P-新品内存容量: 16G硬盘容量: 512G固态硬盘CPU: AMD R7 5800H显存容量: 8GB显卡类型: NVIDIA GeForce RTX3070操作系统: windows 10', 1496, 154, 'LenovoR9000P.jpg');
INSERT INTO `shop` VALUES (11, 'Hasee神舟战神Z7', '11代处理器 新一代显卡 高色域 背光键盘', '电子产品', '笔记本电脑', 'Hasee/神舟', 6399.00, '产品名称：Hasee/神舟 神舟 战神Z7M品牌: Hasee/神舟神舟系列型号: 神舟型号: 战神Z7M内存容量: 8GB 16G硬盘容量: 512G固态硬盘 1T机械硬盘 G固态 1T机械硬盘+256G固态CPU: Intel CORE I7显存容量: 4G显卡类型: NVIDIA GeForce GTX1650', 1000, 60, 'Haseez7.jpg');
INSERT INTO `shop` VALUES (14, '花花公子青年机车服潮', '穿三年不龟裂，易打理，耐磨性强，舒适透气', '衣服', '男装', '花花公子', 269.00, '品牌: PLAYBOY/花花公子货号: L8877基础风格: 青春流行上市年份季节: 2017年秋季销售渠道类型: 纯电商(只在线上销售)材质成分: PU', 123, 24, 'HuaHua1.jpg');
INSERT INTO `shop` VALUES (15, '花花公子春秋季薄款韩版长袖T恤', '花花公子官方正品', '衣服', '男装', '花花公子', 139.00, '品牌: PLAYBOY/花花公子货号: NWXL-79-7908基础风格: 时尚都市上市年份季节: 2019年秋季厚薄: 常规销售渠道类型: 纯电商(只在线上销售)材质成分: 棉50% 聚酯纤维45%', 123, 24, 'HuaHua2.jpg');
INSERT INTO `shop` VALUES (16, '花花公子加绒加厚卫衣', '正品保证无理由退换赠送运费险', '衣服', '男装', '花花公子', 269.00, '品牌: PLAYBOY/花花公子货号: HPNM09基础风格: 商务绅士上市年份季节: 2017年冬季厚薄: 加绒销售渠道类型: 纯电商(只在线上销售)材质成分: 聚酯纤维100%', 123, 33, 'HuaHua3.jpg');
INSERT INTO `shop` VALUES (18, '樱洛芙原创圣诞lolita裙', '', '衣服', '女装', '樱洛芙', 380.00, '品牌: 樱洛芙适用年龄: 18-24周岁尺码: S M L面料: 其他图案: 卡通动漫风格: 洛丽塔领型: 其他/other腰型: 中腰衣门襟: 套头颜色分类: 官配长袖内搭 背带裙+腰饰印花飘带+领带袖型: 常规组合形式: 单件货号: L20J220240裙型: A字裙年份季节: 2021年冬季袖长: 无袖裙长: 中长裙流行元素/工艺: 印花款式: 背带廓形: A型材质成分: 聚酯纤维100%', 123, 36, 'Loli1.jpg');
INSERT INTO `shop` VALUES (19, 'Java核心技术卷1', '新华书店正版 编程语言 文轩网', '图书', '计算机软件书籍', '机械工业出版社', 199.00, 'ISBN编号: 9787111145653作者: 孙忱开本: 16开是否是套装: 否出版社名称: 机械工业出版社', 123, 36, 'javabook1.jpg');
INSERT INTO `shop` VALUES (20, 'Java核心技术卷2', '新华书店正版 编程语言 文轩网', '图书', '计算机软件书籍', '机械工业出版社', 139.00, 'ISBN编号: 9787111145654作者: 孙忱开本: 16开是否是套装: 否出版社名称: 机械工业出版社', 123, 36, 'javabook1.jpg');
INSERT INTO `shop` VALUES (21, '阿尔卑斯软糖500g', '约100颗 口味随机发货', '食品', '糖果', '阿尔卑斯', 19.00, '厂址：上海市闵行区江川路街道闵行经济技术开发区绿春路318号厂家联系方式：8008200820配料表：请见包装储藏方法：存放于干燥，太阳直射不到的地方保质期：540 天食品添加剂：请见包装品牌: 阿尔卑斯系列: 香软糖混合口味 散装 500g产地: 中国大陆省份: 上海包装方式: 散装产品: 软糖净含量: 500g钠含量: 267mg/100g', 233, 25, 'ABST.jpg');
INSERT INTO `shop` VALUES (24, '旺仔牛奶糖1000g', '1kg厂家原包装约320粒', '食品', '糖果', '旺旺', 37.00, '厂址：江苏省南京市江宁经济技术开发区董村路112号;江苏省南京市江宁空港枢纽经济区苍穹路1号厂家联系方式：4008211151配料表：详见包装说明保质期：540 天食品添加剂：详见包装说明品牌: 旺旺系列: 旺旺 旺仔牛奶糖（牛奶原味）1kg包装方式: 包装产品: 喜糖净含量: 1000g钠含量: 25mg/100g', 207, 120, 'WWtang.jpg');
INSERT INTO `shop` VALUES (25, '七匹狼男装夹克外套', '七匹狼，支持中国造，力挺新疆棉！', '衣服', '男装', '七匹狼', 479.00, '品牌: Septwolves/七匹狼货号: 1H1910106303-809基础风格: 其他上市年份季节: 2019年秋季厚薄: 薄销售渠道类型: 纯电商材质成分: 聚酯纤维100%', 121, 100, 'lang7feng.jpg');
INSERT INTO `shop` VALUES (26, '七匹狼秋季夹克', '七匹狼，支持中国造，力挺新疆棉！', '衣服', '男装', '七匹狼', 519.00, '品牌名称：Septwolves/七匹狼\r\n更多参数产品参数：\r\n\r\n品牌: Septwolves/七匹狼货号: ZH-1D1960704298-8465基础风格: 时尚都市上市年份季节: 2020年冬季销售渠道类型: 纯电商(只在线上销售)材质成分: 聚酯纤维100%', 106, 116, 'lang7jia.jpg');
INSERT INTO `shop` VALUES (27, '数码智能摄像望远镜', '数码屏显 可录像 可拍照', '电子产品', '数码摄像机', '博视乐', 599.00, '品牌: 博视乐货号: FS608上市时间: 2018年夏季产地: 中国价格区间: 200-500元款式: 双筒倍率: 10倍以上内存扩展容量: 1GB及以上电池类型: 锂电池视频文件格式: AVI照片文件格式: JPEG是否商场同款: 是颜色分类: 官方标配-数码屏显-无内存卡 套餐1-数码屏显-8G内存卡 套餐2-数码屏显-16G内存卡分辨率: 1920x1080', 123, 66, 'shuma.jpg');
INSERT INTO `shop` VALUES (28, '经典Razer雷蛇蝰蛇', '雷蛇蝰蛇鼠标 人体工程学 顺滑移动拒绝卡顿', '电子产品', '鼠标', 'Razer/雷蛇', 79.00, '产品名称：Razer/雷蛇 雷蛇 蝰蛇标准...品牌: Razer/雷蛇型号: 雷蛇 蝰蛇标准版 6400DPI成色: 全新售后服务: 全国联保接口类型: USB光学分辨率: 6400dpi工作方式: 光学套餐类型: 官方标配是否支持人体工程学: 是保修期: 24个月', 123, 44, 'Razer1.jpg');
INSERT INTO `shop` VALUES (29, '罗技g703hero电竞游戏无线鼠标', '支持无线充电(需另外选购充电鼠标垫)', '电子产品', '鼠标', '罗技G', 399.00, '产品名称：罗技G 罗技G703品牌: 罗技G型号: 罗技G703成色: 全新售后服务: 全国联保接口类型: USB按键数: 4个光学分辨率: 其他/other工作方式: 光电滚轮数: 1个无线技术: 2.4GHz套餐类型: 官方标配生产企业: 罗技（中国）科技有限公司是否支持人体工程学: 是是否盒装正品: 是保修期: 24个月\r\n', 122, 78, 'LuoJ1.jpg');
INSERT INTO `shop` VALUES (30, '罗技M90有线鼠标', '对称设计 全国联保 只换不修 即插即用', '电子产品', '鼠标', '罗技G', 45.00, '产品名称：Logitech/罗技 M90品牌: Logitech/罗技型号: M90成色: 全新售后服务: 全国联保接口类型: USB按键数: 3个光学分辨率: 1000dpi工作方式: 光电套餐类型: 官方标配 套餐一 套餐二是否支持人体工程学: 否包装尺寸: 1保修期: 12个月', 120, 80, 'LuoJ2.jpg');
INSERT INTO `shop` VALUES (31, '七匹狼男装夹克立领潮流外套', '官方正品 时尚立领 防泼水面料 可双面穿', '衣服', '男装', 'Septwolves/七匹狼', 539.00, '品牌: Septwolves/七匹狼面料分类: 涤纶货号: lsl1H1950102177基础风格: 时尚都市上市年份季节: 2021年春季厚薄: 常规销售渠道类型: 纯电商(只在线上销售)材质成分: 聚酯纤维100%', 331, 90, 'lang7jiake1.jpg');
INSERT INTO `shop` VALUES (32, '七匹狼真皮夹克', '绵羊皮革真皮皮衣', '衣服', '男装', 'Septwolves/七匹狼', 2599.00, '品牌名称：Septwolves/七匹狼\r\n更多参数产品参数：\r\n\r\n产品名称：Septwolves/七匹狼 1D165...品牌: Septwolves/七匹狼货号: 1D1650105652基础风格: 时尚都市上市年份季节: 2021年夏季销售渠道类型: 商场同款(线上线下都销售)材质成分: 绵羊皮', 230, 101, 'lang7jiake2.jpg');
INSERT INTO `shop` VALUES (33, '花花公子男士外套韩版潮流', '免费试穿送运费险', '衣服', '男装', '花花公子', 269.00, '品牌: PLAYBOY/花花公子面料分类: 涤纶货号: 19209JTPL2318基础风格: 青春流行上市年份季节: 2019年秋季厚薄: 常规销售渠道类型: 纯电商(只在线上销售)材质成分: 聚酯纤维89% 聚氨酯弹性纤维(氨纶)11%\r\n ', 232, 78, 'lang7jiake3.jpg');
INSERT INTO `shop` VALUES (34, '花花公子秋冬季工装夹克', '花花公子正品保障！15天包邮退换！售后无忧', '衣服', '男装', '花花公子', 279.00, '品牌: PLAYBOY/花花公子面料分类: 涤纶货号: KBG2098196基础风格: 青春流行上市年份季节: 2021年秋季厚薄: 厚款销售渠道类型: 纯电商(只在线上销售)材质成分: 聚酯纤维100%', 233, 66, 'lang7jiake4.jpg');
INSERT INTO `shop` VALUES (35, '花花公子长袖t恤', '官方正品', '衣服', '男装', '花花公子', 139.00, '品牌: PLAYBOY/花花公子货号: HH-qaXQ128基础风格: 青春流行上市年份季节: 2021年秋季厚薄: 常规销售渠道类型: 纯电商(只在线上销售)材质成分: 棉95% 聚氨酯弹性纤维(氨纶)5%\r\n', 233, 66, 'huahuatxue.jpg');

-- ----------------------------
-- Table structure for shoper
-- ----------------------------
DROP TABLE IF EXISTS `shoper`;
CREATE TABLE `shoper`  (
  `shoperid` int(11) NOT NULL AUTO_INCREMENT,
  `shopername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` double(255, 0) NOT NULL,
  PRIMARY KEY (`shoperid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoper
-- ----------------------------
INSERT INTO `shoper` VALUES (1, 'Dell/戴尔', '666666', 1000);

-- ----------------------------
-- Table structure for usermessage
-- ----------------------------
DROP TABLE IF EXISTS `usermessage`;
CREATE TABLE `usermessage`  (
  `userid` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `truename` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usermessage
-- ----------------------------
INSERT INTO `usermessage` VALUES (2, 'test1', '陈龙涛', '江西南昌', '19970034896');

SET FOREIGN_KEY_CHECKS = 1;
