-- LocalJoy demo schema and fixtures. Import only into a fresh database.

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_blog
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` bigint(20) NOT NULL COMMENT '商户id',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `images` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '探店的照片，最多9张，多张以\",\"隔开',
  `content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '探店的文字描述',
  `liked` int(8) UNSIGNED NULL DEFAULT 0 COMMENT '点赞数量',
  `comments` int(8) UNSIGNED NULL DEFAULT NULL COMMENT '评论数量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_blog
-- ----------------------------
INSERT INTO `tb_blog` VALUES (4, 4, 2, '无尽浪漫的夜晚丨在万花丛中摇晃着红酒杯🍷品战斧牛排🥩', '/imgs/blogs/7/14/4771fefb-1a87-4252-816c-9f7ec41ffa4a.jpg,/imgs/blogs/4/10/2f07e3c9-ddce-482d-9ea7-c21450f8d7cd.jpg,/imgs/blogs/2/6/b0756279-65da-4f2d-b62a-33f74b06454a.jpg,/imgs/blogs/10/7/7e97f47d-eb49-4dc9-a583-95faa7aed287.jpg,/imgs/blogs/1/2/4a7b496b-2a08-4af7-aa95-df2c3bd0ef97.jpg,/imgs/blogs/14/3/52b290eb-8b5d-403b-8373-ba0bb856d18e.jpg', '生活就是一半烟火·一半诗意<br/>手执烟火谋生活·心怀诗意以谋爱·<br/>当然<br/>\r\n男朋友给不了的浪漫要学会自己给🍒<br/>\n无法重来的一生·尽量快乐.<br/><br/>🏰「小筑里·神秘浪漫花园餐厅」🏰<br/><br/>\n💯这是一家最最最美花园的西餐厅·到处都是花餐桌上是花前台是花  美好无处不在\n品一口葡萄酒，维亚红酒马瑟兰·微醺上头工作的疲惫消失无际·生如此多娇🍃<br/><br/>📍地址:延安路200号(家乐福面)<br/><br/>🚌交通:地铁①号线定安路B口出右转过下通道右转就到啦～<br/><br/>--------------🥣菜品详情🥣---------------<br/><br/>「战斧牛排]<br/>\n超大一块战斧牛排经过火焰的炙烤发出阵阵香，外焦里嫩让人垂涎欲滴，切开牛排的那一刻，牛排的汁水顺势流了出来，分熟的牛排肉质软，简直细嫩到犯规，一刻都等不了要放入嘴里咀嚼～<br/><br/>「奶油培根意面」<br/>太太太好吃了💯<br/>我真的无法形容它的美妙，意面混合奶油香菇的香味真的太太太香了，我真的舔盘了，一丁点美味都不想浪费‼️<br/><br/><br/>「香菜汁烤鲈鱼」<br/>这个酱是辣的 真的绝好吃‼️<br/>鲈鱼本身就很嫩没什么刺，烤过之后外皮酥酥的，鱼肉蘸上酱料根本停不下来啊啊啊啊<br/>能吃辣椒的小伙伴一定要尝尝<br/><br/>非常可 好吃子🍽\n<br/>--------------🍃个人感受🍃---------------<br/><br/>【👩🏻‍🍳服务】<br/>小姐姐特别耐心的给我们介绍彩票 <br/>推荐特色菜品，拍照需要帮忙也是尽心尽力配合，太爱他们了<br/><br/>【🍃环境】<br/>比较有格调的西餐厅 整个餐厅的布局可称得上的万花丛生 有种在人间仙境的感觉🌸<br/>集美食美酒与鲜花为一体的风格店铺 令人向往<br/>烟火皆是生活 人间皆是浪漫<br/>', 1, 104, '2021-12-28 19:50:01', '2022-03-10 14:26:34');
INSERT INTO `tb_blog` VALUES (5, 1, 2, '人均30💰杭州这家港式茶餐厅我疯狂打call‼️', '/imgs/blogs/4/7/863cc302-d150-420d-a596-b16e9232a1a6.jpg,/imgs/blogs/11/12/8b37d208-9414-4e78-b065-9199647bb3e3.jpg,/imgs/blogs/4/1/fa74a6d6-3026-4cb7-b0b6-35abb1e52d11.jpg,/imgs/blogs/9/12/ac2ce2fb-0605-4f14-82cc-c962b8c86688.jpg,/imgs/blogs/4/0/26a7cd7e-6320-432c-a0b4-1b7418f45ec7.jpg,/imgs/blogs/15/9/cea51d9b-ac15-49f6-b9f1-9cf81e9b9c85.jpg', '又吃到一家好吃的茶餐厅🍴环境是怀旧tvb港风📺边吃边拍照片📷几十种菜品均价都在20+💰可以是很平价了！<br>·<br>店名：九记冰厅(远洋店)<br>地址：杭州市丽水路远洋乐堤港负一楼（溜冰场旁边）<br>·<br>✔️黯然销魂饭（38💰）<br>这碗饭我吹爆！米饭上盖满了甜甜的叉烧 还有两颗溏心蛋🍳每一粒米饭都裹着浓郁的酱汁 光盘了<br>·<br>✔️铜锣湾漏奶华（28💰）<br>黄油吐司烤的脆脆的 上面洒满了可可粉🍫一刀切开 奶盖流心像瀑布一样流出来  满足<br>·<br>✔️神仙一口西多士士（16💰）<br>简简单单却超级好吃！西多士烤的很脆 黄油味浓郁 面包体超级柔软 上面淋了炼乳<br>·<br>✔️怀旧五柳炸蛋饭（28💰）<br>四个鸡蛋炸成蓬松的炸蛋！也太好吃了吧！还有大块鸡排 上淋了酸甜的酱汁 太合我胃口了！！<br>·<br>✔️烧味双拼例牌（66💰）<br>选了烧鹅➕叉烧 他家烧腊品质真的惊艳到我！据说是每日广州发货 到店现烧现卖的黑棕鹅 每口都是正宗的味道！肉质很嫩 皮超级超级酥脆！一口爆油！叉烧肉也一点都不柴 甜甜的很入味 搭配梅子酱很解腻 ！<br>·<br>✔️红烧脆皮乳鸽（18.8💰）<br>乳鸽很大只 这个价格也太划算了吧， 肉质很有嚼劲 脆皮很酥 越吃越香～<br>·<br>✔️大满足小吃拼盘（25💰）<br>翅尖➕咖喱鱼蛋➕蝴蝶虾➕盐酥鸡<br>zui喜欢里面的咖喱鱼！咖喱酱香甜浓郁！鱼蛋很q弹～<br>·<br>✔️港式熊仔丝袜奶茶（19💰）<br>小熊🐻造型的奶茶冰也太可爱了！颜值担当 很地道的丝袜奶茶 茶味特别浓郁～<br>·', 1, 0, '2021-12-28 20:57:49', '2022-03-10 09:21:39');
INSERT INTO `tb_blog` VALUES (6, 10, 1, '杭州周末好去处｜💰50就可以骑马啦🐎', '/imgs/blogs/blog1.jpg', '杭州周末好去处｜💰50就可以骑马啦🐎', 1, 0, '2022-01-11 16:05:47', '2022-03-10 09:21:41');
INSERT INTO `tb_blog` VALUES (7, 10, 1, '杭州周末好去处｜💰50就可以骑马啦🐎', '/imgs/blogs/blog1.jpg', '杭州周末好去处｜💰50就可以骑马啦🐎', 1, 0, '2022-01-11 16:05:47', '2022-03-10 09:21:42');

-- ----------------------------
-- Table structure for tb_blog_comments
-- ----------------------------
DROP TABLE IF EXISTS `tb_blog_comments`;
CREATE TABLE `tb_blog_comments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `blog_id` bigint(20) UNSIGNED NOT NULL COMMENT '探店id',
  `parent_id` bigint(20) UNSIGNED NOT NULL COMMENT '关联的1级评论id，如果是一级评论，则值为0',
  `answer_id` bigint(20) UNSIGNED NOT NULL COMMENT '回复的评论id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复的内容',
  `liked` int(8) UNSIGNED NULL DEFAULT NULL COMMENT '点赞数',
  `status` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态，0：正常，1：被举报，2：禁止查看',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_blog_comments
-- ----------------------------

-- ----------------------------
-- Table structure for tb_follow
-- ----------------------------
DROP TABLE IF EXISTS `tb_follow`;
CREATE TABLE `tb_follow`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `follow_user_id` bigint(20) UNSIGNED NOT NULL COMMENT '关联的用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_follow
-- ----------------------------

-- ----------------------------
-- Table structure for tb_seckill_voucher
-- ----------------------------
DROP TABLE IF EXISTS `tb_seckill_voucher`;
CREATE TABLE `tb_seckill_voucher`  (
  `voucher_id` bigint(20) UNSIGNED NOT NULL COMMENT '关联的优惠券的id',
  `stock` int(8) NOT NULL COMMENT '库存',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `begin_time` timestamp NOT NULL COMMENT '生效时间',
  `end_time` timestamp NOT NULL COMMENT '失效时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`voucher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '秒杀优惠券表，与优惠券是一对一关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_seckill_voucher
