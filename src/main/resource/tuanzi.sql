/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : tuanzi

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 20/04/2019 22:06:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` int(255) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter`  (
  `cpid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cpname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'chapter video name',
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'real path/course name ',
  PRIMARY KEY (`cpid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of chapter
-- ----------------------------
INSERT INTO `chapter` VALUES ('1526561185890', '1章 Java初体验', '运用Java开发第一个程序。', '1526284527324', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526561282532', '1-1 了解Java语言', '1526561282532_1-1 了解Java语言.txt', '1526284527324', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526561338400', '1-2 JVM和Java跨平台特性', '1526561338401_1-2 JVM和Java跨平台特性.txt', '1526284527324', '1', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608652120', '2章 变量和常量 ', '本章节主要讲解如何在 Java 程序中应用变量和常量进行数据操作、数据类型分类及基本数据类型间的类型转换', '1526285125140', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608717805', '1-4 程序的移植', '1526608717806_1-4 程序的移植.txt', '1526285125140', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608734742', '1-5 经验和技巧的分享', '1526608734742_1-5 经验和技巧的分享.txt', '1526285125140', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608755901', '2-1 Java中的关键字', '1526608755901_2-1 Java中的关键字.txt', '1526284380125', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608781982', '2-2 Java中的标识符', '1526608781982_2-2 Java中的标识符.txt', '1526284380125', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608802797', '2-3 如何命名Java变量', '1526608802797_2-3 如何命名Java变量.txt', '1526284380125', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608823629', '2-4 Java中的数据类型', '1526608823629_2-4 Java中的数据类型.txt', '1526284380125', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608844909', '2-5 Java中的自动类型转换', '1526608844909_2-5 Java中的自动类型转换.txt', '1526284380125', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608879278', '2-6 Java中的强制类型转换', '1526608879278_2-6 Java中的强制类型转换.txt', '1526284380125', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('1526608899062', '2-7 Java常量的应用', '1526608899062_2-7 Java常量的应用.txt', '1526284380125', '0', '1526560766580', '', '');
INSERT INTO `chapter` VALUES ('211001', '1-1 初始C语言', '311001211001.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211002', '1-2 C程序结构', '311001211002.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211003', '2-1 有名有姓的C', '311002211003.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211004', '2-2 变量及赋值', '311002211004.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211005', '2-3 基本数据类型', '311002211004.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211006', '2-4 格式化输出语句', '311002211004.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211007', '2-5 不可改变的常量', '311002211004.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211008', '2-6 自动类型转换', '311002211004.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211009', '2-7 强制类型转换', '311002211004.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211010', '3-1 算术运算符', '311001211001.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211011', '3-2 自增与自减运算符', '311001211002.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211012', '3-3 赋值运算符', '311002211003.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211013', '3-4 关系运算符', '311002211004.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('211014', '3-5 逻辑运算符', '311002211004.txt', '1526284749388', '0', '909005', '', '');
INSERT INTO `chapter` VALUES ('311001', '1章 初始C程序', '简述C语言，编写第一个 HelloWorld程序。介绍C程序的组成结构，什么是主函数，C语言中的规范，解释什么是注释以及书写注释的意思和重要', '1526284749388', '', '909005', '', '');
INSERT INTO `chapter` VALUES ('311002', '2章 C中的数据类型', '本章节主要讲解C语言的算术运算符、赋值运算符、关系运算符、逻辑运算符以及运算符之间的优先级。', '1526284749388', '', '909005', '', '');
INSERT INTO `chapter` VALUES ('311003', '3章 C中的运算符', '本章节主要简述了什么是标识符和变量、介绍C语言的基本数据类型，详细讲解了基本数据类型之间的转换。', '1526284749388', '', '909005', '', '');
INSERT INTO `chapter` VALUES ('311004', 'djfshj ', 'dhfjh ', '1526284749388', NULL, NULL, '', '');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `likenum` int(11) NULL DEFAULT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reuid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`comid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('120004', '1555416738621', '问题1的评论回复', 99, '16166800985', '815001', '909005');
INSERT INTO `comment` VALUES ('1555427586196', '1555416738621', '划分的后代', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555427609003', '1555416738621', '城管局', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555427657710', '1555426174002', '听话话', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555474684659', '1555416738621', '', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555487231557', '1555416738621', '1的', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555487267967', '1555416738621', '111', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555487354170', '1555416738621', '111', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555487455690', '1555416738621', '1111', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555487719320', '1555416738621', '111', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555488347838', '1555416738621', '111', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555488352765', '1555416738621', '111', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555489157970', '1555416738621', '1111', NULL, '815002', NULL, NULL);
INSERT INTO `comment` VALUES ('1555489166521', '1555416738621', 'abc', NULL, '815002', NULL, NULL);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updatetime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typeId` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseImg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `files` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `accessNum` int(11) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1526282010211', 'C++', '815001', '2018-5-14 15:13:31', '2018-5-14', '本课程将带领大家体会面向对象三大特性中的多态特性，讲述了虚函数、抽象类和接口类等概念，以及多态的实现原理，课程的最后引入RTTI及异常处理，使整个多态篇更加完整，更具实战指导性，本门课程是C++远征课程的高潮和经典，对于面向对象的语言的学习将大有裨益。', NULL, '510002', 'b8c9e2eecb30428a8bc5b288d9cb4c5e.jpg', NULL, '100', 100, NULL, 1);
INSERT INTO `course` VALUES ('1526283837408', 'C++远征之继承篇', '815002', '2018-5-14 15:43:57', '2018-5-14', '本课程将带领大家体会C++面向对象三大特性中的继承特性，讲述了基类、派生类的概念，公有继承、保护继承和私有继承、多重继承及多继承，虚析构函数及虚继承的作用，理解课程内容对于面向对象的学习将大有裨益，所有知识均通过编码实践的方式讲解到操作层面，力求即学即会。', NULL, '510002', '1526283837408.jpg', NULL, '0', 130, NULL, 1);
INSERT INTO `course` VALUES ('1526284380125', 'C++远征之封装篇（下）', '815001', '2018-5-14 15:53:00', '2018-5-14', '本课程是真正跨入C++面向对象之门，讲述了对象数组、成员、指针，this指针，常对象、引用、指针、成员函数以及深拷贝和浅拷贝，课程的最后讲述了一个迷宫案例，通过这个案例可以将C++所学知识融会贯通，所有知识均通过编码实践的方式讲解到操作层面，力求即学即会。', NULL, '510002', '1526284380125-2.jpg', NULL, '1', 160, NULL, 1);
INSERT INTO `course` VALUES ('1526284425616', 'C++远征之封装篇（上）', '815001', '2018-5-14 15:53:45', '2018-5-14', '本课程将代领小伙伴们真正迈入C++语言的面向对象大门，在课程中，将会深入讲解类的定义方法，属性的封装方法，构造函数和析构函数等内容，并且所有知识均会通过编码实践的方式讲解到操作层面，力求帮助小伙伴们即学即会！\r\n            ', NULL, '510002', '1526284380125-1.jpg', NULL, '1', 170, NULL, 1);
INSERT INTO `course` VALUES ('1526284527324', 'Java模板引擎之Freemarker', '815002', '2018-5-14 15:55:27', '2018-5-14', '在web开发框架中，MVC模式是最常用的设计模式。企业web应用基本都会用到。Freemarker的设计可以用来生成HTML。它语法简单、功能强大、灵活，宏模板可复用，是互联网前端很常用的技术。而且Spring对Freemarker的整合也很nice。所以是web开发人员必要掌握的技术之一。\r\n            ', NULL, '510003', 'd5bff03147fb4288a2c8df44a864b021_5.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526284749388', 'JAVA Web开发技术应用——监听器', '815002', '2018-5-14 15:59:09', '2018-5-14', '本课程从Java Web中的监听器的概念和用途入手，紧接着讲解监听器的第一个实例，然后由浅到深地从启动顺序到分类、从Servelt2.5到 \r\nServlet3.0，重点讲解了两种分类，包括按监听的对象划分和按监听的事件划分，最后以一个实际项目中统计在线人数的案例进行讲解。\r\n', NULL, '510003', '5cc6f3269b8440d19c5efa62d0d622e7_6.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526284784697', '初识Java微信公众号开发', '815002', '2018-5-14 15:59:44', '2018-5-14', '微信拥有庞大的用户基础，微信公众号的相关开发也比较热门，本套课程就带领大家进入Java微信公众号开发的精彩世界，学习微信公众号开发的相关概念，编辑模式和开发模式应用，以及百度BAE的使用。', NULL, '510003', '5a32e7bda23c40ebbcd2548f05b3c0cb_7.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526284851340', 'C#面向对象编程', '815002', '2018-5-14 16:00:51', '2018-5-14', '本系列课程主要学习c#的面向对象编的编程思想、编程技巧，以及继承、多态、静态类、接口、重载运算符、泛型和委托知识点。通过一个宠物商店的简单案例，贯穿整个课程，让学习变得轻松有趣！\r\n            ', NULL, '510004', '4e82320c3a2948e2b4cf7fd668b8a02b_8.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526284874462', 'C#实现封装', '815002', '2018-5-14 16:01:14', '2018-5-14', '在本次课程中，@绿豆开门从类和对象的概念入手，围绕面向对象的三大技术之一——封装进行讲解。将带领大家学习属性封装的技术，深入理解方法的声明和应用，帮助大家使用C#语言的语法和面向对象的编程思想解决实际问题。\r\n            ', NULL, '510004', 'f67a6379995f40c6a3c65910d56d6a2c_9.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526284938252', 'C#开发轻松入门', '815002', '2018-5-14 16:02:18', '2018-5-14', '本门课程是C#语言的入门教程，在课程中，将从.NET平台和C#的基本概念开始，深入的介绍C#开发的基础语法、简单程序逻辑、Visual \r\nStudio工具的使用技巧以及常用的算法的实现。同时，也希望通过与课程相关的练习题和编程练习，帮助小伙伴们快速步入C#语言的大门。', NULL, '510004', 'fdda64581a284227aadde0e529ce8cfb_10.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285104283', '区块链技术核心概念与原理讲解', '815001', '2018-5-14 16:05:04', '2018-5-14', '区块链已火遍全球，行业人才急缺，岗位炙手可热，学习正当时，本次特邀登链科技首席技术官(Tiny熊），为你讲解区块链技术核心概念与原理。', NULL, '510005', '6397aedc4eef4ef5a72eee5ce4a0f73a_12.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285125140', 'Python实现线性回归', '815001', '2018-5-14 16:05:25', '2018-5-14', '对于机器学习的入门学习者提供线性回归的原理讲解，在掌握原理的基础上，利用python实现最小二乘法或者梯度下降来进行线性回归分析。\r\n            ', NULL, '510005', 'ed610639e5564bf0a0fb2a09c578b520_13.jpg', NULL, '1', 128, NULL, 1);
INSERT INTO `course` VALUES ('1526285150007', 'Python人工智能常用库Numpy使用入门', '815001', '2018-5-14 16:05:50', '2018-5-14', '人工智能的很多方关于数据的操作，机器学习，深度学习，大数据，数据分析等，或多或少都会用到numpy这一python工具库。本课程从搭建环境开始，从anaconda，jupyter\r\n notebook，再到课程重点numpy工具库的使用，让你快速掌握这一热门框架。\r\n            ', NULL, '510005', '9d83866faa8348de9596c01e7adf1199_14.jpg', NULL, '165', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285245449', 'Python-面向对象', '815001', '2018-5-14 16:07:25', '2018-5-14', '面向对象是目前编程语言里面非常主流的一种思想。Python对于面向对象有非常好的实现。同时，借助Python灵活的语法，可以实现一些很酷的面向对象特性。\r\n            ', NULL, '510005', 'baa593168ffd44d3b19cd03c34e34562_15.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285272512', 'Python-走进Requests库', '815001', '2018-5-14 16:07:52', '2018-5-14', '通过requests类库的学习，理解HTTP基本原理，并能够纯熟地使用requests和Github API进行数据交互。除此之外，你还能够获得诸如HTTP认证，Oauth授权等进阶知识和技能.\r\n            ', NULL, '510005', 'c10326d8a9964d1ea64e8c24f69d9f6d_17.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285341464', 'Python操作MySQL数据库', '815001', '2018-5-14 16:09:01', '2018-5-14', '本课程讲解Python如何开发MySQL数据库程序。首先介绍Python开发数据库程序的通用接口规范，然后搭建Python开发数据库程序的开发环境，接着了解了通用接口规范中的connection、cursor两大对象之后，介绍如何增删改查数据库，最后以实例代码演示数据库程序的开发流程。', NULL, '510005', '2a5375b29bea461aacc79f628bfb112a_18.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285472042', 'css定位 position', '815001', '2018-5-14 16:11:12', '2018-5-14', '本课程，将带领大家了解一下定位的知识，教大家如何通过定位来进行布局。\r\n            ', NULL, '510006', '7b506e917c6141878101b671c84517b8_19.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285503832', '浅谈搜索引擎_SEO', '815001', '2018-5-14 16:11:43', '2018-5-14', '本课程主要讲解什么是SEO，以及SEO的作用是什么以及在那些方面能够用到SEO。\r\n            ', NULL, '510006', '1526285503832.jpg', NULL, '0', 167, NULL, 1);
INSERT INTO `course` VALUES ('1526285533031', 'JS实现京东无延迟菜单效果', '815002', '2018-5-14 16:12:13', '2018-5-14', '通过模仿京东商城的无延迟菜单效果，学习到菜单的结构和样式处理，菜单常见交互如何开发，介绍了普通二级菜单的问题，并通过逐步优化去解决该问题。\r\n            ', NULL, '510006', 'bef881c26975460eb06ae91fe3a0ed4e_21.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285560571', 'H5+JS+CSS3实现七夕言情', '815002', '2018-5-14 16:12:40', '2018-5-14', '七夕邻近，才子佳人们又要开始约会了，为了心爱的她献上一份不一样的浪漫。本课程中使用面向接口的编程方式，采用H5+JS+CSS3的混合使用实现整个功能。课程当中总共分为3个主题场景图，多个精灵图以及雪碧图，实现了静与动的完美结合，并且由浅入深的将整个案例拆分讲解。\r\n\r\n            ', NULL, '510006', '1526285560571.jpg', NULL, '0', 159, NULL, 1);
INSERT INTO `course` VALUES ('1526285587640', 'AC2016腾讯前端技术大会', '815002', '2018-5-14 16:13:07', '2018-5-14', '本课程是腾讯前端团队Alloyteam参与主办的AC2016前端技术大会现场实录。大会分享议题涉及最近流行的ReactNative、Node.js、Angular.js、RXjs等技术。精彩分享不容错过！\r\n            ', NULL, '510006', 'ed833eb042964bd6bf1c7a5e434897ec_23.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526285694586', 'Javascript实现二叉树算法', '815002', '2018-5-14 16:14:54', '2018-5-14', 'Javascript发展越来越快，并且将触角延伸到各个领域，几乎有一统江湖之势。无论是前端，后台服务器，移动开发，Javascript无不占据着重要位置，学习和使用Javascipt这门编程语言是性价比最高的，学习Javascript算法也相当重要的。\r\n            ', NULL, '510007', '0cd746ae65ba4d28850f3fa11c244afc_24.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526286374328', '     WEB前端丨HTML入门', '815002', '2018-5-14 16:26:14', '2018-5-14', '本课程，你将学到利用JavaScript运行原理，做出日历定时器的方法，使用JavaScript进行页面处理，完成页面动态交互的实现。', NULL, '510013', '3cb3abd3f062450185af801123c8bd0e_25.jpg', NULL, '0', 126, NULL, 1);
INSERT INTO `course` VALUES ('1526560766580', 'Java基础入门阶段（javase教程，零基础java入门教程）', '815001', '2018-5-17 20:39:26', '2018-5-14', 'Java基础入门阶段（javase教程，零基础java入门教程）（阶段一）支持随到随学', NULL, '510003', 'a8b15cbc152142878e3d357e1bac3ef4_java.jpg', NULL, NULL, 131, NULL, 1);
INSERT INTO `course` VALUES ('1526601415367', 'C4D/PS/AI/CDR新锐平面设计实战', '815001', '2018-5-18 7:56:55', NULL, 'PS爱好者、大学生、商家、广告店主、装饰人群、商场美工、网站美工、印刷、包装等相关平面广告行业人群', NULL, '510013', '085522617fb14f959434a1f7c69ebfd7_26.jpg', NULL, NULL, 10, NULL, 1);
INSERT INTO `course` VALUES ('1526601503338', '一节课学会板式设计', '815001', '2018-5-18 7:58:23', NULL, '电商美工海报特训班。设计总监授课，视频批改作业', NULL, '510013', '2a44f9a8d41f4ee4b5f696f75e345e73_27.jpg', NULL, NULL, 1, NULL, 1);
INSERT INTO `course` VALUES ('1526601605251', '人像精修商业教程', '815001', '2018-5-18 8:00:05', NULL, '塾乐精品小课案例每周更新-VIP学员可学习全部案例-非付费学员可学习部分案例', NULL, '510014', '333de42395ae427d8a1c1d5cdc331129_29.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526601718471', '电商C4D超级美工三期', '815001', '2018-5-18 8:01:58', NULL, 'C4D商业超级美工零基础学习', NULL, '510013', 'ad93c476379a407592bbd9fac1d21724_28.jpg', NULL, NULL, 20, NULL, 1);
INSERT INTO `course` VALUES ('1526601794025', '【直播日更】摩登口语圈 名校外教英语', '815001', '2018-5-18 8:03:14', NULL, '课程以直播和录播的方式为学员呈现，中外教英语讲师跟大家分享口语发音细节与技巧。', NULL, '510025', '1b75e02dd86741f0aeb81a8bbe23c1e2_30.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526601835019', '募格学术-如何说一口标准的英语', '815001', '2018-5-18 8:03:55', NULL, '指明常见发音误区，详解正确学习方法，助你练就一口令人羡慕的标准英语', NULL, '510025', 'd76ce7a63b0b4898a25d356b6c197f76_31.jpg', NULL, NULL, 10, NULL, 1);
INSERT INTO `course` VALUES ('1526601885796', '老k英语， 之1/6课 ', '815001', '2018-5-18 8:04:45', NULL, '英语原来很简单，48个国际音标搞定', NULL, '510025', '105c318175694017b80649d727181288_32.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526601935427', '跟着Meg老师读故事学英语', '815001', '2018-5-18 8:05:35', NULL, '师通过讲故事的形式无形之中给广大英语学习爱好者传授英语', NULL, '510025', '93ed75fe698747e48fe91bb8e1f13fa3_33.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602012049', '羊驼PTE【口语低分】终极逆袭策略', '815001', '2018-5-18 8:06:52', NULL, '羊驼老师带你一节课看懂 导致PTE口语分低的‘十大原因’', NULL, '510026', 'eb121c518e4344da8fd6b81a5da3b245_34.jpg', NULL, NULL, 56, NULL, 1);
INSERT INTO `course` VALUES ('1526602082610', '2019国考 2018下半年省考笔试公开课', '815001', '2018-5-18 8:08:02', NULL, '2019国考 2018下半年省考笔试公开 名师教你如何进面试！', NULL, '510037', '7415202838424f7e9d016c4b7e93c17a_35.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602123986', '2018各省考多省联考公务员笔试行测申论高分', '815001', '2018-5-18 8:08:43', NULL, '2018联考精准备考指导及全程高能免费陪练。\r\n单点狙击，精准破难！', NULL, '510037', 'dabca99654084472ad57529dbe22bcfc_36.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602166666', '2018年下半年申论精讲班', '815001', '2018-5-18 8:09:26', NULL, '申论考点精讲班，小班化管理，保姆式监督，每晚在线上课，携您拒绝懒惰，带您上岸。', NULL, '510037', '785d180b33054f708384d9e43177d9ac_37.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602223398', '2018浙江省事业单位联考—笔试系统班', '815001', '2018-5-18 8:10:23', NULL, '2018浙江省事业单位联考—笔试系统班', NULL, '510038', '51c94d1e3c6a4d5884049649412d568b_38.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602316845', '最详细的英语语法精讲第一卷', '815001', '2018-5-18 8:11:56', NULL, '用海量的例子，通俗的语言讲解晦涩枯燥的英语语法。', NULL, '510050', 'c7e2ce2386774e49a6791133d7b0c51a_video.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602352294', '【2019心理学考研】你的报考院校选对了吗？', '815001', '2018-5-18 8:12:32', NULL, '报考院校的选择对于考研来说至关重要，你的院校选对了吗？', NULL, '510049', '35b4c072d79c45089a8d07e3b40bcdf5_40png.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602395860', '【经验分享课】跨专业考生', '815001', '2018-5-18 8:13:15', NULL, '该课程主要是解答跨专业考生对心理学考研困惑以及学长学姐经验分享。', NULL, '510049', 'ef470e4b64ae4e1f8053a6f5b58f2b5a_41.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602540259', '零基础炒股（投资理财）', '815001', '2018-5-18 8:15:40', NULL, '新手要从基本的做起，包括对什么是股票，什么是K线、如何买卖、股市的构成特点。', NULL, '510061', 'e932be3092c84005995d8171142da771_42.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602593388', '【趣弹】零基础尤克里里弹唱教学', '815001', '2018-5-18 8:16:33', NULL, '零基础想要迅速的学习一门乐器，尤克里里是最好的选择！', NULL, '510062', '2c2f982b2ee5420b981da92581a985a4_43.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602629577', '乐理及五线谱基础课程', '815001', '2018-5-18 8:17:09', NULL, '为大家进行了通俗易懂的入门音乐知识地系统讲解', NULL, '510062', 'af2b68a2fc034636a5de98506320c715_44.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602665067', '带你走进基础乐理课', '815001', '2018-5-18 8:17:45', NULL, '一起走进基础乐理课吧', NULL, '510062', 'd3d66db50ba741fc91a1d1c3e08419ed_45.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602731371', '第二章尤克里里零基础教学', '815001', '2018-5-18 8:18:51', NULL, '学习了第一章尤克里里零基础教学视频前六课的小伙伴可以看往下看第二章尤克里里零基础教学哦~', NULL, '510074', 'e5a28119788247e7b724af316a4fbf03_46.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602775228', '音乐基础知识-初级 视频教程 中央音乐学院音基考级', '815001', '2018-5-18 8:19:35', NULL, '更好地提升我们的音乐素养和能力！', NULL, '510074', 'cb53f6711d4a40b2a012b98120bbe759_47.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602826060', 'D和G调琴转调', '815001', '2018-5-18 8:20:26', NULL, '线谱对古筝的普及推广，以及规范化有重要的意义', NULL, '510074', '3b0d317ddc194e8e94de9be9c183e2c8_48.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602920794', '《微笑的女孩》（常速版）', '815001', '2018-5-18 8:22:00', NULL, '人物肖像油画速写全过程（常速播放版）无讲解', NULL, '510073', '930fc1d9005d431f9030834599e7da58_49.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526602988699', '油画棒，原来可以这样画', '815001', '2018-5-18 8:23:08', NULL, '一盒油画棒，一张纸，就可以开始学习临摹印象派油画拉......', NULL, '510073', 'a5d2ce35780f4bedbb1f5bcb76293c38_50.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526607231339', '2018年省考', '815001', '2018-5-18 9:33:51', NULL, '\r\n                                    2018年省考（适用于事业单位、政法干警、三支一扶面试名师精讲）', NULL, '510037', 'c95064d7484e4b0daae5ca56b4ec57b7_51.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526607280708', '2018考研复试吐槽大会', '815001', '2018-5-18 9:34:40', NULL, '我们吐槽什么——', NULL, '510049', '7a5fea6085f14109a5994db9b864a87f_52.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526607338732', '2019心理学考研基础阶段规划课', '815001', '2018-5-18 9:35:38', NULL, '2019心理学考研基础阶段规划课，助你有效夯实基础，明确复习思路。\r\n<br>\r\n', NULL, '510049', '4f11df1a018041b6a80e99c6a92e5c3c_53.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526607383977', '原味缠论集训-理论篇', '815001', '2018-5-18 9:36:23', NULL, '只要你是炒股的朋友，不分你的等级', NULL, '510061', '5d8e0ed34f754c759ebdd35695ba4cb1_54.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526607444508', '佣金宝牛金大学股市谈谈谈系列视频', '815001', '2018-5-18 9:37:24', NULL, '帮助亲们提升投资水平、抓住市场机会，从股市获取更多收益！', NULL, '510061', '5e5fba4c20fc425b9603c73c831e4682_55.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526607496436', '晚间技术课', '815001', '2018-5-18 9:38:16', NULL, '学习学禅都将能够运用《缠中说禅》经典体系进行解剖股市密码', NULL, '510061', '39e8fb37f3c04ddda5109236f11d1d3d_56.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526607579612', '油画入门（油画小白成长记）', '815001', '2018-5-18 9:39:39', NULL, '高雅不高难，快来试一试！', NULL, '510073', '5502efdfa90c49ffade93aa0ef098ad4_57.jpg', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('1526607619821', '《趣味油画》印象派/美术', '815001', '2018-5-18 9:40:19', NULL, '想画油画吗？其实也很简单的', NULL, '510073', '689430a1cddb4912a20ad0101ad92e5a_58.png', NULL, NULL, NULL, NULL, 1);
INSERT INTO `course` VALUES ('909002', 'Linux C语言结构体', '815001', '2018-04-02', '2018-04-03', '希望通过本课程的学习，能帮助小伙伴们进一步的理解C语言。', '内容', '510001', '909002.jpg', 'files', '99', 128, '', 1);
INSERT INTO `course` VALUES ('909003', 'Linux C语言指针与内存', '815001', '2018-04-03', '2018-04-13', '本课程通过图形与程序实验，配合gdb调试工具，将c语言编程中最难理解的内存管理与指针形象的展示在大家面前。', '内容', '510001', '909003.jpg', 'files', '99', 128, '', 1);
INSERT INTO `course` VALUES ('909004', 'Linux C语言编程原理与实践', '815001', '2018-04-03', '2018-04-13', '介绍C语言基本工作原理以及适用与C的实际开发方式。', '内容', '510001', '909004.jpg', 'files', '99', 128, '', 2);
INSERT INTO `course` VALUES ('909005', 'C语言入门', '815001', '2018-04-13', '2018-04-13', '希望通过本教程帮助C语言入门学习者迅速掌握程序逻辑并开始C语言编程。', '311001,311002', '510001', '909005.jpg', 'files', '99', 180, '', 1);

-- ----------------------------
-- Table structure for coursetype
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype`  (
  `typeId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ctname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `partype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of coursetype
-- ----------------------------
INSERT INTO `coursetype` VALUES ('510001', 'C', '610001', '');
INSERT INTO `coursetype` VALUES ('510002', 'C++', '610001', '');
INSERT INTO `coursetype` VALUES ('510003', 'Java', '610001', '');
INSERT INTO `coursetype` VALUES ('510004', 'C#/.Net', '610001', '');
INSERT INTO `coursetype` VALUES ('510005', 'Python', '610001', '');
INSERT INTO `coursetype` VALUES ('510006', 'HTML/CSS', '610001', '');
INSERT INTO `coursetype` VALUES ('510007', 'JavaScript', '610001', '');
INSERT INTO `coursetype` VALUES ('510008', 'Android开发', '610001', '');
INSERT INTO `coursetype` VALUES ('510009', 'IOS开发', '610001', '');
INSERT INTO `coursetype` VALUES ('510010', 'Linux运维', '610001', '');
INSERT INTO `coursetype` VALUES ('510011', '大数据', '610001', '');
INSERT INTO `coursetype` VALUES ('510012', '人工智能', '610001', '');
INSERT INTO `coursetype` VALUES ('510013', '网页美工', '610002', '');
INSERT INTO `coursetype` VALUES ('510014', '摄影后期', '610002', '');
INSERT INTO `coursetype` VALUES ('510015', '广告海报', '610002', '');
INSERT INTO `coursetype` VALUES ('510016', '游戏UI设计', '610002', '');
INSERT INTO `coursetype` VALUES ('510017', 'Photoshop', '610002', '');
INSERT INTO `coursetype` VALUES ('510018', 'CAD', '610002', '');
INSERT INTO `coursetype` VALUES ('510019', '动画设计', '610002', '');
INSERT INTO `coursetype` VALUES ('510020', '影视特效', '610002', '');
INSERT INTO `coursetype` VALUES ('510021', '室内设计', '610002', '');
INSERT INTO `coursetype` VALUES ('510022', '建筑设计', '610002', '');
INSERT INTO `coursetype` VALUES ('510023', '手绘', '610002', '');
INSERT INTO `coursetype` VALUES ('510024', '后期剪辑', '610002', '');
INSERT INTO `coursetype` VALUES ('510025', '英语口语', '610003', '');
INSERT INTO `coursetype` VALUES ('510026', '学术英语', '610003', '');
INSERT INTO `coursetype` VALUES ('510027', '雅思', '610003', '');
INSERT INTO `coursetype` VALUES ('510028', '托福', '610003', '');
INSERT INTO `coursetype` VALUES ('510029', '英语四级', '610003', '');
INSERT INTO `coursetype` VALUES ('510030', '英语六级', '610003', '');
INSERT INTO `coursetype` VALUES ('510031', '韩语零基础', '610003', '');
INSERT INTO `coursetype` VALUES ('510032', '韩流文化', '610003', '');
INSERT INTO `coursetype` VALUES ('510033', '法语', '610003', '');
INSERT INTO `coursetype` VALUES ('510034', '德语', '610003', '');
INSERT INTO `coursetype` VALUES ('510035', '西班牙语', '610003', '');
INSERT INTO `coursetype` VALUES ('510036', '方言', '610003', '');
INSERT INTO `coursetype` VALUES ('510037', '公务员', '610004', '');
INSERT INTO `coursetype` VALUES ('510038', '教师考试', '610004', '');
INSERT INTO `coursetype` VALUES ('510039', '法律硕士', '610004', '');
INSERT INTO `coursetype` VALUES ('510040', '会计从业', '610004', '');
INSERT INTO `coursetype` VALUES ('510041', '注册会计师', '610004', '');
INSERT INTO `coursetype` VALUES ('510042', '执业药师', '610004', '');
INSERT INTO `coursetype` VALUES ('510043', '一级建造师', '610004', '');
INSERT INTO `coursetype` VALUES ('510044', '工程造价', '610004', '');
INSERT INTO `coursetype` VALUES ('510045', '人力资源', '610004', '');
INSERT INTO `coursetype` VALUES ('510046', '心理咨询', '610004', '');
INSERT INTO `coursetype` VALUES ('510047', '计算机等级考试', '610004', '');
INSERT INTO `coursetype` VALUES ('510048', '企业培训', '610004', '');
INSERT INTO `coursetype` VALUES ('510049', '规划指导', '610005', '');
INSERT INTO `coursetype` VALUES ('510050', '考研英语', '610005', '');
INSERT INTO `coursetype` VALUES ('510051', '考研政治', '610005', '');
INSERT INTO `coursetype` VALUES ('510052', '考研数学', '610005', '');
INSERT INTO `coursetype` VALUES ('510053', '专业课', '610005', '');
INSERT INTO `coursetype` VALUES ('510054', '自考', '610005', '');
INSERT INTO `coursetype` VALUES ('510055', '专升本', '610005', '');
INSERT INTO `coursetype` VALUES ('510056', '高考备战', '610005', '');
INSERT INTO `coursetype` VALUES ('510057', '中考备战', '610005', '');
INSERT INTO `coursetype` VALUES ('510058', '语文', '610005', '');
INSERT INTO `coursetype` VALUES ('510059', '数学', '610005', '');
INSERT INTO `coursetype` VALUES ('510060', '英语', '610005', '');
INSERT INTO `coursetype` VALUES ('510061', '证券投资', '610006', '');
INSERT INTO `coursetype` VALUES ('510062', '音乐基础', '610006', '');
INSERT INTO `coursetype` VALUES ('510063', '乐器演奏', '610006', '');
INSERT INTO `coursetype` VALUES ('510064', '摄影', '610006', '');
INSERT INTO `coursetype` VALUES ('510065', '书法', '610006', '');
INSERT INTO `coursetype` VALUES ('510066', '益智休闲', '610006', '');
INSERT INTO `coursetype` VALUES ('510067', '健身训练', '610006', '');
INSERT INTO `coursetype` VALUES ('510068', '家居家装', '610006', '');
INSERT INTO `coursetype` VALUES ('510069', '时尚美妆', '610006', '');
INSERT INTO `coursetype` VALUES ('510070', '动植育养', '610006', '');
INSERT INTO `coursetype` VALUES ('510071', '亲子启蒙', '610006', '');
INSERT INTO `coursetype` VALUES ('510072', '少儿编程', '610006', '');
INSERT INTO `coursetype` VALUES ('510073', '国画油画', '610007', '');
INSERT INTO `coursetype` VALUES ('510074', '音乐基础', '610007', '');
INSERT INTO `coursetype` VALUES ('510075', '素描', '610007', '');
INSERT INTO `coursetype` VALUES ('610001', 'IT 互联网', '0', '');
INSERT INTO `coursetype` VALUES ('610002', '设计 创作', '0', '');
INSERT INTO `coursetype` VALUES ('610003', '语言 留学', '0', '');
INSERT INTO `coursetype` VALUES ('610004', '职业 考证', '0', '');
INSERT INTO `coursetype` VALUES ('610005', '升学 考研', '0', '');
INSERT INTO `coursetype` VALUES ('610006', '兴趣 生活', '0', '');
INSERT INTO `coursetype` VALUES ('610007', '音乐 美术', '0', '');

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data`  (
  `did` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`did`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES ('1526289178298', '909005', 'ffc3867ceb3241669c46f54937d7663f_C语言库函数.rar');
INSERT INTO `data` VALUES ('1526289249162', '909005', 'b7a30fb7905b4aa59dd0229d2f470324_第二章综合练习.zip');
INSERT INTO `data` VALUES ('1526289255608', '909005', '3781843185f34ba1a64206e50b14c835_第三章综合练习.zip');
INSERT INTO `data` VALUES ('1526609277623', '1526560766580', '9142229458b246719627684b1f95f985_第一章参考代码.rar');
INSERT INTO `data` VALUES ('1526609287609', '1526560766580', '24230d46990d4a78b09d2aa347e0f978_环境变量配置资料.rar');

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise`  (
  `eid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `startime` datetime(0) NULL DEFAULT NULL,
  `endtime` datetime(0) NULL DEFAULT NULL,
  `demand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attachment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pareid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`eid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of exercise
-- ----------------------------
INSERT INTO `exercise` VALUES ('1526393868013', 'C语言第一章练习题', '2018-05-15 22:17:48', '2018-05-18 00:00:00', '请在截止日期内认真完成！', NULL, 'df70e522b795432889567f41d09f8849_陈冰冰-基于翻转课堂的课程资源管理系统的设计与实现.doc', NULL, '1', '909005', '', NULL);
INSERT INTO `exercise` VALUES ('1526393868045', 'C语言第一章练习题', '2018-05-15 22:17:48', '2018-05-18 00:00:00', '请在截止日期内认真完成！', '<p>我的作业内容更新</p>\r\n', 'fe213764cb2c4307860d7440e2111272_', NULL, '0', '1526393868013', '16166800985', NULL);
INSERT INTO `exercise` VALUES ('1526393868047', 'C语言第一章练习题', '2018-05-15 22:17:48', '2018-05-18 00:00:00', '请在截止日期内认真完成！', NULL, '', NULL, '1', '1526393868013', '16166800986', NULL);
INSERT INTO `exercise` VALUES ('1526393868049', 'C语言第一章练习题', '2018-05-15 22:17:48', '2018-05-18 00:00:00', '请在截止日期内认真完成！', NULL, '', NULL, '1', '1526393868013', '16166800987', NULL);
INSERT INTO `exercise` VALUES ('1526609491819', '第一章作业练习', '2018-05-18 10:11:31', '2018-05-25 00:00:00', '请在截止日期前完成并提交！', NULL, '1526608755901_2-1 Java中的关键字.txt', NULL, '1', '1526560766580', '', NULL);
INSERT INTO `exercise` VALUES ('1526609491840', '第一章作业练习', '2018-05-18 10:11:31', '2018-05-25 00:00:00', '请在截止日期前完成并提交！', '<p>我的作业内容</p>\r\n', '627cbb04a21f423099ee0f9a7bdf5d12_', NULL, '0', '1526609491819', '16166800985', NULL);
INSERT INTO `exercise` VALUES ('1526609986889', '第二章作业练习', '2018-05-18 10:19:46', '2018-05-19 00:00:00', '请在截止日期前完成并提交！', NULL, 'b7a30fb7905b4aa59dd0229d2f470324_第二章综合练习.zip', NULL, '1', '1526560766580', '', NULL);
INSERT INTO `exercise` VALUES ('1526609986907', '第二章作业练习', '2018-05-18 10:19:46', '2018-05-19 00:00:00', '请在截止日期前完成并提交！', NULL, '', NULL, '1', '1526609986889', '16166800985', NULL);
INSERT INTO `exercise` VALUES ('1555338523496', '4069.doc', NULL, NULL, NULL, NULL, 'F:/Temp/Upload/Img', NULL, '1', '1526283837408', '815001', NULL);
INSERT INTO `exercise` VALUES ('1555338658831', 'js.txt', NULL, NULL, NULL, NULL, 'F:/Temp/Upload/Img', NULL, '1', '1526283837408', '815001', NULL);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `qid` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `qname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`qid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('110001', 'C语言指针', '909005', '16166800985', '', '');
INSERT INTO `question` VALUES ('1555333268394', 'Allen', '1526284527324', '815001', 'gs', NULL);
INSERT INTO `question` VALUES ('1555333403258', 'Allen_jiang', '1526284527324', '815001', 'gh', NULL);
INSERT INTO `question` VALUES ('1555333798823', 'Allen_jiang', '1526284527324', '815001', '这门课真好', NULL);
INSERT INTO `question` VALUES ('1555416738621', 'Allen_jiang', '1526283837408', '815001', '更新', NULL);
INSERT INTO `question` VALUES ('1555425911311', '途索', '1526283837408', '815002', 'gd', NULL);
INSERT INTO `question` VALUES ('1555426094502', '途索', '1526283837408', '815002', 'fhj', NULL);
INSERT INTO `question` VALUES ('1555426174002', '途索', '1526283837408', '815002', 'gdh', NULL);
INSERT INTO `question` VALUES ('949d3b1961064c209b961f9557e6b00a', 'Bon', '1526284527324', '815001', 'jh', NULL);

-- ----------------------------
-- Table structure for selectcourse
-- ----------------------------
DROP TABLE IF EXISTS `selectcourse`;
CREATE TABLE `selectcourse`  (
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `score` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of selectcourse
-- ----------------------------
INSERT INTO `selectcourse` VALUES ('909001', '16166800985', '', 1, '');
INSERT INTO `selectcourse` VALUES ('909002', '16166800985', '', 1, '');
INSERT INTO `selectcourse` VALUES ('909003', '16166800985', '', 1, '');
INSERT INTO `selectcourse` VALUES ('909004', '16166800985', '', 0, '');
INSERT INTO `selectcourse` VALUES ('909005', '16166800985', '', 1, '');
INSERT INTO `selectcourse` VALUES ('909005', '16166800986', '', 1, '');
INSERT INTO `selectcourse` VALUES ('909005', '16166800987', '', 1, '');
INSERT INTO `selectcourse` VALUES ('1526284749388', '16166800985', NULL, 1, NULL);
INSERT INTO `selectcourse` VALUES ('1526283837408', '16166800985', NULL, 1, NULL);
INSERT INTO `selectcourse` VALUES ('1526284784697', '16166800985', NULL, 1, NULL);
INSERT INTO `selectcourse` VALUES ('1526284527324', '815001', NULL, 1, NULL);
INSERT INTO `selectcourse` VALUES ('1526282010211', '16166800985', NULL, 1, NULL);
INSERT INTO `selectcourse` VALUES ('1526284425616', '16166800985', NULL, 1, NULL);
INSERT INTO `selectcourse` VALUES ('1526285125140', '16166800985', NULL, 1, NULL);
INSERT INTO `selectcourse` VALUES ('1526560766580', '16166800985', NULL, 1, NULL);
INSERT INTO `selectcourse` VALUES ('1526284380125', '16166800985', NULL, 1, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profess` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `headImg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validatecode` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT NULL,
  `STATUS` int(11) NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1526393416874', 'myyl', '123456', '女', NULL, NULL, NULL, '15073051134', '1371694630@qq.com', 'headimgs.jpg', NULL, NULL, '2018-5-15 22:10:16', NULL, 1, 0, '1');
INSERT INTO `user` VALUES ('16166800985', 'bingbingui', 'bingbingui', '男', '22', '河北&', '学生', '15073051134', '652118574@qq.com', '1.jpg', '我是冰冰uiuiui', 'contact', '', '', 1, 0, '');
INSERT INTO `user` VALUES ('815001', 'Allen_jiang', '123456', '男', '0', '湖南&长沙', '算法工程师', '', '', 'head1.jpg', '关注编程、系统架构、性能优化。在 IT 公司担任项目经理、架构师、高级开发顾问等职位，是 CSDN、 开源中国、云栖社区等技术社区专家。', NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815002', '途索', '123456', '男', NULL, NULL, '前端工程师', NULL, NULL, 'head4.jpg', '7年工作经验的资深前端工程师，主要从事Web视频领域的底层开发。', NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815003', '麦兜IT', '123456', '女', NULL, NULL, 'PHP工程师', NULL, NULL, 'tou.png', '主要从事PHP产品快速开发工作。精通PHP相关技术，擅长使用Yaf、Yii、CodeIgniter进行快速开发、将Web相关如Javascript、Redis、Shell、Python等多领域技术结合使用', NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815004', 'Oscar老师', '123456', '女', NULL, NULL, 'python全栈工程师', NULL, NULL, 'baa593168ffd44d3b19cd03c34e34562_15.jpg', '五年工作经验，喜欢钻研python技术，对爬虫、web开发以及机器学习有浓厚的兴趣，关注前沿技术以及发展趋势。', NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815005', '刘果国', '123456', '男', NULL, NULL, 'UI设计', NULL, NULL, 'c10326d8a9964d1ea64e8c24f69d9f6d_17.jpg', '从事UI设计5年，现在90%的工作任务都依靠Sketch来完成产品设计及分工协作，积累了大量的操作实例及使用技巧', NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815006', 'nate', '123456', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815007', 'Jason', '123456', '男', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815008', 'Moocer', '123456', '女', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815009', 'skyding', '123456', '女', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `user` VALUES ('815010', 'bennyhuo', '123456', '女', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
