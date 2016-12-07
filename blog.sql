/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2016-12-06 13:28:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) DEFAULT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `vip_lv` int(11) DEFAULT '0' COMMENT 'vip等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=561 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('560', 'admin', 'Qmh2HLwFhpBZH1lD8Z9pkQQPH1opdn9V', '$2y$13$.iEokQmpdf3tyab/bPbB6uH9y.j9eciGcZ7P3yX/ybT678CoKxFpC', null, null, 'admin@163.com', '10', '10', null, '0', '1479796450', '1479796450');

-- ----------------------------
-- Table structure for cats
-- ----------------------------
DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cat_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of cats
-- ----------------------------
INSERT INTO `cats` VALUES ('1', '分类一');
INSERT INTO `cats` VALUES ('2', '分类二');
INSERT INTO `cats` VALUES ('3', '分类三');
INSERT INTO `cats` VALUES ('4', '分类四');
INSERT INTO `cats` VALUES ('5', '分类五');

-- ----------------------------
-- Table structure for feeds
-- ----------------------------
DROP TABLE IF EXISTS `feeds`;
CREATE TABLE `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='聊天信息表';

-- ----------------------------
-- Records of feeds
-- ----------------------------
INSERT INTO `feeds` VALUES ('10', '560', 'hello world', '1480576643');
INSERT INTO `feeds` VALUES ('11', '560', '高铁 加油！\n', '1480583770');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `label_img` varchar(255) DEFAULT NULL COMMENT '标签图',
  `cat_id` int(11) DEFAULT NULL COMMENT '分类id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `is_valid` tinyint(1) DEFAULT '0' COMMENT '是否有效：0-未发布 1-已发布',
  `created_at` int(11) DEFAULT NULL COMMENT '创建时间',
  `updated_at` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_cat_valid` (`cat_id`,`is_valid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='文章主表';

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('113', '任剑涛：中国如何避开“穷得只剩下钱”的窘境', '中华民族是一个具有强烈荣耀心的民族。一个民族的荣耀心愈加强烈，就愈是要从内部成员的认同与外部世界的公认两个角度加以紧张辨认。相比而言，国家内部成员对民族荣耀的认同，是相对较易的事情', '<p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">中华民族是一个具有强烈荣耀心的民族。一个民族的荣耀心愈加强烈，就愈是要从内部成员的认同与外部世界的公认两个角度加以紧张辨认。相比而言，国家内部成员对民族荣耀的认同，是相对较易的事情。民族成员对民族成就的感知，受代际传承、生活体认和政治制度多重动力的塑造，常常在经意与不经意中，实现荣耀认知的共识与定势。但外部世界对中华民族荣耀的认可程度，就明显有高低不同的巨大落差。这种落差，就与中华民族的自我荣耀心，存在难以弥合的罅隙。姑且不说历史上的差异，即便今天中国告别了贫困和落后，重新成为世界上的重量级国家，但尚未得到中华民族自我预期的世界尊重。我们的内心，是多么盼望全世界对中华民族另眼相看，高度注目，礼敬有加。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">不过，要让举世尊敬中华民族，我们民族还得艰苦努力不说，首先还得先认识清楚，中华民族如何才能得到举世尊重？</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>中华民族完全有自我荣耀的充分理由</strong></p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">中华民族的荣耀心，首先是一种自认的结果。换言之，中华民族确实创造了足以令自己感到骄傲和荣耀的辉煌成就。中华民族的自我荣耀，确实从多个方面呈现出来：</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">从历史上看，中华民族是极少数开创人类轴心文明的伟大民族。轴心文明，指的是公元前800-200年期间，古希腊-罗马、印度和中国等少数国家，以其文明的原创能力，发现了大写的人，从而开创了此后2500年的文明传承历史。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">从物质文明和社会文化上看，中国古代有著名的五大发明：造纸术、指南针、火药、印刷术和算盘。这些发明，不仅推动人类古典文明上了台阶，而且对现代文明的兴起发挥了巨大的推进作用。一个民族，有其中一大发明便足以傲世，何况中华民族为世界贡献了五大发明！至于中国古代社会的良风美俗，就更是令人赞叹不已。</p><p><br/></p>', '/image/20161129/1480387572527268.jpg', '2', '560', 'test', '1', '1480387629', '1480387629');
INSERT INTO `posts` VALUES ('114', '从原点上确立中国学术话语权', '本文语粹●要建立“中国学派”、争取“中国话语权”，首先必须解决的是如何找到一个既能体现人类文明共通之处，又能让中国与西方并驾齐驱的逻辑起点。●谁都不会认为西方科学已经肃清了人类在科', '<p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">本文语粹</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">●要建立“中国学派”、争取“中国话语权”，首先必须解决的是如何找到一个既能体现人类文明共通之处，又能让中国与西方并驾齐驱的逻辑起点。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">●谁都不会认为西方科学已经肃清了人类在科学所及范围的一切未知，这样的确信显得过于狂妄，不是科学和科学家应有的品格。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">●西方关于物体与规律之关系的世界观，决定了其认知取向是专注于对实体的物及其动态表现的描述，此即所谓“知识”，而中国以“道”为起点的世界观，则决定了其舍弃物体的外在表现而回归于“道”本身，其理论表达形态就是所谓“道理”。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">●古老文明可以为独立绵延而自豪，但拒绝学习不是中华民族的品格，“赵武灵王胡服骑射”奠定的开放心态和学习传统，至今仍在发扬光大。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>“中国学派”从哪里出发？“中国话语权”何以确立？</strong></p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">在经济发展、社会进步的背景下，国内学界要求“创立中国学派”、“争取中国在社会科学领域的话语权”的呼声日趋高涨。中国经验必须上升为中国理论，这个要求之意义重大，无论怎么评价都不过分。现在的问题是，“中国学派”从哪里出发？“中国话语权”何以确立？尚未见到严格的方法论阐述。学界固然已开始整理改革开放以来中国社会科学研究的成果，希冀探索出中国学派和中国话语权的构建之路（这样的努力是重要而可贵的），但由于尚未找到区别于西方学派的中国学派的出发点或中国话语权的基准点，简单的成果收集、整理和概括，一则难以避免“碎片化”，无法构成真正意义上的“学派”；二则所有整理作业仍在西方社会科学理论的地基上展开，“中国学派”的标注有了，但中国话语仍不清晰，讨论的问题和切入的视角体现的仍是西方学术体系。这意味着，确立中国话语权的历史性任务仍需要根本性突破。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><p><img alt=\"从原点上确立中国学术话语权\" src=\"http://img1.gtimg.com/cul/pics/hv1/143/221/2160/140510498.jpg\" style=\"border: none; vertical-align: bottom; max-width: 640px;\"/></p><p><br/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255); font-family: 宋体; font-size: 10pt;\"><span style=\"font-size: 12px;\">图源网络</span></p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">要确立中国话语权，既不能“言必称希腊”，唯西方学术规范马首是瞻，也不能简单同西方学理范式反着来。这如同中医，固然有效，但今天国人不可能拒绝抗生素、核磁共振和外科手术等同传统中医毫无关系的诊断方法和治疗手段。所以，平等看待不同文化对人类文明的各自贡献，超越不同文化之间的个性差异，从人类文明的共通之处出发，实事求是地总结中国经验何以构成对人类的独特贡献，才是中华民族屹立于世界民族之林的资格证明，才是中国话语权的依托所在。所以，要建立“中国学派”、争取“中国话语权”，首先必须解决的是如何找到一个既能体现人类文明共通之处，又能让中国与西方并驾齐驱的逻辑起点。仅仅与西方学者在西方设定的理论跑道上“你追我赶”，意义不大，辟通足以同西方对话的中国自己的理论路径，才真正具有战略价值，而找到这个逻辑起点、回到原点更是重中之重。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>回到原点就是回到人类文明共通之处</strong></p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">“中国不是没有科学，而是没有西方意义上的科学。”</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">“中国不是没有宗教，而是没有西方意义上的宗教。”</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; font-size: 15.9996px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">“中国不是没有××，而是没有西方意义上的××”，是西方的“中国学家”在进行中西文化比较时约定俗成的句式，目的在于避免陷入一种貌似科学其实不合逻辑的学理纠缠，“中国何以没有××”。</p><p><br/></p>', '/image/20161129/1480388028806243.jpg', '2', '560', 'test', '1', '1480388042', '1480388042');
INSERT INTO `posts` VALUES ('115', '北沿江高铁确定2018年开建 扬州到上海只要1.5小时', '扬子晚报讯（记者 韩飞）加密苏南、提质苏中、均衡苏北，是江苏“十三五”铁路建设重要任务。日前，省政府向省人大常委会第二十七次会议提交《关于加快推进连镇铁路南延工程及北沿江高速铁路建', '<p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">扬子晚报讯（记者 韩飞）加密苏南、提质苏中、均衡苏北，是江苏“十三五”铁路建设重要任务。日前，省政府向省人大常委会第二十七次会议提交《关于加快推进连镇铁路南延工程及北沿江高速铁路建设议案办理情况报告》，报告明确，连镇铁路南延段已列入“十三五”开工项目，而备受关注的连接南京、扬州、泰州、南通、上海的北沿江高速铁路将于2018年开工。该通道建成后，扬州到上海有望1.5个小时内到达。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>扬州到上海有望只要1.5小时</strong></p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">报告明确国家发改委编制的《推动长江经济带发展三年行动计划（2016-2018年）（征求意见稿）》已将北沿江高速铁路项目列为2018年开工建设项目。根据规划方案，北沿江城际铁路自上海引出，跨越崇明岛至南通启东（海门），经南通、泰州、扬州至南京市，江苏境内全长约385公里，等级为客运专线，设计速度目标值350公里/小时。目前，我省相关部门正积极与上海市有关部门沟通协商过江通道规划问题。该通道建成后，理论上扬州到上海有望1.5个小时内到达，泰州至上海有望1小时左右到达；该通道也是南通至上海间，继沪通铁路之后又一快速铁路过江通道。</p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\"><strong>连镇铁路南延段力争“十三五”开工</strong></p><p style=\"margin-top: 0px; margin-bottom: 29px; padding: 0px; line-height: 28px; font-family: 宋体, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">报告明确连镇铁路南延段是我省“三纵四横”骨干网中间“一纵”的重要组成部分。《江苏省“十三五”铁路发展规划》（送审稿）将连镇铁路南延段列为“十三五”开工项目。根据规划方案，连镇铁路南延段起于镇江市，途经金坛、溧阳，至高淳，并具备延伸至安徽宣城的条件。江苏段正线全长约150公里，等级为客运专线，设计速度目标值250公里/小时。该项目建设对构建山东半岛、苏北地区至海西地区的快速通道，加强长三角地区与海峡西岸经济区的交流合作，促进区域协调发展具有重要意义。</p><p><br/></p>', '/image/20161130/1480476887754691.jpg', '3', '560', 'test', '1', '1480476912', '1480476912');

-- ----------------------------
-- Table structure for post_extends
-- ----------------------------
DROP TABLE IF EXISTS `post_extends`;
CREATE TABLE `post_extends` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `post_id` int(11) DEFAULT NULL COMMENT '文章id',
  `browser` int(11) DEFAULT '0' COMMENT '浏览量',
  `collect` int(11) DEFAULT '0' COMMENT '收藏量',
  `praise` int(11) DEFAULT '0' COMMENT '点赞',
  `comment` int(11) DEFAULT '0' COMMENT '评论',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='文章扩展表';

-- ----------------------------
-- Records of post_extends
-- ----------------------------
INSERT INTO `post_extends` VALUES ('38', '115', '24', '0', '0', '0');
INSERT INTO `post_extends` VALUES ('39', '113', '3', '0', '0', '0');

-- ----------------------------
-- Table structure for relation_post_tags
-- ----------------------------
DROP TABLE IF EXISTS `relation_post_tags`;
CREATE TABLE `relation_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `post_id` int(11) DEFAULT NULL COMMENT '文章ID',
  `tag_id` int(11) DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_id` (`post_id`,`tag_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='文章和标签关系表';

-- ----------------------------
-- Records of relation_post_tags
-- ----------------------------
INSERT INTO `relation_post_tags` VALUES ('66', '115', '36');
INSERT INTO `relation_post_tags` VALUES ('67', '115', '37');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tag_name` varchar(255) DEFAULT NULL COMMENT '标签名称',
  `post_num` int(11) DEFAULT '0' COMMENT '关联文章数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_name` (`tag_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('36', '标签1', '1');
INSERT INTO `tags` VALUES ('37', '标签2', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL COMMENT '自动登录key',
  `password_hash` varchar(255) NOT NULL COMMENT '加密密码',
  `password_reset_token` varchar(255) DEFAULT NULL COMMENT '重置密码token',
  `email_validate_token` varchar(255) DEFAULT NULL COMMENT '邮箱验证token',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `role` smallint(6) NOT NULL DEFAULT '10' COMMENT '角色等级',
  `status` smallint(6) NOT NULL DEFAULT '10' COMMENT '状态',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `vip_lv` int(11) DEFAULT '0' COMMENT 'vip等级',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=563 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('560', 'test', 'Qmh2HLwFhpBZH1lD8Z9pkQQPH1opdn9V', '$2y$13$.iEokQmpdf3tyab/bPbB6uH9y.j9eciGcZ7P3yX/ybT678CoKxFpC', null, null, 'admin@163.com', '10', '10', null, '0', '1479796450', '1480907714');
INSERT INTO `user` VALUES ('561', 'test_001', 'lWKnnIH-3pHbCRCAnXo-jsvZeXMALne-', '$2y$13$YsgKWOAbOoaExaK2Gn/u.uqMMOVhzOgyxxwP79xHXg5.fkM2Danl6', null, null, '2224679347@qq.com', '10', '10', null, '0', '1479869847', '1479869847');
INSERT INTO `user` VALUES ('562', 'test_002', 'Hrc_o3gMtZfbRQDore5nSu4gP6lXyIFs', '$2y$13$nhoBbPNUTrCnj6p9srKoA.TokUym05E/UUleu6joMAOAh1M.LXBTG', null, null, 'yuting_pan@qq.com', '10', '10', null, '0', '1479973192', '1479973192');