-- ----------------------------

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商铺名称',
  `type_id` bigint(20) UNSIGNED NOT NULL COMMENT '商铺类型的id',
  `images` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商铺图片，多个图片以\',\'隔开',
  `area` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商圈，例如陆家嘴',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
  `x` double UNSIGNED NOT NULL COMMENT '经度',
  `y` double UNSIGNED NOT NULL COMMENT '维度',
  `avg_price` bigint(10) UNSIGNED NULL DEFAULT NULL COMMENT '均价，取整数',
  `sold` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '销量',
  `comments` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '评论数量',
  `score` int(2) UNSIGNED ZEROFILL NOT NULL COMMENT '评分，1~5分，乘10保存，避免小数',
  `open_hours` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营业时间，例如 10:00-22:00',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreign_key_type`(`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES (1, '103茶餐厅', 1, 'https://qcloud.dpfile.com/pc/jiclIsCKmOI2arxKN1Uf0Hx3PucIJH8q0QSz-Z8llzcN56-_QiKuOvyio1OOxsRtFoXqu0G3iT2T27qat3WhLVEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vfCF2ubeXzk49OsGrXt_KYDCngOyCwZK-s3fqawWswzk.jpg,https://qcloud.dpfile.com/pc/IOf6VX3qaBgFXFVgp75w-KKJmWZjFc8GXDU8g9bQC6YGCpAmG00QbfT4vCCBj7njuzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vmIU_8ZGOT1OjpJmLxG6urQ.jpg', '大关', '金华路锦昌文华苑29号', 120.149192, 30.316078, 80, 0000004215, 0000003035, 37, '10:00-22:00', '2021-12-22 18:10:39', '2022-01-13 17:32:19');
INSERT INTO `tb_shop` VALUES (2, '蔡馬洪涛烤肉·老北京铜锅涮羊肉', 1, 'https://p0.meituan.net/bbia/c1870d570e73accbc9fee90b48faca41195272.jpg,http://p0.meituan.net/mogu/397e40c28fc87715b3d5435710a9f88d706914.jpg,https://qcloud.dpfile.com/pc/MZTdRDqCZdbPDUO0Hk6lZENRKzpKRF7kavrkEI99OxqBZTzPfIxa5E33gBfGouhFuzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vmIU_8ZGOT1OjpJmLxG6urQ.jpg', '拱宸桥/上塘', '上塘路1035号（中国工商银行旁）', 120.151505, 30.333422, 85, 0000002160, 0000001460, 46, '11:30-03:00', '2021-12-22 19:00:13', '2022-01-11 16:12:26');
INSERT INTO `tb_shop` VALUES (3, '新白鹿餐厅(运河上街店)', 1, 'https://p0.meituan.net/biztone/694233_1619500156517.jpeg,https://img.meituan.net/msmerchant/876ca8983f7395556eda9ceb064e6bc51840883.png,https://img.meituan.net/msmerchant/86a76ed53c28eff709a36099aefe28b51554088.png', '运河上街', '台州路2号运河上街购物中心F5', 120.151954, 30.32497, 61, 0000012035, 0000008045, 47, '10:30-21:00', '2021-12-22 19:10:05', '2022-01-11 16:12:42');
INSERT INTO `tb_shop` VALUES (4, 'Mamala(杭州远洋乐堤港店)', 1, 'https://img.meituan.net/msmerchant/232f8fdf09050838bd33fb24e79f30f9606056.jpg,https://qcloud.dpfile.com/pc/rDe48Xe15nQOHCcEEkmKUp5wEKWbimt-HDeqYRWsYJseXNncvMiXbuED7x1tXqN4uzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vmIU_8ZGOT1OjpJmLxG6urQ.jpg', '拱宸桥/上塘', '丽水路66号远洋乐堤港商城2期1层B115号', 120.146659, 30.312742, 290, 0000013519, 0000009529, 49, '11:00-22:00', '2021-12-22 19:17:15', '2022-01-11 16:12:51');
INSERT INTO `tb_shop` VALUES (5, '海底捞火锅(水晶城购物中心店）', 1, 'https://img.meituan.net/msmerchant/054b5de0ba0b50c18a620cc37482129a45739.jpg,https://img.meituan.net/msmerchant/59b7eff9b60908d52bd4aea9ff356e6d145920.jpg,https://qcloud.dpfile.com/pc/Qe2PTEuvtJ5skpUXKKoW9OQ20qc7nIpHYEqJGBStJx0mpoyeBPQOJE4vOdYZwm9AuzFvxlbkWx5uwqY2qcjixFEuLYk00OmSS1IdNpm8K8sG4JN9RIm2mTKcbLtc2o2vmIU_8ZGOT1OjpJmLxG6urQ.jpg', '大关', '上塘路458号水晶城购物中心F6', 120.15778, 30.310633, 104, 0000004125, 0000002764, 49, '10:00-07:00', '2021-12-22 19:20:58', '2022-01-11 16:13:01');
INSERT INTO `tb_shop` VALUES (6, '幸福里老北京涮锅（丝联店）', 1, 'https://img.meituan.net/msmerchant/e71a2d0d693b3033c15522c43e03f09198239.jpg,https://img.meituan.net/msmerchant/9f8a966d60ffba00daf35458522273ca658239.jpg,https://img.meituan.net/msmerchant/ef9ca5ef6c05d381946fe4a9aa7d9808554502.jpg', '拱宸桥/上塘', '金华南路189号丝联166号', 120.148603, 30.318618, 130, 0000009531, 0000007324, 46, '11:00-13:50,17:00-20:50', '2021-12-22 19:24:53', '2022-01-11 16:13:09');
INSERT INTO `tb_shop` VALUES (7, '炉鱼(拱墅万达广场店)', 1, 'https://img.meituan.net/msmerchant/909434939a49b36f340523232924402166854.jpg,https://img.meituan.net/msmerchant/32fd2425f12e27db0160e837461c10303700032.jpg,https://img.meituan.net/msmerchant/f7022258ccb8dabef62a0514d3129562871160.jpg', '北部新城', '杭行路666号万达商业中心4幢2单元409室(铺位号4005)', 120.124691, 30.336819, 85, 0000002631, 0000001320, 47, '00:00-24:00', '2021-12-22 19:40:52', '2022-01-11 16:13:19');
INSERT INTO `tb_shop` VALUES (8, '浅草屋寿司（运河上街店）', 1, 'https://img.meituan.net/msmerchant/cf3dff697bf7f6e11f4b79c4e7d989e4591290.jpg,https://img.meituan.net/msmerchant/0b463f545355c8d8f021eb2987dcd0c8567811.jpg,https://img.meituan.net/msmerchant/c3c2516939efaf36c4ccc64b0e629fad587907.jpg', '运河上街', '拱墅区金华路80号运河上街B1', 120.150526, 30.325231, 88, 0000002406, 0000001206, 46, ' 11:00-21:30', '2021-12-22 19:51:06', '2022-01-11 16:13:25');
INSERT INTO `tb_shop` VALUES (9, '羊老三羊蝎子牛仔排北派炭火锅(运河上街店)', 1, 'https://p0.meituan.net/biztone/163160492_1624251899456.jpeg,https://img.meituan.net/msmerchant/e478eb16f7e31a7f8b29b5e3bab6de205500837.jpg,https://img.meituan.net/msmerchant/6173eb1d18b9d70ace7fdb3f2dd939662884857.jpg', '运河上街', '台州路2号运河上街购物中心F5', 120.150598, 30.325251, 101, 0000002763, 0000001363, 44, '11:00-21:30', '2021-12-22 19:53:59', '2022-01-11 16:13:34');
INSERT INTO `tb_shop` VALUES (10, '开乐迪KTV（运河上街店）', 2, 'https://p0.meituan.net/joymerchant/a575fd4adb0b9099c5c410058148b307-674435191.jpg,https://p0.meituan.net/merchantpic/68f11bf850e25e437c5f67decfd694ab2541634.jpg,https://p0.meituan.net/dpdeal/cb3a12225860ba2875e4ea26c6d14fcc197016.jpg', '运河上街', '台州路2号运河上街购物中心F4', 120.149093, 30.324666, 67, 0000026891, 0000000902, 37, '00:00-24:00', '2021-12-22 20:25:16', '2021-12-22 20:25:16');
INSERT INTO `tb_shop` VALUES (11, 'INLOVE KTV(水晶城店)', 2, 'https://p0.meituan.net/dpmerchantpic/53e74b200211d68988a4f02ae9912c6c1076826.jpg,https://qcloud.dpfile.com/pc/4iWtIvzLzwM2MGgyPu1PCDb4SWEaKqUeHm--YAt1EwR5tn8kypBcqNwHnjg96EvT_Gd2X_f-v9T8Yj4uLt25Gg.jpg,https://qcloud.dpfile.com/pc/WZsJWRI447x1VG2x48Ujgu7vwqksi_9WitdKI4j3jvIgX4MZOpGNaFtM93oSSizbGybIjx5eX6WNgCPvcASYAw.jpg', '水晶城', '上塘路458号水晶城购物中心6层', 120.15853, 30.310002, 75, 0000035977, 0000005684, 47, '11:30-06:00', '2021-12-22 20:29:02', '2021-12-22 20:39:00');
INSERT INTO `tb_shop` VALUES (12, '魅(杭州远洋乐堤港店)', 2, 'https://p0.meituan.net/dpmerchantpic/63833f6ba0393e2e8722420ef33f3d40466664.jpg,https://p0.meituan.net/dpmerchantpic/ae3c94cc92c529c4b1d7f68cebed33fa105810.png,', '远洋乐堤港', '丽水路58号远洋乐堤港F4', 120.14983, 30.31211, 88, 0000006444, 0000000235, 46, '10:00-02:00', '2021-12-22 20:34:34', '2021-12-22 20:34:34');
INSERT INTO `tb_shop` VALUES (13, '讴K拉量贩KTV(北城天地店)', 2, 'https://p1.meituan.net/merchantpic/598c83a8c0d06fe79ca01056e214d345875600.jpg,https://qcloud.dpfile.com/pc/HhvI0YyocYHRfGwJWqPQr34hRGRl4cWdvlNwn3dqghvi4WXlM2FY1te0-7pE3Wb9_Gd2X_f-v9T8Yj4uLt25Gg.jpg,https://qcloud.dpfile.com/pc/F5ZVzZaXFE27kvQzPnaL4V8O9QCpVw2nkzGrxZE8BqXgkfyTpNExfNG5CEPQX4pjGybIjx5eX6WNgCPvcASYAw.jpg', 'D32天阳购物中心', '湖州街567号北城天地5层', 120.130453, 30.327655, 58, 0000018997, 0000001857, 41, '12:00-02:00', '2021-12-22 20:38:54', '2021-12-22 20:40:04');
INSERT INTO `tb_shop` VALUES (14, '星聚会KTV(拱墅区万达店)', 2, 'https://p0.meituan.net/dpmerchantpic/f4cd6d8d4eb1959c3ea826aa05a552c01840451.jpg,https://p0.meituan.net/dpmerchantpic/2efc07aed856a8ab0fc75c86f4b9b0061655777.jpg,https://qcloud.dpfile.com/pc/zWfzzIorCohKT0bFwsfAlHuayWjI6DBEMPHHncmz36EEMU9f48PuD9VxLLDAjdoU_Gd2X_f-v9T8Yj4uLt25Gg.jpg', '北部新城', '杭行路666号万达广场C座1-2F', 120.128958, 30.337252, 60, 0000017771, 0000000685, 47, '10:00-22:00', '2021-12-22 20:48:54', '2021-12-22 20:48:54');

-- ----------------------------
-- Table structure for tb_shop_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_type`;
CREATE TABLE `tb_shop_type`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '顺序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop_type
-- ----------------------------
INSERT INTO `tb_shop_type` VALUES (1, '美食', '/types/ms.png', 1, '2021-12-22 20:17:47', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (2, 'KTV', '/types/KTV.png', 2, '2021-12-22 20:18:27', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (3, '丽人·美发', '/types/lrmf.png', 3, '2021-12-22 20:18:48', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (4, '健身运动', '/types/jsyd.png', 10, '2021-12-22 20:19:04', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (5, '按摩·足疗', '/types/amzl.png', 5, '2021-12-22 20:19:27', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (6, '美容SPA', '/types/spa.png', 6, '2021-12-22 20:19:35', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (7, '亲子游乐', '/types/qzyl.png', 7, '2021-12-22 20:19:53', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (8, '酒吧', '/types/jiuba.png', 8, '2021-12-22 20:20:02', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (9, '轰趴馆', '/types/hpg.png', 9, '2021-12-22 20:20:08', '2021-12-23 11:24:31');
INSERT INTO `tb_shop_type` VALUES (10, '美睫·美甲', '/types/mjmj.png', 4, '2021-12-22 20:21:46', '2021-12-23 11:24:31');

-- ----------------------------
-- Table structure for tb_sign
-- ----------------------------
DROP TABLE IF EXISTS `tb_sign`;
CREATE TABLE `tb_sign`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `year` year NOT NULL COMMENT '签到的年',
  `month` tinyint(2) NOT NULL COMMENT '签到的月',
  `date` date NOT NULL COMMENT '签到的日期',
  `is_backup` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否补签',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_sign
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码，加密存储',
  `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '昵称，默认是用户id',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '人物头像',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniqe_key_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '13000000001', '', 'demo_user_1', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (2, '13000000002', '', 'demo_user_2', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (4, '13000000004', '', 'demo_user_4', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (5, '13000000005', '', 'demo_user_5', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (6, '13000000006', '', 'demo_user_6', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (10, '13000000010', '', 'demo_user_10', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (11, '13000000011', '', 'demo_user_11', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (12, '13000000012', '', 'demo_user_12', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (13, '13000000013', '', 'demo_user_13', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (14, '13000000014', '', 'demo_user_14', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (15, '13000000015', '', 'demo_user_15', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (16, '13000000016', '', 'demo_user_16', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (17, '13000000017', '', 'demo_user_17', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (18, '13000000018', '', 'demo_user_18', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (19, '13000000019', '', 'demo_user_19', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (20, '13000000020', '', 'demo_user_20', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (21, '13000000021', '', 'demo_user_21', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (22, '13000000022', '', 'demo_user_22', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (23, '13000000023', '', 'demo_user_23', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (24, '13000000024', '', 'demo_user_24', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (25, '13000000025', '', 'demo_user_25', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (26, '13000000026', '', 'demo_user_26', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (27, '13000000027', '', 'demo_user_27', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (28, '13000000028', '', 'demo_user_28', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (29, '13000000029', '', 'demo_user_29', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (30, '13000000030', '', 'demo_user_30', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (31, '13000000031', '', 'demo_user_31', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (32, '13000000032', '', 'demo_user_32', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (33, '13000000033', '', 'demo_user_33', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (34, '13000000034', '', 'demo_user_34', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (35, '13000000035', '', 'demo_user_35', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (36, '13000000036', '', 'demo_user_36', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (37, '13000000037', '', 'demo_user_37', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (38, '13000000038', '', 'demo_user_38', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (39, '13000000039', '', 'demo_user_39', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (40, '13000000040', '', 'demo_user_40', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (41, '13000000041', '', 'demo_user_41', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (42, '13000000042', '', 'demo_user_42', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (43, '13000000043', '', 'demo_user_43', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (44, '13000000044', '', 'demo_user_44', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (45, '13000000045', '', 'demo_user_45', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (46, '13000000046', '', 'demo_user_46', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (47, '13000000047', '', 'demo_user_47', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (48, '13000000048', '', 'demo_user_48', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (49, '13000000049', '', 'demo_user_49', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (50, '13000000050', '', 'demo_user_50', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (51, '13000000051', '', 'demo_user_51', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (52, '13000000052', '', 'demo_user_52', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (53, '13000000053', '', 'demo_user_53', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (54, '13000000054', '', 'demo_user_54', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (55, '13000000055', '', 'demo_user_55', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (56, '13000000056', '', 'demo_user_56', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (57, '13000000057', '', 'demo_user_57', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (58, '13000000058', '', 'demo_user_58', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (59, '13000000059', '', 'demo_user_59', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (60, '13000000060', '', 'demo_user_60', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (61, '13000000061', '', 'demo_user_61', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (62, '13000000062', '', 'demo_user_62', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (63, '13000000063', '', 'demo_user_63', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (64, '13000000064', '', 'demo_user_64', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (65, '13000000065', '', 'demo_user_65', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (66, '13000000066', '', 'demo_user_66', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (67, '13000000067', '', 'demo_user_67', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (68, '13000000068', '', 'demo_user_68', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (69, '13000000069', '', 'demo_user_69', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (70, '13000000070', '', 'demo_user_70', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (71, '13000000071', '', 'demo_user_71', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (72, '13000000072', '', 'demo_user_72', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (73, '13000000073', '', 'demo_user_73', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (74, '13000000074', '', 'demo_user_74', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (75, '13000000075', '', 'demo_user_75', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (76, '13000000076', '', 'demo_user_76', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (77, '13000000077', '', 'demo_user_77', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (78, '13000000078', '', 'demo_user_78', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (79, '13000000079', '', 'demo_user_79', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (80, '13000000080', '', 'demo_user_80', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (81, '13000000081', '', 'demo_user_81', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (82, '13000000082', '', 'demo_user_82', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (83, '13000000083', '', 'demo_user_83', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (84, '13000000084', '', 'demo_user_84', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (85, '13000000085', '', 'demo_user_85', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (86, '13000000086', '', 'demo_user_86', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (87, '13000000087', '', 'demo_user_87', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (88, '13000000088', '', 'demo_user_88', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (89, '13000000089', '', 'demo_user_89', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (90, '13000000090', '', 'demo_user_90', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (91, '13000000091', '', 'demo_user_91', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (92, '13000000092', '', 'demo_user_92', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (93, '13000000093', '', 'demo_user_93', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (94, '13000000094', '', 'demo_user_94', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (95, '13000000095', '', 'demo_user_95', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (96, '13000000096', '', 'demo_user_96', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (97, '13000000097', '', 'demo_user_97', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (98, '13000000098', '', 'demo_user_98', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (99, '13000000099', '', 'demo_user_99', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (100, '13000000100', '', 'demo_user_100', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (101, '13000000101', '', 'demo_user_101', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (102, '13000000102', '', 'demo_user_102', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (103, '13000000103', '', 'demo_user_103', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (104, '13000000104', '', 'demo_user_104', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (105, '13000000105', '', 'demo_user_105', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (106, '13000000106', '', 'demo_user_106', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (107, '13000000107', '', 'demo_user_107', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (108, '13000000108', '', 'demo_user_108', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (109, '13000000109', '', 'demo_user_109', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (110, '13000000110', '', 'demo_user_110', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (111, '13000000111', '', 'demo_user_111', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (112, '13000000112', '', 'demo_user_112', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (113, '13000000113', '', 'demo_user_113', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (114, '13000000114', '', 'demo_user_114', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (115, '13000000115', '', 'demo_user_115', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (116, '13000000116', '', 'demo_user_116', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (117, '13000000117', '', 'demo_user_117', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (118, '13000000118', '', 'demo_user_118', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (119, '13000000119', '', 'demo_user_119', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (120, '13000000120', '', 'demo_user_120', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (121, '13000000121', '', 'demo_user_121', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (122, '13000000122', '', 'demo_user_122', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (123, '13000000123', '', 'demo_user_123', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (124, '13000000124', '', 'demo_user_124', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (125, '13000000125', '', 'demo_user_125', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (126, '13000000126', '', 'demo_user_126', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (127, '13000000127', '', 'demo_user_127', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (128, '13000000128', '', 'demo_user_128', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (129, '13000000129', '', 'demo_user_129', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (130, '13000000130', '', 'demo_user_130', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (131, '13000000131', '', 'demo_user_131', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (132, '13000000132', '', 'demo_user_132', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (133, '13000000133', '', 'demo_user_133', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (134, '13000000134', '', 'demo_user_134', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (135, '13000000135', '', 'demo_user_135', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (136, '13000000136', '', 'demo_user_136', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (137, '13000000137', '', 'demo_user_137', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (138, '13000000138', '', 'demo_user_138', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (139, '13000000139', '', 'demo_user_139', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (140, '13000000140', '', 'demo_user_140', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (141, '13000000141', '', 'demo_user_141', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (142, '13000000142', '', 'demo_user_142', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (143, '13000000143', '', 'demo_user_143', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (144, '13000000144', '', 'demo_user_144', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (145, '13000000145', '', 'demo_user_145', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (146, '13000000146', '', 'demo_user_146', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (147, '13000000147', '', 'demo_user_147', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (148, '13000000148', '', 'demo_user_148', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (149, '13000000149', '', 'demo_user_149', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (150, '13000000150', '', 'demo_user_150', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (151, '13000000151', '', 'demo_user_151', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (152, '13000000152', '', 'demo_user_152', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (153, '13000000153', '', 'demo_user_153', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (154, '13000000154', '', 'demo_user_154', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (155, '13000000155', '', 'demo_user_155', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (156, '13000000156', '', 'demo_user_156', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (157, '13000000157', '', 'demo_user_157', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (158, '13000000158', '', 'demo_user_158', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (159, '13000000159', '', 'demo_user_159', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (160, '13000000160', '', 'demo_user_160', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (161, '13000000161', '', 'demo_user_161', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (162, '13000000162', '', 'demo_user_162', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (163, '13000000163', '', 'demo_user_163', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (164, '13000000164', '', 'demo_user_164', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (165, '13000000165', '', 'demo_user_165', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (166, '13000000166', '', 'demo_user_166', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (167, '13000000167', '', 'demo_user_167', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (168, '13000000168', '', 'demo_user_168', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (169, '13000000169', '', 'demo_user_169', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (170, '13000000170', '', 'demo_user_170', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (171, '13000000171', '', 'demo_user_171', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (172, '13000000172', '', 'demo_user_172', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (173, '13000000173', '', 'demo_user_173', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (174, '13000000174', '', 'demo_user_174', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (175, '13000000175', '', 'demo_user_175', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (176, '13000000176', '', 'demo_user_176', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (177, '13000000177', '', 'demo_user_177', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (178, '13000000178', '', 'demo_user_178', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (179, '13000000179', '', 'demo_user_179', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (180, '13000000180', '', 'demo_user_180', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (181, '13000000181', '', 'demo_user_181', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (182, '13000000182', '', 'demo_user_182', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (183, '13000000183', '', 'demo_user_183', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (184, '13000000184', '', 'demo_user_184', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (185, '13000000185', '', 'demo_user_185', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (186, '13000000186', '', 'demo_user_186', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (187, '13000000187', '', 'demo_user_187', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (188, '13000000188', '', 'demo_user_188', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (189, '13000000189', '', 'demo_user_189', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (190, '13000000190', '', 'demo_user_190', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (191, '13000000191', '', 'demo_user_191', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (192, '13000000192', '', 'demo_user_192', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (193, '13000000193', '', 'demo_user_193', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (194, '13000000194', '', 'demo_user_194', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (195, '13000000195', '', 'demo_user_195', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (196, '13000000196', '', 'demo_user_196', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (197, '13000000197', '', 'demo_user_197', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (198, '13000000198', '', 'demo_user_198', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (199, '13000000199', '', 'demo_user_199', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (200, '13000000200', '', 'demo_user_200', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (201, '13000000201', '', 'demo_user_201', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (202, '13000000202', '', 'demo_user_202', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (203, '13000000203', '', 'demo_user_203', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (204, '13000000204', '', 'demo_user_204', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (205, '13000000205', '', 'demo_user_205', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (206, '13000000206', '', 'demo_user_206', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (207, '13000000207', '', 'demo_user_207', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (208, '13000000208', '', 'demo_user_208', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (209, '13000000209', '', 'demo_user_209', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (210, '13000000210', '', 'demo_user_210', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (211, '13000000211', '', 'demo_user_211', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (212, '13000000212', '', 'demo_user_212', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (213, '13000000213', '', 'demo_user_213', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (214, '13000000214', '', 'demo_user_214', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (215, '13000000215', '', 'demo_user_215', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (216, '13000000216', '', 'demo_user_216', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (217, '13000000217', '', 'demo_user_217', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (218, '13000000218', '', 'demo_user_218', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (219, '13000000219', '', 'demo_user_219', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (220, '13000000220', '', 'demo_user_220', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (221, '13000000221', '', 'demo_user_221', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (222, '13000000222', '', 'demo_user_222', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (223, '13000000223', '', 'demo_user_223', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (224, '13000000224', '', 'demo_user_224', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (225, '13000000225', '', 'demo_user_225', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (226, '13000000226', '', 'demo_user_226', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (227, '13000000227', '', 'demo_user_227', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (228, '13000000228', '', 'demo_user_228', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (229, '13000000229', '', 'demo_user_229', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (230, '13000000230', '', 'demo_user_230', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (231, '13000000231', '', 'demo_user_231', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (232, '13000000232', '', 'demo_user_232', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (233, '13000000233', '', 'demo_user_233', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (234, '13000000234', '', 'demo_user_234', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (235, '13000000235', '', 'demo_user_235', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (236, '13000000236', '', 'demo_user_236', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (237, '13000000237', '', 'demo_user_237', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (238, '13000000238', '', 'demo_user_238', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (239, '13000000239', '', 'demo_user_239', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (240, '13000000240', '', 'demo_user_240', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (241, '13000000241', '', 'demo_user_241', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (242, '13000000242', '', 'demo_user_242', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (243, '13000000243', '', 'demo_user_243', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (244, '13000000244', '', 'demo_user_244', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (245, '13000000245', '', 'demo_user_245', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (246, '13000000246', '', 'demo_user_246', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (247, '13000000247', '', 'demo_user_247', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (248, '13000000248', '', 'demo_user_248', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (249, '13000000249', '', 'demo_user_249', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (250, '13000000250', '', 'demo_user_250', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (251, '13000000251', '', 'demo_user_251', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (252, '13000000252', '', 'demo_user_252', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (253, '13000000253', '', 'demo_user_253', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (254, '13000000254', '', 'demo_user_254', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (255, '13000000255', '', 'demo_user_255', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (256, '13000000256', '', 'demo_user_256', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (257, '13000000257', '', 'demo_user_257', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (258, '13000000258', '', 'demo_user_258', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (259, '13000000259', '', 'demo_user_259', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (260, '13000000260', '', 'demo_user_260', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (261, '13000000261', '', 'demo_user_261', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (262, '13000000262', '', 'demo_user_262', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (263, '13000000263', '', 'demo_user_263', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (264, '13000000264', '', 'demo_user_264', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (265, '13000000265', '', 'demo_user_265', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (266, '13000000266', '', 'demo_user_266', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (267, '13000000267', '', 'demo_user_267', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (268, '13000000268', '', 'demo_user_268', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (269, '13000000269', '', 'demo_user_269', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (270, '13000000270', '', 'demo_user_270', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (271, '13000000271', '', 'demo_user_271', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (272, '13000000272', '', 'demo_user_272', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (273, '13000000273', '', 'demo_user_273', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (274, '13000000274', '', 'demo_user_274', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (275, '13000000275', '', 'demo_user_275', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (276, '13000000276', '', 'demo_user_276', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (277, '13000000277', '', 'demo_user_277', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (278, '13000000278', '', 'demo_user_278', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (279, '13000000279', '', 'demo_user_279', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (280, '13000000280', '', 'demo_user_280', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (281, '13000000281', '', 'demo_user_281', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (282, '13000000282', '', 'demo_user_282', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (283, '13000000283', '', 'demo_user_283', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (284, '13000000284', '', 'demo_user_284', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (285, '13000000285', '', 'demo_user_285', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (286, '13000000286', '', 'demo_user_286', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (287, '13000000287', '', 'demo_user_287', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (288, '13000000288', '', 'demo_user_288', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (289, '13000000289', '', 'demo_user_289', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (290, '13000000290', '', 'demo_user_290', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (291, '13000000291', '', 'demo_user_291', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (292, '13000000292', '', 'demo_user_292', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (293, '13000000293', '', 'demo_user_293', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (294, '13000000294', '', 'demo_user_294', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (295, '13000000295', '', 'demo_user_295', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (296, '13000000296', '', 'demo_user_296', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (297, '13000000297', '', 'demo_user_297', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (298, '13000000298', '', 'demo_user_298', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (299, '13000000299', '', 'demo_user_299', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (300, '13000000300', '', 'demo_user_300', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (301, '13000000301', '', 'demo_user_301', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (302, '13000000302', '', 'demo_user_302', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (303, '13000000303', '', 'demo_user_303', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (304, '13000000304', '', 'demo_user_304', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (305, '13000000305', '', 'demo_user_305', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (306, '13000000306', '', 'demo_user_306', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (307, '13000000307', '', 'demo_user_307', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (308, '13000000308', '', 'demo_user_308', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (309, '13000000309', '', 'demo_user_309', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (310, '13000000310', '', 'demo_user_310', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (311, '13000000311', '', 'demo_user_311', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (312, '13000000312', '', 'demo_user_312', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (313, '13000000313', '', 'demo_user_313', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (314, '13000000314', '', 'demo_user_314', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (315, '13000000315', '', 'demo_user_315', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (316, '13000000316', '', 'demo_user_316', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (317, '13000000317', '', 'demo_user_317', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (318, '13000000318', '', 'demo_user_318', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (319, '13000000319', '', 'demo_user_319', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (320, '13000000320', '', 'demo_user_320', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (321, '13000000321', '', 'demo_user_321', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (322, '13000000322', '', 'demo_user_322', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (323, '13000000323', '', 'demo_user_323', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (324, '13000000324', '', 'demo_user_324', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (325, '13000000325', '', 'demo_user_325', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (326, '13000000326', '', 'demo_user_326', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (327, '13000000327', '', 'demo_user_327', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (328, '13000000328', '', 'demo_user_328', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (329, '13000000329', '', 'demo_user_329', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (330, '13000000330', '', 'demo_user_330', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (331, '13000000331', '', 'demo_user_331', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (332, '13000000332', '', 'demo_user_332', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (333, '13000000333', '', 'demo_user_333', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (334, '13000000334', '', 'demo_user_334', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (335, '13000000335', '', 'demo_user_335', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (336, '13000000336', '', 'demo_user_336', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (337, '13000000337', '', 'demo_user_337', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (338, '13000000338', '', 'demo_user_338', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (339, '13000000339', '', 'demo_user_339', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (340, '13000000340', '', 'demo_user_340', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (341, '13000000341', '', 'demo_user_341', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (342, '13000000342', '', 'demo_user_342', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (343, '13000000343', '', 'demo_user_343', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (344, '13000000344', '', 'demo_user_344', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (345, '13000000345', '', 'demo_user_345', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (346, '13000000346', '', 'demo_user_346', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (347, '13000000347', '', 'demo_user_347', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (348, '13000000348', '', 'demo_user_348', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (349, '13000000349', '', 'demo_user_349', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (350, '13000000350', '', 'demo_user_350', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (351, '13000000351', '', 'demo_user_351', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (352, '13000000352', '', 'demo_user_352', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (353, '13000000353', '', 'demo_user_353', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (354, '13000000354', '', 'demo_user_354', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (355, '13000000355', '', 'demo_user_355', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (356, '13000000356', '', 'demo_user_356', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (357, '13000000357', '', 'demo_user_357', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (358, '13000000358', '', 'demo_user_358', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (359, '13000000359', '', 'demo_user_359', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (360, '13000000360', '', 'demo_user_360', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (361, '13000000361', '', 'demo_user_361', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (362, '13000000362', '', 'demo_user_362', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (363, '13000000363', '', 'demo_user_363', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (364, '13000000364', '', 'demo_user_364', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (365, '13000000365', '', 'demo_user_365', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (366, '13000000366', '', 'demo_user_366', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (367, '13000000367', '', 'demo_user_367', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (368, '13000000368', '', 'demo_user_368', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (369, '13000000369', '', 'demo_user_369', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (370, '13000000370', '', 'demo_user_370', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (371, '13000000371', '', 'demo_user_371', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (372, '13000000372', '', 'demo_user_372', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (373, '13000000373', '', 'demo_user_373', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (374, '13000000374', '', 'demo_user_374', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (375, '13000000375', '', 'demo_user_375', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (376, '13000000376', '', 'demo_user_376', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (377, '13000000377', '', 'demo_user_377', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (378, '13000000378', '', 'demo_user_378', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (379, '13000000379', '', 'demo_user_379', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (380, '13000000380', '', 'demo_user_380', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (381, '13000000381', '', 'demo_user_381', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (382, '13000000382', '', 'demo_user_382', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (383, '13000000383', '', 'demo_user_383', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (384, '13000000384', '', 'demo_user_384', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (385, '13000000385', '', 'demo_user_385', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (386, '13000000386', '', 'demo_user_386', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (387, '13000000387', '', 'demo_user_387', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (388, '13000000388', '', 'demo_user_388', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (389, '13000000389', '', 'demo_user_389', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (390, '13000000390', '', 'demo_user_390', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (391, '13000000391', '', 'demo_user_391', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (392, '13000000392', '', 'demo_user_392', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (393, '13000000393', '', 'demo_user_393', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (394, '13000000394', '', 'demo_user_394', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (395, '13000000395', '', 'demo_user_395', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (396, '13000000396', '', 'demo_user_396', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (397, '13000000397', '', 'demo_user_397', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (398, '13000000398', '', 'demo_user_398', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (399, '13000000399', '', 'demo_user_399', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (400, '13000000400', '', 'demo_user_400', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (401, '13000000401', '', 'demo_user_401', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (402, '13000000402', '', 'demo_user_402', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (403, '13000000403', '', 'demo_user_403', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (404, '13000000404', '', 'demo_user_404', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (405, '13000000405', '', 'demo_user_405', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (406, '13000000406', '', 'demo_user_406', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (407, '13000000407', '', 'demo_user_407', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (408, '13000000408', '', 'demo_user_408', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (409, '13000000409', '', 'demo_user_409', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (410, '13000000410', '', 'demo_user_410', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (411, '13000000411', '', 'demo_user_411', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (412, '13000000412', '', 'demo_user_412', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (413, '13000000413', '', 'demo_user_413', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (414, '13000000414', '', 'demo_user_414', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (415, '13000000415', '', 'demo_user_415', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (416, '13000000416', '', 'demo_user_416', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (417, '13000000417', '', 'demo_user_417', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (418, '13000000418', '', 'demo_user_418', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (419, '13000000419', '', 'demo_user_419', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (420, '13000000420', '', 'demo_user_420', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (421, '13000000421', '', 'demo_user_421', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (422, '13000000422', '', 'demo_user_422', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (423, '13000000423', '', 'demo_user_423', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (424, '13000000424', '', 'demo_user_424', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (425, '13000000425', '', 'demo_user_425', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (426, '13000000426', '', 'demo_user_426', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (427, '13000000427', '', 'demo_user_427', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (428, '13000000428', '', 'demo_user_428', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (429, '13000000429', '', 'demo_user_429', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (430, '13000000430', '', 'demo_user_430', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (431, '13000000431', '', 'demo_user_431', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (432, '13000000432', '', 'demo_user_432', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (433, '13000000433', '', 'demo_user_433', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (434, '13000000434', '', 'demo_user_434', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (435, '13000000435', '', 'demo_user_435', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (436, '13000000436', '', 'demo_user_436', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (437, '13000000437', '', 'demo_user_437', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (438, '13000000438', '', 'demo_user_438', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (439, '13000000439', '', 'demo_user_439', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (440, '13000000440', '', 'demo_user_440', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (441, '13000000441', '', 'demo_user_441', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (442, '13000000442', '', 'demo_user_442', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (443, '13000000443', '', 'demo_user_443', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (444, '13000000444', '', 'demo_user_444', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (445, '13000000445', '', 'demo_user_445', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (446, '13000000446', '', 'demo_user_446', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (447, '13000000447', '', 'demo_user_447', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (448, '13000000448', '', 'demo_user_448', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (449, '13000000449', '', 'demo_user_449', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (450, '13000000450', '', 'demo_user_450', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (451, '13000000451', '', 'demo_user_451', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (452, '13000000452', '', 'demo_user_452', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (453, '13000000453', '', 'demo_user_453', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (454, '13000000454', '', 'demo_user_454', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (455, '13000000455', '', 'demo_user_455', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (456, '13000000456', '', 'demo_user_456', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (457, '13000000457', '', 'demo_user_457', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (458, '13000000458', '', 'demo_user_458', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (459, '13000000459', '', 'demo_user_459', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (460, '13000000460', '', 'demo_user_460', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (461, '13000000461', '', 'demo_user_461', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (462, '13000000462', '', 'demo_user_462', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (463, '13000000463', '', 'demo_user_463', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (464, '13000000464', '', 'demo_user_464', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (465, '13000000465', '', 'demo_user_465', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (466, '13000000466', '', 'demo_user_466', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (467, '13000000467', '', 'demo_user_467', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (468, '13000000468', '', 'demo_user_468', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (469, '13000000469', '', 'demo_user_469', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (470, '13000000470', '', 'demo_user_470', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (471, '13000000471', '', 'demo_user_471', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (472, '13000000472', '', 'demo_user_472', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (473, '13000000473', '', 'demo_user_473', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (474, '13000000474', '', 'demo_user_474', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (475, '13000000475', '', 'demo_user_475', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (476, '13000000476', '', 'demo_user_476', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (477, '13000000477', '', 'demo_user_477', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (478, '13000000478', '', 'demo_user_478', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (479, '13000000479', '', 'demo_user_479', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (480, '13000000480', '', 'demo_user_480', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (481, '13000000481', '', 'demo_user_481', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (482, '13000000482', '', 'demo_user_482', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (483, '13000000483', '', 'demo_user_483', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (484, '13000000484', '', 'demo_user_484', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (485, '13000000485', '', 'demo_user_485', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (486, '13000000486', '', 'demo_user_486', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (487, '13000000487', '', 'demo_user_487', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (488, '13000000488', '', 'demo_user_488', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (489, '13000000489', '', 'demo_user_489', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (490, '13000000490', '', 'demo_user_490', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (491, '13000000491', '', 'demo_user_491', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (492, '13000000492', '', 'demo_user_492', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (493, '13000000493', '', 'demo_user_493', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (494, '13000000494', '', 'demo_user_494', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (495, '13000000495', '', 'demo_user_495', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (496, '13000000496', '', 'demo_user_496', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (497, '13000000497', '', 'demo_user_497', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (498, '13000000498', '', 'demo_user_498', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (499, '13000000499', '', 'demo_user_499', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (500, '13000000500', '', 'demo_user_500', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (501, '13000000501', '', 'demo_user_501', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (502, '13000000502', '', 'demo_user_502', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (503, '13000000503', '', 'demo_user_503', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (504, '13000000504', '', 'demo_user_504', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (505, '13000000505', '', 'demo_user_505', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (506, '13000000506', '', 'demo_user_506', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (507, '13000000507', '', 'demo_user_507', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (508, '13000000508', '', 'demo_user_508', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (509, '13000000509', '', 'demo_user_509', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (510, '13000000510', '', 'demo_user_510', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (511, '13000000511', '', 'demo_user_511', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (512, '13000000512', '', 'demo_user_512', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (513, '13000000513', '', 'demo_user_513', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (514, '13000000514', '', 'demo_user_514', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (515, '13000000515', '', 'demo_user_515', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (516, '13000000516', '', 'demo_user_516', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (517, '13000000517', '', 'demo_user_517', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (518, '13000000518', '', 'demo_user_518', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (519, '13000000519', '', 'demo_user_519', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (520, '13000000520', '', 'demo_user_520', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (521, '13000000521', '', 'demo_user_521', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (522, '13000000522', '', 'demo_user_522', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (523, '13000000523', '', 'demo_user_523', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (524, '13000000524', '', 'demo_user_524', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (525, '13000000525', '', 'demo_user_525', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (526, '13000000526', '', 'demo_user_526', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (527, '13000000527', '', 'demo_user_527', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (528, '13000000528', '', 'demo_user_528', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (529, '13000000529', '', 'demo_user_529', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (530, '13000000530', '', 'demo_user_530', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (531, '13000000531', '', 'demo_user_531', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (532, '13000000532', '', 'demo_user_532', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (533, '13000000533', '', 'demo_user_533', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (534, '13000000534', '', 'demo_user_534', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (535, '13000000535', '', 'demo_user_535', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (536, '13000000536', '', 'demo_user_536', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (537, '13000000537', '', 'demo_user_537', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (538, '13000000538', '', 'demo_user_538', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (539, '13000000539', '', 'demo_user_539', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (540, '13000000540', '', 'demo_user_540', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (541, '13000000541', '', 'demo_user_541', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (542, '13000000542', '', 'demo_user_542', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (543, '13000000543', '', 'demo_user_543', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (544, '13000000544', '', 'demo_user_544', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (545, '13000000545', '', 'demo_user_545', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (546, '13000000546', '', 'demo_user_546', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (547, '13000000547', '', 'demo_user_547', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (548, '13000000548', '', 'demo_user_548', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (549, '13000000549', '', 'demo_user_549', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (550, '13000000550', '', 'demo_user_550', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (551, '13000000551', '', 'demo_user_551', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (552, '13000000552', '', 'demo_user_552', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (553, '13000000553', '', 'demo_user_553', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (554, '13000000554', '', 'demo_user_554', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (555, '13000000555', '', 'demo_user_555', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (556, '13000000556', '', 'demo_user_556', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (557, '13000000557', '', 'demo_user_557', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (558, '13000000558', '', 'demo_user_558', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (559, '13000000559', '', 'demo_user_559', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (560, '13000000560', '', 'demo_user_560', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (561, '13000000561', '', 'demo_user_561', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (562, '13000000562', '', 'demo_user_562', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (563, '13000000563', '', 'demo_user_563', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (564, '13000000564', '', 'demo_user_564', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (565, '13000000565', '', 'demo_user_565', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (566, '13000000566', '', 'demo_user_566', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (567, '13000000567', '', 'demo_user_567', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (568, '13000000568', '', 'demo_user_568', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (569, '13000000569', '', 'demo_user_569', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (570, '13000000570', '', 'demo_user_570', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (571, '13000000571', '', 'demo_user_571', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (572, '13000000572', '', 'demo_user_572', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (573, '13000000573', '', 'demo_user_573', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (574, '13000000574', '', 'demo_user_574', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (575, '13000000575', '', 'demo_user_575', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (576, '13000000576', '', 'demo_user_576', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (577, '13000000577', '', 'demo_user_577', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (578, '13000000578', '', 'demo_user_578', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (579, '13000000579', '', 'demo_user_579', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (580, '13000000580', '', 'demo_user_580', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (581, '13000000581', '', 'demo_user_581', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (582, '13000000582', '', 'demo_user_582', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (583, '13000000583', '', 'demo_user_583', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (584, '13000000584', '', 'demo_user_584', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (585, '13000000585', '', 'demo_user_585', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (586, '13000000586', '', 'demo_user_586', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (587, '13000000587', '', 'demo_user_587', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (588, '13000000588', '', 'demo_user_588', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (589, '13000000589', '', 'demo_user_589', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (590, '13000000590', '', 'demo_user_590', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (591, '13000000591', '', 'demo_user_591', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (592, '13000000592', '', 'demo_user_592', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (593, '13000000593', '', 'demo_user_593', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (594, '13000000594', '', 'demo_user_594', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (595, '13000000595', '', 'demo_user_595', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (596, '13000000596', '', 'demo_user_596', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (597, '13000000597', '', 'demo_user_597', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (598, '13000000598', '', 'demo_user_598', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (599, '13000000599', '', 'demo_user_599', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (600, '13000000600', '', 'demo_user_600', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (601, '13000000601', '', 'demo_user_601', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (602, '13000000602', '', 'demo_user_602', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (603, '13000000603', '', 'demo_user_603', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (604, '13000000604', '', 'demo_user_604', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (605, '13000000605', '', 'demo_user_605', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (606, '13000000606', '', 'demo_user_606', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (607, '13000000607', '', 'demo_user_607', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (608, '13000000608', '', 'demo_user_608', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (609, '13000000609', '', 'demo_user_609', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (610, '13000000610', '', 'demo_user_610', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (611, '13000000611', '', 'demo_user_611', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (612, '13000000612', '', 'demo_user_612', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (613, '13000000613', '', 'demo_user_613', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (614, '13000000614', '', 'demo_user_614', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (615, '13000000615', '', 'demo_user_615', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (616, '13000000616', '', 'demo_user_616', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (617, '13000000617', '', 'demo_user_617', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (618, '13000000618', '', 'demo_user_618', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (619, '13000000619', '', 'demo_user_619', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (620, '13000000620', '', 'demo_user_620', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (621, '13000000621', '', 'demo_user_621', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (622, '13000000622', '', 'demo_user_622', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (623, '13000000623', '', 'demo_user_623', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (624, '13000000624', '', 'demo_user_624', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (625, '13000000625', '', 'demo_user_625', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (626, '13000000626', '', 'demo_user_626', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (627, '13000000627', '', 'demo_user_627', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (628, '13000000628', '', 'demo_user_628', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (629, '13000000629', '', 'demo_user_629', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (630, '13000000630', '', 'demo_user_630', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (631, '13000000631', '', 'demo_user_631', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (632, '13000000632', '', 'demo_user_632', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (633, '13000000633', '', 'demo_user_633', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (634, '13000000634', '', 'demo_user_634', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (635, '13000000635', '', 'demo_user_635', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (636, '13000000636', '', 'demo_user_636', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (637, '13000000637', '', 'demo_user_637', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (638, '13000000638', '', 'demo_user_638', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (639, '13000000639', '', 'demo_user_639', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (640, '13000000640', '', 'demo_user_640', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (641, '13000000641', '', 'demo_user_641', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (642, '13000000642', '', 'demo_user_642', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (643, '13000000643', '', 'demo_user_643', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (644, '13000000644', '', 'demo_user_644', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (645, '13000000645', '', 'demo_user_645', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (646, '13000000646', '', 'demo_user_646', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (647, '13000000647', '', 'demo_user_647', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (648, '13000000648', '', 'demo_user_648', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (649, '13000000649', '', 'demo_user_649', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (650, '13000000650', '', 'demo_user_650', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (651, '13000000651', '', 'demo_user_651', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (652, '13000000652', '', 'demo_user_652', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (653, '13000000653', '', 'demo_user_653', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (654, '13000000654', '', 'demo_user_654', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (655, '13000000655', '', 'demo_user_655', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (656, '13000000656', '', 'demo_user_656', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (657, '13000000657', '', 'demo_user_657', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (658, '13000000658', '', 'demo_user_658', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (659, '13000000659', '', 'demo_user_659', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (660, '13000000660', '', 'demo_user_660', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (661, '13000000661', '', 'demo_user_661', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (662, '13000000662', '', 'demo_user_662', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (663, '13000000663', '', 'demo_user_663', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (664, '13000000664', '', 'demo_user_664', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (665, '13000000665', '', 'demo_user_665', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (666, '13000000666', '', 'demo_user_666', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (667, '13000000667', '', 'demo_user_667', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (668, '13000000668', '', 'demo_user_668', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (669, '13000000669', '', 'demo_user_669', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (670, '13000000670', '', 'demo_user_670', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (671, '13000000671', '', 'demo_user_671', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (672, '13000000672', '', 'demo_user_672', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (673, '13000000673', '', 'demo_user_673', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (674, '13000000674', '', 'demo_user_674', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (675, '13000000675', '', 'demo_user_675', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (676, '13000000676', '', 'demo_user_676', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (677, '13000000677', '', 'demo_user_677', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (678, '13000000678', '', 'demo_user_678', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (679, '13000000679', '', 'demo_user_679', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (680, '13000000680', '', 'demo_user_680', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (681, '13000000681', '', 'demo_user_681', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (682, '13000000682', '', 'demo_user_682', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (683, '13000000683', '', 'demo_user_683', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (684, '13000000684', '', 'demo_user_684', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (685, '13000000685', '', 'demo_user_685', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (686, '13000000686', '', 'demo_user_686', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (687, '13000000687', '', 'demo_user_687', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (688, '13000000688', '', 'demo_user_688', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (689, '13000000689', '', 'demo_user_689', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (690, '13000000690', '', 'demo_user_690', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (691, '13000000691', '', 'demo_user_691', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (692, '13000000692', '', 'demo_user_692', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (693, '13000000693', '', 'demo_user_693', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (694, '13000000694', '', 'demo_user_694', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (695, '13000000695', '', 'demo_user_695', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (696, '13000000696', '', 'demo_user_696', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (697, '13000000697', '', 'demo_user_697', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (698, '13000000698', '', 'demo_user_698', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (699, '13000000699', '', 'demo_user_699', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (700, '13000000700', '', 'demo_user_700', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (701, '13000000701', '', 'demo_user_701', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (702, '13000000702', '', 'demo_user_702', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (703, '13000000703', '', 'demo_user_703', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (704, '13000000704', '', 'demo_user_704', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (705, '13000000705', '', 'demo_user_705', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (706, '13000000706', '', 'demo_user_706', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (707, '13000000707', '', 'demo_user_707', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (708, '13000000708', '', 'demo_user_708', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (709, '13000000709', '', 'demo_user_709', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (710, '13000000710', '', 'demo_user_710', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (711, '13000000711', '', 'demo_user_711', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (712, '13000000712', '', 'demo_user_712', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (713, '13000000713', '', 'demo_user_713', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (714, '13000000714', '', 'demo_user_714', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (715, '13000000715', '', 'demo_user_715', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (716, '13000000716', '', 'demo_user_716', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (717, '13000000717', '', 'demo_user_717', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (718, '13000000718', '', 'demo_user_718', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (719, '13000000719', '', 'demo_user_719', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (720, '13000000720', '', 'demo_user_720', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (721, '13000000721', '', 'demo_user_721', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (722, '13000000722', '', 'demo_user_722', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (723, '13000000723', '', 'demo_user_723', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (724, '13000000724', '', 'demo_user_724', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (725, '13000000725', '', 'demo_user_725', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (726, '13000000726', '', 'demo_user_726', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (727, '13000000727', '', 'demo_user_727', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (728, '13000000728', '', 'demo_user_728', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (729, '13000000729', '', 'demo_user_729', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (730, '13000000730', '', 'demo_user_730', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (731, '13000000731', '', 'demo_user_731', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (732, '13000000732', '', 'demo_user_732', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (733, '13000000733', '', 'demo_user_733', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (734, '13000000734', '', 'demo_user_734', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (735, '13000000735', '', 'demo_user_735', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (736, '13000000736', '', 'demo_user_736', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (737, '13000000737', '', 'demo_user_737', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (738, '13000000738', '', 'demo_user_738', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (739, '13000000739', '', 'demo_user_739', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (740, '13000000740', '', 'demo_user_740', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (741, '13000000741', '', 'demo_user_741', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (742, '13000000742', '', 'demo_user_742', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (743, '13000000743', '', 'demo_user_743', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (744, '13000000744', '', 'demo_user_744', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (745, '13000000745', '', 'demo_user_745', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (746, '13000000746', '', 'demo_user_746', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (747, '13000000747', '', 'demo_user_747', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (748, '13000000748', '', 'demo_user_748', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (749, '13000000749', '', 'demo_user_749', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (750, '13000000750', '', 'demo_user_750', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (751, '13000000751', '', 'demo_user_751', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (752, '13000000752', '', 'demo_user_752', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (753, '13000000753', '', 'demo_user_753', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (754, '13000000754', '', 'demo_user_754', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (755, '13000000755', '', 'demo_user_755', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (756, '13000000756', '', 'demo_user_756', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (757, '13000000757', '', 'demo_user_757', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (758, '13000000758', '', 'demo_user_758', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (759, '13000000759', '', 'demo_user_759', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (760, '13000000760', '', 'demo_user_760', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (761, '13000000761', '', 'demo_user_761', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (762, '13000000762', '', 'demo_user_762', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (763, '13000000763', '', 'demo_user_763', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (764, '13000000764', '', 'demo_user_764', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (765, '13000000765', '', 'demo_user_765', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (766, '13000000766', '', 'demo_user_766', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (767, '13000000767', '', 'demo_user_767', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (768, '13000000768', '', 'demo_user_768', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (769, '13000000769', '', 'demo_user_769', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (770, '13000000770', '', 'demo_user_770', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (771, '13000000771', '', 'demo_user_771', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (772, '13000000772', '', 'demo_user_772', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (773, '13000000773', '', 'demo_user_773', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (774, '13000000774', '', 'demo_user_774', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (775, '13000000775', '', 'demo_user_775', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (776, '13000000776', '', 'demo_user_776', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (777, '13000000777', '', 'demo_user_777', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (778, '13000000778', '', 'demo_user_778', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (779, '13000000779', '', 'demo_user_779', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (780, '13000000780', '', 'demo_user_780', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (781, '13000000781', '', 'demo_user_781', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (782, '13000000782', '', 'demo_user_782', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (783, '13000000783', '', 'demo_user_783', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (784, '13000000784', '', 'demo_user_784', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (785, '13000000785', '', 'demo_user_785', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (786, '13000000786', '', 'demo_user_786', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (787, '13000000787', '', 'demo_user_787', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (788, '13000000788', '', 'demo_user_788', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (789, '13000000789', '', 'demo_user_789', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (790, '13000000790', '', 'demo_user_790', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (791, '13000000791', '', 'demo_user_791', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (792, '13000000792', '', 'demo_user_792', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (793, '13000000793', '', 'demo_user_793', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (794, '13000000794', '', 'demo_user_794', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (795, '13000000795', '', 'demo_user_795', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (796, '13000000796', '', 'demo_user_796', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (797, '13000000797', '', 'demo_user_797', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (798, '13000000798', '', 'demo_user_798', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (799, '13000000799', '', 'demo_user_799', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (800, '13000000800', '', 'demo_user_800', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (801, '13000000801', '', 'demo_user_801', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (802, '13000000802', '', 'demo_user_802', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (803, '13000000803', '', 'demo_user_803', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (804, '13000000804', '', 'demo_user_804', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (805, '13000000805', '', 'demo_user_805', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (806, '13000000806', '', 'demo_user_806', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (807, '13000000807', '', 'demo_user_807', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (808, '13000000808', '', 'demo_user_808', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (809, '13000000809', '', 'demo_user_809', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (810, '13000000810', '', 'demo_user_810', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (811, '13000000811', '', 'demo_user_811', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (812, '13000000812', '', 'demo_user_812', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (813, '13000000813', '', 'demo_user_813', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (814, '13000000814', '', 'demo_user_814', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (815, '13000000815', '', 'demo_user_815', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (816, '13000000816', '', 'demo_user_816', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (817, '13000000817', '', 'demo_user_817', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (818, '13000000818', '', 'demo_user_818', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (819, '13000000819', '', 'demo_user_819', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (820, '13000000820', '', 'demo_user_820', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (821, '13000000821', '', 'demo_user_821', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (822, '13000000822', '', 'demo_user_822', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (823, '13000000823', '', 'demo_user_823', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (824, '13000000824', '', 'demo_user_824', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (825, '13000000825', '', 'demo_user_825', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (826, '13000000826', '', 'demo_user_826', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (827, '13000000827', '', 'demo_user_827', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (828, '13000000828', '', 'demo_user_828', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (829, '13000000829', '', 'demo_user_829', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (830, '13000000830', '', 'demo_user_830', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (831, '13000000831', '', 'demo_user_831', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (832, '13000000832', '', 'demo_user_832', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (833, '13000000833', '', 'demo_user_833', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (834, '13000000834', '', 'demo_user_834', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (835, '13000000835', '', 'demo_user_835', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (836, '13000000836', '', 'demo_user_836', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (837, '13000000837', '', 'demo_user_837', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (838, '13000000838', '', 'demo_user_838', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (839, '13000000839', '', 'demo_user_839', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (840, '13000000840', '', 'demo_user_840', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (841, '13000000841', '', 'demo_user_841', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (842, '13000000842', '', 'demo_user_842', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (843, '13000000843', '', 'demo_user_843', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (844, '13000000844', '', 'demo_user_844', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (845, '13000000845', '', 'demo_user_845', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (846, '13000000846', '', 'demo_user_846', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (847, '13000000847', '', 'demo_user_847', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (848, '13000000848', '', 'demo_user_848', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (849, '13000000849', '', 'demo_user_849', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (850, '13000000850', '', 'demo_user_850', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (851, '13000000851', '', 'demo_user_851', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (852, '13000000852', '', 'demo_user_852', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (853, '13000000853', '', 'demo_user_853', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (854, '13000000854', '', 'demo_user_854', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (855, '13000000855', '', 'demo_user_855', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (856, '13000000856', '', 'demo_user_856', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (857, '13000000857', '', 'demo_user_857', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (858, '13000000858', '', 'demo_user_858', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (859, '13000000859', '', 'demo_user_859', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (860, '13000000860', '', 'demo_user_860', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (861, '13000000861', '', 'demo_user_861', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (862, '13000000862', '', 'demo_user_862', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (863, '13000000863', '', 'demo_user_863', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (864, '13000000864', '', 'demo_user_864', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (865, '13000000865', '', 'demo_user_865', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (866, '13000000866', '', 'demo_user_866', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (867, '13000000867', '', 'demo_user_867', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (868, '13000000868', '', 'demo_user_868', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (869, '13000000869', '', 'demo_user_869', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (870, '13000000870', '', 'demo_user_870', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (871, '13000000871', '', 'demo_user_871', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (872, '13000000872', '', 'demo_user_872', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (873, '13000000873', '', 'demo_user_873', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (874, '13000000874', '', 'demo_user_874', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (875, '13000000875', '', 'demo_user_875', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (876, '13000000876', '', 'demo_user_876', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (877, '13000000877', '', 'demo_user_877', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (878, '13000000878', '', 'demo_user_878', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (879, '13000000879', '', 'demo_user_879', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (880, '13000000880', '', 'demo_user_880', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (881, '13000000881', '', 'demo_user_881', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (882, '13000000882', '', 'demo_user_882', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (883, '13000000883', '', 'demo_user_883', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (884, '13000000884', '', 'demo_user_884', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (885, '13000000885', '', 'demo_user_885', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (886, '13000000886', '', 'demo_user_886', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (887, '13000000887', '', 'demo_user_887', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (888, '13000000888', '', 'demo_user_888', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (889, '13000000889', '', 'demo_user_889', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (890, '13000000890', '', 'demo_user_890', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (891, '13000000891', '', 'demo_user_891', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (892, '13000000892', '', 'demo_user_892', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (893, '13000000893', '', 'demo_user_893', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (894, '13000000894', '', 'demo_user_894', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (895, '13000000895', '', 'demo_user_895', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (896, '13000000896', '', 'demo_user_896', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (897, '13000000897', '', 'demo_user_897', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (898, '13000000898', '', 'demo_user_898', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (899, '13000000899', '', 'demo_user_899', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (900, '13000000900', '', 'demo_user_900', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (901, '13000000901', '', 'demo_user_901', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (902, '13000000902', '', 'demo_user_902', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (903, '13000000903', '', 'demo_user_903', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (904, '13000000904', '', 'demo_user_904', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (905, '13000000905', '', 'demo_user_905', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (906, '13000000906', '', 'demo_user_906', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (907, '13000000907', '', 'demo_user_907', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (908, '13000000908', '', 'demo_user_908', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (909, '13000000909', '', 'demo_user_909', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (910, '13000000910', '', 'demo_user_910', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (911, '13000000911', '', 'demo_user_911', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (912, '13000000912', '', 'demo_user_912', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (913, '13000000913', '', 'demo_user_913', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (914, '13000000914', '', 'demo_user_914', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (915, '13000000915', '', 'demo_user_915', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (916, '13000000916', '', 'demo_user_916', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (917, '13000000917', '', 'demo_user_917', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (918, '13000000918', '', 'demo_user_918', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (919, '13000000919', '', 'demo_user_919', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (920, '13000000920', '', 'demo_user_920', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (921, '13000000921', '', 'demo_user_921', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (922, '13000000922', '', 'demo_user_922', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (923, '13000000923', '', 'demo_user_923', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (924, '13000000924', '', 'demo_user_924', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (925, '13000000925', '', 'demo_user_925', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (926, '13000000926', '', 'demo_user_926', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (927, '13000000927', '', 'demo_user_927', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (928, '13000000928', '', 'demo_user_928', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (929, '13000000929', '', 'demo_user_929', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (930, '13000000930', '', 'demo_user_930', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (931, '13000000931', '', 'demo_user_931', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (932, '13000000932', '', 'demo_user_932', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (933, '13000000933', '', 'demo_user_933', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (934, '13000000934', '', 'demo_user_934', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (935, '13000000935', '', 'demo_user_935', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (936, '13000000936', '', 'demo_user_936', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (937, '13000000937', '', 'demo_user_937', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (938, '13000000938', '', 'demo_user_938', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (939, '13000000939', '', 'demo_user_939', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (940, '13000000940', '', 'demo_user_940', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (941, '13000000941', '', 'demo_user_941', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (942, '13000000942', '', 'demo_user_942', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (943, '13000000943', '', 'demo_user_943', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (944, '13000000944', '', 'demo_user_944', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (945, '13000000945', '', 'demo_user_945', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (946, '13000000946', '', 'demo_user_946', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (947, '13000000947', '', 'demo_user_947', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (948, '13000000948', '', 'demo_user_948', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (949, '13000000949', '', 'demo_user_949', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (950, '13000000950', '', 'demo_user_950', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (951, '13000000951', '', 'demo_user_951', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (952, '13000000952', '', 'demo_user_952', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (953, '13000000953', '', 'demo_user_953', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (954, '13000000954', '', 'demo_user_954', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (955, '13000000955', '', 'demo_user_955', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (956, '13000000956', '', 'demo_user_956', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (957, '13000000957', '', 'demo_user_957', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (958, '13000000958', '', 'demo_user_958', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (959, '13000000959', '', 'demo_user_959', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (960, '13000000960', '', 'demo_user_960', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (961, '13000000961', '', 'demo_user_961', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (962, '13000000962', '', 'demo_user_962', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (963, '13000000963', '', 'demo_user_963', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (964, '13000000964', '', 'demo_user_964', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (965, '13000000965', '', 'demo_user_965', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (966, '13000000966', '', 'demo_user_966', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (967, '13000000967', '', 'demo_user_967', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (968, '13000000968', '', 'demo_user_968', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (969, '13000000969', '', 'demo_user_969', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (970, '13000000970', '', 'demo_user_970', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (971, '13000000971', '', 'demo_user_971', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (972, '13000000972', '', 'demo_user_972', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (973, '13000000973', '', 'demo_user_973', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (974, '13000000974', '', 'demo_user_974', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (975, '13000000975', '', 'demo_user_975', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (976, '13000000976', '', 'demo_user_976', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (977, '13000000977', '', 'demo_user_977', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (978, '13000000978', '', 'demo_user_978', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (979, '13000000979', '', 'demo_user_979', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (980, '13000000980', '', 'demo_user_980', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (981, '13000000981', '', 'demo_user_981', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (982, '13000000982', '', 'demo_user_982', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (983, '13000000983', '', 'demo_user_983', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (984, '13000000984', '', 'demo_user_984', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (985, '13000000985', '', 'demo_user_985', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (986, '13000000986', '', 'demo_user_986', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (987, '13000000987', '', 'demo_user_987', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (988, '13000000988', '', 'demo_user_988', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (989, '13000000989', '', 'demo_user_989', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (990, '13000000990', '', 'demo_user_990', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (991, '13000000991', '', 'demo_user_991', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (992, '13000000992', '', 'demo_user_992', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (993, '13000000993', '', 'demo_user_993', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (994, '13000000994', '', 'demo_user_994', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (995, '13000000995', '', 'demo_user_995', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (996, '13000000996', '', 'demo_user_996', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (997, '13000000997', '', 'demo_user_997', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (998, '13000000998', '', 'demo_user_998', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (999, '13000000999', '', 'demo_user_999', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1000, '13000001000', '', 'demo_user_1000', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1001, '13000001001', '', 'demo_user_1001', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1002, '13000001002', '', 'demo_user_1002', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1003, '13000001003', '', 'demo_user_1003', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1004, '13000001004', '', 'demo_user_1004', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1005, '13000001005', '', 'demo_user_1005', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1006, '13000001006', '', 'demo_user_1006', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1007, '13000001007', '', 'demo_user_1007', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1008, '13000001008', '', 'demo_user_1008', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');
INSERT INTO `tb_user` VALUES (1009, '13000001009', '', 'demo_user_1009', '', '2026-01-01 00:00:00', '2026-01-01 00:00:00');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`  (
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '主键，用户id',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '城市名称',
  `introduce` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人介绍，不要超过128个字符',
  `fans` int(8) UNSIGNED NULL DEFAULT 0 COMMENT '粉丝数量',
  `followee` int(8) UNSIGNED NULL DEFAULT 0 COMMENT '关注的人的数量',
  `gender` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '性别，0：男，1：女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `credits` int(8) UNSIGNED NULL DEFAULT 0 COMMENT '积分',
  `level` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '会员级别，0~9级,0代表未开通会员',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_voucher
-- ----------------------------
DROP TABLE IF EXISTS `tb_voucher`;
CREATE TABLE `tb_voucher`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '商铺id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代金券标题',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `rules` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用规则',
  `pay_value` bigint(10) UNSIGNED NOT NULL COMMENT '支付金额，单位是分。例如200代表2元',
  `actual_value` bigint(10) NOT NULL COMMENT '抵扣金额，单位是分。例如200代表2元',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0,普通券；1,秒杀券',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1,上架; 2,下架; 3,过期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_voucher
-- ----------------------------
INSERT INTO `tb_voucher` VALUES (1, 1, '50元代金券', '周一至周日均可使用', '全场通用\\n无需预约\\n可无限叠加\\不兑现、不找零\\n仅限堂食', 4750, 5000, 0, 1, '2022-01-04 09:42:39', '2022-01-04 09:43:31');

-- ----------------------------
-- Table structure for tb_voucher_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_voucher_order`;
CREATE TABLE `tb_voucher_order`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '下单的用户id',
  `voucher_id` bigint(20) UNSIGNED NOT NULL COMMENT '购买的代金券id',
  `pay_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付方式 1：余额支付；2：支付宝；3：微信',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '订单状态，1：未支付；2：已支付；3：已核销；4：已取消；5：退款中；6：已退款',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `use_time` timestamp NULL DEFAULT NULL COMMENT '核销时间',
  `refund_time` timestamp NULL DEFAULT NULL COMMENT '退款时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_voucher_order
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
