#设置客户端连接服务器的编码
set names utf8;
#先丢弃
drop database if exists auto_show;
#创建数据表并设置存储字符
create database auto_show charset=utf8;
#进入数据库
use auto_show;
-- 1.用户表
create table user(
u_id int PRIMARY key auto_increment,
u_name VARCHAR(32),
u_pwd VARCHAR(32),
phone VARCHAR(11) not null UNIQUE,
--  用户头像
hpic varchar(125) DEFAULT '9af1d612-e0a5-4b43-b4a1-ba310fa9e87e.webp',
--  性别
gender boolean,
--  用户积分
p_int int,
--  用户收货地址
u_address VARCHAR(128),
--  签到记录
u_records datetime,
--  商城积分
u_points int DEFAULT 10000
);

-- 文章表
create table artical(
art_id int PRIMARY key auto_increment,
-- 文章标题
art_title varchar(64),
-- 发表文章的时间
art_time bigint,
-- 文章的内容
art_textcontent text,  
-- 文章的图片
art_imgs varchar(128),
-- 文章的评论量
art_com_count int DEFAULT 0,
-- 文章的点赞数
art_zan_count int DEFAULT 0,
-- 文章的分类：svip(推荐) vip(精品)  normal(普通)
art_style varchar(6) DEFAULT 'normal',
-- 文章作者用户id
art_u_id int,
-- 文章作者名字
art_u_name varchar(32),
-- 文章作者头像
art_u_hpic varchar(128)
);
INSERT into artical VALUES(null,'够硬核！高合HiPhi X获“C-NCAP五星安全评价”，用安全为豪华加分',1640315786227,'近日，中国新车评价规程（C-NCAP）新一批测试结果公布，其中自主豪华纯电车型高合HiPhi X(图片|配置|询价)凭借在乘员保护、行人保护、主动安全测试项目的出色表现，喜获C-NCAP测试五星评价。高合HiPhi X用成绩向人们展示了纯电动汽车的超高安全性能，打消了人们对纯电动车型安全性的担忧。在乘员保护方面，高合HiPhi X在各种测试中都取得了不俗的成绩。
在最严苛的64 kph 40%正面偏置碰撞中，高合HiPhi X主副驾气囊均精准弹开，主副驾假人在座椅上坐姿保持良好；预紧式安全带及时点爆，在碰撞初始就将乘员牢牢地约束在座椅上；乘员舱A柱几乎无形变，碰撞没有对驾乘人员空间产生明显挤压。高合HiPhi X凭借钢铝混合式高强度车身“铜墙铁壁”般的防护，为驾乘人员在交通事故中创造生存空间，用全车安全气囊搭配预紧式安全带的方案，有效降低碰撞时对驾乘人员的伤害。

同时，在主动安全方面，高合HiPhi X搭载的ADAS系统表现优异，以满分的测试成绩顺利通过测试，主动安全方面表现令人满意。高合HiPhi X“大安全”设计理念，铸就了其全维度安全用车体验。在设计伊始，高合汽车就严格按照C-NCAP五星安全标准打造，同时兼顾C-IASI的评价体系，除了使用深度优化的钢铝混合车身，配合先进机械及化学连接工艺，带来高安全性能的异型结构车身外，还采用五维安全设计的电池系统，及航空器安全级六大双冗余系统，为用户构筑全维度、超安全的用车保障。动力电池系统作为纯电动车的核心部件，不仅价格昂贵，如果防护不当碰撞中还会对驾乘人员造成二次伤害，因而电池是纯电车型碰撞中重点防护对象。高合HiPhi X拥有五维安全管理系统，保证电池在全生命周期、任何使用场景下都能更加安全。高合HiPhi X的高压电池在架构布置上采用环绕式策略，充分利用周边门槛、副车架等强壮结构保障电池不直接面对外部异物冲击。同时，高合HiPhi X在前舱配备高强度底部防冲击横梁，结合配置在电池底部的高强度钢板和大模量高强铝型材截面电池壳体，能够有效保护来自车辆前部及底部的低矮硬物对动力系统的冲击。
此外，高合HiPhi X还是全球唯一配备航空器安全级六大双冗余系统的车型，在感知、制动、转向、通信、电源及计算等6大核心部件均具备两套系统，做到双重保护，使自动辅助驾驶运行更安全可靠，为用户提供双倍安心。

当今社会，人们对于用车安全越来越重视，只有拥有出色安全性能的汽车才能获得消费市场的青睐。高合HiPhi X用前瞻性的安全设计理念，先进的制造工艺，合理的材料与结构的搭配，成就了其“五星级”的安全防护。这样的高合HiPhi X注定是更多家庭增换购豪华电车的首选！','e5fb69b0-5697-454e-b65a-bdd69600906d.webp',0,0,'svip',1,'guanfang','d491cb0e-f2c4-4b12-bfa1-f2a2b06e8c05.webp');

INSERT into artical VALUES(null,'年轻人的家用SUV，五菱星辰对比长安CS75 PLUS，应该投谁一票？',1640315784387,'什么是年轻人家用SUV的“销量密码”？运动感、年轻氛围、带T动力和实用空间等因素，都不可或缺。例如长安CS75 PLUS(图片|配置|询价)，就将这些方面做到了均衡，而它的销量也很可观。而上汽通用五菱在今年9月中旬推出的首款银标SUV——星辰，在上市不到3个月的时间，其销量也突破了4万台。
那么问题就来了，星辰和CS75 PLUS这两款车，都是家用与偏向年轻消费者的产品定位，咱们广大90后在这两台SUV之间，又该如何选呢？下面，我们就来对两车做一番对比，看看究竟谁更懂90后。
价格部分，虽然两款车都定位于紧凑型SUV，但在价格上的差异还是不小。五菱星辰(图片|配置|询价)共有5款在售车型，指导价为6.98-9.98万元；长安CS75 PLUS也有5款车型，但考虑到价格差，我们就跳过2.0T车型，剩下的3款1.5T车型指导价为11.79-13.19万元。其实价格来说也不算贵，但奈何星辰定价更低，顶配都不到10万。
对比了价格，咱们再来聊聊家用车的核心产品力之一——空间。五菱星辰车身长宽高为4594*1820*1740mm、轴距为2750mm，相对来说，星辰的车长在同级中是不占优势的，好在短悬长轴的特性换来了不错的使用空间。长安CS75 PLUS的车身长宽高为4690*1865*1710mm（1.5T车型）、轴距为2710mm，对比星辰的话，CS75 PLUS的车长优势更突出，但轴距略处下风。
以身高178cm的试乘员为例，将前排座椅调至最低，星辰能有一拳一指的头部空间；坐进后排后，头部空间余量为一拳、腿部空间也有两拳三指，放在同级车型中还是很拿得出手的表现。后备厢的话，常规状态下纵深为930mm、高度为760mm、最大宽度1260mm，装载能力算是主流水平，优点主要表现在进深空间不错。
最后，咱们再看看两款车的配置对比。在星辰顶配车型上，六气囊、360度环视影像、定速巡航、自动驻车、前排无钥匙进入、主驾电动调节、9个扬声器等都有配备，Ling OS灵犀系统带来了智能用车，在操作导航/语音/远程控车等功能时，体验感都很不错；毕竟在“智能座舱语言体验TOP10”的排名中，星辰的Ling OS灵犀系统进入了前三。

据悉，五菱近期还将与网易云合作，依托该系统打造LING Club首次在线音乐会，也是LING HOUSE首次跨界活动，以及Ling感生态首度互联，而Ling OS灵犀系统也是首家账户体系打通的用户生态，大家能在上面完成组队出行、相互交流。此外，星辰配备的FSD减振阀和265色可调的氛围灯，在同价位车型中亦是难以见到的。
总结：不难看出，前辈长安CS75 PLUS也好、后浪五菱星辰也罢，它们的产品力都切中了广大90后的口味和关于家庭用车的实用性。但如果是我选择的话，可能还是星辰的高性价比、高质价比，会更打动我一些。因为在空间、座椅、配置等方面，星辰和CS75 PLUS一样，都有相同优势，且在颜值上也拿捏得不错，但星辰更亲民的价格，对于年轻人来说明显还是更友好一些。
','0e26de28-5230-4bb2-841d-d79c1e25f9b6.webp',0,0,'svip',1,'guanfang','d491cb0e-f2c4-4b12-bfa1-f2a2b06e8c05.webp');

INSERT into artical VALUES(null,'德系纯进口性能车，配3.0T+8AT动力，5秒破百，带你看奥迪S5',1640315726227,'
很多人对于豪华车的理解还是比较片面的，只追求外观大气、空间大，对动力以及品质的要求反而没那么高，甚至有些豪华轿车在三四十万的价位竟然零百加速需要10秒以上，有点令人难以理解。对于一台豪华车应该具备什么品质，本期以2022款奥迪S5(图片|配置|询价) 3.0T Sportback为例，详细聊聊这个话题。
奥迪S5 3.0T Sportback为整车德国进口，定价也达到63.18万，不管是从品牌、血统亦或是定价，都能算得上豪华车标准。外观设计上奥迪S5还是偏向于激进，契合年轻人审美。新款采用最新的设计语言，传统的六边形中网配蜂窝格栅，气质犀利。引擎盖上筋线向着中网收束，给人一种蓄势待发的力量感，熏黑的格栅一侧有专属的“S5”LOGO，个性十足。
两侧为一体式大灯，并且很能体现奥迪在灯光上的造诣。灯组占据的位置并不大，像是两枚楔子嵌入两侧车头，但其中集成了远近光灯、日行灯和转向灯，其中远光灯还是LED和激光的光源，结构复杂，亮度高，体积小巧，功能强大。但同时也为其配备了自适应远近光功能，会车时近光避免给对向车辆造成困扰。
侧面线条很有韧劲，车尾做了个小溜背，两侧后视镜外侧涂了银色。圈内有句话叫“红标的本田，银耳的奥迪”，都是性能车的代名词。车身尺寸为4762*1843*1342mm，轴距2831mm，在中型车里并不算拔尖。B柱和侧面车框都使用了熏黑装饰条，腰线笔直贯穿，19英寸双五辐轮毂配普利司通高性能薄款胎，主打操控。
总体而言奥迪S5作为全进口中型掀背轿跑车，其综合实力很强，外观内饰基本上没有短板，舒适度和动力以及悬架系统也是同价位极高的水准，唯一一个小小瑕疵仅在于选装件较多，但瑕不掩瑜，这样一台豪华轿跑还是让许多人能够对它产生好感，你们觉得这个评价公允吗？
','84f6801c-3026-4885-8a18-0e74c2355f6f.webp',0,0,'svip',1,'guanfang','d491cb0e-f2c4-4b12-bfa1-f2a2b06e8c05.webp');



-- 评论表
create table comment(
comm_id int PRIMARY key auto_increment,
-- 评论对应的文章的id
comm_art_id int,
-- 评论的内容
comm_content varchar(255),
-- 这条评论的用户的id
comm_from_uid int,
-- 评论时间
comm_time bigint
);

-- 回复表
create table reply(
rep_id int PRIMARY key auto_increment,
-- 对应评论的id
rep_comm_id int,
--  对应的回复目标的id
rep_rep_id int,
-- 回复的类型 （回复评论、回复回复）
rep_type varchar(12),
-- 回复的内容
rep_content varchar(250),
-- 回复的人的用户id
rep_from_uid int,
-- 回复的目标的用户id
rep_to_uid bigint
);
INSERT into reply VALUES(null,1,null,'评论','你嘿什么？',2,1);

-- 关注表
create table cares(
care_id int PRIMARY key auto_increment,
-- 粉丝用户id
care_from_uid int,
-- 关注的人的用户id
care_to_uid int
-- foreign key(care_from_uid) references user(u_id),
-- foreign key(care_to_uid) references user(u_id)
);
INSERT into cares VALUES(null,1,2);

-- 点赞表
create table loves(
l_id int PRIMARY key auto_increment,
-- 点赞对应的文章id
l_art_id int,
-- 喜欢该文章，点赞的用户id
l_uid int,
-- 喜欢状态   1喜欢
l_type int
);

  
-- 2.场次表
create table scene(
--  每个场次的id(外键链接 至 订单表 订单场次id)
s_id int PRIMARY key auto_increment,
--  场次的名字
s_name VARCHAR(64),
--  场次封面
s_pic VARCHAR(255),
--  场次开始时间
showStartTime varchar(32),
--  场次结束时间
showEndTime varchar(32),
-- 场次地点
s_address VARCHAR(128),
-- 票价
s_price int,
-- 举办活动id
s_activity int
);


-- 3.积分商品表
create table product(
-- 商品id
p_id int PRIMARY key auto_increment,
--  商品名
p_name varchar(32),
--  商品图片
p_pic varchar(255),
--  所需积分
p_points int,
-- 剩余数量
p_num int,
-- 商品价格
p_price int
);

-- 4.订单表
create table p_order(
-- 订单id
o_id varchar(32) PRIMARY key,
-- 用户id(链接 至 用户表 用户id)
o_u_id int,
--  订单场次id(外键链接 至 场次表 场次id) 
osen_id int,
--  订单场次名(链接 至 场次表 用户id) 
o_name varchar(32),
-- 场次开始时间
o_time varchar(16),
-- 购买票的数量
o_number int,
-- 购买的的门票价
o_price varchar(9),
-- 购买的游客信息
tname varchar(32),
tphone varchar(11),
tidcard varchar(18) UNIQUE
-- 外键链接 用户id 至 用户表 用户id(u_id)
-- foreign key(o_u_id) references user(u_id),
-- 外键链接 订单场次id 至 场次表 场次id(u_id)
-- foreign key(osen_id) references scene(s_id)
);
-- 4-2游客信息表
create table tuser(
  t_id int PRIMARY key auto_increment,
  tname varchar(32),
  tphone varchar(11),
  tidcard varchar(18) UNIQUE, 
  t_uid int
);
INSERT into tuser VALUES(null,'张柱','13273888956','410482190012031234',1);
INSERT into tuser VALUES(null,'婷婷','13273888955','410482190012031233',1);
-- 4-3.积分商品订单
create table pp_order(
-- 订单id
po_id INT PRIMARY key auto_increment,
-- 兑换的商品名称
po_pname VARCHAR(128),
-- 商品图片
po_pic text,
-- 花费积分
po_points VARCHAR(128),
-- 订单地址
po_addr text not null,
-- 收货人姓名
po_name VARCHAR(32),
-- 收货人手机号
po_phone varchar(11) not null,
-- 订单时间
po_time VARCHAR(128),
-- 用户u_id
u_id int
);
-- 5.品牌表
create table barand(
-- 品牌id
b_id int PRIMARY key auto_increment,
--  品牌名
b_name VARCHAR(32),
-- 品牌logo
b_logo varchar(255),
-- 线下销售点id (被链接至 销售点表 线下销售点ID)
b_sale_id int
);
-- 5-1.品牌表
create table b_pic(
-- 品牌id
b_pic_id int PRIMARY key auto_increment,
--  品牌名
b_pic_name VARCHAR(32),
-- 品牌车图片
bb_pic varchar(255),
-- 类别id (被链接至 brand表下的b_id)
bmm_id int,      
foreign key(bmm_id) references barand(b_id)
);
-- 6.活动表
create table activity(
-- 活动id
a_id int PRIMARY key auto_increment,
-- 活动名称
a_name VARCHAR(32),
-- 活动介绍
a_details Text,
-- 活动图片
a_pic varchar(255),
-- 城市
a_city varchar(16)
);
-- 8.咨询表
create table news(
-- 咨询ID
n_id int PRIMARY key auto_increment,
-- 咨询标题
n_titles VARCHAR(64),
-- 咨询图片
n_pic VARCHAR(255),
-- 咨询详情
n_details text
);

-- 7.销售点表
create table shops(
-- 销售点id(外键链接至 品牌表 销售点ID(b_sale_id))
shop_id int PRIMARY key auto_increment,
-- 品牌id
shop_b_id int,
-- 销售点名称
shop_name varchar(32),
-- 销售点地址
shop_address VARCHAR(64),
-- 销售点联系方式
shop_phone VARCHAR(64),
foreign key(shop_b_id) REFERENCES barand(b_id)
);

#表5,表5-1数据
INSERT into barand VALUES(null,'特斯拉','https://pic.baike.soso.com/ugc/baikepic2/7078/cut-20210810152935-1517696822_jpg_493_395_10855.jpg/300',2);
INSERT into barand VALUES(null,'amg','https://pic.baike.soso.com/ugc/baikepic2/26386/cut-20190623160737-1518947525_jpg_732_585_16049.jpg/300',2);
INSERT into barand VALUES(null,'宾利','https://pic.baike.soso.com/ugc/baikepic2/6183/cut-20210705165024-1220051757_jpg_545_436_28025.jpg/300',2);
INSERT into barand VALUES(null,'路虎','https://pic.baike.soso.com/ugc/baikepic2/25014/cut-20190905151528-1193843045_jpg_880_704_50244.jpg/300',2);
INSERT into barand VALUES(null,'奥迪','https://pic.baike.soso.com/ugc/baikepic2/20830/20180220044532-2024795675_jpeg_2625_2625_276214.jpg/300',2);
INSERT into barand VALUES(null,'阿斯顿马丁','https://pic.baike.soso.com/ugc/baikepic2/13698/cut-20171120100304-700978536_jpg_726_581_35616.jpg/300',2);
INSERT into barand VALUES(null,'雪佛兰','https://pic.baike.soso.com/ugc/baikepic2/21522/cut-20190726120944-1440721532_jpg_530_425_20265.jpg/300',2);
INSERT into barand VALUES(null,'劳斯莱斯','https://pic.baike.soso.com/ugc/baikepic2/13113/cut-20201217170320-1261222487_jpg_365_292_15424.jpg/300',2);
INSERT into barand VALUES(null,'jeep','https://pic.baike.soso.com/ugc/baikepic2/750/20200529164108-194604546_jpeg_1024_768_28919.jpg/300',2);
INSERT into barand VALUES(null,'本田','https://pic.baike.soso.com/ugc/baikepic2/11684/cov-20190801105351-540935934_jpg_1024_857_71891.jpg/300',2);
INSERT into barand VALUES(null,'红旗','https://pic.baike.soso.com/ugc/baikepic2/7704/cov-20211006082311-1531055506_jpg_500_292_10259.jpg/300',2);
INSERT into barand VALUES(null,'凯迪拉克','https://pic.baike.soso.com/ugc/baikepic2/18544/cut-20180910182304-146697035_jpg_732_585_39584.jpg/300',2);
INSERT into barand VALUES(null,'法拉利','https://pic.baike.soso.com/ugc/baikepic2/1931/cov-20191012172924-651159220_jpg_391_438_19007.jpg/300',2);
INSERT into barand VALUES(null,'保时捷','https://pic.baike.soso.com/ugc/baikepic2/4144/cov-20210515162948-1262461128_jpg_400_300_11678.jpg/300',2);
INSERT into barand VALUES(null,'宝马','https://pic.baike.soso.com/ugc/baikepic2/22904/cut-20190923133253-680956394_jpg_609_488_13968.jpg/300',2);
INSERT into barand VALUES(null,'雷克萨斯','https://pic.baike.soso.com/ugc/baikepic2/21915/cut-20190730151106-715545386_jpg_391_313_5927.jpg/300',2);
INSERT into barand VALUES(null,'沃尔沃','https://pic.baike.soso.com/ugc/baikepic2/8075/cut-20210923154800-1255324141_jpg_376_470_10761.jpg/300',2);
INSERT into barand VALUES(null,'英菲尼迪','https://pic.baike.soso.com/ugc/baikepic2/23717/20180402225953-36466700_png_2560_1440_583101.jpg/300',2);
INSERT into barand VALUES(null,'蔚来','https://pic.baike.soso.com/ugc/baikepic2/7258/cut-20210824095527-2123061636_jpg_284_227_5389.jpg/300',2);
INSERT into barand VALUES(null,'比亚迪','https://pic.baike.soso.com/ugc/baikepic2/7681/cut-20210913205506-1680431088_jpg_550_440_14831.jpg/300',2);
INSERT into barand VALUES(null,'别克','https://pic.baike.soso.com/ugc/baikepic2/3353/cut-20201026103020-759307155_jpg_866_694_51904.jpg/300',2);
INSERT into barand VALUES(null,'MINI','https://pic.baike.soso.com/ugc/baikepic2/1306/20170824061939-467447331_jpg_324_259_7639.jpg/0',2);
INSERT into barand VALUES(null,'MG','https://pic.baike.soso.com/ugc/baikepic2/7756/cov-20210930210544-1168630708_jpg_842_842_34459.jpg/300',2);
INSERT into barand VALUES(null,'上海大众','https://pic.baike.soso.com/ugc/baikepic2/1837/20200529164317-897642640_jpeg_300_225_10208.jpg/0',2);

INSERT into b_pic VALUES(null,'amg','https://car2.autoimg.cn/cardfs/product/g29/M05/4A/B8/1400x0_1_q95_autohomecar__ChsEn18qeOSAChAVAB43AcowmEQ895.jpg',2);
INSERT into b_pic VALUES(null,'amg','https://car2.autoimg.cn/cardfs/product/g29/M03/4C/42/1400x0_1_q95_autohomecar__ChsEfl8qeOOARcuJAB-jT-jlwmQ565.jpg',2);
INSERT into b_pic VALUES(null,'amg','https://car3.autoimg.cn/cardfs/product/g29/M07/4A/B8/1400x0_1_q95_autohomecar__ChsEn18qeOGAL5CXACCJtbu5QfU818.jpg',2);
INSERT into b_pic VALUES(null,'amg','https://car3.autoimg.cn/cardfs/product/g29/M0B/4A/B7/1400x0_1_q95_autohomecar__ChsEn18qeOCAN408AB_Ss5H7qIE151.jpg',2);
INSERT into b_pic VALUES(null,'amg','https://car3.autoimg.cn/cardfs/product/g3/M07/6C/3C/1400x0_1_q95_autohomecar__ChwFlV8qeN2AcvOPAB7MD1h1azA163.jpg',2);

INSERT into b_pic VALUES(null,'宾利','https://car2.autoimg.cn/cardfs/product/g1/M05/6A/D1/1400x0_1_q95_autohomecar__ChsEj17OLiCAe7WkAAdhVUzZWQI979.jpg',3);
INSERT into b_pic VALUES(null,'宾利','https://car3.autoimg.cn/cardfs/product/g1/M0A/73/74/1400x0_1_q95_autohomecar__ChsEmV7OLh-AP4eBAAcdueXh0DE908.jpg',3);
INSERT into b_pic VALUES(null,'宾利','https://car2.autoimg.cn/cardfs/product/g30/M09/51/7D/1400x0_1_q95_autohomecar__ChsEoF7OLh-ALCMkAAamITLYxcw983.jpg',3);
INSERT into b_pic VALUES(null,'宾利','https://car2.autoimg.cn/cardfs/product/g30/M06/51/7D/1400x0_1_q95_autohomecar__ChsEoF7OLh6AOZayAAVHLleKSlo247.jpg',3);
INSERT into b_pic VALUES(null,'宾利','https://car3.autoimg.cn/cardfs/product/g30/M02/8C/59/1400x0_1_q95_autohomecar__ChwFlF7OLh6AOrWBAAWWkfyIhTk752.jpg',3);

INSERT into b_pic VALUES(null,'特斯拉','https://car2.autoimg.cn/cardfs/product/g28/M02/C1/B5/1400x0_1_q95_autohomecar__ChwFkmGNDZOAR4IHABsSN7bgTJo383.jpg',1);
INSERT into b_pic VALUES(null,'特斯拉','https://car2.autoimg.cn/cardfs/product/g28/M07/B1/A8/1400x0_1_q95_autohomecar__ChxkmmGNDZKATbDWAB2SbBAPWLI722.jpg',1);
INSERT into b_pic VALUES(null,'特斯拉','https://car2.autoimg.cn/cardfs/product/g28/M07/B1/A8/1400x0_1_q95_autohomecar__ChxkmmGNDZKAEC4oAB7dwwDjweQ055.jpg',1);
INSERT into b_pic VALUES(null,'特斯拉','https://car2.autoimg.cn/cardfs/product/g28/M06/B1/A8/1400x0_1_q95_autohomecar__ChxkmmGNDZGATWlJAB8dDpMh-JY167.jpg',1);
INSERT into b_pic VALUES(null,'特斯拉','https://car3.autoimg.cn/cardfs/product/g28/M03/B1/A8/1400x0_1_q95_autohomecar__ChxkmmGNDZGAAhFEAB_hBTNUxeM960.jpg',1);

INSERT into b_pic VALUES(null,'路虎','https://car3.autoimg.cn/cardfs/product/g28/M02/BB/4B/1400x0_1_q95_autohomecar__ChxkmmGuEt-AUyfhAApRijicBZI141.jpg',4);
INSERT into b_pic VALUES(null,'路虎','https://car3.autoimg.cn/cardfs/product/g28/M02/CB/5E/1400x0_1_q95_autohomecar__ChwFkmGuEt-AVIdYAAnrVTxEyN8129.jpg',4);
INSERT into b_pic VALUES(null,'路虎','https://car2.autoimg.cn/cardfs/product/g28/M05/BB/4B/1400x0_1_q95_autohomecar__ChxkmmGuEt-ACSEKAAspVDx3_6o852.jpg',4);
INSERT into b_pic VALUES(null,'路虎','https://car2.autoimg.cn/cardfs/product/g28/M08/BB/4B/1400x0_1_q95_autohomecar__ChxkmmGuEt6ARSOMAAq9ZZQZbQ4259.jpg',4);
INSERT into b_pic VALUES(null,'路虎','https://car2.autoimg.cn/cardfs/product/g28/M03/CB/5E/1400x0_1_q95_autohomecar__ChwFkmGuEt6ALAkYAAnoUtIWWeA143.jpg',4);


INSERT into b_pic VALUES(null,'奥迪','https://car2.autoimg.cn/cardfs/product/g20/M0E/9D/8F/1400x0_1_q95_autohomecar__ChsElWD0OVqANl5JACYY34AewPw838.jpg',5);
INSERT into b_pic VALUES(null,'奥迪','https://car2.autoimg.cn/cardfs/product/g20/M01/9F/94/1400x0_1_q95_autohomecar__ChwEpmD0OVmAcGtpACzYWqCgnJk762.jpg',5);
INSERT into b_pic VALUES(null,'奥迪','https://car2.autoimg.cn/cardfs/product/g13/M0F/95/18/1400x0_1_q95_autohomecar__ChsE8mD0OViAA-VnACLSXL3Is9o918.jpg',5);
INSERT into b_pic VALUES(null,'奥迪','https://car3.autoimg.cn/cardfs/product/g20/M12/9F/94/1400x0_1_q95_autohomecar__ChwEpmD0OViAPRFiAC37P7B9iWQ903.jpg',5);
INSERT into b_pic VALUES(null,'奥迪','https://car2.autoimg.cn/cardfs/product/g20/M13/95/70/1400x0_1_q95_autohomecar__ChxklGD0OVeAE_vZACz_YY8RXz0430.jpg',5);


INSERT into b_pic VALUES(null,'阿斯顿马丁','https://car2.autoimg.cn/cardfs/product/g24/M0B/29/03/1400x0_1_q95_autohomecar__ChwFjmDyz6yASvfeAAru8AWI9BI627.jpg',6);
INSERT into b_pic VALUES(null,'阿斯顿马丁','https://car3.autoimg.cn/cardfs/product/g24/M09/29/03/1400x0_1_q95_autohomecar__ChwFjmDyz6uAaH-dAAo6Nj9oB5c660.jpg',6);
INSERT into b_pic VALUES(null,'阿斯顿马丁','https://car2.autoimg.cn/cardfs/product/g24/M0A/29/03/1400x0_1_q95_autohomecar__ChwFjmDyz6uAeOiJAAqdvo1FCJQ880.jpg',6);
INSERT into b_pic VALUES(null,'阿斯顿马丁','https://car2.autoimg.cn/cardfs/product/g5/M0A/6F/7E/1400x0_1_q95_autohomecar__ChxkkGDyz6qAJckbAAvAmS-W4WE732.jpg',6);
INSERT into b_pic VALUES(null,'阿斯顿马丁','https://car2.autoimg.cn/cardfs/product/g24/M04/29/03/1400x0_1_q95_autohomecar__ChwFjmDyz6qAByTDAAreuGV_TpU034.jpg',6);


INSERT into b_pic VALUES(null,'保时捷','https://car2.autoimg.cn/cardfs/product/g18/M0B/46/9C/1400x0_1_q95_autohomecar__ChxksGDdT_yAXEpFACDRmkFmENs529.jpg',14);
INSERT into b_pic VALUES(null,'保时捷','https://car2.autoimg.cn/cardfs/product/g4/M03/69/B8/1400x0_1_q95_autohomecar__Chxkl2DdT_yAcdUBAB66mytLohQ796.jpg',14);
INSERT into b_pic VALUES(null,'保时捷','https://car3.autoimg.cn/cardfs/product/g18/M06/46/9C/1400x0_1_q95_autohomecar__ChxksGDdT_uATcJrACDiEV9gchw105.jpg',14);
INSERT into b_pic VALUES(null,'保时捷','https://car3.autoimg.cn/cardfs/product/g18/M09/4E/C2/1400x0_1_q95_autohomecar__ChsE2GDdT_qAccZvAB_MtZw0AxI335.jpg',14);
INSERT into b_pic VALUES(null,'保时捷','https://car2.autoimg.cn/cardfs/product/g4/M00/EA/4C/1400x0_1_q95_autohomecar__ChwElmDdT_qANZgfACHUcHYqOno834.jpg',14);

INSERT into b_pic VALUES(null,'雷克萨斯','https://car3.autoimg.cn/cardfs/product/g24/M07/E0/1E/1400x0_1_q95_autohomecar__Chtk3WDVsUOAQ0o2AArufRJHKG8836.jpg',16);
INSERT into b_pic VALUES(null,'雷克萨斯','https://car3.autoimg.cn/cardfs/product/g3/M01/76/9F/1400x0_1_q95_autohomecar__ChsEm19bNsaABwesAAhwBZZe7-U513.jpg',16);
INSERT into b_pic VALUES(null,'雷克萨斯','https://car2.autoimg.cn/cardfs/product/g3/M05/8C/A3/1400x0_1_q95_autohomecar__ChcCRV6OgbOAPL8QAAHyetViX1c625.jpg',16);
INSERT into b_pic VALUES(null,'雷克萨斯','https://car3.autoimg.cn/cardfs/product/g29/M05/95/CA/1400x0_1_q95_autohomecar__ChsEn16OgbKAIqk3AAMgPPBD8LI445.jpg',16);
INSERT into b_pic VALUES(null,'雷克萨斯','https://car2.autoimg.cn/cardfs/product/g29/M01/98/2D/1400x0_1_q95_autohomecar__ChsEfl6OgbGANzowAAH9b4Kxeuw666.jpg',16);

INSERT into b_pic VALUES(null,'劳斯莱斯','https://car2.autoimg.cn/cardfs/product/g25/M04/71/EB/1400x0_1_q95_autohomecar__ChcCr1r0wpKALzoUAAdpzzh5zMk165.jpg',8);
INSERT into b_pic VALUES(null,'劳斯莱斯','https://car2.autoimg.cn/cardfs/product/g25/M02/67/3C/1400x0_1_q95_autohomecar__wKgHIFr0wpGAQgBbAAbVbX27zLY891.jpg',8);
INSERT into b_pic VALUES(null,'劳斯莱斯','https://car3.autoimg.cn/cardfs/product/g25/M09/6E/01/1400x0_1_q95_autohomecar__wKgHIlr0wpCAOqxfAAbTuM3oPUU894.jpg',8);
INSERT into b_pic VALUES(null,'劳斯莱斯','https://car2.autoimg.cn/cardfs/product/g25/M03/71/EB/1400x0_1_q95_autohomecar__ChcCr1r0wo-AfPb9AAXC7pzIW3c094.jpg',8);
INSERT into b_pic VALUES(null,'劳斯莱斯','https://car3.autoimg.cn/cardfs/product/g25/M04/67/3C/1400x0_1_q95_autohomecar__wKgHIFr0wo-AHtswAAZkNQlupwk326.jpg',8);


INSERT into b_pic VALUES(null,'雪佛兰','https://car0.autoimg.cn/upload/2014/6/30/1400x0_1_q95_autohomecar__20140630085658515-1.jpg',7);
INSERT into b_pic VALUES(null,'雪佛兰','https://car0.autoimg.cn/upload/2014/6/30/1400x0_1_q95_autohomecar__20140630085657361-1.jpg',7);
INSERT into b_pic VALUES(null,'雪佛兰','https://car1.autoimg.cn/upload/2014/6/30/1400x0_1_q95_autohomecar__20140630085656222-1.jpg',7);
INSERT into b_pic VALUES(null,'雪佛兰','https://car1.autoimg.cn/upload/2014/6/30/1400x0_1_q95_autohomecar__20140630085543885-1.jpg',7);
INSERT into b_pic VALUES(null,'雪佛兰','https://car0.autoimg.cn/upload/2014/6/30/1400x0_1_q95_autohomecar__20140630085542512-1.jpg',7);

INSERT into b_pic VALUES(null,'宝马','https://car2.autoimg.cn/cardfs/product/g28/M0A/88/86/1400x0_1_q95_autohomecar__ChxkmmGSTsmAZdQtABdW4xW92oc918.jpg',15);
INSERT into b_pic VALUES(null,'宝马','https://car3.autoimg.cn/cardfs/product/g28/M01/80/74/1400x0_1_q95_autohomecar__ChwFkmGqD4SAafs1ACJDat-v9yQ755.jpg',15);
INSERT into b_pic VALUES(null,'宝马','https://car3.autoimg.cn/cardfs/product/g28/M00/80/74/1400x0_1_q95_autohomecar__ChwFkmGqD4SAWqPoACXWw8vh9Dg579.jpg',15);
INSERT into b_pic VALUES(null,'宝马','https://car2.autoimg.cn/cardfs/product/g28/M07/70/64/1400x0_1_q95_autohomecar__ChxkmmGqD4SAA-0XACnfSp4Rs3M072.jpg',15);
INSERT into b_pic VALUES(null,'宝马','https://car3.autoimg.cn/cardfs/product/g28/M00/80/74/1400x0_1_q95_autohomecar__ChwFkmGqD4OAHDPHACiPHYCAivY639.jpg',15);


INSERT into b_pic VALUES(null,'jeep','https://car3.autoimg.cn/cardfs/product/g28/M06/D4/4C/1400x0_1_q95_autohomecar__ChxkmmGWYGiAf9pTABqE5eg3fjY553.jpg',9);
INSERT into b_pic VALUES(null,'jeep','https://car2.autoimg.cn/cardfs/product/g28/M03/D4/4C/1400x0_1_q95_autohomecar__ChxkmmGWYGeAVllkAB4D_R2jXKw275.jpg',9);
INSERT into b_pic VALUES(null,'jeep','https://car2.autoimg.cn/cardfs/product/g28/M01/D4/4C/1400x0_1_q95_autohomecar__ChxkmmGWYGaAJ71SACBERrL5CT0100.jpg',9);
INSERT into b_pic VALUES(null,'jeep','https://car2.autoimg.cn/cardfs/product/g28/M09/D4/4B/1400x0_1_q95_autohomecar__ChxkmmGWYGWAJ2iDABw2swZZAw0441.jpg',9);
INSERT into b_pic VALUES(null,'jeep','https://car3.autoimg.cn/cardfs/product/g28/M04/D4/4B/1400x0_1_q95_autohomecar__ChxkmmGWYGSAWoeyAB0XAkBvp4E076.jpg',9);


-- 积分商品数据
insert into product values(null,'车展纪念徽章','https://g-search2.alicdn.com/img/bao/uploaded/i4/i3/2791365811/O1CN01D0Bmv01snU8DOjSU2_!!2791365811.jpg',3000,999,0);
INSERT into product VALUES(null,'卡卡钥匙挂件','https://g-search3.alicdn.com/img/bao/uploaded/i4/i4/280228726/TB2.GrUfbtlpuFjSspfXXXLUpXa_!!280228726.jpg',4000,999,0);
INSERT into product VALUES(null,'卡卡3D手机座','https://img.alicdn.com/imgextra/i4/502430139/O1CN01Smo8pJ1CthjfxnyZW_!!0-saturn_solar.jpg',5000,999,0);
INSERT into product VALUES(null,'卡卡限量T恤','https://g-search3.alicdn.com/img/bao/uploaded/i4/i2/3388156393/O1CN010O6fpX1x62jSYn6oj_!!3388156393.jpg',8000,999,0);
INSERT into product VALUES(null,'卡卡帆布包','https://g-search3.alicdn.com/img/bao/uploaded/i4/i1/2201421758948/O1CN01DEFT652FyEgkTuauU_!!2201421758948.jpg',9000,0,0);

#表2,表6数据
#郑州的
insert into scene values
(null,'2021秋季第34届郑州大河国际车展','https://image.chezhanri.com/2021/0909/f3c6ea1329bfd009289d6042f22c3b6b.jpg!show_thumb','2021年10月02日','2021年10月06日','郑州国际会展中心','30','1');
#对应外键————插入活动id

insert into scene values
(null,'2021第三届中国（郑州）国际房车旅游产业链大会','https://image.chezhanri.com/2021/0917/feae641a7092cc3945e8b77a6a5d76c4.jpg!show_thumb','2021年10月21日','2021年10月24日','河南省体育中心','50','2');

insert into scene values
(null,'2021郑州第35届惠民团车节暨第二届','https://image.chezhanri.com/2021/1012/7c0240ccdef23aca1f451f0d755b6eb2.jpg!show_thumb','2021年10月23日','2021年11月1日','郑州中原福塔','20','3');

insert into scene values
(null,'2021第十四届郑州国际汽车展览会暨新能源·智能网联汽车展览会|房车露营展','https://image.chezhanri.com/assets/img/nopic-16x9.jpg!show_thumb','2021年11月04日','2021年11月09日','郑州国际会展中心','30','4');

insert into scene values
(null,'2021中国·郑州年终厂价直销团购车展','https://image.chezhanri.com/2021/1207/4a76e5e3be961fdfbad4aa66f9f6ed8a.jpg!show_thumb','2021年12月21日','2021年12月26日','郑州国际会展中心','50','5');


#北京的
insert into scene values
(null,'2021第22届中国（北京）国际房车露营展览会','https://image.chezhanri.com/2021/0926/af0518fa11bb3fcdea12392113c77647.jpg!show_thumb','2021年10月14日','2021年10月19日','北京房车世界','80','6');

insert into scene values
(null,'2021北京酷车国际文化节暨房车购车周','https://image.chezhanri.com/2021/1011/c4424cb6965d571782cce3e28fed8ffb.jpg!show_thumb','2021年10月15日','2021年10月20日','北京酷车小镇房车文化街','50','7');

insert into scene values
(null,'2021第三十五届北京惠民团车节','https://image.chezhanri.com/2021/1012/3b0f99eda656c29efff684013e2b615c.jpg!show_thumb','2021年10月16日','2021年10月24日','北京国家会议中心','30','7');

insert into scene values
(null,'Motor China 2022北京国际摩托车','https://image.chezhanri.com/2021/1026/949684b12cdd8c872b39b20cbf0a57e1.jpg!show_thumb','2022年05月20日','2021年05月23日','中国国际展览中心（新馆)','50','7');

insert into scene values
(null,'2022（第十七届）北京国际汽车展览','https://image.chezhanri.com/assets/img/nopic-16x9.jpg!show_thumb','2022年04月21日','2021年04月30日','北京中国国际展览中心新馆','70','7');

-- #插入活动表
-- 第一个活动
insert into activity values
(null,'逛车展赢汽车','<span style="font-family:Optima-Regular, PingFangTC-light;">今年是郑州国际车展连续举办的第二十年，为了回馈广大车友观众对车展的支持，车展主办方联合奇瑞汽车送出年轻派新选择——新款瑞虎7 PLUS（一年使用权），只要来逛展，那个把瑞虎7 PLUS开回家的人，可能就是你！</span><span style="font-family:Optima-Regular, PingFangTC-light;"><br />
</span><span style="font-family:Optima-Regular, PingFangTC-light;">奇瑞瑞虎7家族全新车型</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#407600;">瑞虎7 PLUS</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">，使用全新前脸设计，更显年轻、运动、新潮。整体精致大气，有望成为10万级SUV爆款车型。</span></span></span></span> 
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210906/20210906134925_50557.jpg" alt="" /><br />
</span></span></span> 
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"><strong></strong></span></span></span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong>/ 参与方式 /</strong></span> 
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;"><strong> </strong></span><span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong>参与时间</strong></span><span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong>：</strong></span><span style="font-size:14px;">9月30日9:00~10月5日15:00</span>
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong> 参与地点</strong></span><span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong>：</strong></span><span style="font-size:14px;">郑州新世界车展现场</span>
</p>
<p>
	<span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong> 参与条件：</strong></span> 
</p>
<p>
	<span style="font-size:14px;">展期内刷本人手机号名</span><span style="color:#FFFFFF;"></span><span style="font-size:14px;">下的电子门票入场，点击小程序首页的“逛展赢汽车”活动页面，即自动进入抽奖池。</span>
</p>
<p>
	<br />
</p>
<p>
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210906/20210906135348_59738.png" alt="" /> 
</p>
<p>
	<br />
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"></span></span></span> 
</p>
<p style="text-align:center;">
	<span style="font-family:Optima-Regular, PingFangTC-light;"><strong><span style="color:#407600;"><span style="font-size:16px;"></span><span style="font-size:16px;">/ 注意事项 /</span></span></strong></span> 
</p>
<p style="text-align:center;">
	<span style="font-family:Optima-Regular, PingFangTC-light;"><strong><span style="color:#407600;"><span style="font-size:16px;"><br />
</span></span></strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">1、电子门票绑定的手机号是参与抽奖的唯一凭证；</span> 
</p>
<p>
	<span style="font-size:14px;">2、抽奖号为每个手机号名下电子票首次入场后生成的顺序号，凭电子票入场后，抽奖号被列入抽奖号池；</span>
</p>
<p>
	<span style="font-size:14px;">3、每个手机号只能参与一次抽奖；</span>
</p>
<p>
	<span style="font-size:14px;">4、实体票不参与抽奖，但可以凭实体票至总服务台找到工作人员，激活对应的电子票，即可参与抽奖。</span>
</p>
<p>
	<br />
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong> 开奖时间：</strong></span><span style="font-size:14px;">2021年10月5日15：00</span> 
</p>
<p>
	<span><br />
</span> 
</p>
<p>
	<span><br />
</span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong>/ 如何领奖 /</strong></span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong><br />
</strong></span> 
</p>
<span style="line-height:2;font-size:14px;">1、中奖观众请于10月5日17:00前至现场服务台凭有效身份证明办理领取手续，如规定时间内无法到达现场，需与主办方联系说明（025-66048880），办理手续时间截止日期为10月10日，逾期未领视为自动放弃获奖资格；</span><br />
<span style="line-height:2;font-size:14px;">2、获得奖品的观众须配合缴纳个人偶然所得税；</span><br />
<span style="line-height:2;font-size:14px;">3、奖品只能以实物发放，不可折现；广告页面所示奖品仅为示意图，最终以实物为准；</span><br />
<span style="line-height:2;font-size:14px;">4、本活动秉持公平、公正、公开的原则，在法律允许范围内，本次活动的最终解释权归郑州奥傲展览有限公司所有。</span><br />','http://www.njae.net/Public/Uploads/21-01/612ccbcdcca2a.jpg','郑州');

insert into activity values
(null,'逛车展赢汽车','<span style="font-family:Optima-Regular, PingFangTC-light;">今年是北京国际车展连续举办的第二十年，为了回馈广大车友观众对车展的支持，车展主办方联合奇瑞汽车送出年轻派新选择——新款瑞虎7 PLUS（一年使用权），只要来逛展，那个把瑞虎7 PLUS开回家的人，可能就是你！</span><span style="font-family:Optima-Regular, PingFangTC-light;"><br />
</span><span style="font-family:Optima-Regular, PingFangTC-light;">奇瑞瑞虎7家族全新车型</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#407600;">瑞虎7 PLUS</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">，使用全新前脸设计，更显年轻、运动、新潮。整体精致大气，有望成为10万级SUV爆款车型。</span></span></span></span> 
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210906/20210906134925_50557.jpg" alt="" /><br />
</span></span></span> 
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"><strong></strong></span></span></span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong>/ 参与方式 /</strong></span> 
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;"><strong> </strong></span><span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong>参与时间</strong></span><span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong>：</strong></span><span style="font-size:14px;">9月30日9:00~10月5日15:00</span>
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong> 参与地点</strong></span><span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong>：</strong></span><span style="font-size:14px;">郑州新世界车展现场</span>
</p>
<p>
	<span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong> 参与条件：</strong></span> 
</p>
<p>
	<span style="font-size:14px;">展期内刷本人手机号名</span><span style="color:#FFFFFF;"></span><span style="font-size:14px;">下的电子门票入场，点击小程序首页的“逛展赢汽车”活动页面，即自动进入抽奖池。</span>
</p>
<p>
	<br />
</p>
<p>
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210906/20210906135348_59738.png" alt="" /> 
</p>
<p>
	<br />
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"></span></span></span> 
</p>
<p style="text-align:center;">
	<span style="font-family:Optima-Regular, PingFangTC-light;"><strong><span style="color:#407600;"><span style="font-size:16px;"></span><span style="font-size:16px;">/ 注意事项 /</span></span></strong></span> 
</p>
<p style="text-align:center;">
	<span style="font-family:Optima-Regular, PingFangTC-light;"><strong><span style="color:#407600;"><span style="font-size:16px;"><br />
</span></span></strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">1、电子门票绑定的手机号是参与抽奖的唯一凭证；</span> 
</p>
<p>
	<span style="font-size:14px;">2、抽奖号为每个手机号名下电子票首次入场后生成的顺序号，凭电子票入场后，抽奖号被列入抽奖号池；</span>
</p>
<p>
	<span style="font-size:14px;">3、每个手机号只能参与一次抽奖；</span>
</p>
<p>
	<span style="font-size:14px;">4、实体票不参与抽奖，但可以凭实体票至总服务台找到工作人员，激活对应的电子票，即可参与抽奖。</span>
</p>
<p>
	<br />
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong> 开奖时间：</strong></span><span style="font-size:14px;">2021年10月5日15：00</span> 
</p>
<p>
	<span><br />
</span> 
</p>
<p>
	<span><br />
</span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong>/ 如何领奖 /</strong></span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong><br />
</strong></span> 
</p>
<span style="line-height:2;font-size:14px;">1、中奖观众请于10月5日17:00前至现场服务台凭有效身份证明办理领取手续，如规定时间内无法到达现场，需与主办方联系说明（025-66048880），办理手续时间截止日期为10月10日，逾期未领视为自动放弃获奖资格；</span><br />
<span style="line-height:2;font-size:14px;">2、获得奖品的观众须配合缴纳个人偶然所得税；</span><br />
<span style="line-height:2;font-size:14px;">3、奖品只能以实物发放，不可折现；广告页面所示奖品仅为示意图，最终以实物为准；</span><br />
<span style="line-height:2;font-size:14px;">4、本活动秉持公平、公正、公开的原则，在法律允许范围内，本次活动的最终解释权归北京奥傲展览有限公司所有。</span><br />','http://www.njae.net/Public/Uploads/21-01/612ccbcdcca2a.jpg','北京');

-- 第二个活动
insert into activity values
(null,'签到赚积分','<strong><span style="font-size:14px;">一、活动时间：2021年9月1-29日</span></strong> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:14px;">二、活动内容：</span> 
</p>
<p>
	<span style="font-size:14px;">登录“国际车展”小程序可参与【签到赚积分】活动。2021年9月29日（含）之前，用户连续签到7天即可获得200-2000元不等的购车补贴、电子票，所获积分可兑换车展二十周年限量礼品。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong><span style="font-size:14px;">三、签到福利：</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">用户首次登录小程序后将自动获得200-2000元（随机）现金购车补贴；</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第3天可获得1张车展门票；</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第4天可获得额外的100-500元（随机）购车补贴，可与首次金额叠加</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第6天可获得3张车展门票</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第7天可获得额外的100-500元（随机）购车补贴，可与前两次金额叠加</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">举例：用户A首次登录小程序后获得500元（随机）购车补贴，连续签到第4天获得200元（随机），连续签到第7天获得400元（随机），则用户A最终获得的购车补贴金额为500+200+400=1100元。</span></strong> 
</p>
<br />
<p>
	<span style="font-size:14px;">四、积分攻略：</span> 
</p>
<p>
	<span style="font-size:14px;">每天进入小程序的签到页面，点击“签到”可获得5个积分</span><span style="font-size:14px;">；</span> 
</p>
<p>
	<span style="font-size:14px;">每天分享小程序给1位好友，可额外获得5个积分</span><span style="font-size:14px;">；</span> 
</p>
<p>
	<span style="font-size:14px;">连续签到的第3、4、6、7天，除获得每日签到积分外，还可额外获得10个积分。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong><span style="font-size:14px;">五、积分兑换：</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">90积分可兑换车展二十年限量卡卡帆布包一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">80积分可兑换车展二十年限量卡卡T恤一件</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">50积分可兑换车展二十年限量卡卡3D手机座一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">40积分可兑换车展二十年纪念卡卡钥匙挂件一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">30积分可兑换车展二十年纪念徽章一枚。</span></strong> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:14px;">六、注意事项：</span> 
</p>
<p>
	<span style="font-size:14px;">活动期间，同一用户仅可参与1次签到活动；</span> 
</p>
<p>
	<span style="font-size:14px;">积分兑换中，同品类兑换不可叠加；</span> 
</p>
<p>
	<span style="font-size:14px;">如出现漏签，可使用积分进行补签，每补签1次需消耗10个积分；</span> 
</p>
<p>
	<span style="font-size:14px;">购车补贴需在车展现场购车后，提交相关购车证明方可发放（具体使用规则可进入【百万购车补贴】页面查看；</span> 
</p>
<p>
	<span style="font-size:14px;">所有实物礼品需在2021年10月5日16:00之前至现场总服务台处兑换，数量有限，先到先得；</span> 
</p>
<p>
	<span style="font-size:14px;">本活动最终解释权归郑州奥源展览有限公司所有。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df01cf12aa.jpg','郑州');
insert into activity values
(null,'签到赚积分','<strong><span style="font-size:14px;">一、活动时间：2021年9月1-29日</span></strong> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:14px;">二、活动内容：</span> 
</p>
<p>
	<span style="font-size:14px;">登录“国际车展”小程序可参与【签到赚积分】活动。2021年9月29日（含）之前，用户连续签到7天即可获得200-2000元不等的购车补贴、电子票，所获积分可兑换车展二十周年限量礼品。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong><span style="font-size:14px;">三、签到福利：</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">用户首次登录小程序后将自动获得200-2000元（随机）现金购车补贴；</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第3天可获得1张车展门票；</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第4天可获得额外的100-500元（随机）购车补贴，可与首次金额叠加</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第6天可获得3张车展门票</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第7天可获得额外的100-500元（随机）购车补贴，可与前两次金额叠加</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">举例：用户A首次登录小程序后获得500元（随机）购车补贴，连续签到第4天获得200元（随机），连续签到第7天获得400元（随机），则用户A最终获得的购车补贴金额为500+200+400=1100元。</span></strong> 
</p>
<br />
<p>
	<span style="font-size:14px;">四、积分攻略：</span> 
</p>
<p>
	<span style="font-size:14px;">每天进入小程序的签到页面，点击“签到”可获得5个积分</span><span style="font-size:14px;">；</span> 
</p>
<p>
	<span style="font-size:14px;">每天分享小程序给1位好友，可额外获得5个积分</span><span style="font-size:14px;">；</span> 
</p>
<p>
	<span style="font-size:14px;">连续签到的第3、4、6、7天，除获得每日签到积分外，还可额外获得10个积分。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong><span style="font-size:14px;">五、积分兑换：</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">90积分可兑换车展二十年限量卡卡帆布包一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">80积分可兑换车展二十年限量卡卡T恤一件</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">50积分可兑换车展二十年限量卡卡3D手机座一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">40积分可兑换车展二十年纪念卡卡钥匙挂件一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">30积分可兑换车展二十年纪念徽章一枚。</span></strong> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:14px;">六、注意事项：</span> 
</p>
<p>
	<span style="font-size:14px;">活动期间，同一用户仅可参与1次签到活动；</span> 
</p>
<p>
	<span style="font-size:14px;">积分兑换中，同品类兑换不可叠加；</span> 
</p>
<p>
	<span style="font-size:14px;">如出现漏签，可使用积分进行补签，每补签1次需消耗10个积分；</span> 
</p>
<p>
	<span style="font-size:14px;">购车补贴需在车展现场购车后，提交相关购车证明方可发放（具体使用规则可进入【百万购车补贴】页面查看；</span> 
</p>
<p>
	<span style="font-size:14px;">所有实物礼品需在2021年10月5日16:00之前至现场总服务台处兑换，数量有限，先到先得；</span> 
</p>
<p>
	<span style="font-size:14px;">本活动最终解释权归北京奥源展览有限公司所有。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df01cf12aa.jpg','北京');

-- 第三个活动
insert into activity values
(null,'百万购车补贴','<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;background-color:#FFE500;"><strong>领取购车补贴的方式很简单，只需进入国际车展小程序，成功登录后可直接获得200元~2000元随机金额的购车补贴。</strong></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;background-color:#FFE500;"><strong>活动流程：</strong></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">1、微信搜索 “国际车展”小程序，进入小程序后点击“百万购车补贴”，可获取200-2000元随机购车抵用券。此券可与【签到赚积分】活动所获金额叠加使用（不限车型，不限车价），点击小程序首页【签到有礼】，连续签到第四天，可获得额外的100~500元随机金额的购车补贴，连续签到第七天，可获得额外的100~500元随机金额的购车补贴。</span></span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<strong>举个例子：</strong><span style="font-size:14px;font-family:微软雅黑;">用户A首次登录小程序后获得500元（随机）购车补贴，连续签到第四天获得200元（随机）购车补贴，连续签到第七天获得400元（随机）购车补贴，则用户A最终获得的购车补贴金额为500元+200元+400元=1100元。用户A在现场购车，且提交的购车表单成功通过审核后，以上购车补贴子金额正式生效。</span> 
</p>
<p style="text-align:center;background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img src="/Public/Kindeditor/attached/image/20210903/20210903194029_59029.jpg" alt="" /><br />
</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">2、国际车展（2021年9月30日-10月5日）现场购车的观众，进入“国际车展”小程序，点击【百万购车补贴】按钮，填写购车表单信息，包括购车人身份证照片、购车合同、购车定金凭证（请确保上传图片的清晰度）等等，即可获得一个订单顺序码，每日顺序码在100名内（含第100名），并经工作人员在线审核通过后，购车抵用券则正式生效。数量有限，先到先得。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><strong><span style="background-color:#FFE500;">注意事项：</span></strong><span style="background-color:#FFE500;"></span><br />
</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">1、每个购车订单对应唯一购车人、手机号及身份证号，订单手机号需与购车抵用券绑定的帐号手机号一致，请务必确保填写信息的真实性。 </span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">2、展会主办方工作人员和参展商不得参与购车补贴活动，展商或个人出现任何伪造行为一经主办方发现，取消其今后参与此类活动的资格，并保留追究法律责任的权利。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">3、购车抵用券正式生效的观众需在2021年12月31日17:00前通过车展小程序提交购车发票，工作人员审核通过后，方可通知领取。接到通知的观众持所购车辆行驶证原件、购车发票原件、购车人身份证原件至展会组办方领取购车补贴，请确保所带原件与购车现场提交至小程序内的信息一致，现场再次审核无误后当场发放购车补贴。逾期未领取购车补贴视为自动放弃。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;">4、本活动秉持公平、公正、公开的原则，在法律许可范围内，郑州奥源展览有限公司对本活动拥有最终解释权。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612ccc8c7aaa7.jpg','郑州');

insert into activity values
(null,'百万购车补贴','<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;background-color:#FFE500;"><strong>领取购车补贴的方式很简单，只需进入国际车展小程序，成功登录后可直接获得200元~2000元随机金额的购车补贴。</strong></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;background-color:#FFE500;"><strong>活动流程：</strong></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">1、微信搜索 “国际车展”小程序，进入小程序后点击“百万购车补贴”，可获取200-2000元随机购车抵用券。此券可与【签到赚积分】活动所获金额叠加使用（不限车型，不限车价），点击小程序首页【签到有礼】，连续签到第四天，可获得额外的100~500元随机金额的购车补贴，连续签到第七天，可获得额外的100~500元随机金额的购车补贴。</span></span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<strong>举个例子：</strong><span style="font-size:14px;font-family:微软雅黑;">用户A首次登录小程序后获得500元（随机）购车补贴，连续签到第四天获得200元（随机）购车补贴，连续签到第七天获得400元（随机）购车补贴，则用户A最终获得的购车补贴金额为500元+200元+400元=1100元。用户A在现场购车，且提交的购车表单成功通过审核后，以上购车补贴子金额正式生效。</span> 
</p>
<p style="text-align:center;background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img src="/Public/Kindeditor/attached/image/20210903/20210903194029_59029.jpg" alt="" /><br />
</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">2、国际车展（2021年9月30日-10月5日）现场购车的观众，进入“国际车展”小程序，点击【百万购车补贴】按钮，填写购车表单信息，包括购车人身份证照片、购车合同、购车定金凭证（请确保上传图片的清晰度）等等，即可获得一个订单顺序码，每日顺序码在100名内（含第100名），并经工作人员在线审核通过后，购车抵用券则正式生效。数量有限，先到先得。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><strong><span style="background-color:#FFE500;">注意事项：</span></strong><span style="background-color:#FFE500;"></span><br />
</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">1、每个购车订单对应唯一购车人、手机号及身份证号，订单手机号需与购车抵用券绑定的帐号手机号一致，请务必确保填写信息的真实性。 </span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">2、展会主办方工作人员和参展商不得参与购车补贴活动，展商或个人出现任何伪造行为一经主办方发现，取消其今后参与此类活动的资格，并保留追究法律责任的权利。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">3、购车抵用券正式生效的观众需在2021年12月31日17:00前通过车展小程序提交购车发票，工作人员审核通过后，方可通知领取。接到通知的观众持所购车辆行驶证原件、购车发票原件、购车人身份证原件至展会组办方领取购车补贴，请确保所带原件与购车现场提交至小程序内的信息一致，现场再次审核无误后当场发放购车补贴。逾期未领取购车补贴视为自动放弃。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;">4、本活动秉持公平、公正、公开的原则，在法律许可范围内，北京奥源展览有限公司对本活动拥有最终解释权。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612ccc8c7aaa7.jpg','北京');

-- 第四个活动
insert into activity values
(null,'抖出你精彩','
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">如今，手机是人人必备的打卡利器，拍照、拍视频上传共享成了最流行的社交方式。2021（第二十届）郑州国际车展即将于十一黄金周期间举办，作为一年一度的汽车盛会，车展现场各式各样的展车、礼仪模特、好玩的活动，都是视频拍摄的最佳素材，一年一次，不容错过。2021郑州国际车展抖音短视频大赛分为以下两部分：</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>一、聚焦日常——拍汽车生活</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<br />
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>无门槛限制，全民参与；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">②</span>聚焦日常生活，拍摄与汽车有关的短视频，内容须为原创作品，体现汽车元素，时长控制60秒以内；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">③</span>发布作品时，须@郑州国际车展 并添加话题#十一郑州国际车展 ，方算参与成功，否则视为无效作品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">④</span>发布平台为抖音APP。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>评选方式：</strong>截至</span></span><span style="font-family:微软雅黑;font-size:14px;">2021年9月24日，抖音作品的点赞量达20个以上（含20个），即免费发放车展电子门票2张。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与时间：</strong>2021年9月3-24日</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>获奖公布与门票发放</strong>：2021年9月26日</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>二、车展现场——拍全场亮点</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong><br />
</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>无门槛限制，全民参与；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-size:14px;color:#333333;font-family:" background-color:#ffffff;"="">②</span>车展现场，围绕展台、展车、模特、活动等元素进行短视频拍摄，作品须体现车展现场元素，时长控制60秒以内；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">③</span>发布作品时，须@郑州国际车展 并添加话题#十一郑州国际车展 ，方算参与成功，否则视为无效作品。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">④</span>发布平台为抖音APP。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>评选方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>至截稿日（2021年10月3日），根据抖音作品的点赞量、评论量、转发量指标筛选获奖入围作品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-size:14px;color:#333333;font-family:" background-color:#ffffff;"="">②</span>车展主办方最终根据抖音作品的主题契合度、创意度等要求，确定最终获奖作品，届时</span><br />
<span style="font-size:14px;">将对获奖者颁发奖品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">③</span>参与抖音作品的各项数据须为自然流量，禁止第三方推流，一经发现，取消参赛资格。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>奖项设置：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">一等奖（1名）：1000元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">二等奖（2名）：500元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">三等奖（3名）：200元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与时间：</strong><span style="font-family:微软雅黑;font-size:14px;">2021年9月30日-10月3日</span><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>奖项发放：</strong>2021年10月5日10:00-11:00 总服务台</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>免责声明：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>作品须为原创，禁止使用他人作品参赛；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">②</span>短视频若发生侵犯他人著作权、肖像权、名誉权等行为及由此产生的一切法律纠纷由参赛者承担；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">③</span>奥源展览有限公司有权使用所有参赛作品，用于郑州国际车展的宣传和展示（非卖品）；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">④</span>如有疑问请致电025-86891580。</span><br />
</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df1c1e709a.jpg','郑州');
insert into activity values
(null,'抖出你精彩','
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">如今，手机是人人必备的打卡利器，拍照、拍视频上传共享成了最流行的社交方式。2021（第二十届）北京国际车展即将于十一黄金周期间举办，作为一年一度的汽车盛会，车展现场各式各样的展车、礼仪模特、好玩的活动，都是视频拍摄的最佳素材，一年一次，不容错过。2021北京国际车展抖音短视频大赛分为以下两部分：</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>一、聚焦日常——拍汽车生活</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<br />
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>无门槛限制，全民参与；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">②</span>聚焦日常生活，拍摄与汽车有关的短视频，内容须为原创作品，体现汽车元素，时长控制60秒以内；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">③</span>发布作品时，须@北京国际车展 并添加话题#十一北京国际车展 ，方算参与成功，否则视为无效作品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">④</span>发布平台为抖音APP。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>评选方式：</strong>截至</span></span><span style="font-family:微软雅黑;font-size:14px;">2021年9月24日，抖音作品的点赞量达20个以上（含20个），即免费发放车展电子门票2张。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与时间：</strong>2021年9月3-24日</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>获奖公布与门票发放</strong>：2021年9月26日</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>二、车展现场——拍全场亮点</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong><br />
</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>无门槛限制，全民参与；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-size:14px;color:#333333;font-family:" background-color:#ffffff;"="">②</span>车展现场，围绕展台、展车、模特、活动等元素进行短视频拍摄，作品须体现车展现场元素，时长控制60秒以内；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">③</span>发布作品时，须@北京国际车展 并添加话题#十一北京国际车展 ，方算参与成功，否则视为无效作品。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">④</span>发布平台为抖音APP。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>评选方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>至截稿日（2021年10月3日），根据抖音作品的点赞量、评论量、转发量指标筛选获奖入围作品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-size:14px;color:#333333;font-family:" background-color:#ffffff;"="">②</span>车展主办方最终根据抖音作品的主题契合度、创意度等要求，确定最终获奖作品，届时</span><br />
<span style="font-size:14px;">将对获奖者颁发奖品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">③</span>参与抖音作品的各项数据须为自然流量，禁止第三方推流，一经发现，取消参赛资格。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>奖项设置：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">一等奖（1名）：1000元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">二等奖（2名）：500元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">三等奖（3名）：200元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与时间：</strong><span style="font-family:微软雅黑;font-size:14px;">2021年9月30日-10月3日</span><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>奖项发放：</strong>2021年10月5日10:00-11:00 总服务台</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>免责声明：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>作品须为原创，禁止使用他人作品参赛；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">②</span>短视频若发生侵犯他人著作权、肖像权、名誉权等行为及由此产生的一切法律纠纷由参赛者承担；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">③</span>奥源展览有限公司有权使用所有参赛作品，用于南京国际车展的宣传和展示（非卖品）；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">④</span>如有疑问请致电025-86891580。</span><br />
</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df1c1e709a.jpg','北京');

-- 第五个活动
insert into activity values
(null,'车展On Line官方直播','<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">为方便观众可以多维度，多视角观看车展现场，2021（第二十届）郑州国际车展主办方将在官方抖音号上进行全天直播，并邀请到专业车评人，对当下热门新车、超豪车、新势力车进行零距离讲解，还将邀请车企高管进入直播间，打造“品牌高管送福利”环节，送出2021郑州国际车展专属购车政策/福利。<strong>9月30日9:30-16:30，抖音APP搜索进入“郑州国际车展”抖音号，即可观看车展直播。</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><br />
</span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><strong>Focus1：主播带你</strong><strong></strong><strong>看车展</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">2021郑州国际车展邀请专业车评人，现场讲解新车亮点，带观众从专业角度看车、赏车，买车这件事儿，一定要有信得过的 “领路人”，省去看车买车烦恼，相信专业人士的讲解，对您的买车计划有所帮助。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830184226_61644.jpg" alt="" /> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><strong>Focus2：品牌高管送福利</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">买车，就要多好省。2021郑州国际车展官方直播“品牌高管送福利”环节，组办方邀请到展商品牌高管来到直播间，为观看直播的观众提供专属购车福利（仅限本次车展），只要您在线参与互动，就能抢到超级划算的购车福利，现场购车即可核销使用，真正解决您的买车痛点——价格问题。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><br />
</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">视频看了不过瘾？没关系，<strong>除了官方视频直播，本届车展还将开通图片直播</strong>，把现场精彩搬上云端，精美图片实时更新，一键直达您的手机。<strong>点击小程序首页“现场直播”即可观看精彩的图片直播。</strong></span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df079d8ae4.jpg','郑州');
insert into activity values
(null,'车展On Line官方直播','<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">为方便观众可以多维度，多视角观看车展现场，2021（第二十届）北京国际车展主办方将在官方抖音号上进行全天直播，并邀请到专业车评人，对当下热门新车、超豪车、新势力车进行零距离讲解，还将邀请车企高管进入直播间，打造“品牌高管送福利”环节，送出2021北京国际车展专属购车政策/福利。<strong>9月30日9:30-16:30，抖音APP搜索进入“南京国际车展”抖音号，即可观看车展直播。</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><br />
</span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><strong>Focus1：主播带你</strong><strong></strong><strong>看车展</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">2021北京国际车展邀请专业车评人，现场讲解新车亮点，带观众从专业角度看车、赏车，买车这件事儿，一定要有信得过的 “领路人”，省去看车买车烦恼，相信专业人士的讲解，对您的买车计划有所帮助。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830184226_61644.jpg" alt="" /> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><strong>Focus2：品牌高管送福利</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">买车，就要多好省。2021北京国际车展官方直播“品牌高管送福利”环节，组办方邀请到展商品牌高管来到直播间，为观看直播的观众提供专属购车福利（仅限本次车展），只要您在线参与互动，就能抢到超级划算的购车福利，现场购车即可核销使用，真正解决您的买车痛点——价格问题。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><br />
</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">视频看了不过瘾？没关系，<strong>除了官方视频直播，本届车展还将开通图片直播</strong>，把现场精彩搬上云端，精美图片实时更新，一键直达您的手机。<strong>点击小程序首页“现场直播”即可观看精彩的图片直播。</strong></span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df079d8ae4.jpg','北京');

-- 第六个活动
insert into activity values
(null,'2021年格兰披治模拟赛车大奖赛','<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;">9月30日-10月5日，邀请您来车展现场参加一场专业级的赛车比赛，您会定时赴约吗？届时，专业级赛车模拟器将带您上赛道！</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;">作为移动互联网时代下的新生代体育运动，赛车模拟器已经被国家体育总局和中国汽车摩托车运动联合会确定为正式的体育比赛</span><span style="font-family:微软雅黑;font-size:14px;">项目，借着这股模拟赛车运动风潮，</span><span style="font-family:微软雅黑;font-size:14px;">2021</span><span style="font-family:微软雅黑;font-size:14px;">郑州国际车展主办方将格兰披治模拟赛车大奖赛正式引入郑州，</span><span style="font-family:微软雅黑;font-size:14px;">将带观众进入身临其境般的虚拟赛车世界。提到赛车，很多朋友联想到的会是代表速度与激情的音浪或者酷炫外观，但是提到赛事，</span><span style="font-family:微软雅黑;font-size:14px;">就算是资深车迷，可能也会有些陌生</span><span style="font-family:微软雅黑;font-size:14px;">。</span></span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830191832_65877.png" /> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;"><span style="font-size:10px;">（图片来源网络，不代表实际展品）</span><br />
</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;">如今，电竞和赛车都是倍受年轻人喜欢的运动，把这两者结合起来的赛车模拟器，是一种结合赛车设计和工程技术的电竞赛车游戏模拟器，模拟赛道每个细节和路面抓地力变化，<span style="font-family:微软雅黑;font-size:14px;">最强大之处在于其拟真性，赛道的每个细节，路面抓地力变化，赛道温度湿度，赛场风力，下雨后赛道的湿滑特性等都与真实环境下非常相似</span>，降低了赛车运动参与门槛，为拥有赛车梦但难以实现的年轻人，提供了一个圆梦的平台，使每一位爱车人士及电竞爱好者在电竞赛事中尽情享受速度快感，燃烧你的荷尔蒙。</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830191930_70881.png" /> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-size:10px;">（图片来源网络，不代表实际展品）</span><br />
</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;">本届车展的格兰披治模拟赛车大奖赛，全展期内对观众开放，将满足不同年龄段、不同水平赛车电竞爱好者的需求。有句话是这么说的，</span><span style="font-family:微软雅黑;font-size:14px;">模拟器玩得好的人，开车一定不</span><span style="font-family:微软雅黑;font-size:14px;">会</span><span style="font-family:微软雅黑;font-size:14px;">差，而开车开得好的人，却不一定能开好模拟器，这是个真理。</span><span style="font-family:微软雅黑;font-size:14px;">所以，广大车友和喜欢电竞的朋友，这个十一黄金周诚邀您与亲朋好友前来现场体验。</span></span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong>如何体验模拟赛车：微信搜索【</strong></span><span style="font-family:微软雅黑;font-size:14px;"><span style="background-color:#FFE500;"><strong>郑州国际车展】小程序，点击首页“格兰披治大奖赛”进入预约通道，选择你想预约的时间分段，提示预约</strong></span><span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong>成功后，在约定的时间到场，即可体验。每日预约名额有限，约满即止，单人有3次预约机会。</strong></span></span> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903193125_59964.jpg" alt="" /><br />
</strong></span></span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df0aa8b697.jpg','郑州');
insert into activity values
(null,'2021年格兰披治模拟赛车大奖赛','<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;">9月30日-10月5日，邀请您来车展现场参加一场专业级的赛车比赛，您会定时赴约吗？届时，专业级赛车模拟器将带您上赛道！</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;">作为移动互联网时代下的新生代体育运动，赛车模拟器已经被国家体育总局和中国汽车摩托车运动联合会确定为正式的体育比赛</span><span style="font-family:微软雅黑;font-size:14px;">项目，借着这股模拟赛车运动风潮，</span><span style="font-family:微软雅黑;font-size:14px;">2021</span><span style="font-family:微软雅黑;font-size:14px;">北京国际车展主办方将格兰披治模拟赛车大奖赛正式引入北京，</span><span style="font-family:微软雅黑;font-size:14px;">将带观众进入身临其境般的虚拟赛车世界。提到赛车，很多朋友联想到的会是代表速度与激情的音浪或者酷炫外观，但是提到赛事，</span><span style="font-family:微软雅黑;font-size:14px;">就算是资深车迷，可能也会有些陌生</span><span style="font-family:微软雅黑;font-size:14px;">。</span></span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830191832_65877.png" /> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;"><span style="font-size:10px;">（图片来源网络，不代表实际展品）</span><br />
</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;">如今，电竞和赛车都是倍受年轻人喜欢的运动，把这两者结合起来的赛车模拟器，是一种结合赛车设计和工程技术的电竞赛车游戏模拟器，模拟赛道每个细节和路面抓地力变化，<span style="font-family:微软雅黑;font-size:14px;">最强大之处在于其拟真性，赛道的每个细节，路面抓地力变化，赛道温度湿度，赛场风力，下雨后赛道的湿滑特性等都与真实环境下非常相似</span>，降低了赛车运动参与门槛，为拥有赛车梦但难以实现的年轻人，提供了一个圆梦的平台，使每一位爱车人士及电竞爱好者在电竞赛事中尽情享受速度快感，燃烧你的荷尔蒙。</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830191930_70881.png" /> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-size:10px;">（图片来源网络，不代表实际展品）</span><br />
</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;">本届车展的格兰披治模拟赛车大奖赛，全展期内对观众开放，将满足不同年龄段、不同水平赛车电竞爱好者的需求。有句话是这么说的，</span><span style="font-family:微软雅黑;font-size:14px;">模拟器玩得好的人，开车一定不</span><span style="font-family:微软雅黑;font-size:14px;">会</span><span style="font-family:微软雅黑;font-size:14px;">差，而开车开得好的人，却不一定能开好模拟器，这是个真理。</span><span style="font-family:微软雅黑;font-size:14px;">所以，广大车友和喜欢电竞的朋友，这个十一黄金周诚邀您与亲朋好友前来现场体验。</span></span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong>如何体验模拟赛车：微信搜索【</strong></span><span style="font-family:微软雅黑;font-size:14px;"><span style="background-color:#FFE500;"><strong>北京国际车展】小程序，点击首页“格兰披治大奖赛”进入预约通道，选择你想预约的时间分段，提示预约</strong></span><span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong>成功后，在约定的时间到场，即可体验。每日预约名额有限，约满即止，单人有3次预约机会。</strong></span></span> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903193125_59964.jpg" alt="" /><br />
</strong></span></span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df0aa8b697.jpg','北京');

-- 第七个活动
insert into activity values
(null,'追梦骑士-机车生活节','<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center">今年，郑州国际车展创新展出形式，首次开辟<span style="color:#E53333;">追梦骑士——首届郑州机车生活节！</span>联合<span
        style="color:#E53333;">郑州MOTO 7 机车文化园</span>，携手国内外知名摩托车品牌联袂展出。<br />
    并且今年车展现场还将举行“<strong>郑州骑士文明安全骑行承诺签名</strong>”活动，携手金陵摩托车主共创美好骑行环境，为打造更好的城市交通尽自己一份力。<br />
    <span style="font-size:14px;"></span>
</p>
<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center"><br />
</p>
<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center"><br />
</p>
<p style="text-align:center;">
    <span style="background-color:#FFFFFF;color:#E53333;font-size:14px;"><strong>/ 品牌云集 /</strong></span>
</p>
<p>
    <br />
</p>
热爱机车文化的车友们，可以在本届机车生活节上，近距离了解各大品牌机车，感受摩托车独有的酷炫魅力。还能够认识更多热爱生活、追逐风与自由的金陵骑士。
<p>
    <br />
</p>
<p style="text-align:center;">
    <img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903193602_93468.png" alt="" />
</p>
<p style="text-align:center;">
    <br />
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>品牌远不止如此</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>更多参展摩托车品牌</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>可在郑州国际车展小程序上查看哦</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span><br />
        </span></span>
</p>
</div>
</div>
<div class="main_right">
    <div class="right-vedio" style="width: 260px; height: 177px; overflow: hidden;">','http://www.njae.net/Public/Uploads/21-01/612df0c0eed2a.jpg','郑州');
insert into activity values
(null,'追梦骑士-机车生活节','<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center">今年，北京国际车展创新展出形式，首次开辟<span style="color:#E53333;">追梦骑士——首届北京机车生活节！</span>联合<span
        style="color:#E53333;">北京MOTO 7 机车文化园</span>，携手国内外知名摩托车品牌联袂展出。<br />
    并且今年车展现场还将举行“<strong>北京骑士文明安全骑行承诺签名</strong>”活动，携手金陵摩托车主共创美好骑行环境，为打造更好的城市交通尽自己一份力。<br />
    <span style="font-size:14px;"></span>
</p>
<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center"><br />
</p>
<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center"><br />
</p>
<p style="text-align:center;">
    <span style="background-color:#FFFFFF;color:#E53333;font-size:14px;"><strong>/ 品牌云集 /</strong></span>
</p>
<p>
    <br />
</p>
热爱机车文化的车友们，可以在本届机车生活节上，近距离了解各大品牌机车，感受摩托车独有的酷炫魅力。还能够认识更多热爱生活、追逐风与自由的金陵骑士。
<p>
    <br />
</p>
<p style="text-align:center;">
    <img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903193602_93468.png" alt="" />
</p>
<p style="text-align:center;">
    <br />
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>品牌远不止如此</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>更多参展摩托车品牌</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>可在北京国际车展小程序上查看哦</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span><br />
        </span></span>
</p>
</div>
</div>
<div class="main_right">
    <div class="right-vedio" style="width: 260px; height: 177px; overflow: hidden;">','http://www.njae.net/Public/Uploads/21-01/612df0c0eed2a.jpg','北京');

-- 第八个活动
insert into activity values
(null,'光影拍客3.0-万元悬赏最佳拍客','<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">报名时间：</span></strong><span style="font-size:14px;">即日起-截止到9月15日</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">报名人数：</span></strong><span style="font-size:14px;">不限</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><strong><span style="font-size:14px;">报名要求：（</span></strong><span style="font-size:14px;"><strong>满足任一条件即可报名</strong></span><strong><span style="font-size:14px;">）</span></strong></strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">历届郑州国际车展获奖者</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">国际/国家/省/市/区级摄影协会会员</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">参加过摄影赛事的获奖者</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">摄影从业证件、摄影记者证</span> 
</p>
<p style="text-align:left;">
	<span><br />
</span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">设备要求：</span></strong><span style="font-size:14px;">单反数码相机</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">作品要求：</span></strong><span style="font-size:14px;">取景地为2021（第二十届）郑州国际车展现场，参赛作品以展会火爆人气、活动表演、展台展车、现场观众、礼仪模特等为选题，突出本届车展闪亮之处；参赛作品可以在原始稿件基础上进行适当裁剪，禁止电脑技术处理照片（如ps等）。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">数量要求：</span></strong><strong><span style="font-size:14px;">每人提交数量不超过10张，提交作品请备注作品标题、文字说明、拍摄者姓名和联系方式，信息不完整者则视为报名不成功。</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">审核查询：</span></strong><span style="font-size:14px;">报名提交48小时后，进入车展小程序点击“我的”→“我的报名”，即可查看审核进度。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">门票发放：</span></strong><span style="font-size:14px;">审核通过后，每人将免费获赠电子门票4张，9月27日统一发放。点击“我的”→“我的门票”查看电子门票信息。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">现金酬稿：</span></strong><strong><span style="font-size:14px;">凡入选的优秀作品，将获得200元每张的酬稿。</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><br />
</strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">线下投稿地点：</span></strong><span style="font-size:14px;">请携带摄影作品读取设备，至现场总服务台</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">线上投稿方式：</span></strong><span style="font-size:14px;">发送作品至726415881.com</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">投稿时间：</span></strong><strong><span style="font-size:14px;">2021年9月30日-10月3日</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">作品评选：</span></strong><span style="font-size:14px;">邀请摄影界、媒体界人士参与评选。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">评选结果公布时间：</span></strong><strong><span style="font-size:14px;">2021年10月4日</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">酬稿领取时间及地点：</span></strong><strong><span style="font-size:14px;">2021年10月5日10:00-10:30 现场总服务台（逾期视为放弃领奖）</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">咨询电话：</span></strong><span style="font-size:14px;">025-86891580</span></span> 
</p>
<p style="text-align:left;">
	<span><br />
</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;"><strong>注意事项：</strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">1、参赛作品须为活动参与者的原创作品，不能包含任何侵犯版权、商标、道德权利、隐私/宣传或知识产权的内容，奥源展览有限公司不承担活动参与者由于作品侵权所引起的纠纷，一切与优秀作品有关的纠纷由活动参与者自行承担；</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">2、参赛作品若被评选为优秀作品，主办方有权使用优秀作品，在车展相关纸质印刷品、官方网站、官方自媒体等渠道做宣传使用，包括发布、展示以及调整、修改、创建衍生著作等用途；</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">3、如参赛作品违反上述规则，主办方有权取消其参赛资格，并不予告知参赛者。</span> 
</p>
','http://www.njae.net/Public/Uploads/21-01/612df0e08c1d5.jpg','郑州');
insert into activity values
(null,'光影拍客3.0-万元悬赏最佳拍客','<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">报名时间：</span></strong><span style="font-size:14px;">即日起-截止到9月15日</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">报名人数：</span></strong><span style="font-size:14px;">不限</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><strong><span style="font-size:14px;">报名要求：（</span></strong><span style="font-size:14px;"><strong>满足任一条件即可报名</strong></span><strong><span style="font-size:14px;">）</span></strong></strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">历届北京国际车展获奖者</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">国际/国家/省/市/区级摄影协会会员</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">参加过摄影赛事的获奖者</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">摄影从业证件、摄影记者证</span> 
</p>
<p style="text-align:left;">
	<span><br />
</span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">设备要求：</span></strong><span style="font-size:14px;">单反数码相机</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">作品要求：</span></strong><span style="font-size:14px;">取景地为2021（第二十届）北京国际车展现场，参赛作品以展会火爆人气、活动表演、展台展车、现场观众、礼仪模特等为选题，突出本届车展闪亮之处；参赛作品可以在原始稿件基础上进行适当裁剪，禁止电脑技术处理照片（如ps等）。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">数量要求：</span></strong><strong><span style="font-size:14px;">每人提交数量不超过10张，提交作品请备注作品标题、文字说明、拍摄者姓名和联系方式，信息不完整者则视为报名不成功。</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">审核查询：</span></strong><span style="font-size:14px;">报名提交48小时后，进入车展小程序点击“我的”→“我的报名”，即可查看审核进度。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">门票发放：</span></strong><span style="font-size:14px;">审核通过后，每人将免费获赠电子门票4张，9月27日统一发放。点击“我的”→“我的门票”查看电子门票信息。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">现金酬稿：</span></strong><strong><span style="font-size:14px;">凡入选的优秀作品，将获得200元每张的酬稿。</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><br />
</strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">线下投稿地点：</span></strong><span style="font-size:14px;">请携带摄影作品读取设备，至现场总服务台</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">线上投稿方式：</span></strong><span style="font-size:14px;">发送作品至726415881.com</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">投稿时间：</span></strong><strong><span style="font-size:14px;">2021年9月30日-10月3日</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">作品评选：</span></strong><span style="font-size:14px;">邀请摄影界、媒体界人士参与评选。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">评选结果公布时间：</span></strong><strong><span style="font-size:14px;">2021年10月4日</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">酬稿领取时间及地点：</span></strong><strong><span style="font-size:14px;">2021年10月5日10:00-10:30 现场总服务台（逾期视为放弃领奖）</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">咨询电话：</span></strong><span style="font-size:14px;">025-86891580</span></span> 
</p>
<p style="text-align:left;">
	<span><br />
</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;"><strong>注意事项：</strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">1、参赛作品须为活动参与者的原创作品，不能包含任何侵犯版权、商标、道德权利、隐私/宣传或知识产权的内容，奥源展览有限公司不承担活动参与者由于作品侵权所引起的纠纷，一切与优秀作品有关的纠纷由活动参与者自行承担；</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">2、参赛作品若被评选为优秀作品，主办方有权使用优秀作品，在车展相关纸质印刷品、官方网站、官方自媒体等渠道做宣传使用，包括发布、展示以及调整、修改、创建衍生著作等用途；</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">3、如参赛作品违反上述规则，主办方有权取消其参赛资格，并不予告知参赛者。</span> 
</p>
','http://www.njae.net/Public/Uploads/21-01/612df0e08c1d5.jpg','北京');

-- 第九个活动
insert into activity values
(null,'卡卡趣游记','<span style="line-height:2;font-size:14px;">郑州国际车展打造的IP卡卡家族又上线了，本届车展由萌萌的卡卡带领大家开心逛展打卡拿礼品。展会设有15个打卡点，解锁一个打卡点即可获得一枚印章，集齐4枚印章就可以兑换精美礼品，解锁的越多，礼品拿的越嗨！</span> 
</p>
<p style="text-align:center;">
	<span style="line-height:2;background-color:#FFE500;font-size:16px;"><strong>打卡站点一览如下</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆总服务台-玩一把小游戏</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">在总服务台领取参观指南后，你的打卡之旅就可以开始啦。可直接在服务台参与套圈小游戏，完成游戏后，志愿者会帮你盖章1次哦！如果你对套圈的把控力足够强，那你还可以直接套到许多小礼物，比如卡卡系列周边、健腹轮、冷感毛巾....高手们直接套得盆满钵满！</span> 
</p>
<p>
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903200433_94145.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆-观看赛车模拟器比赛</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">在现场观看一场模拟赛车比赛，进入身临其境般的虚拟赛车世界。拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903200906_84822.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆-观看迷你四驱车比赛/体验迷你四驱车</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">重温童年美好回忆，感受迷你四驱车的速度与激情。在迷你四驱车专区迷你四驱车/观看/报名参与迷你四驱车比赛，拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201004_63147.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-参观机车生活节专区</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">近距离了解品牌机车，感受摩托车独有的酷炫魅力，认识更多热爱生活、追逐风与自由的金陵骑士。拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201021_24425.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找捷豹路虎【XFL】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡捷豹路虎展台，为新现代豪华主义XFL拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201102_30991.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>6号馆-寻找上汽大众【新途观L】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡上汽大众品牌，为IQ颜值双在线的新途观L拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201139_73999.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找合创【Z03】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡合创展台，为电竞青年心选的Z03拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201201_83590.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>6号馆-寻找一汽-大众【ID.4 CROZZ】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡一汽-大众展台，为其首款纯电SUV——ID.4 CROZZ拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201219_60173.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找哈弗【H6】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡哈弗展台，为“高品质国民神车”H6拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201244_78199.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>7号馆-寻找小鹏【P7】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡小鹏展台，为“超长续航，智能轿跑”的小鹏P7拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201300_95622.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找东风本田【思域】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡东风本田展台，为运动美学标杆第十一代思域拍照，至总服台验证后，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201357_71947.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找R汽车【Marvel R】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">为5G智能电动SUV——Marvel R拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201431_59505.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找东风悦达起亚【第四代嘉华】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡东风悦达起亚展台，为硬朗大气的跨界SUV嘉华拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201453_93761.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找极狐展台【阿尔达S】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><span style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;background-color:#FFFFFF;">打卡极狐展台，为新一代豪华智能纯电轿车阿尔法S拍照，至总服务台验证，志愿者予以盖章1次。</span></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><span style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;background-color:#FFFFFF;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210908/20210908114622_84230.jpg" alt="" /><br />
</span></span> 
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	<strong>8号馆-寻找哪吒展台【U PRO】</strong>
</p>
<p style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;text-align:justify;background-color:#FFFFFF;">
	打卡哪吒展台，为新能源黑科技哪吒U PRO拍照，至总服务台验证，志愿者予以盖章1次。
</p>
<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210915/20210915162647_58796.jpg" alt="" /><br />
<p>
	<br />
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>玩法规则</strong></span> 
</p>
<p>
	<span style="font-size:14px;"><strong>初级奖励：搜集4枚印章，可获得卡卡徽章1枚。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之一：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择3个站点进行打卡可获得盖章，你选择的3个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p>
	<span style="font-size:14px;"><strong>中级奖励：搜集6枚印章，可获得卡卡周边1份。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之二：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择4个站点进行打卡可获得盖章，你选择的4个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p>
	<span style="font-size:14px;"><strong>高级奖励：搜集8枚印章，可获得卡卡盲盒1个。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之二：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择6个站点进行打卡可获得盖章，你选择的6个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<br />
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>礼品兑换</strong></span> 
</p>
<p>
	<span style="font-size:14px;">符合兑换要求的观众，请至【卡卡趣游记】活动区领取礼品。本次活动礼品为郑州国际车展二十周年定制纪念品，设计精美，欢迎大家现场体验！</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>注意事项</strong></span> 
</p>
<p>
	<span font-size:14px;background-color:#ffffff;"="" style="color: rgb(51, 51, 51); font-size: 14px;">①</span><span style="font-size:14px;">本次活动共有15个打卡站点，车友们无需全部打卡，也无需按顺序打卡，想要拿到最高奖励，只需8枚印章即可；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">②</span><span style="font-size:14px;">如果你是积极打卡小能手，将现场15个打卡点全部打卡完毕的话，还可额外获得1份卡卡周边（以现场发放为准）；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">③</span><span style="font-size:14px;">活动奖励每人只可兑换一次，一次一档，不可多选，不可重复选；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">④</span><span style="font-size:14px;">在法律允许的范围内，本活动最终解释权归奥源展览有限公司所有。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612ccdc1505f1.jpg','郑州');
insert into activity values
(null,'卡卡趣游记','<span style="line-height:2;font-size:14px;">郑州国际车展打造的IP卡卡家族又上线了，本届车展由萌萌的卡卡带领大家开心逛展打卡拿礼品。展会设有15个打卡点，解锁一个打卡点即可获得一枚印章，集齐4枚印章就可以兑换精美礼品，解锁的越多，礼品拿的越嗨！</span> 
</p>
<p style="text-align:center;">
	<span style="line-height:2;background-color:#FFE500;font-size:16px;"><strong>打卡站点一览如下</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆总服务台-玩一把小游戏</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">在总服务台领取参观指南后，你的打卡之旅就可以开始啦。可直接在服务台参与套圈小游戏，完成游戏后，志愿者会帮你盖章1次哦！如果你对套圈的把控力足够强，那你还可以直接套到许多小礼物，比如卡卡系列周边、健腹轮、冷感毛巾....高手们直接套得盆满钵满！</span> 
</p>
<p>
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903200433_94145.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆-观看赛车模拟器比赛</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">在现场观看一场模拟赛车比赛，进入身临其境般的虚拟赛车世界。拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903200906_84822.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆-观看迷你四驱车比赛/体验迷你四驱车</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">重温童年美好回忆，感受迷你四驱车的速度与激情。在迷你四驱车专区迷你四驱车/观看/报名参与迷你四驱车比赛，拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201004_63147.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-参观机车生活节专区</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">近距离了解品牌机车，感受摩托车独有的酷炫魅力，认识更多热爱生活、追逐风与自由的金陵骑士。拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201021_24425.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找捷豹路虎【XFL】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡捷豹路虎展台，为新现代豪华主义XFL拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201102_30991.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>6号馆-寻找上汽大众【新途观L】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡上汽大众品牌，为IQ颜值双在线的新途观L拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201139_73999.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找合创【Z03】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡合创展台，为电竞青年心选的Z03拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201201_83590.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>6号馆-寻找一汽-大众【ID.4 CROZZ】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡一汽-大众展台，为其首款纯电SUV——ID.4 CROZZ拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201219_60173.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找哈弗【H6】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡哈弗展台，为“高品质国民神车”H6拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201244_78199.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>7号馆-寻找小鹏【P7】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡小鹏展台，为“超长续航，智能轿跑”的小鹏P7拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201300_95622.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找东风本田【思域】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡东风本田展台，为运动美学标杆第十一代思域拍照，至总服台验证后，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201357_71947.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找R汽车【Marvel R】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">为5G智能电动SUV——Marvel R拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201431_59505.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找东风悦达起亚【第四代嘉华】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡东风悦达起亚展台，为硬朗大气的跨界SUV嘉华拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201453_93761.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找极狐展台【阿尔达S】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><span style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;background-color:#FFFFFF;">打卡极狐展台，为新一代豪华智能纯电轿车阿尔法S拍照，至总服务台验证，志愿者予以盖章1次。</span></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><span style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;background-color:#FFFFFF;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210908/20210908114622_84230.jpg" alt="" /><br />
</span></span> 
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	<strong>8号馆-寻找哪吒展台【U PRO】</strong>
</p>
<p style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;text-align:justify;background-color:#FFFFFF;">
	打卡哪吒展台，为新能源黑科技哪吒U PRO拍照，至总服务台验证，志愿者予以盖章1次。
</p>
<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210915/20210915162647_58796.jpg" alt="" /><br />
<p>
	<br />
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>玩法规则</strong></span> 
</p>
<p>
	<span style="font-size:14px;"><strong>初级奖励：搜集4枚印章，可获得卡卡徽章1枚。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之一：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择3个站点进行打卡可获得盖章，你选择的3个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p>
	<span style="font-size:14px;"><strong>中级奖励：搜集6枚印章，可获得卡卡周边1份。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之二：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择4个站点进行打卡可获得盖章，你选择的4个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p>
	<span style="font-size:14px;"><strong>高级奖励：搜集8枚印章，可获得卡卡盲盒1个。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之二：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择6个站点进行打卡可获得盖章，你选择的6个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<br />
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>礼品兑换</strong></span> 
</p>
<p>
	<span style="font-size:14px;">符合兑换要求的观众，请至【卡卡趣游记】活动区领取礼品。本次活动礼品为北京国际车展二十周年定制纪念品，设计精美，欢迎大家现场体验！</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>注意事项</strong></span> 
</p>
<p>
	<span font-size:14px;background-color:#ffffff;"="" style="color: rgb(51, 51, 51); font-size: 14px;">①</span><span style="font-size:14px;">本次活动共有15个打卡站点，车友们无需全部打卡，也无需按顺序打卡，想要拿到最高奖励，只需8枚印章即可；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">②</span><span style="font-size:14px;">如果你是积极打卡小能手，将现场15个打卡点全部打卡完毕的话，还可额外获得1份卡卡周边（以现场发放为准）；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">③</span><span style="font-size:14px;">活动奖励每人只可兑换一次，一次一档，不可多选，不可重复选；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">④</span><span style="font-size:14px;">在法律允许的范围内，本活动最终解释权归南京奥源展览有限公司所有。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612ccdc1505f1.jpg','北京');
-- 第十个活动
insert into activity values
(null,'迷你四驱车','<p style="color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">TA从诞生的那天起，就以<strong>仿真、新颖的外型、强大的动力，闪电般的速度</strong>，吸引成千上万的青少年。</span><span style="font-family:Optima-Regular, PingFangTC-light;">一部《四驱兄弟》动漫更是成为80后、90后的集体记忆。</span><span style="font-family:Optima-Regular, PingFangTC-light;">从简单的拼装，到技术性的改造；从普通的贴纸，到艺术性的喷漆；从慢速跑完一圈的基础要求，到飞速竞争第一的对抗；无一不令人着迷。</span> 
</p>
<p>
    <br />
</p>
<p style="background:white;text-indent:21pt;">
    <span style="font-size:16px;"><span style="line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830193533_35529.png" /></span></span></span> 
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p style="text-align:left;">
    <span style="color:#003399;font-size:14px;"><strong>/ 迷你四驱车专业赛事 /</strong></span> 
</p>
<p style="text-align:left;">
    <span style="color:#003399;font-size:14px;"><strong><br />
</strong></span> 
</p>
<div style="text-align:center;">
    <p style="text-align:left;color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">在今年十一车展的现场，郑州国际车展主办方联合</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">郑州LPT迷你四驱车俱乐部</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">，在现场为广大车友打造迷你四驱车专区，如果你也是一名迷你四驱车文化爱好者的话，千万不要错过哟。</span> 
        </p>
<p style="text-align:left;color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">值得期待的是：</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">2021發利隆杯田宫迷你四驱车世界挑战赛中国区选拔赛-郑州站</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">落地车展现场，最终的冠军选手还将代表中国参加今年在日本举行的世界杯。如此重磅赛事加持，必将掀起郑州车友们的又一波热情。</span> 
    </p>
    <div style="text-align:left;">
        <br />
    </div>
</div>
<p>
    <br />
</p>
<p style="background:white;text-align:center;text-indent:21pt;">
    <span style="font-size:16px;"><span style="line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210908/20210908113624_50592.jpg" alt="" /><br />
</span></span></span> 
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;font-size:14px;">/ 迷你四驱车体验区 /</span></strong> 
</p>
<p>
    <br />
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;">除了看点十足紧张刺激的专业赛事，迷你四驱车专区还会开设</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">观众体验区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;">观众可使用现场工作人员提供的免费迷你四驱车车辆跑赛道，还可选择在现场购买迷你四驱车，由专业人员进行指导组装、答疑解惑。</span> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">迷你四驱车体验通道</span><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">娱乐体验区/专业比赛区。</span>
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210915/20210915163228_60262.png" alt="" /><br />
</span>
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;background-color:#0052FF;font-size:14px;color:#FFFFFF;"> 体验区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">对迷你四驱车感兴趣的朋友们可直接到现场活动专区参与体验，现场提供轨道试车，无需报名费。</span><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">另，现场有迷你四驱车售卖区，购买后有安装问题可请教现场工作人员；</span> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><br />
</span> 
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;background-color:#0052FF;color:#FFFFFF;"> 专业区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">专业选手可添加客服微信</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;color:#D92142;">njaykk</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">报名参赛，报名费用100元/4次。（加好友时请备注信息：迷你四驱）</span> 
</p','http://www.njae.net/Public/Uploads/21-01/612df0f72c919.jpg','郑州');
insert into activity values
(null,'迷你四驱车','<p style="color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">TA从诞生的那天起，就以<strong>仿真、新颖的外型、强大的动力，闪电般的速度</strong>，吸引成千上万的青少年。</span><span style="font-family:Optima-Regular, PingFangTC-light;">一部《四驱兄弟》动漫更是成为80后、90后的集体记忆。</span><span style="font-family:Optima-Regular, PingFangTC-light;">从简单的拼装，到技术性的改造；从普通的贴纸，到艺术性的喷漆；从慢速跑完一圈的基础要求，到飞速竞争第一的对抗；无一不令人着迷。</span> 
</p>
<p>
    <br />
</p>
<p style="background:white;text-indent:21pt;">
    <span style="font-size:16px;"><span style="line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830193533_35529.png" /></span></span></span> 
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p style="text-align:left;">
    <span style="color:#003399;font-size:14px;"><strong>/ 迷你四驱车专业赛事 /</strong></span> 
</p>
<p style="text-align:left;">
    <span style="color:#003399;font-size:14px;"><strong><br />
</strong></span> 
</p>
<div style="text-align:center;">
    <p style="text-align:left;color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">在今年十一车展的现场，北京国际车展主办方联合</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">北京LPT迷你四驱车俱乐部</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">，在现场为广大车友打造迷你四驱车专区，如果你也是一名迷你四驱车文化爱好者的话，千万不要错过哟。</span> 
        </p>
<p style="text-align:left;color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">值得期待的是：</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">2021發利隆杯田宫迷你四驱车世界挑战赛中国区选拔赛-北京站</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">落地车展现场，最终的冠军选手还将代表中国参加今年在日本举行的世界杯。如此重磅赛事加持，必将掀起北京车友们的又一波热情。</span> 
    </p>
    <div style="text-align:left;">
        <br />
    </div>
</div>
<p>
    <br />
</p>
<p style="background:white;text-align:center;text-indent:21pt;">
    <span style="font-size:16px;"><span style="line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210908/20210908113624_50592.jpg" alt="" /><br />
</span></span></span> 
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;font-size:14px;">/ 迷你四驱车体验区 /</span></strong> 
</p>
<p>
    <br />
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;">除了看点十足紧张刺激的专业赛事，迷你四驱车专区还会开设</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">观众体验区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;">观众可使用现场工作人员提供的免费迷你四驱车车辆跑赛道，还可选择在现场购买迷你四驱车，由专业人员进行指导组装、答疑解惑。</span> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">迷你四驱车体验通道</span><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">娱乐体验区/专业比赛区。</span>
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210915/20210915163228_60262.png" alt="" /><br />
</span>
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;background-color:#0052FF;font-size:14px;color:#FFFFFF;"> 体验区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">对迷你四驱车感兴趣的朋友们可直接到现场活动专区参与体验，现场提供轨道试车，无需报名费。</span><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">另，现场有迷你四驱车售卖区，购买后有安装问题可请教现场工作人员；</span> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><br />
</span> 
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;background-color:#0052FF;color:#FFFFFF;"> 专业区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">专业选手可添加客服微信</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;color:#D92142;">njaykk</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">报名参赛，报名费用100元/4次。（加好友时请备注信息：迷你四驱）</span> 
</p','http://www.njae.net/Public/Uploads/21-01/612df0f72c919.jpg','北京');

-- 销售点数据
-- 1 奔驰
INSERT into shops values(null,2,'郑州利之星汽车有限公司','管城回族区奔驰广场东','03716030188');
INSERT into shops VALUES(null,2,'郑州之星汽车销售服务有限公司','金水区郑花路88号万通广场','03718818666');
INSERT into shops VALUES(null,2,'郑州汇升奔驰建设路店','河南省郑州市中原区郑上路30','03718625666');
INSERT into shops VALUES(null,2,'郑州梅赛德斯奔驰','金水区花园北路88号','037155186666');
INSERT into shops VALUES(null,2,'郑州鹏龙万通汽车销售有限公司(中原店)','郑州市中原区中原西路189号','03715595555');
INSERT into shops VALUES(null,2,'北京奔驰汽车有限公司','北京市大兴区博兴路8号','01067824888');
INSERT into shops VALUES(null,2,'梅赛德斯-奔驰汽车金融有限公司','北京市朝阳区望京街8号利星行广场C座C601_C7-9','01084178887');
INSERT into shops VALUES(null,2,'利星行之星(北京)汽车有限公司','利星行之星(北京)汽车有限公司','010-56399168');
INSERT into shops VALUES(null,2,'北京鹏龙星徽汽车销售服务有限公司','北京市朝阳区十里河桥内环方向向南500米白墙子村271号(近分钟寺桥)','01081661600');

-- 2 宾利
INSERT into shops VALUES(null,3,'宾利郑州4s店','金水区中州大道与宏康路交叉口西南90米','037188921111');
INSERT into shops VALUES(null,3,'宾利利星行之星4s店','河南省郑州市中原区郑上路30','037188921111');
INSERT into shops VALUES(null,3,'宾利汇升建设路店','金水区中州大道与宏康路交叉口西南90米','037188921111');
INSERT into shops VALUES(null,3,'宾利北q京三里屯售后服务中心','北京市顺义区顺义马坡聚源工业区龙跃街9号院','01067877451');
INSERT into shops VALUES(null,3,'宾利(北京五棵松店)','北京市海淀区西四环复兴路69号华熙live五棵松6幢1层101-200号','010-68898616');
INSERT into shops VALUES(null,3,'宾利北京(三里屯店)','北京市朝阳区新东路幸福二村40号1层','4000110970');

-- 3 特斯拉
INSERT into shops VALUES(null,1,'特斯拉汽车销售服务郑州有限公司(金水分公司)','河南省郑州市金水区花园路西1号正弘城L1-58号1层L58','037188921111');
INSERT into shops VALUES(null,1,'特斯拉(郑州福塔中心)','河南省郑州市管城回族区经北六路80号','4009100707');
INSERT into shops VALUES(null,1,'特斯拉体验中心(郑州熙地港体验店)','金水区农业东路15号熙地港购物中心1楼','037160303843');
INSERT into shops VALUES(null,1,'TESLA(北京华贸购物中心)','北京市朝阳区建国路79号华贸购物中心F1','01059057370');
INSERT into shops VALUES(null,1,'TESLA(北京颐堤港)','北京市朝阳区酒仙桥路18号(将台路口)颐堤港L1-L177','01059052500');
INSERT into shops VALUES(null,1,'TESLA(北京侨福芳草地购物中心)','北京市朝阳区东大桥路9号侨福芳草地购物中心LG2','01056692669');
-- 4 路虎
INSERT into shops VALUES(null,4,'郑州恒信路伟汽车销售服务有限公司','管城回族区十八里河街道文治路与鼎尚街交汇处西南角','03716373177');
INSERT into shops VALUES(null,4,'保时捷奥迪奔驰路虎专修(郑州轩奥商鼎店)','保时捷奥迪奔驰路虎专修(郑州轩奥商鼎店)','037153303000');
INSERT into shops VALUES(null,4,'郑州荣昇汽车销售服务有限公司','新郑市祥云路1号','037160200856');
INSERT into shops VALUES(null,4,'北京运通兴捷汽车销售服务有限公司','北京市大兴区金时大街7号院9号楼','01080254111');
INSERT into shops VALUES(null,4,'北京燕英捷燕顺捷汽车销售服务有限公司','北京市朝阳区金盏乡东苇路北京金港汽车公园C区9号','01064306188');
INSERT into shops VALUES(null,4,'北京运通嘉捷汽车销售服务有限公司','北京市顺义区赵全营镇昌金路赵全营段231号院8幢','01060447000');
INSERT into shops VALUES(null,4,'北京中进捷旺汽车销售服务有限公司(西北旺店)','北京市海淀区西北旺百旺绿谷汽车园F1地块6号','01062866686');
-- 5 奥迪
INSERT into shops VALUES(null,5,'郑州丰之元汽车销售服务有限公司','丰之元汽车销售服务有限公司','037185967777');
INSERT into shops VALUES(null,5,'郑州奥迪一汽大众','金水区中州大道民航路966号','037165949618');
INSERT into shops VALUES(null,5,'郑州中升汇迪汽车销售服务有限公司','惠济区花园路与开元路交汇处西300米路南(河南汽贸中心院内)','037166655555');
INSERT into shops VALUES(null,5,'北京一汽大众奥迪4S店','北京市通州区梨园南街99号','01081593336');
INSERT into shops VALUES(null,5,'北京国服信奥兴奥迪4S店','北京市石景山区古城街道古城大街北京国际汽车贸易园区F区9号','01068867373');
INSERT into shops VALUES(null,5,'奥迪(北京运动车体验中心)(北京运动车体验中心)','北京市朝阳区东苇路奥迪金港汽车公园F区18号','01084328898');
INSERT into shops VALUES(null,5,'北京奥之杰奥迪服务有限公司','北京市朝阳区望京地区花家地南里甲2号','01064792999');

-- 6 阿斯顿马丁
INSERT into shops VALUES(null,6,'阿斯顿·马丁(郑州)','河南省郑州市管城回族区经北六路80号','037162070007');
INSERT into shops VALUES(null,6,'郑州丰之元汽车销售服务有限公司','丰之元汽车销售服务有限公司','01064792999');
INSERT into shops VALUES(null,6,'郑州荣昇汽车销售服务有限公司','新郑市祥云路1号','037166655555');
INSERT into shops VALUES(null,6,'阿斯顿马丁(北京南店)','北京市大兴区西红门镇金时大街7号院5号楼北京运通(毗邻南中轴路五连环环岛)','01067876007');
INSERT into shops VALUES(null,6,'阿斯顿马丁(北京金宝街亚洲店)','北京市东城区金宝街99号北京丽晶酒店1层106-109号','01067873007');
INSERT into shops VALUES(null,6,'阿斯顿·马丁(北京)','北京市朝阳区东苇路(苇沟出口)金港汽车公园I区6号','01084333007');

-- 7 保时捷
INSERT into shops VALUES(null,14,'保时捷(郑州华润万象城店)','保时捷(华润万象城店)','037162070007');
INSERT into shops VALUES(null,14,'PORSCHE(郑州经三路店)','保时捷(华润万象城店)','037165219911');
INSERT into shops VALUES(null,14,'郑州金水保时捷(金水区服务中心)','郑州金水保时捷(金水区服务中心)','037165219911');
INSERT into shops VALUES(null,14,'保时捷(北京金港店)','北京市朝阳区金盏乡东苇路北金港大道1号金港汽车公园 C区8号甲1','01064309911');
INSERT into shops VALUES(null,14,'保时捷(北京百得利)','北京市海淀区西四环北路143号海淀保时捷中心','010-58739956');
INSERT into shops VALUES(null,14,'北京亦庄保时捷中心','北京市大兴区经济技术开发区东环北路甲1号','010-59659911');
INSERT into shops VALUES(null,14,'保时捷(长安店)','保时捷(长安店)','01065211911');

-- 8 雷克萨斯
INSERT into shops VALUES(null,16,'郑州富达','惠济区花园路与连霍高速交口向北1公里路西河南省汽贸中心南门','037155550066');
INSERT into shops VALUES(null,16,'郑州远达雷克萨斯汽车销售服务有限公司','金水区商都路与十里铺街交叉口东南角','037155550066');
INSERT into shops VALUES(null,16,'郑州中升雷克萨斯汽车销售服务有限公司','中原区中原西路兰州路交叉口大中原汽车城D区16号东侧','037156595555');
INSERT into shops VALUES(null,16,'雷克萨斯(北京)','北京市朝阳区平房乡石各庄路89号','010-65479191');
INSERT into shops VALUES(null,16,'北京博瑞翔腾雷克萨斯汽车销售服务有限公司','北京市石景山区石景山莲石东路1号(莲玉桥西北侧)','01068659993');
INSERT into shops VALUES(null,16,'北京雷克萨斯销售服务中心','北京市丰台区南四环中路161号','01087582119');
INSERT into shops VALUES(null,16,'北京英华雷克萨斯4s店','北京市朝阳区王四营乡马房寺路332号','01087399999');
-- 9 劳斯莱斯'
INSERT into shops VALUES(null,8,'劳斯莱斯汽车(郑州店)','金水区中州大道与龙门路(原宏康路)交汇处西南角','037186630000');
INSERT into shops VALUES(null,8,'劳斯莱斯汽车(北京三里屯店)','北京市朝阳区三里屯新东路首开幸福广场40号首层','4000120970');
INSERT into shops VALUES(null,8,'劳斯莱斯汽车服务中心(北京店)','北京市大兴区开发区宏达北路16号中航技北京工业园3号楼1层','01067888797');
INSERT into shops VALUES(null,8,'劳斯莱斯汽车(北京金宝街店)','北京市东城区金宝街92号一层14,15,16号','01065641065');
-- 10 雪佛兰
INSERT into shops VALUES(null,7,'郑州众通中原汽车服务有限公司','金水区北环路中段江山汽车广场1号展厅','037163790999');
INSERT into shops VALUES(null,7,'雪佛兰(郑州市凯林4S店)','惠济区花园路与开元路交叉口河南汽贸中心内','037165636333');
INSERT into shops VALUES(null,7,'雪佛兰4S店(郑州威佳店)','中原区郑州市高新区西四环与梧桐街交叉口向南50米路西','037163790999');
INSERT into shops VALUES(null,7,'河南锦荣雪佛兰4S店(郑州锦荣店)','中牟县郑东新区金水东路与绕城高速口中央大道庞大汽车园区','037155180088');

INSERT into shops VALUES(null,7,'雪佛兰(北京达世行同驰4s店姚家园店)','北京市朝阳区东方基业汽车城中区9号','18600933497');
INSERT into shops VALUES(null,7,'北京合力景通汽车销售服务有限公司','北京市石景山区古城大街(特钢公司厂内)北京国际汽车贸易服务园区F区13号','01068809772');
INSERT into shops VALUES(null,7,'北京合通雪佛兰4S店(亦庄店)','北京市大兴区经济技术开发区万源街18号1幢1-2层','01052163166');
INSERT into shops VALUES(null,7,'北京前搏阳光汽车贸易有限公司','北京市顺义区后沙峪地区京密路后沙峪段3号','01080485611');
-- 11 宝马
INSERT into shops VALUES(null,15,'郑州郑德宝汽车销售服务有限公司','金水区中州大道与连霍高速交汇处向南720米路西','037165638888');
INSERT into shops VALUES(null,15,'郑州奔驰宝马奥迪专修长通店','管城回族区西刘街中国石油郑州第二加油站(西刘街)西侧','17013695678');
INSERT into shops VALUES(null,15,'燕宝汽车服务(宏达北路店)','北京市大兴区宏达北路26号(近荣京东街)','037165638888');

INSERT into shops VALUES(null,15,'BMW(北京运通嘉宝)','北京市顺义区赵全营镇牛板路板桥段43号(西刘街)西侧','01080485611');
INSERT into shops VALUES(null,15,'北京骏宝行宝马4S店(八角店)','北京市石景山区时代花园南路30号','01068866777');
INSERT into shops VALUES(null,15,'北京宝泽行宝马4S店(丰台店)','北京市丰台区丰台街道西三环南路59号(西刘街)西侧','01058061535');
-- 12 jeep
INSERT into shops VALUES(null,9,'郑州普鸿Jeep4S店','管城回族区经北六路大雅方金酒店(郑州第三大街店)西侧约220米','19137914567');
INSERT into shops VALUES(null,9,'郑州众通中原汽车服务有限公司','金水区北环路中段江山汽车广场1号展厅','037165636333');
INSERT into shops VALUES(null,9,'河南锦荣jeep4S店(郑州锦荣店)','中牟县郑东新区金水东路与绕城高速口中央大道庞大汽车园区','037155180088');
INSERT into shops VALUES(null,9,'北京中进百旺汽车销售服务有限公司','北京市海淀区西北旺镇百旺绿谷汽车园','01082403616');
INSERT into shops VALUES(null,9,'Jeep(来广营西路店)','北京市朝阳区来广营西路55号','01084911116');
INSERT into shops VALUES(null,9,'北京安源·Jeep品牌双五星旗舰店','北京市昌平区北七家镇东三旗村北亚运村汽车市场内3-11','01061763866');

#表2,表6数据
#郑州的
insert into scene values
(null,'2021秋季第34届郑州大河国际车展','https://image.chezhanri.com/2021/0909/f3c6ea1329bfd009289d6042f22c3b6b.jpg!show_thumb','2021年10月02日','2021年10月06日','郑州国际会展中心','30','1');
#对应外键————插入活动id

insert into scene values
(null,'2021第三届中国（郑州）国际房车旅游产业链大会','https://image.chezhanri.com/2021/0917/feae641a7092cc3945e8b77a6a5d76c4.jpg!show_thumb','2021年10月21日','2021年10月24日','河南省体育中心','50','2');

insert into scene values
(null,'2021郑州第35届惠民团车节暨第二届','https://image.chezhanri.com/2021/1012/7c0240ccdef23aca1f451f0d755b6eb2.jpg!show_thumb','2021年10月23日','2021年11月1日','郑州中原福塔','20','3');

insert into scene values
(null,'2021第十四届郑州国际汽车展览会暨新能源·智能网联汽车展览会|房车露营展','https://image.chezhanri.com/assets/img/nopic-16x9.jpg!show_thumb','2021年11月04日','2021年11月09日','郑州国际会展中心','30','4');

insert into scene values
(null,'2021中国·郑州年终厂价直销团购车展','https://image.chezhanri.com/2021/1207/4a76e5e3be961fdfbad4aa66f9f6ed8a.jpg!show_thumb','2021年12月21日','2021年12月26日','郑州国际会展中心','50','5');


#北京的
insert into scene values
(null,'2021第22届中国（北京）国际房车露营展览会','https://image.chezhanri.com/2021/0926/af0518fa11bb3fcdea12392113c77647.jpg!show_thumb','2021年10月14日','2021年10月19日','北京房车世界','80','6');

insert into scene values
(null,'2021北京酷车国际文化节暨房车购车周','https://image.chezhanri.com/2021/1011/c4424cb6965d571782cce3e28fed8ffb.jpg!show_thumb','2021年10月15日','2021年10月20日','北京酷车小镇房车文化街','50','7');

insert into scene values
(null,'2021第三十五届北京惠民团车节','https://image.chezhanri.com/2021/1012/3b0f99eda656c29efff684013e2b615c.jpg!show_thumb','2021年10月16日','2021年10月24日','北京国家会议中心','30','7');

insert into scene values
(null,'Motor China 2022北京国际摩托车','https://image.chezhanri.com/2021/1026/949684b12cdd8c872b39b20cbf0a57e1.jpg!show_thumb','2022年05月20日','2021年05月23日','中国国际展览中心（新馆)','50','7');

insert into scene values
(null,'2022（第十七届）北京国际汽车展览','https://image.chezhanri.com/assets/img/nopic-16x9.jpg!show_thumb','2022年04月21日','2021年04月30日','北京中国国际展览中心新馆','70','7');

-- #插入活动表
-- 第一个活动
insert into activity values
(null,'逛车展赢汽车','<span style="font-family:Optima-Regular, PingFangTC-light;">今年是郑州国际车展连续举办的第二十年，为了回馈广大车友观众对车展的支持，车展主办方联合奇瑞汽车送出年轻派新选择——新款瑞虎7 PLUS（一年使用权），只要来逛展，那个把瑞虎7 PLUS开回家的人，可能就是你！</span><span style="font-family:Optima-Regular, PingFangTC-light;"><br />
</span><span style="font-family:Optima-Regular, PingFangTC-light;">奇瑞瑞虎7家族全新车型</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#407600;">瑞虎7 PLUS</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">，使用全新前脸设计，更显年轻、运动、新潮。整体精致大气，有望成为10万级SUV爆款车型。</span></span></span></span> 
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210906/20210906134925_50557.jpg" alt="" /><br />
</span></span></span> 
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"><strong></strong></span></span></span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong>/ 参与方式 /</strong></span> 
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;"><strong> </strong></span><span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong>参与时间</strong></span><span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong>：</strong></span><span style="font-size:14px;">9月30日9:00~10月5日15:00</span>
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong> 参与地点</strong></span><span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong>：</strong></span><span style="font-size:14px;">郑州新世界车展现场</span>
</p>
<p>
	<span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong> 参与条件：</strong></span> 
</p>
<p>
	<span style="font-size:14px;">展期内刷本人手机号名</span><span style="color:#FFFFFF;"></span><span style="font-size:14px;">下的电子门票入场，点击小程序首页的“逛展赢汽车”活动页面，即自动进入抽奖池。</span>
</p>
<p>
	<br />
</p>
<p>
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210906/20210906135348_59738.png" alt="" /> 
</p>
<p>
	<br />
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"></span></span></span> 
</p>
<p style="text-align:center;">
	<span style="font-family:Optima-Regular, PingFangTC-light;"><strong><span style="color:#407600;"><span style="font-size:16px;"></span><span style="font-size:16px;">/ 注意事项 /</span></span></strong></span> 
</p>
<p style="text-align:center;">
	<span style="font-family:Optima-Regular, PingFangTC-light;"><strong><span style="color:#407600;"><span style="font-size:16px;"><br />
</span></span></strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">1、电子门票绑定的手机号是参与抽奖的唯一凭证；</span> 
</p>
<p>
	<span style="font-size:14px;">2、抽奖号为每个手机号名下电子票首次入场后生成的顺序号，凭电子票入场后，抽奖号被列入抽奖号池；</span>
</p>
<p>
	<span style="font-size:14px;">3、每个手机号只能参与一次抽奖；</span>
</p>
<p>
	<span style="font-size:14px;">4、实体票不参与抽奖，但可以凭实体票至总服务台找到工作人员，激活对应的电子票，即可参与抽奖。</span>
</p>
<p>
	<br />
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong> 开奖时间：</strong></span><span style="font-size:14px;">2021年10月5日15：00</span> 
</p>
<p>
	<span><br />
</span> 
</p>
<p>
	<span><br />
</span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong>/ 如何领奖 /</strong></span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong><br />
</strong></span> 
</p>
<span style="line-height:2;font-size:14px;">1、中奖观众请于10月5日17:00前至现场服务台凭有效身份证明办理领取手续，如规定时间内无法到达现场，需与主办方联系说明（025-66048880），办理手续时间截止日期为10月10日，逾期未领视为自动放弃获奖资格；</span><br />
<span style="line-height:2;font-size:14px;">2、获得奖品的观众须配合缴纳个人偶然所得税；</span><br />
<span style="line-height:2;font-size:14px;">3、奖品只能以实物发放，不可折现；广告页面所示奖品仅为示意图，最终以实物为准；</span><br />
<span style="line-height:2;font-size:14px;">4、本活动秉持公平、公正、公开的原则，在法律允许范围内，本次活动的最终解释权归郑州奥傲展览有限公司所有。</span><br />','http://www.njae.net/Public/Uploads/21-01/612ccbcdcca2a.jpg','郑州');

insert into activity values
(null,'逛车展赢汽车','<span style="font-family:Optima-Regular, PingFangTC-light;">今年是北京国际车展连续举办的第二十年，为了回馈广大车友观众对车展的支持，车展主办方联合奇瑞汽车送出年轻派新选择——新款瑞虎7 PLUS（一年使用权），只要来逛展，那个把瑞虎7 PLUS开回家的人，可能就是你！</span><span style="font-family:Optima-Regular, PingFangTC-light;"><br />
</span><span style="font-family:Optima-Regular, PingFangTC-light;">奇瑞瑞虎7家族全新车型</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#407600;">瑞虎7 PLUS</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">，使用全新前脸设计，更显年轻、运动、新潮。整体精致大气，有望成为10万级SUV爆款车型。</span></span></span></span> 
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210906/20210906134925_50557.jpg" alt="" /><br />
</span></span></span> 
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"><strong></strong></span></span></span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong>/ 参与方式 /</strong></span> 
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;"><strong> </strong></span><span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong>参与时间</strong></span><span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong>：</strong></span><span style="font-size:14px;">9月30日9:00~10月5日15:00</span>
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong> 参与地点</strong></span><span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong>：</strong></span><span style="font-size:14px;">郑州新世界车展现场</span>
</p>
<p>
	<span style="background-color:#99BB00;color:#FFFFFF;font-size:14px;"><strong> 参与条件：</strong></span> 
</p>
<p>
	<span style="font-size:14px;">展期内刷本人手机号名</span><span style="color:#FFFFFF;"></span><span style="font-size:14px;">下的电子门票入场，点击小程序首页的“逛展赢汽车”活动页面，即自动进入抽奖池。</span>
</p>
<p>
	<br />
</p>
<p>
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210906/20210906135348_59738.png" alt="" /> 
</p>
<p>
	<br />
</p>
<p style="text-indent:22.6pt;background:white;">
	<span style="font-size:16px;line-height:2;font-family:微软雅黑;"><span style="line-height:2.5;"><span style="font-size:14px;"></span></span></span> 
</p>
<p style="text-align:center;">
	<span style="font-family:Optima-Regular, PingFangTC-light;"><strong><span style="color:#407600;"><span style="font-size:16px;"></span><span style="font-size:16px;">/ 注意事项 /</span></span></strong></span> 
</p>
<p style="text-align:center;">
	<span style="font-family:Optima-Regular, PingFangTC-light;"><strong><span style="color:#407600;"><span style="font-size:16px;"><br />
</span></span></strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">1、电子门票绑定的手机号是参与抽奖的唯一凭证；</span> 
</p>
<p>
	<span style="font-size:14px;">2、抽奖号为每个手机号名下电子票首次入场后生成的顺序号，凭电子票入场后，抽奖号被列入抽奖号池；</span>
</p>
<p>
	<span style="font-size:14px;">3、每个手机号只能参与一次抽奖；</span>
</p>
<p>
	<span style="font-size:14px;">4、实体票不参与抽奖，但可以凭实体票至总服务台找到工作人员，激活对应的电子票，即可参与抽奖。</span>
</p>
<p>
	<br />
</p>
<p>
	<span style="color:#FFFFFF;background-color:#99BB00;font-size:14px;"><strong> 开奖时间：</strong></span><span style="font-size:14px;">2021年10月5日15：00</span> 
</p>
<p>
	<span><br />
</span> 
</p>
<p>
	<span><br />
</span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong>/ 如何领奖 /</strong></span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;color:#006600;"><strong><br />
</strong></span> 
</p>
<span style="line-height:2;font-size:14px;">1、中奖观众请于10月5日17:00前至现场服务台凭有效身份证明办理领取手续，如规定时间内无法到达现场，需与主办方联系说明（025-66048880），办理手续时间截止日期为10月10日，逾期未领视为自动放弃获奖资格；</span><br />
<span style="line-height:2;font-size:14px;">2、获得奖品的观众须配合缴纳个人偶然所得税；</span><br />
<span style="line-height:2;font-size:14px;">3、奖品只能以实物发放，不可折现；广告页面所示奖品仅为示意图，最终以实物为准；</span><br />
<span style="line-height:2;font-size:14px;">4、本活动秉持公平、公正、公开的原则，在法律允许范围内，本次活动的最终解释权归北京奥傲展览有限公司所有。</span><br />','http://www.njae.net/Public/Uploads/21-01/612ccbcdcca2a.jpg','北京');

-- 第二个活动
insert into activity values
(null,'签到赚积分','<strong><span style="font-size:14px;">一、活动时间：2021年9月1-29日</span></strong> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:14px;">二、活动内容：</span> 
</p>
<p>
	<span style="font-size:14px;">登录“国际车展”小程序可参与【签到赚积分】活动。2021年9月29日（含）之前，用户连续签到7天即可获得200-2000元不等的购车补贴、电子票，所获积分可兑换车展二十周年限量礼品。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong><span style="font-size:14px;">三、签到福利：</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">用户首次登录小程序后将自动获得200-2000元（随机）现金购车补贴；</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第3天可获得1张车展门票；</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第4天可获得额外的100-500元（随机）购车补贴，可与首次金额叠加</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第6天可获得3张车展门票</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第7天可获得额外的100-500元（随机）购车补贴，可与前两次金额叠加</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">举例：用户A首次登录小程序后获得500元（随机）购车补贴，连续签到第4天获得200元（随机），连续签到第7天获得400元（随机），则用户A最终获得的购车补贴金额为500+200+400=1100元。</span></strong> 
</p>
<br />
<p>
	<span style="font-size:14px;">四、积分攻略：</span> 
</p>
<p>
	<span style="font-size:14px;">每天进入小程序的签到页面，点击“签到”可获得5个积分</span><span style="font-size:14px;">；</span> 
</p>
<p>
	<span style="font-size:14px;">每天分享小程序给1位好友，可额外获得5个积分</span><span style="font-size:14px;">；</span> 
</p>
<p>
	<span style="font-size:14px;">连续签到的第3、4、6、7天，除获得每日签到积分外，还可额外获得10个积分。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong><span style="font-size:14px;">五、积分兑换：</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">90积分可兑换车展二十年限量卡卡帆布包一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">80积分可兑换车展二十年限量卡卡T恤一件</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">50积分可兑换车展二十年限量卡卡3D手机座一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">40积分可兑换车展二十年纪念卡卡钥匙挂件一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">30积分可兑换车展二十年纪念徽章一枚。</span></strong> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:14px;">六、注意事项：</span> 
</p>
<p>
	<span style="font-size:14px;">活动期间，同一用户仅可参与1次签到活动；</span> 
</p>
<p>
	<span style="font-size:14px;">积分兑换中，同品类兑换不可叠加；</span> 
</p>
<p>
	<span style="font-size:14px;">如出现漏签，可使用积分进行补签，每补签1次需消耗10个积分；</span> 
</p>
<p>
	<span style="font-size:14px;">购车补贴需在车展现场购车后，提交相关购车证明方可发放（具体使用规则可进入【百万购车补贴】页面查看；</span> 
</p>
<p>
	<span style="font-size:14px;">所有实物礼品需在2021年10月5日16:00之前至现场总服务台处兑换，数量有限，先到先得；</span> 
</p>
<p>
	<span style="font-size:14px;">本活动最终解释权归郑州奥源展览有限公司所有。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df01cf12aa.jpg','郑州');
insert into activity values
(null,'签到赚积分','<strong><span style="font-size:14px;">一、活动时间：2021年9月1-29日</span></strong> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:14px;">二、活动内容：</span> 
</p>
<p>
	<span style="font-size:14px;">登录“国际车展”小程序可参与【签到赚积分】活动。2021年9月29日（含）之前，用户连续签到7天即可获得200-2000元不等的购车补贴、电子票，所获积分可兑换车展二十周年限量礼品。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong><span style="font-size:14px;">三、签到福利：</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">用户首次登录小程序后将自动获得200-2000元（随机）现金购车补贴；</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第3天可获得1张车展门票；</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第4天可获得额外的100-500元（随机）购车补贴，可与首次金额叠加</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第6天可获得3张车展门票</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">连续签到第7天可获得额外的100-500元（随机）购车补贴，可与前两次金额叠加</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">举例：用户A首次登录小程序后获得500元（随机）购车补贴，连续签到第4天获得200元（随机），连续签到第7天获得400元（随机），则用户A最终获得的购车补贴金额为500+200+400=1100元。</span></strong> 
</p>
<br />
<p>
	<span style="font-size:14px;">四、积分攻略：</span> 
</p>
<p>
	<span style="font-size:14px;">每天进入小程序的签到页面，点击“签到”可获得5个积分</span><span style="font-size:14px;">；</span> 
</p>
<p>
	<span style="font-size:14px;">每天分享小程序给1位好友，可额外获得5个积分</span><span style="font-size:14px;">；</span> 
</p>
<p>
	<span style="font-size:14px;">连续签到的第3、4、6、7天，除获得每日签到积分外，还可额外获得10个积分。</span> 
</p>
<p>
	<br />
</p>
<p>
	<strong><span style="font-size:14px;">五、积分兑换：</span></strong> 
</p>
<p>
	<strong><span style="font-size:14px;">90积分可兑换车展二十年限量卡卡帆布包一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">80积分可兑换车展二十年限量卡卡T恤一件</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">50积分可兑换车展二十年限量卡卡3D手机座一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">40积分可兑换车展二十年纪念卡卡钥匙挂件一个</span></strong><span style="font-size:14px;"><strong>；</strong></span> 
</p>
<p>
	<strong><span style="font-size:14px;">30积分可兑换车展二十年纪念徽章一枚。</span></strong> 
</p>
<p>
	<br />
</p>
<p>
	<span style="font-size:14px;">六、注意事项：</span> 
</p>
<p>
	<span style="font-size:14px;">活动期间，同一用户仅可参与1次签到活动；</span> 
</p>
<p>
	<span style="font-size:14px;">积分兑换中，同品类兑换不可叠加；</span> 
</p>
<p>
	<span style="font-size:14px;">如出现漏签，可使用积分进行补签，每补签1次需消耗10个积分；</span> 
</p>
<p>
	<span style="font-size:14px;">购车补贴需在车展现场购车后，提交相关购车证明方可发放（具体使用规则可进入【百万购车补贴】页面查看；</span> 
</p>
<p>
	<span style="font-size:14px;">所有实物礼品需在2021年10月5日16:00之前至现场总服务台处兑换，数量有限，先到先得；</span> 
</p>
<p>
	<span style="font-size:14px;">本活动最终解释权归北京奥源展览有限公司所有。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df01cf12aa.jpg','北京');

-- 第三个活动
insert into activity values
(null,'百万购车补贴','<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;background-color:#FFE500;"><strong>领取购车补贴的方式很简单，只需进入国际车展小程序，成功登录后可直接获得200元~2000元随机金额的购车补贴。</strong></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;background-color:#FFE500;"><strong>活动流程：</strong></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">1、微信搜索 “国际车展”小程序，进入小程序后点击“百万购车补贴”，可获取200-2000元随机购车抵用券。此券可与【签到赚积分】活动所获金额叠加使用（不限车型，不限车价），点击小程序首页【签到有礼】，连续签到第四天，可获得额外的100~500元随机金额的购车补贴，连续签到第七天，可获得额外的100~500元随机金额的购车补贴。</span></span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<strong>举个例子：</strong><span style="font-size:14px;font-family:微软雅黑;">用户A首次登录小程序后获得500元（随机）购车补贴，连续签到第四天获得200元（随机）购车补贴，连续签到第七天获得400元（随机）购车补贴，则用户A最终获得的购车补贴金额为500元+200元+400元=1100元。用户A在现场购车，且提交的购车表单成功通过审核后，以上购车补贴子金额正式生效。</span> 
</p>
<p style="text-align:center;background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img src="/Public/Kindeditor/attached/image/20210903/20210903194029_59029.jpg" alt="" /><br />
</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">2、国际车展（2021年9月30日-10月5日）现场购车的观众，进入“国际车展”小程序，点击【百万购车补贴】按钮，填写购车表单信息，包括购车人身份证照片、购车合同、购车定金凭证（请确保上传图片的清晰度）等等，即可获得一个订单顺序码，每日顺序码在100名内（含第100名），并经工作人员在线审核通过后，购车抵用券则正式生效。数量有限，先到先得。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><strong><span style="background-color:#FFE500;">注意事项：</span></strong><span style="background-color:#FFE500;"></span><br />
</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">1、每个购车订单对应唯一购车人、手机号及身份证号，订单手机号需与购车抵用券绑定的帐号手机号一致，请务必确保填写信息的真实性。 </span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">2、展会主办方工作人员和参展商不得参与购车补贴活动，展商或个人出现任何伪造行为一经主办方发现，取消其今后参与此类活动的资格，并保留追究法律责任的权利。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">3、购车抵用券正式生效的观众需在2021年12月31日17:00前通过车展小程序提交购车发票，工作人员审核通过后，方可通知领取。接到通知的观众持所购车辆行驶证原件、购车发票原件、购车人身份证原件至展会组办方领取购车补贴，请确保所带原件与购车现场提交至小程序内的信息一致，现场再次审核无误后当场发放购车补贴。逾期未领取购车补贴视为自动放弃。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;">4、本活动秉持公平、公正、公开的原则，在法律许可范围内，郑州奥源展览有限公司对本活动拥有最终解释权。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612ccc8c7aaa7.jpg','郑州');

insert into activity values
(null,'百万购车补贴','<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;background-color:#FFE500;"><strong>领取购车补贴的方式很简单，只需进入国际车展小程序，成功登录后可直接获得200元~2000元随机金额的购车补贴。</strong></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;background-color:#FFE500;"><strong>活动流程：</strong></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;">1、微信搜索 “国际车展”小程序，进入小程序后点击“百万购车补贴”，可获取200-2000元随机购车抵用券。此券可与【签到赚积分】活动所获金额叠加使用（不限车型，不限车价），点击小程序首页【签到有礼】，连续签到第四天，可获得额外的100~500元随机金额的购车补贴，连续签到第七天，可获得额外的100~500元随机金额的购车补贴。</span></span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<strong>举个例子：</strong><span style="font-size:14px;font-family:微软雅黑;">用户A首次登录小程序后获得500元（随机）购车补贴，连续签到第四天获得200元（随机）购车补贴，连续签到第七天获得400元（随机）购车补贴，则用户A最终获得的购车补贴金额为500元+200元+400元=1100元。用户A在现场购车，且提交的购车表单成功通过审核后，以上购车补贴子金额正式生效。</span> 
</p>
<p style="text-align:center;background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img src="/Public/Kindeditor/attached/image/20210903/20210903194029_59029.jpg" alt="" /><br />
</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">2、国际车展（2021年9月30日-10月5日）现场购车的观众，进入“国际车展”小程序，点击【百万购车补贴】按钮，填写购车表单信息，包括购车人身份证照片、购车合同、购车定金凭证（请确保上传图片的清晰度）等等，即可获得一个订单顺序码，每日顺序码在100名内（含第100名），并经工作人员在线审核通过后，购车抵用券则正式生效。数量有限，先到先得。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><strong><span style="background-color:#FFE500;">注意事项：</span></strong><span style="background-color:#FFE500;"></span><br />
</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">1、每个购车订单对应唯一购车人、手机号及身份证号，订单手机号需与购车抵用券绑定的帐号手机号一致，请务必确保填写信息的真实性。 </span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">2、展会主办方工作人员和参展商不得参与购车补贴活动，展商或个人出现任何伪造行为一经主办方发现，取消其今后参与此类活动的资格，并保留追究法律责任的权利。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><span style="font-size:14px;">3、购车抵用券正式生效的观众需在2021年12月31日17:00前通过车展小程序提交购车发票，工作人员审核通过后，方可通知领取。接到通知的观众持所购车辆行驶证原件、购车发票原件、购车人身份证原件至展会组办方领取购车补贴，请确保所带原件与购车现场提交至小程序内的信息一致，现场再次审核无误后当场发放购车补贴。逾期未领取购车补贴视为自动放弃。</span></span> 
</p>
<p style="background:white;text-indent:22.6pt;">
	<span style="font-size:14px;font-family:微软雅黑;">4、本活动秉持公平、公正、公开的原则，在法律许可范围内，北京奥源展览有限公司对本活动拥有最终解释权。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612ccc8c7aaa7.jpg','北京');

-- 第四个活动
insert into activity values
(null,'抖出你精彩','
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">如今，手机是人人必备的打卡利器，拍照、拍视频上传共享成了最流行的社交方式。2021（第二十届）郑州国际车展即将于十一黄金周期间举办，作为一年一度的汽车盛会，车展现场各式各样的展车、礼仪模特、好玩的活动，都是视频拍摄的最佳素材，一年一次，不容错过。2021郑州国际车展抖音短视频大赛分为以下两部分：</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>一、聚焦日常——拍汽车生活</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<br />
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>无门槛限制，全民参与；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">②</span>聚焦日常生活，拍摄与汽车有关的短视频，内容须为原创作品，体现汽车元素，时长控制60秒以内；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">③</span>发布作品时，须@郑州国际车展 并添加话题#十一郑州国际车展 ，方算参与成功，否则视为无效作品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">④</span>发布平台为抖音APP。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>评选方式：</strong>截至</span></span><span style="font-family:微软雅黑;font-size:14px;">2021年9月24日，抖音作品的点赞量达20个以上（含20个），即免费发放车展电子门票2张。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与时间：</strong>2021年9月3-24日</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>获奖公布与门票发放</strong>：2021年9月26日</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>二、车展现场——拍全场亮点</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong><br />
</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>无门槛限制，全民参与；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-size:14px;color:#333333;font-family:" background-color:#ffffff;"="">②</span>车展现场，围绕展台、展车、模特、活动等元素进行短视频拍摄，作品须体现车展现场元素，时长控制60秒以内；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">③</span>发布作品时，须@郑州国际车展 并添加话题#十一郑州国际车展 ，方算参与成功，否则视为无效作品。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">④</span>发布平台为抖音APP。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>评选方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>至截稿日（2021年10月3日），根据抖音作品的点赞量、评论量、转发量指标筛选获奖入围作品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-size:14px;color:#333333;font-family:" background-color:#ffffff;"="">②</span>车展主办方最终根据抖音作品的主题契合度、创意度等要求，确定最终获奖作品，届时</span><br />
<span style="font-size:14px;">将对获奖者颁发奖品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">③</span>参与抖音作品的各项数据须为自然流量，禁止第三方推流，一经发现，取消参赛资格。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>奖项设置：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">一等奖（1名）：1000元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">二等奖（2名）：500元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">三等奖（3名）：200元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与时间：</strong><span style="font-family:微软雅黑;font-size:14px;">2021年9月30日-10月3日</span><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>奖项发放：</strong>2021年10月5日10:00-11:00 总服务台</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>免责声明：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>作品须为原创，禁止使用他人作品参赛；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">②</span>短视频若发生侵犯他人著作权、肖像权、名誉权等行为及由此产生的一切法律纠纷由参赛者承担；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">③</span>奥源展览有限公司有权使用所有参赛作品，用于郑州国际车展的宣传和展示（非卖品）；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">④</span>如有疑问请致电025-86891580。</span><br />
</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df1c1e709a.jpg','郑州');
insert into activity values
(null,'抖出你精彩','
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">如今，手机是人人必备的打卡利器，拍照、拍视频上传共享成了最流行的社交方式。2021（第二十届）北京国际车展即将于十一黄金周期间举办，作为一年一度的汽车盛会，车展现场各式各样的展车、礼仪模特、好玩的活动，都是视频拍摄的最佳素材，一年一次，不容错过。2021北京国际车展抖音短视频大赛分为以下两部分：</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>一、聚焦日常——拍汽车生活</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<br />
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>无门槛限制，全民参与；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">②</span>聚焦日常生活，拍摄与汽车有关的短视频，内容须为原创作品，体现汽车元素，时长控制60秒以内；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">③</span>发布作品时，须@北京国际车展 并添加话题#十一北京国际车展 ，方算参与成功，否则视为无效作品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">④</span>发布平台为抖音APP。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>评选方式：</strong>截至</span></span><span style="font-family:微软雅黑;font-size:14px;">2021年9月24日，抖音作品的点赞量达20个以上（含20个），即免费发放车展电子门票2张。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与时间：</strong>2021年9月3-24日</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>获奖公布与门票发放</strong>：2021年9月26日</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>二、车展现场——拍全场亮点</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong><br />
</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>无门槛限制，全民参与；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-size:14px;color:#333333;font-family:" background-color:#ffffff;"="">②</span>车展现场，围绕展台、展车、模特、活动等元素进行短视频拍摄，作品须体现车展现场元素，时长控制60秒以内；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">③</span>发布作品时，须@北京国际车展 并添加话题#十一北京国际车展 ，方算参与成功，否则视为无效作品。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">④</span>发布平台为抖音APP。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>评选方式：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>至截稿日（2021年10月3日），根据抖音作品的点赞量、评论量、转发量指标筛选获奖入围作品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="font-size:14px;color:#333333;font-family:" background-color:#ffffff;"="">②</span>车展主办方最终根据抖音作品的主题契合度、创意度等要求，确定最终获奖作品，届时</span><br />
<span style="font-size:14px;">将对获奖者颁发奖品；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" background-color:#ffffff;font-size:14px;"="">③</span>参与抖音作品的各项数据须为自然流量，禁止第三方推流，一经发现，取消参赛资格。</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>奖项设置：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">一等奖（1名）：1000元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">二等奖（2名）：500元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;">三等奖（3名）：200元购物卡</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>参与时间：</strong><span style="font-family:微软雅黑;font-size:14px;">2021年9月30日-10月3日</span><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>奖项发放：</strong>2021年10月5日10:00-11:00 总服务台</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><br />
</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><strong>免责声明：</strong></span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">①</span>作品须为原创，禁止使用他人作品参赛；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">②</span>短视频若发生侵犯他人著作权、肖像权、名誉权等行为及由此产生的一切法律纠纷由参赛者承担；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">③</span>奥源展览有限公司有权使用所有参赛作品，用于南京国际车展的宣传和展示（非卖品）；</span></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24.1pt;">
	<span style="line-height:2;font-size:14px;font-family:微软雅黑;"><span style="font-size:14px;"><span style="color:#333333;font-family:" font-size:14px;background-color:#ffffff;"="">④</span>如有疑问请致电025-86891580。</span><br />
</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df1c1e709a.jpg','北京');

-- 第五个活动
insert into activity values
(null,'车展On Line官方直播','<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">为方便观众可以多维度，多视角观看车展现场，2021（第二十届）郑州国际车展主办方将在官方抖音号上进行全天直播，并邀请到专业车评人，对当下热门新车、超豪车、新势力车进行零距离讲解，还将邀请车企高管进入直播间，打造“品牌高管送福利”环节，送出2021郑州国际车展专属购车政策/福利。<strong>9月30日9:30-16:30，抖音APP搜索进入“郑州国际车展”抖音号，即可观看车展直播。</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><br />
</span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><strong>Focus1：主播带你</strong><strong></strong><strong>看车展</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">2021郑州国际车展邀请专业车评人，现场讲解新车亮点，带观众从专业角度看车、赏车，买车这件事儿，一定要有信得过的 “领路人”，省去看车买车烦恼，相信专业人士的讲解，对您的买车计划有所帮助。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830184226_61644.jpg" alt="" /> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><strong>Focus2：品牌高管送福利</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">买车，就要多好省。2021郑州国际车展官方直播“品牌高管送福利”环节，组办方邀请到展商品牌高管来到直播间，为观看直播的观众提供专属购车福利（仅限本次车展），只要您在线参与互动，就能抢到超级划算的购车福利，现场购车即可核销使用，真正解决您的买车痛点——价格问题。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><br />
</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">视频看了不过瘾？没关系，<strong>除了官方视频直播，本届车展还将开通图片直播</strong>，把现场精彩搬上云端，精美图片实时更新，一键直达您的手机。<strong>点击小程序首页“现场直播”即可观看精彩的图片直播。</strong></span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df079d8ae4.jpg','郑州');
insert into activity values
(null,'车展On Line官方直播','<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">为方便观众可以多维度，多视角观看车展现场，2021（第二十届）北京国际车展主办方将在官方抖音号上进行全天直播，并邀请到专业车评人，对当下热门新车、超豪车、新势力车进行零距离讲解，还将邀请车企高管进入直播间，打造“品牌高管送福利”环节，送出2021北京国际车展专属购车政策/福利。<strong>9月30日9:30-16:30，抖音APP搜索进入“南京国际车展”抖音号，即可观看车展直播。</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><br />
</span> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><strong>Focus1：主播带你</strong><strong></strong><strong>看车展</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">2021北京国际车展邀请专业车评人，现场讲解新车亮点，带观众从专业角度看车、赏车，买车这件事儿，一定要有信得过的 “领路人”，省去看车买车烦恼，相信专业人士的讲解，对您的买车计划有所帮助。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830184226_61644.jpg" alt="" /> 
</p>
<p class="MsoNormal" align="left" style="text-align:center;text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><strong>Focus2：品牌高管送福利</strong></span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">买车，就要多好省。2021北京国际车展官方直播“品牌高管送福利”环节，组办方邀请到展商品牌高管来到直播间，为观看直播的观众提供专属购车福利（仅限本次车展），只要您在线参与互动，就能抢到超级划算的购车福利，现场购车即可核销使用，真正解决您的买车痛点——价格问题。</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;"><br />
</span> 
</p>
<p class="MsoNormal" align="left" style="text-indent:24pt;">
	<span style="font-size:14px;line-height:2;font-family:微软雅黑;">视频看了不过瘾？没关系，<strong>除了官方视频直播，本届车展还将开通图片直播</strong>，把现场精彩搬上云端，精美图片实时更新，一键直达您的手机。<strong>点击小程序首页“现场直播”即可观看精彩的图片直播。</strong></span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df079d8ae4.jpg','北京');

-- 第六个活动
insert into activity values
(null,'2021年格兰披治模拟赛车大奖赛','<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;">9月30日-10月5日，邀请您来车展现场参加一场专业级的赛车比赛，您会定时赴约吗？届时，专业级赛车模拟器将带您上赛道！</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;">作为移动互联网时代下的新生代体育运动，赛车模拟器已经被国家体育总局和中国汽车摩托车运动联合会确定为正式的体育比赛</span><span style="font-family:微软雅黑;font-size:14px;">项目，借着这股模拟赛车运动风潮，</span><span style="font-family:微软雅黑;font-size:14px;">2021</span><span style="font-family:微软雅黑;font-size:14px;">郑州国际车展主办方将格兰披治模拟赛车大奖赛正式引入郑州，</span><span style="font-family:微软雅黑;font-size:14px;">将带观众进入身临其境般的虚拟赛车世界。提到赛车，很多朋友联想到的会是代表速度与激情的音浪或者酷炫外观，但是提到赛事，</span><span style="font-family:微软雅黑;font-size:14px;">就算是资深车迷，可能也会有些陌生</span><span style="font-family:微软雅黑;font-size:14px;">。</span></span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830191832_65877.png" /> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;"><span style="font-size:10px;">（图片来源网络，不代表实际展品）</span><br />
</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;">如今，电竞和赛车都是倍受年轻人喜欢的运动，把这两者结合起来的赛车模拟器，是一种结合赛车设计和工程技术的电竞赛车游戏模拟器，模拟赛道每个细节和路面抓地力变化，<span style="font-family:微软雅黑;font-size:14px;">最强大之处在于其拟真性，赛道的每个细节，路面抓地力变化，赛道温度湿度，赛场风力，下雨后赛道的湿滑特性等都与真实环境下非常相似</span>，降低了赛车运动参与门槛，为拥有赛车梦但难以实现的年轻人，提供了一个圆梦的平台，使每一位爱车人士及电竞爱好者在电竞赛事中尽情享受速度快感，燃烧你的荷尔蒙。</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830191930_70881.png" /> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-size:10px;">（图片来源网络，不代表实际展品）</span><br />
</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;">本届车展的格兰披治模拟赛车大奖赛，全展期内对观众开放，将满足不同年龄段、不同水平赛车电竞爱好者的需求。有句话是这么说的，</span><span style="font-family:微软雅黑;font-size:14px;">模拟器玩得好的人，开车一定不</span><span style="font-family:微软雅黑;font-size:14px;">会</span><span style="font-family:微软雅黑;font-size:14px;">差，而开车开得好的人，却不一定能开好模拟器，这是个真理。</span><span style="font-family:微软雅黑;font-size:14px;">所以，广大车友和喜欢电竞的朋友，这个十一黄金周诚邀您与亲朋好友前来现场体验。</span></span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong>如何体验模拟赛车：微信搜索【</strong></span><span style="font-family:微软雅黑;font-size:14px;"><span style="background-color:#FFE500;"><strong>郑州国际车展】小程序，点击首页“格兰披治大奖赛”进入预约通道，选择你想预约的时间分段，提示预约</strong></span><span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong>成功后，在约定的时间到场，即可体验。每日预约名额有限，约满即止，单人有3次预约机会。</strong></span></span> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903193125_59964.jpg" alt="" /><br />
</strong></span></span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df0aa8b697.jpg','郑州');
insert into activity values
(null,'2021年格兰披治模拟赛车大奖赛','<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;">9月30日-10月5日，邀请您来车展现场参加一场专业级的赛车比赛，您会定时赴约吗？届时，专业级赛车模拟器将带您上赛道！</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;">作为移动互联网时代下的新生代体育运动，赛车模拟器已经被国家体育总局和中国汽车摩托车运动联合会确定为正式的体育比赛</span><span style="font-family:微软雅黑;font-size:14px;">项目，借着这股模拟赛车运动风潮，</span><span style="font-family:微软雅黑;font-size:14px;">2021</span><span style="font-family:微软雅黑;font-size:14px;">北京国际车展主办方将格兰披治模拟赛车大奖赛正式引入北京，</span><span style="font-family:微软雅黑;font-size:14px;">将带观众进入身临其境般的虚拟赛车世界。提到赛车，很多朋友联想到的会是代表速度与激情的音浪或者酷炫外观，但是提到赛事，</span><span style="font-family:微软雅黑;font-size:14px;">就算是资深车迷，可能也会有些陌生</span><span style="font-family:微软雅黑;font-size:14px;">。</span></span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830191832_65877.png" /> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;"><span style="font-size:10px;">（图片来源网络，不代表实际展品）</span><br />
</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="line-height:2.5;font-family:微软雅黑;font-size:14px;">如今，电竞和赛车都是倍受年轻人喜欢的运动，把这两者结合起来的赛车模拟器，是一种结合赛车设计和工程技术的电竞赛车游戏模拟器，模拟赛道每个细节和路面抓地力变化，<span style="font-family:微软雅黑;font-size:14px;">最强大之处在于其拟真性，赛道的每个细节，路面抓地力变化，赛道温度湿度，赛场风力，下雨后赛道的湿滑特性等都与真实环境下非常相似</span>，降低了赛车运动参与门槛，为拥有赛车梦但难以实现的年轻人，提供了一个圆梦的平台，使每一位爱车人士及电竞爱好者在电竞赛事中尽情享受速度快感，燃烧你的荷尔蒙。</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830191930_70881.png" /> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-size:10px;">（图片来源网络，不代表实际展品）</span><br />
</span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;">本届车展的格兰披治模拟赛车大奖赛，全展期内对观众开放，将满足不同年龄段、不同水平赛车电竞爱好者的需求。有句话是这么说的，</span><span style="font-family:微软雅黑;font-size:14px;">模拟器玩得好的人，开车一定不</span><span style="font-family:微软雅黑;font-size:14px;">会</span><span style="font-family:微软雅黑;font-size:14px;">差，而开车开得好的人，却不一定能开好模拟器，这是个真理。</span><span style="font-family:微软雅黑;font-size:14px;">所以，广大车友和喜欢电竞的朋友，这个十一黄金周诚邀您与亲朋好友前来现场体验。</span></span> 
</p>
<p align="left" class="MsoNormal" style="text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong>如何体验模拟赛车：微信搜索【</strong></span><span style="font-family:微软雅黑;font-size:14px;"><span style="background-color:#FFE500;"><strong>北京国际车展】小程序，点击首页“格兰披治大奖赛”进入预约通道，选择你想预约的时间分段，提示预约</strong></span><span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong>成功后，在约定的时间到场，即可体验。每日预约名额有限，约满即止，单人有3次预约机会。</strong></span></span> 
</p>
<p align="left" class="MsoNormal" style="text-align:center;text-indent:24.1pt;">
	<span style="font-family:微软雅黑;font-size:14px;"><span style="font-family:微软雅黑;font-size:14px;background-color:#FFE500;"><strong><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903193125_59964.jpg" alt="" /><br />
</strong></span></span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612df0aa8b697.jpg','北京');

-- 第七个活动
insert into activity values
(null,'追梦骑士-机车生活节','<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center">今年，郑州国际车展创新展出形式，首次开辟<span style="color:#E53333;">追梦骑士——首届郑州机车生活节！</span>联合<span
        style="color:#E53333;">郑州MOTO 7 机车文化园</span>，携手国内外知名摩托车品牌联袂展出。<br />
    并且今年车展现场还将举行“<strong>郑州骑士文明安全骑行承诺签名</strong>”活动，携手金陵摩托车主共创美好骑行环境，为打造更好的城市交通尽自己一份力。<br />
    <span style="font-size:14px;"></span>
</p>
<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center"><br />
</p>
<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center"><br />
</p>
<p style="text-align:center;">
    <span style="background-color:#FFFFFF;color:#E53333;font-size:14px;"><strong>/ 品牌云集 /</strong></span>
</p>
<p>
    <br />
</p>
热爱机车文化的车友们，可以在本届机车生活节上，近距离了解各大品牌机车，感受摩托车独有的酷炫魅力。还能够认识更多热爱生活、追逐风与自由的金陵骑士。
<p>
    <br />
</p>
<p style="text-align:center;">
    <img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903193602_93468.png" alt="" />
</p>
<p style="text-align:center;">
    <br />
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>品牌远不止如此</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>更多参展摩托车品牌</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>可在郑州国际车展小程序上查看哦</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span><br />
        </span></span>
</p>
</div>
</div>
<div class="main_right">
    <div class="right-vedio" style="width: 260px; height: 177px; overflow: hidden;">','http://www.njae.net/Public/Uploads/21-01/612df0c0eed2a.jpg','郑州');
insert into activity values
(null,'追梦骑士-机车生活节','<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center">今年，北京国际车展创新展出形式，首次开辟<span style="color:#E53333;">追梦骑士——首届北京机车生活节！</span>联合<span
        style="color:#E53333;">北京MOTO 7 机车文化园</span>，携手国内外知名摩托车品牌联袂展出。<br />
    并且今年车展现场还将举行“<strong>北京骑士文明安全骑行承诺签名</strong>”活动，携手金陵摩托车主共创美好骑行环境，为打造更好的城市交通尽自己一份力。<br />
    <span style="font-size:14px;"></span>
</p>
<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center"><br />
</p>
<p style="text-align: left;" font-size:17px;font-weight:normal;background-color:#ffffff;text-align:center;"=""
    align="center"><br />
</p>
<p style="text-align:center;">
    <span style="background-color:#FFFFFF;color:#E53333;font-size:14px;"><strong>/ 品牌云集 /</strong></span>
</p>
<p>
    <br />
</p>
热爱机车文化的车友们，可以在本届机车生活节上，近距离了解各大品牌机车，感受摩托车独有的酷炫魅力。还能够认识更多热爱生活、追逐风与自由的金陵骑士。
<p>
    <br />
</p>
<p style="text-align:center;">
    <img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903193602_93468.png" alt="" />
</p>
<p style="text-align:center;">
    <br />
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>品牌远不止如此</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>更多参展摩托车品牌</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span>可在北京国际车展小程序上查看哦</span></span>
</p>
<p style="text-align:center;">
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><span><br />
        </span></span>
</p>
</div>
</div>
<div class="main_right">
    <div class="right-vedio" style="width: 260px; height: 177px; overflow: hidden;">','http://www.njae.net/Public/Uploads/21-01/612df0c0eed2a.jpg','北京');

-- 第八个活动
insert into activity values
(null,'光影拍客3.0-万元悬赏最佳拍客','<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">报名时间：</span></strong><span style="font-size:14px;">即日起-截止到9月15日</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">报名人数：</span></strong><span style="font-size:14px;">不限</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><strong><span style="font-size:14px;">报名要求：（</span></strong><span style="font-size:14px;"><strong>满足任一条件即可报名</strong></span><strong><span style="font-size:14px;">）</span></strong></strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">历届郑州国际车展获奖者</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">国际/国家/省/市/区级摄影协会会员</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">参加过摄影赛事的获奖者</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">摄影从业证件、摄影记者证</span> 
</p>
<p style="text-align:left;">
	<span><br />
</span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">设备要求：</span></strong><span style="font-size:14px;">单反数码相机</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">作品要求：</span></strong><span style="font-size:14px;">取景地为2021（第二十届）郑州国际车展现场，参赛作品以展会火爆人气、活动表演、展台展车、现场观众、礼仪模特等为选题，突出本届车展闪亮之处；参赛作品可以在原始稿件基础上进行适当裁剪，禁止电脑技术处理照片（如ps等）。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">数量要求：</span></strong><strong><span style="font-size:14px;">每人提交数量不超过10张，提交作品请备注作品标题、文字说明、拍摄者姓名和联系方式，信息不完整者则视为报名不成功。</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">审核查询：</span></strong><span style="font-size:14px;">报名提交48小时后，进入车展小程序点击“我的”→“我的报名”，即可查看审核进度。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">门票发放：</span></strong><span style="font-size:14px;">审核通过后，每人将免费获赠电子门票4张，9月27日统一发放。点击“我的”→“我的门票”查看电子门票信息。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">现金酬稿：</span></strong><strong><span style="font-size:14px;">凡入选的优秀作品，将获得200元每张的酬稿。</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><br />
</strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">线下投稿地点：</span></strong><span style="font-size:14px;">请携带摄影作品读取设备，至现场总服务台</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">线上投稿方式：</span></strong><span style="font-size:14px;">发送作品至726415881.com</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">投稿时间：</span></strong><strong><span style="font-size:14px;">2021年9月30日-10月3日</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">作品评选：</span></strong><span style="font-size:14px;">邀请摄影界、媒体界人士参与评选。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">评选结果公布时间：</span></strong><strong><span style="font-size:14px;">2021年10月4日</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">酬稿领取时间及地点：</span></strong><strong><span style="font-size:14px;">2021年10月5日10:00-10:30 现场总服务台（逾期视为放弃领奖）</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">咨询电话：</span></strong><span style="font-size:14px;">025-86891580</span></span> 
</p>
<p style="text-align:left;">
	<span><br />
</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;"><strong>注意事项：</strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">1、参赛作品须为活动参与者的原创作品，不能包含任何侵犯版权、商标、道德权利、隐私/宣传或知识产权的内容，奥源展览有限公司不承担活动参与者由于作品侵权所引起的纠纷，一切与优秀作品有关的纠纷由活动参与者自行承担；</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">2、参赛作品若被评选为优秀作品，主办方有权使用优秀作品，在车展相关纸质印刷品、官方网站、官方自媒体等渠道做宣传使用，包括发布、展示以及调整、修改、创建衍生著作等用途；</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">3、如参赛作品违反上述规则，主办方有权取消其参赛资格，并不予告知参赛者。</span> 
</p>
','http://www.njae.net/Public/Uploads/21-01/612df0e08c1d5.jpg','郑州');
insert into activity values
(null,'光影拍客3.0-万元悬赏最佳拍客','<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">报名时间：</span></strong><span style="font-size:14px;">即日起-截止到9月15日</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">报名人数：</span></strong><span style="font-size:14px;">不限</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><strong><span style="font-size:14px;">报名要求：（</span></strong><span style="font-size:14px;"><strong>满足任一条件即可报名</strong></span><strong><span style="font-size:14px;">）</span></strong></strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">历届北京国际车展获奖者</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">国际/国家/省/市/区级摄影协会会员</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">参加过摄影赛事的获奖者</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">摄影从业证件、摄影记者证</span> 
</p>
<p style="text-align:left;">
	<span><br />
</span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">设备要求：</span></strong><span style="font-size:14px;">单反数码相机</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">作品要求：</span></strong><span style="font-size:14px;">取景地为2021（第二十届）北京国际车展现场，参赛作品以展会火爆人气、活动表演、展台展车、现场观众、礼仪模特等为选题，突出本届车展闪亮之处；参赛作品可以在原始稿件基础上进行适当裁剪，禁止电脑技术处理照片（如ps等）。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">数量要求：</span></strong><strong><span style="font-size:14px;">每人提交数量不超过10张，提交作品请备注作品标题、文字说明、拍摄者姓名和联系方式，信息不完整者则视为报名不成功。</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">审核查询：</span></strong><span style="font-size:14px;">报名提交48小时后，进入车展小程序点击“我的”→“我的报名”，即可查看审核进度。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">门票发放：</span></strong><span style="font-size:14px;">审核通过后，每人将免费获赠电子门票4张，9月27日统一发放。点击“我的”→“我的门票”查看电子门票信息。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">现金酬稿：</span></strong><strong><span style="font-size:14px;">凡入选的优秀作品，将获得200元每张的酬稿。</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><br />
</strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">线下投稿地点：</span></strong><span style="font-size:14px;">请携带摄影作品读取设备，至现场总服务台</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">线上投稿方式：</span></strong><span style="font-size:14px;">发送作品至726415881.com</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">投稿时间：</span></strong><strong><span style="font-size:14px;">2021年9月30日-10月3日</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">作品评选：</span></strong><span style="font-size:14px;">邀请摄影界、媒体界人士参与评选。</span></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">评选结果公布时间：</span></strong><strong><span style="font-size:14px;">2021年10月4日</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">酬稿领取时间及地点：</span></strong><strong><span style="font-size:14px;">2021年10月5日10:00-10:30 现场总服务台（逾期视为放弃领奖）</span></strong></span> 
</p>
<p style="text-align:left;">
	<span><strong><span style="font-size:14px;">咨询电话：</span></strong><span style="font-size:14px;">025-86891580</span></span> 
</p>
<p style="text-align:left;">
	<span><br />
</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;"><strong>注意事项：</strong></span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">1、参赛作品须为活动参与者的原创作品，不能包含任何侵犯版权、商标、道德权利、隐私/宣传或知识产权的内容，奥源展览有限公司不承担活动参与者由于作品侵权所引起的纠纷，一切与优秀作品有关的纠纷由活动参与者自行承担；</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">2、参赛作品若被评选为优秀作品，主办方有权使用优秀作品，在车展相关纸质印刷品、官方网站、官方自媒体等渠道做宣传使用，包括发布、展示以及调整、修改、创建衍生著作等用途；</span> 
</p>
<p style="text-align:left;">
	<span style="font-size:14px;">3、如参赛作品违反上述规则，主办方有权取消其参赛资格，并不予告知参赛者。</span> 
</p>
','http://www.njae.net/Public/Uploads/21-01/612df0e08c1d5.jpg','北京');

-- 第九个活动
insert into activity values
(null,'卡卡趣游记','<span style="line-height:2;font-size:14px;">郑州国际车展打造的IP卡卡家族又上线了，本届车展由萌萌的卡卡带领大家开心逛展打卡拿礼品。展会设有15个打卡点，解锁一个打卡点即可获得一枚印章，集齐4枚印章就可以兑换精美礼品，解锁的越多，礼品拿的越嗨！</span> 
</p>
<p style="text-align:center;">
	<span style="line-height:2;background-color:#FFE500;font-size:16px;"><strong>打卡站点一览如下</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆总服务台-玩一把小游戏</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">在总服务台领取参观指南后，你的打卡之旅就可以开始啦。可直接在服务台参与套圈小游戏，完成游戏后，志愿者会帮你盖章1次哦！如果你对套圈的把控力足够强，那你还可以直接套到许多小礼物，比如卡卡系列周边、健腹轮、冷感毛巾....高手们直接套得盆满钵满！</span> 
</p>
<p>
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903200433_94145.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆-观看赛车模拟器比赛</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">在现场观看一场模拟赛车比赛，进入身临其境般的虚拟赛车世界。拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903200906_84822.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆-观看迷你四驱车比赛/体验迷你四驱车</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">重温童年美好回忆，感受迷你四驱车的速度与激情。在迷你四驱车专区迷你四驱车/观看/报名参与迷你四驱车比赛，拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201004_63147.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-参观机车生活节专区</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">近距离了解品牌机车，感受摩托车独有的酷炫魅力，认识更多热爱生活、追逐风与自由的金陵骑士。拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201021_24425.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找捷豹路虎【XFL】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡捷豹路虎展台，为新现代豪华主义XFL拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201102_30991.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>6号馆-寻找上汽大众【新途观L】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡上汽大众品牌，为IQ颜值双在线的新途观L拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201139_73999.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找合创【Z03】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡合创展台，为电竞青年心选的Z03拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201201_83590.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>6号馆-寻找一汽-大众【ID.4 CROZZ】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡一汽-大众展台，为其首款纯电SUV——ID.4 CROZZ拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201219_60173.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找哈弗【H6】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡哈弗展台，为“高品质国民神车”H6拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201244_78199.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>7号馆-寻找小鹏【P7】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡小鹏展台，为“超长续航，智能轿跑”的小鹏P7拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201300_95622.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找东风本田【思域】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡东风本田展台，为运动美学标杆第十一代思域拍照，至总服台验证后，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201357_71947.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找R汽车【Marvel R】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">为5G智能电动SUV——Marvel R拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201431_59505.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找东风悦达起亚【第四代嘉华】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡东风悦达起亚展台，为硬朗大气的跨界SUV嘉华拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201453_93761.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找极狐展台【阿尔达S】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><span style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;background-color:#FFFFFF;">打卡极狐展台，为新一代豪华智能纯电轿车阿尔法S拍照，至总服务台验证，志愿者予以盖章1次。</span></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><span style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;background-color:#FFFFFF;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210908/20210908114622_84230.jpg" alt="" /><br />
</span></span> 
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	<strong>8号馆-寻找哪吒展台【U PRO】</strong>
</p>
<p style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;text-align:justify;background-color:#FFFFFF;">
	打卡哪吒展台，为新能源黑科技哪吒U PRO拍照，至总服务台验证，志愿者予以盖章1次。
</p>
<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210915/20210915162647_58796.jpg" alt="" /><br />
<p>
	<br />
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>玩法规则</strong></span> 
</p>
<p>
	<span style="font-size:14px;"><strong>初级奖励：搜集4枚印章，可获得卡卡徽章1枚。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之一：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择3个站点进行打卡可获得盖章，你选择的3个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p>
	<span style="font-size:14px;"><strong>中级奖励：搜集6枚印章，可获得卡卡周边1份。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之二：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择4个站点进行打卡可获得盖章，你选择的4个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p>
	<span style="font-size:14px;"><strong>高级奖励：搜集8枚印章，可获得卡卡盲盒1个。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之二：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择6个站点进行打卡可获得盖章，你选择的6个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<br />
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>礼品兑换</strong></span> 
</p>
<p>
	<span style="font-size:14px;">符合兑换要求的观众，请至【卡卡趣游记】活动区领取礼品。本次活动礼品为郑州国际车展二十周年定制纪念品，设计精美，欢迎大家现场体验！</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>注意事项</strong></span> 
</p>
<p>
	<span font-size:14px;background-color:#ffffff;"="" style="color: rgb(51, 51, 51); font-size: 14px;">①</span><span style="font-size:14px;">本次活动共有15个打卡站点，车友们无需全部打卡，也无需按顺序打卡，想要拿到最高奖励，只需8枚印章即可；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">②</span><span style="font-size:14px;">如果你是积极打卡小能手，将现场15个打卡点全部打卡完毕的话，还可额外获得1份卡卡周边（以现场发放为准）；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">③</span><span style="font-size:14px;">活动奖励每人只可兑换一次，一次一档，不可多选，不可重复选；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">④</span><span style="font-size:14px;">在法律允许的范围内，本活动最终解释权归奥源展览有限公司所有。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612ccdc1505f1.jpg','郑州');
insert into activity values
(null,'卡卡趣游记','<span style="line-height:2;font-size:14px;">郑州国际车展打造的IP卡卡家族又上线了，本届车展由萌萌的卡卡带领大家开心逛展打卡拿礼品。展会设有15个打卡点，解锁一个打卡点即可获得一枚印章，集齐4枚印章就可以兑换精美礼品，解锁的越多，礼品拿的越嗨！</span> 
</p>
<p style="text-align:center;">
	<span style="line-height:2;background-color:#FFE500;font-size:16px;"><strong>打卡站点一览如下</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆总服务台-玩一把小游戏</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">在总服务台领取参观指南后，你的打卡之旅就可以开始啦。可直接在服务台参与套圈小游戏，完成游戏后，志愿者会帮你盖章1次哦！如果你对套圈的把控力足够强，那你还可以直接套到许多小礼物，比如卡卡系列周边、健腹轮、冷感毛巾....高手们直接套得盆满钵满！</span> 
</p>
<p>
	<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903200433_94145.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆-观看赛车模拟器比赛</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">在现场观看一场模拟赛车比赛，进入身临其境般的虚拟赛车世界。拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903200906_84822.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>4号馆-观看迷你四驱车比赛/体验迷你四驱车</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">重温童年美好回忆，感受迷你四驱车的速度与激情。在迷你四驱车专区迷你四驱车/观看/报名参与迷你四驱车比赛，拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201004_63147.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-参观机车生活节专区</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">近距离了解品牌机车，感受摩托车独有的酷炫魅力，认识更多热爱生活、追逐风与自由的金陵骑士。拍摄现场照片，向总服务台的志愿者出示后，予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201021_24425.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找捷豹路虎【XFL】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡捷豹路虎展台，为新现代豪华主义XFL拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201102_30991.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>6号馆-寻找上汽大众【新途观L】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡上汽大众品牌，为IQ颜值双在线的新途观L拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201139_73999.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找合创【Z03】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡合创展台，为电竞青年心选的Z03拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201201_83590.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>6号馆-寻找一汽-大众【ID.4 CROZZ】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡一汽-大众展台，为其首款纯电SUV——ID.4 CROZZ拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201219_60173.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找哈弗【H6】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡哈弗展台，为“高品质国民神车”H6拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201244_78199.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>7号馆-寻找小鹏【P7】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡小鹏展台，为“超长续航，智能轿跑”的小鹏P7拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201300_95622.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找东风本田【思域】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡东风本田展台，为运动美学标杆第十一代思域拍照，至总服台验证后，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201357_71947.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找R汽车【Marvel R】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">为5G智能电动SUV——Marvel R拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201431_59505.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>5号馆-寻找东风悦达起亚【第四代嘉华】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;">打卡东风悦达起亚展台，为硬朗大气的跨界SUV嘉华拍照，至总服务台验证，志愿者予以盖章1次。</span><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210903/20210903201453_93761.jpg" alt="" /> 
</p>
<p>
	<br />
</p>
<p>
	<span style="line-height:2;font-size:14px;"><strong>8号馆-寻找极狐展台【阿尔达S】</strong></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><span style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;background-color:#FFFFFF;">打卡极狐展台，为新一代豪华智能纯电轿车阿尔法S拍照，至总服务台验证，志愿者予以盖章1次。</span></span> 
</p>
<p>
	<span style="line-height:2;font-size:14px;"><span style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;background-color:#FFFFFF;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210908/20210908114622_84230.jpg" alt="" /><br />
</span></span> 
</p>
<p>
	<strong><br />
</strong>
</p>
<p>
	<strong>8号馆-寻找哪吒展台【U PRO】</strong>
</p>
<p style="color:#686868;font-family:Optima-Regular, PingFangTC-light;font-size:13px;text-align:justify;background-color:#FFFFFF;">
	打卡哪吒展台，为新能源黑科技哪吒U PRO拍照，至总服务台验证，志愿者予以盖章1次。
</p>
<img src="http://www.njae.net/Public/Kindeditor/attached/image/20210915/20210915162647_58796.jpg" alt="" /><br />
<p>
	<br />
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>玩法规则</strong></span> 
</p>
<p>
	<span style="font-size:14px;"><strong>初级奖励：搜集4枚印章，可获得卡卡徽章1枚。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之一：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择3个站点进行打卡可获得盖章，你选择的3个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p>
	<span style="font-size:14px;"><strong>中级奖励：搜集6枚印章，可获得卡卡周边1份。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之二：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择4个站点进行打卡可获得盖章，你选择的4个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p>
	<span style="font-size:14px;"><strong>高级奖励：搜集8枚印章，可获得卡卡盲盒1个。</strong></span> 
</p>
<p>
	<span style="font-size:14px;">本阶奖励兑换条件：</span> 
</p>
<p>
	<span style="font-size:14px;">①必须打卡其中之二：[总服务台小游戏]、[赛车模拟器专区]、[迷你四驱车专区]、[机车生活节专区]；</span> 
</p>
<p>
	<span style="font-size:14px;">②文中提及的11个展台站点，选择6个站点进行打卡可获得盖章，你选择的6个站点需满足“分布在不同展馆”这一条件。</span> 
</p>
<p>
	<br />
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>礼品兑换</strong></span> 
</p>
<p>
	<span style="font-size:14px;">符合兑换要求的观众，请至【卡卡趣游记】活动区领取礼品。本次活动礼品为北京国际车展二十周年定制纪念品，设计精美，欢迎大家现场体验！</span> 
</p>
<p>
	<span style="font-size:14px;"><br />
</span> 
</p>
<p style="text-align:center;">
	<span style="font-size:16px;background-color:#FFE500;"><strong>注意事项</strong></span> 
</p>
<p>
	<span font-size:14px;background-color:#ffffff;"="" style="color: rgb(51, 51, 51); font-size: 14px;">①</span><span style="font-size:14px;">本次活动共有15个打卡站点，车友们无需全部打卡，也无需按顺序打卡，想要拿到最高奖励，只需8枚印章即可；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">②</span><span style="font-size:14px;">如果你是积极打卡小能手，将现场15个打卡点全部打卡完毕的话，还可额外获得1份卡卡周边（以现场发放为准）；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">③</span><span style="font-size:14px;">活动奖励每人只可兑换一次，一次一档，不可多选，不可重复选；</span> 
</p>
<p>
	<span style="font-size:14px;color:#333333;">④</span><span style="font-size:14px;">在法律允许的范围内，本活动最终解释权归南京奥源展览有限公司所有。</span> 
</p>','http://www.njae.net/Public/Uploads/21-01/612ccdc1505f1.jpg','北京');
-- 第十个活动
insert into activity values
(null,'迷你四驱车','<p style="color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">TA从诞生的那天起，就以<strong>仿真、新颖的外型、强大的动力，闪电般的速度</strong>，吸引成千上万的青少年。</span><span style="font-family:Optima-Regular, PingFangTC-light;">一部《四驱兄弟》动漫更是成为80后、90后的集体记忆。</span><span style="font-family:Optima-Regular, PingFangTC-light;">从简单的拼装，到技术性的改造；从普通的贴纸，到艺术性的喷漆；从慢速跑完一圈的基础要求，到飞速竞争第一的对抗；无一不令人着迷。</span> 
</p>
<p>
    <br />
</p>
<p style="background:white;text-indent:21pt;">
    <span style="font-size:16px;"><span style="line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830193533_35529.png" /></span></span></span> 
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p style="text-align:left;">
    <span style="color:#003399;font-size:14px;"><strong>/ 迷你四驱车专业赛事 /</strong></span> 
</p>
<p style="text-align:left;">
    <span style="color:#003399;font-size:14px;"><strong><br />
</strong></span> 
</p>
<div style="text-align:center;">
    <p style="text-align:left;color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">在今年十一车展的现场，郑州国际车展主办方联合</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">郑州LPT迷你四驱车俱乐部</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">，在现场为广大车友打造迷你四驱车专区，如果你也是一名迷你四驱车文化爱好者的话，千万不要错过哟。</span> 
        </p>
<p style="text-align:left;color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">值得期待的是：</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">2021發利隆杯田宫迷你四驱车世界挑战赛中国区选拔赛-郑州站</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">落地车展现场，最终的冠军选手还将代表中国参加今年在日本举行的世界杯。如此重磅赛事加持，必将掀起郑州车友们的又一波热情。</span> 
    </p>
    <div style="text-align:left;">
        <br />
    </div>
</div>
<p>
    <br />
</p>
<p style="background:white;text-align:center;text-indent:21pt;">
    <span style="font-size:16px;"><span style="line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210908/20210908113624_50592.jpg" alt="" /><br />
</span></span></span> 
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;font-size:14px;">/ 迷你四驱车体验区 /</span></strong> 
</p>
<p>
    <br />
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;">除了看点十足紧张刺激的专业赛事，迷你四驱车专区还会开设</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">观众体验区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;">观众可使用现场工作人员提供的免费迷你四驱车车辆跑赛道，还可选择在现场购买迷你四驱车，由专业人员进行指导组装、答疑解惑。</span> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">迷你四驱车体验通道</span><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">娱乐体验区/专业比赛区。</span>
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210915/20210915163228_60262.png" alt="" /><br />
</span>
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;background-color:#0052FF;font-size:14px;color:#FFFFFF;"> 体验区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">对迷你四驱车感兴趣的朋友们可直接到现场活动专区参与体验，现场提供轨道试车，无需报名费。</span><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">另，现场有迷你四驱车售卖区，购买后有安装问题可请教现场工作人员；</span> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><br />
</span> 
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;background-color:#0052FF;color:#FFFFFF;"> 专业区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">专业选手可添加客服微信</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;color:#D92142;">njaykk</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">报名参赛，报名费用100元/4次。（加好友时请备注信息：迷你四驱）</span> 
</p','http://www.njae.net/Public/Uploads/21-01/612df0f72c919.jpg','郑州');
insert into activity values
(null,'迷你四驱车','<p style="color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">TA从诞生的那天起，就以<strong>仿真、新颖的外型、强大的动力，闪电般的速度</strong>，吸引成千上万的青少年。</span><span style="font-family:Optima-Regular, PingFangTC-light;">一部《四驱兄弟》动漫更是成为80后、90后的集体记忆。</span><span style="font-family:Optima-Regular, PingFangTC-light;">从简单的拼装，到技术性的改造；从普通的贴纸，到艺术性的喷漆；从慢速跑完一圈的基础要求，到飞速竞争第一的对抗；无一不令人着迷。</span> 
</p>
<p>
    <br />
</p>
<p style="background:white;text-indent:21pt;">
    <span style="font-size:16px;"><span style="line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img alt="" src="http://www.njae.net/Public/Kindeditor/attached/image/20210830/20210830193533_35529.png" /></span></span></span> 
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p style="text-align:left;">
    <span style="color:#003399;font-size:14px;"><strong>/ 迷你四驱车专业赛事 /</strong></span> 
</p>
<p style="text-align:left;">
    <span style="color:#003399;font-size:14px;"><strong><br />
</strong></span> 
</p>
<div style="text-align:center;">
    <p style="text-align:left;color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">在今年十一车展的现场，北京国际车展主办方联合</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">北京LPT迷你四驱车俱乐部</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">，在现场为广大车友打造迷你四驱车专区，如果你也是一名迷你四驱车文化爱好者的话，千万不要错过哟。</span> 
        </p>
<p style="text-align:left;color:#333333;font-family:-apple-system, BlinkMacSystemFont, " font-size:14px;background-color:#ffffff;"=""> <span style="font-family:Optima-Regular, PingFangTC-light;">值得期待的是：</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">2021發利隆杯田宫迷你四驱车世界挑战赛中国区选拔赛-北京站</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;">落地车展现场，最终的冠军选手还将代表中国参加今年在日本举行的世界杯。如此重磅赛事加持，必将掀起北京车友们的又一波热情。</span> 
    </p>
    <div style="text-align:left;">
        <br />
    </div>
</div>
<p>
    <br />
</p>
<p style="background:white;text-align:center;text-indent:21pt;">
    <span style="font-size:16px;"><span style="line-height:2;font-family:微软雅黑;"><span style="font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210908/20210908113624_50592.jpg" alt="" /><br />
</span></span></span> 
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;font-size:14px;">/ 迷你四驱车体验区 /</span></strong> 
</p>
<p>
    <br />
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;">除了看点十足紧张刺激的专业赛事，迷你四驱车专区还会开设</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;color:#021EAA;">观众体验区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;">观众可使用现场工作人员提供的免费迷你四驱车车辆跑赛道，还可选择在现场购买迷你四驱车，由专业人员进行指导组装、答疑解惑。</span> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">迷你四驱车体验通道</span><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">娱乐体验区/专业比赛区。</span>
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><img src="http://www.njae.net/Public/Kindeditor/attached/image/20210915/20210915163228_60262.png" alt="" /><br />
</span>
</p>
<p style="background:white;text-indent:21pt;">
    <br />
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;background-color:#0052FF;font-size:14px;color:#FFFFFF;"> 体验区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">对迷你四驱车感兴趣的朋友们可直接到现场活动专区参与体验，现场提供轨道试车，无需报名费。</span><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">另，现场有迷你四驱车售卖区，购买后有安装问题可请教现场工作人员；</span> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;"><br />
</span> 
</p>
<p>
    <strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;background-color:#0052FF;color:#FFFFFF;"> 专业区：</span></strong> 
</p>
<p>
    <span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">专业选手可添加客服微信</span><strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;color:#D92142;">njaykk</span></strong><span style="font-family:Optima-Regular, PingFangTC-light;font-size:14px;">报名参赛，报名费用100元/4次。（加好友时请备注信息：迷你四驱）</span> 
</p','http://www.njae.net/Public/Uploads/21-01/612df0f72c919.jpg','北京');



#表8数据
INSERT into news VALUES(1,'2021烟台冬季惠民车展将延期举办','https://image.chezhanri.com/2021/1129/e88d1f7e9a2fa390f52eabaae2ebe517.jpeg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>2021烟台冬季惠民车展将延期举办</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：为保障参展商和观众的健康和安全，最大程度确保展会效果，鉴于当前部分城市疫情的不确定性，主办方经审慎考虑并与主管部门商议后决定:原定于2021年12月10-12日举办的“2021烟台冬季惠民车展”延期至12月17-19日举办，地点不变：烟台国际博览中心。
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">
            为保障参展商和观众的健康和安全，最大程度确保展会效果，鉴于当前部分城市疫情的不确定性，主办方经审慎考虑并与主管部门商议后决定:原定于2021年12月10-12日举办的“2021烟台冬季惠民车展”延期至12月17-19日举办，地点不变：烟台国际博览中心。
          </p>
          <p style="text-indent: 2em">
            届时，我们将与各大品牌方保持紧密沟通，保障展会整体参展效果，更加丰富展出品牌，切实为广大的消费者打造集钜惠购车、服务便捷的汽车盛会。
          </p>
          <p align="center"><strong>关于2021烟台年末汽车惠民促销展举办时间的通知</strong></p>
          <p>尊敬的各参展商、相关单位及各界观众：</p>
          <p style="text-indent: 2em">
            原定于2021年12月10-12
            日在烟台国际博览中心举办的“2021烟台年末汽车惠民促销展”因疫情原因延期举办，延期至2021年12月17日-19日。此时间是商会与政府相关部门反复沟通后确定的时间，望各参展单位积极调整配合。
          </p>
          <p style="text-indent: 2em">因新冠肺炎疫情的因素，导致展会时间延期，由此给您造成的诸多不便，我们深表歉意！</p>
          <p style="text-indent: 2em">特此通知！</p>
          <p align="right">烟台市汽车商会</p>
          <p align="right"><span style="text-indent: 2em">烟台国际会展文化产业有限公司</span></p>
          <p align="right"><span style="text-indent: 2em">2021年11月25日</span></p>
          <p style="text-indent: 2em"><br /></p>
          <p>
            <img src="https://image.chezhanri.com/2021/1129/e88d1f7e9a2fa390f52eabaae2ebe517.jpeg" alt="烟台冬季惠民车展延期" />
          </p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT into news VALUES(2,'第十九届广州国际汽车展览会圆满闭幕','https://image.chezhanri.com/2021/1129/cbd9c07ae290c1d71eece21f07119b37.jpeg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>第十九届广州国际汽车展览会圆满闭幕</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：2021年11月28日，第十九届广州国际汽车展览会（下称“广州汽车展”）圆满落下帷幕。本届广州汽车展在国内外企业的倾情参与下，在社会各界的大力支持下取得了圆满成功。历时十天的展会共吸引到观众78.5万人次。车展期间共举办92场新闻发布会，9418名记者参与报道了展会盛况，其中包括全球各大新闻机构的驻华记者。
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">
            2021年11月28日，第十九届广州国际汽车展览会（下称“广州汽车展”）圆满落下帷幕。在全球疫情持续不断及各大国际车展接连取消或者延期的背景下，广州汽车展成为了全世界范围内唯一连续两年如期举办的国际A级车展。本届广州汽车展在国内外企业的倾情参与下，在社会各界的大力支持下取得了圆满成功。历时十天的展会共吸引到观众78.5万人次。车展期间共举办92场新闻发布会，9418名记者参与报道了展会盛况，其中包括全球各大新闻机构的驻华记者。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1129/cbd9c07ae290c1d71eece21f07119b37.jpeg" alt="广州国际车展" /></p>
          <p style="text-indent: 2em">
            作为全球最大汽车市场上的年度收官之作、“中国汽车市场发展风向标”展会的广州汽车展，吸引到了来自全球车企和汽车媒体的目光。以“新科技、新生活”为主题，广州汽车展持续向业界传递新理念，向市场展示新产品，为中国汽车产业启迪新方向。
          </p>
          <p style="text-indent: 2em"><strong>中国品牌迎来高光时刻</strong></p>
          <p style="text-indent: 2em">
            本届广州汽车展上发布的54台全球首发车中，中国品牌全球首发车高达47台；展出的28台概念车中，中国品牌展车19台；在展出的241台新能源车中，中国品牌更是高达153台。中国汽车工业经过了数十年的筚路蓝缕、披荆斩棘，中国品牌从以市场换技术到以技术造市场，从借鉴追赶到创新引领，在本届广州汽车展上迎来了高光时刻。在品牌战略方面，中国车企纷纷推出高端豪华品牌，上行进攻高端市场；在产品规划方面，中国品牌以质促量，不断下放前沿车辆技术，持续提升产品力。坐拥主场优势的中国车企，携全系列产品高规格参展广州汽车展，在全球首发车、概念车、新能源车三项具有重要代表意义的数据上，中国车企展现出了前所未有的巨大优势，在中国这个世界上体量最大、竞争最激烈的汽车竞技场中大放异彩。
          </p>
          <p style="text-indent: 2em"><strong>新能源车从概念走向普及</strong></p>
          <p style="text-indent: 2em">
            本届广州汽车展共展出车辆1020台，其中国内外参展车企共展出新能源车241台，占全部展车总数的23.6%，与上一届展出的142台新能源车相比，增长了69.7%。在本届展会上，新能源车造车新势力企业，在经过数年的技术积累和市场开发后，大举推出全新车型，持续丰富产品线；跨国车企则谋定而动，纷纷将技术积累转化为市场产品，推出新能源车系列车型；中国品牌则不断创新上行，以全新的品牌和产品抢占市场。十月份最新统计数据显示，新能源车产销继续刷新记录，分别达到39.7万辆和38.3万辆，同比增长1.3倍。1-10月，新能源车产销分别完成256.6万辆和254.2万辆，同比均增长1.8倍。新能源车市场渗透率继续维持历史高位，达到16.4%。新能源车及配套充电技术产品在本届广州汽车展上受到行业的高度关注，以纯电驱动为主流，插电式及增程式混合动力与燃料电池动力为辅助的“三驾马车”将成为中国乃至全球汽车产业转型升级的新动力。
          </p>
          <p style="text-indent: 2em"><strong>智能网联产业链逐渐成型</strong></p>
          <p style="text-indent: 2em">
            在本届广州汽车展上，全球车企齐聚羊城，展示世界汽车工业的创新发展成果，全面展现汽车与5G技术、移动互联、人工智能、大数据、云计算等前沿科技的深度融合。整车企业纷纷推出了装载固态激光雷达、超高清摄像头、毫米波雷达、长距超声波传感器等智能网联装备的车型。各大展台上也展出了包括智能座舱、智能汽车操作系统、自动驾驶解决方案、视觉交互、人脸识别、语音人工智能、实景抬头显示、智能穿戴设备互联等前沿车辆技术。在户外场地上，如祺出行将集智能网联技术之大成的自动驾驶车辆带到了现场供观众进行实乘体验。自动驾驶车辆的落地上路，标志着围绕自动驾驶的智能网联产业链正在逐渐形成，智能网联产品已然进入了全面发展的新阶段，新的变革时代将再次拉开帷幕。
          </p>
          <p style="text-indent: 2em"><strong>场景式互动体验成为展览新模式</strong></p>
          <p style="text-indent: 2em">
            随着我国经济发展模式进入新时代，各行各业都进入了转型升级的发展轨道。广州汽车展紧贴时代新趋势，不断创新展览模式。在本届展会上，参展企业纷纷创新展示形式，在展品设计方面，贴合市场潮流，推出动漫、游戏、机甲、运动、美妆、梦幻、童趣等个性化主题产品，更有企业将战斗机带到了展会现场；在展示方式方面，打造宇宙空间站、户外露营、电玩竞技、公路旅行、轻奢休闲、怀旧复古、潮玩小店等时尚生活场景，为观众带来沉浸式的观展体验。丰富多彩的同期活动也让广州汽车展成为了年度最盛大的汽车嘉年华，更是一个大型汽车主题公园。
          </p>
          <p style="text-indent: 2em"><strong>助力国际消费中心城市建设</strong></p>
          <p style="text-indent: 2em">
            在“十四五”时期加快构建以国内大循环为主体、国内国际双循环相互促进新发展格局的大背景下，广州作为唯一一个非直辖城市，于今年七月入选中国首批国际消费中心城市，充分突显广州作为“千年商都”，在促进国内经济发展、国际文化交流方面的重要作用和政治地位。汽车产业作为我国支柱产业，在新时代既肩负着科技创新及应用的桥头堡作用，又担负着提振消费促进经济发展的重要使命。从本届车展超预期的观众人数上可以看出，作为中国三大国际车展的广州汽车展，已然成为助力中国消费中心城市建设的重要平台。
          </p>
          <p style="text-indent: 2em"><strong>严格执行疫情防控措施</strong></p>
          <p style="text-indent: 2em">
            广州汽车展在国内疫情多点散发的背景下举办，组委会高度重视展会疫情防控工作，严格遵照《广州市展览活动新冠肺炎疫情常态化防控操作指引》落实疫情防控措施。展会筹备期间，由政府相关管理部门、主办单位、承办单位及展会服务机构共同组建了疫情防控联席会议机构，制定了完善的疫情防控方案和应急预案，实行了由主办方、展馆方、服务商、参展商共同参与的联防联控责任机制。展会举办期间，坚决贯彻“身份必录、绿码必查、体温必测、口罩必戴、消毒必做、突发必处”的“六必原则”。展会现场设置驻场核酸检测点，对省外非中高风险地区工作人员实施三天两检制度，并向有需要的与会人员提供检测服务。组委会专设疫情防控工作小组，在展会期间密切关注全国疫情发展，及时更新中高风险地区名单，根据疫情变化动态调整防控措施，做到既全方位落实疫情防控工作，又为展商和观众提供便捷的参展服务和良好的观展环境。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1129/961f64f1db9695b67dfbd62bc5736fcc.jpeg" alt="广州国际车展" /></p>
          <p style="text-indent: 2em">
            第十九届广州国际汽车展在全球疫情依然持续、国内疫情多点散发的不利环境下成功举办，无论是对于全球汽车行业的发展、还是对中国经济社会的发展，都有着极其重要的意义。广州汽车展作为广州最重要的城市名片之一，本届展会的成功举办，既向国际社会展示了中国抗疫成果以及中国汽车产业的发展成果，又向全世界展现了中国经济逆风而起的强大韧劲以及中国对外打开市场的大国胸襟和对内驱动消费的强大内生能力，更向全球汽车产业传递出了积极的信号和坚定的信心。2021年是“十四五”开局之年，中国经济社会发展将继续由高速发展向高质量发展推进，一个全新的时代正在开启。
          </p>
          <p style="text-indent: 2em">
            第二十届广州国际汽车展览会将于2022年11月18日至27日（11月18日为媒体日）在广交会展馆举办，我们期待与业界共同见证新时代，创造新辉煌。
          </p>
          <p style="text-indent: 2em"><strong>关于广州国际汽车展览会</strong></p>
          <p style="text-indent: 2em">
            广州国际汽车展览会创办于2003年，是由中国对外贸易中心、中国机械工业联合会、中国国际贸易促进委员会汽车行业分会、中国汽车工业协会联合主办，广州展联展览服务有限公司承办的高品质、国际化、综合性大型车展。展会以“新科技、新生活”为主题，每年一届，固定于十一月份在广交会展馆举办。
          </p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT into news VALUES(3,'一年一度 岁末狂欢 2021第十四届东盟国际车展11月25日开幕','https://image.chezhanri.com/2021/1125/01b8d850cdb0e40d994e6c5ef22b7682.jpg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>一年一度 岁末狂欢 2021第十四届东盟国际车展11月25日开幕</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：2021第十四届中国-东盟（南宁）国际汽车展览会暨新能源&智能汽车展|房车露营展（简称：2021东盟国际车展），将于11月25日在南宁国际会展中心盛大开幕。
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">
            由中国-东盟博览会秘书处、武汉尚格会展股份有限公司主办，南宁尚格会展服务有限公司、上海尚格会展有限公司承办，南宁市商务局支持的2021第十四届中国-东盟（南宁）国际汽车展览会暨新能源&amp;智能汽车展|房车露营展（简称：2021东盟国际车展），将于11月25日在南宁国际会展中心盛大开幕。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1125/32ab6b676521230b9b44bc3e16d43e25.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em">
            始于2008年，东盟国际车展已成功在南宁连续举办十三届。13年的品牌沉淀，见证了广西汽车行业的发展与交通出行的变迁，跃居成为华南地区三大汽车专业展览会之一。
          </p>
          <p style="text-indent: 2em"><strong>选购</strong></p>
          <p style="text-indent: 2em"><strong>近90品牌千款车型任选</strong></p>
          <p style="text-indent: 2em">
            作为广西一年一度大车展，2021东盟国际车展将启用南宁国际会展中心D区1、2层室内展馆及外广场，近90个全球知名汽车品牌参展，预计展出面积近8万平米。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1125/01b8d850cdb0e40d994e6c5ef22b7682.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em"><strong>以下为参展品牌明细：</strong></p>
          <p style="text-indent: 2em">
            <strong>豪华品牌：</strong
            >宾利、保时捷、法拉利、玛莎拉蒂、奔驰、宝马、奥迪、捷豹、路虎、林肯、沃尔沃、凯迪拉克、英菲尼迪、斯巴鲁、进口大众
          </p>
          <p style="text-indent: 2em">
            <strong>合资品牌：</strong
            >一汽丰田、东风悦达·起亚、广汽本田、广汽丰田、广汽三菱、东风本田、北京现代、Jeep、长安福特、上汽大众、长安马自达、东风日产、郑州日产、雪佛兰、斯柯达、一汽大众、捷达、江铃福特、东风雪铁龙、东风标致、别克
          </p>
          <p style="text-indent: 2em">
            <strong>自主品牌：</strong
            >红旗、比亚迪、WEY、坦克、领克、五菱、宝骏、北京汽车、广汽传祺、哈弗、长城炮、吉利、名爵、奇瑞、东风风行、星途、江西五十铃、长安汽车、启辰、东风风神
          </p>
          <p style="text-indent: 2em">
            <strong>新能源品牌：</strong
            >欧拉、理想、小鹏汽车、零跑汽车、雷丁汽车、哪吒汽车、广汽埃安、天际汽车、大运新能源、几何汽车、威马汽车、东风新能源、思皓新能源、合创新能源、五菱新能源、宝骏新能源、比亚迪新能源、宝马新能源、上汽大众新能源、一汽大众新能源、奇瑞新能源
          </p>
          <p style="text-indent: 2em"><strong>平行进口车：</strong>道之星名车、博奥名车</p>
          <p style="text-indent: 2em"><strong>房车品牌：</strong>华一星旺房车、瑞豪居房车、大通房车、帝盛房车</p>
          <p style="text-indent: 2em">
            <strong>摩托车品牌：</strong
            >杜卡迪、宝马、奥古斯塔、本田、QJMOTO、川崎、庞巴迪、KTM、Vespa、胡思瓦娜、莫里尼、意塔杰特
          </p>
          <p style="text-indent: 2em">仅供参考，实际以现场为准</p>
          <p style="text-indent: 2em">
            2021东盟国际车展深度挖掘汽车消费需求，集中展示乘用车、商用车、商务车、新能源车、房车、机车和二手车等，充分满足市民的工作和出行需求。
          </p>
          <p style="text-indent: 2em">
            值得一提的是，2021东盟国际车展特别设立豪车专区、新能源专馆、广汽集团专馆、房车专区和机车展示区，市民根据需求提前制定观展路线，省时又省力。同时，组委会联合T3出行提供地铁口往返免费接送服务，市民可根据需求选择乘坐。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1125/ddbbd9cf5e6fc9c0570b475f280d61c8.jpg" alt="东盟国际车展" /></p>
          <p><img src="https://image.chezhanri.com/2021/1125/ce67c9eca04a5d50f8a03e7a728a732b.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em"><strong>抢购</strong></p>
          <p style="text-indent: 2em"><strong>数十款新车抢鲜上市发布</strong></p>
          <p style="text-indent: 2em">
            尽管受“缺芯”影响明显，但这并没有阻碍汽车品牌上新的势头。2021东盟国际车展作为区域车市风向标式的汽车品牌盛会，宾利添越S、哈弗神兽、广汽本田型格、东风本田英仕派、一汽丰田凌放、广汽丰田赛那、长安福特EVOS、广汽传祺GS8、领克09、东风风神奕炫max、奇瑞新能源小蚂蚁甜粉款等数十款新车将重磅首发，广西市民不用出远门，也能在家门口的车展一睹新车风采。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1125/db6f9487705e237b47a4e3b9773b955a.jpg" alt="东盟国际车展" /></p>
          <p><img src="https://image.chezhanri.com/2021/1125/5db43d023c4edc3e6559766aee3471eb.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em">
            届时，汽车品牌厂家、区域将会亲临现场为品牌新车站台，部分品牌还会邀请广州国际车展原班模特团队亮相车展现场，厂家政策、厂家车模、热辣舞蹈和互动有礼，新车控们幸福感拉满。
          </p>
          <p style="text-indent: 2em">多品牌角逐，谁将一举拿下销售开门红，抢占广西汽车消费市场，让我们拭目以待。</p>
          <p style="text-indent: 2em"><strong>惠购</strong></p>
          <p style="text-indent: 2em"><strong>百款特价车，单款优惠过万</strong></p>
          <p style="text-indent: 2em">
            2021东盟国际车展90%以上汽车品牌厂家高规格展具参展，各品牌厂家铆足劲促销，制定车展专属优惠政策，现金直降、置换补贴以及购车礼包等方面全力出击，力求通过岁末最后一场大车展，提前完成全年销售目标。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1125/5a15aae678200f3719c98f9c7da6b4fb.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em">
            特价车方面，WEYVV7 Gt
            现金优惠3万元，长安马自达MAZDACX-8现金优惠6万元，东风本田插电混动CR-V综合优惠5万元，红旗H9综合优惠3.5万元等。
          </p>
          <p style="text-indent: 2em">
            置换补贴方面，广汽传祺指定车型置换补贴至高1万元，比亚迪置换补贴至高2万元，北京汽车置换补贴至高1.5万元，东风本田二手车置换补贴至高1万元等等。
          </p>
          <p style="text-indent: 2em"><strong>嗨购</strong></p>
          <p style="text-indent: 2em"><strong>购车抽盲盒，多重福利叠加</strong></p>
          <p style="text-indent: 2em">在2021东盟国际车展现场买车先别急着走，多重购车福利叠加不容错过。</p>
          <p style="text-indent: 2em">
            汽车品牌展台每天都会安排车模走秀和互动活动，参与互动即有惊喜大礼，现场订车即享订车大礼包。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1021/bd6d7a22eee606cccbece2de907599cd.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em">
            汽车品牌给力，车展组委会更豪气。现场购车市民可前往组委会活动处参与购车抽盲盒活动，大冰箱、大牌手机、毛毯、乳胶枕、厨具等礼品任抽。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1112/d7b21b47d4ae618835f45d90370513d7.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em">仅供参考，以实际为准</p>
          <p style="text-indent: 2em">此外，车贷金融专区也有惊喜，现场成功办理车贷分期，也可以领取各个银行准备的分期礼。</p>
          <p style="text-indent: 2em"><strong>乐购</strong></p>
          <p style="text-indent: 2em"><strong>欢乐消费季，万元购车补贴</strong></p>
          <p style="text-indent: 2em">
            2021东盟国际车展作为岁末收官之战，同时也是2021南宁欢乐消费季汽车主会场，紧密结合国家、自治区政府、商务主管部门的汽车促消费政策，车展组委会整合汽车品牌厂家、区域，金融机构以及异业合作等多方资源，一起瓜分千万优惠。
          </p>
          <p style="text-indent: 2em">
            与此同时，车展组委会还推出寻找车展锦鲤，送出万元现金购车补贴。线上参与活动，中奖人凭车展门票入场，在车展现场购车并登记，可获得组委会送出的10000元现金购车补贴。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1112/9bbe8c28db1f2d2750ce016d351795be.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em"><strong>欢购</strong></p>
          <p style="text-indent: 2em"><strong>车展潮玩季6大主题活动</strong></p>
          <p style="text-indent: 2em">
            2021东盟国际车展紧密结合尚格会展“重塑增长合能未来“的全年战略部署，围绕“车界潮玩＋”主题，打造一系列潮玩互动场景，让市民一站式地体验最新潮汽车生活方式。
          </p>
          <p style="text-indent: 2em"><strong>潮玩街区：</strong></p>
          <p style="text-indent: 2em">非遗文化体验、魔力套圈圈、网红场景街拍等精彩互动活动等你来参与。</p>
          <p><img src="https://image.chezhanri.com/2021/1125/a736bd791265de68f720deb033ebd1a3.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em"><strong>潮玩大舞台：</strong></p>
          <p style="text-indent: 2em">战马街舞邀请赛、东盟少儿才艺大赛、潮童秀、最受关注车型评选等。</p>
          <p><img src="https://image.chezhanri.com/2021/1112/f5acbdcda527f8cd377a89ee6ec3ae9b.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em"><strong>潮人带你看车展：</strong></p>
          <p style="text-indent: 2em">
            广西电台、南宁电台、新浪潮人、抖音达人、车界老司机等各界红人主播，会通过直播平台带你看车展。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1119/edfe02661d9863d48c6a0515c1431108.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em"><strong>2021金融购车节：</strong></p>
          <p style="text-indent: 2em">
            建设银行、中国银行、农业银行、招商银行、交通银行等多家金融机构为购车用户提供一站式车贷金融服务，圆您新车梦。
          </p>
          <p style="text-indent: 2em"><strong>潮牌活动：</strong></p>
          <p style="text-indent: 2em">
            近90潮牌将举办数十场新车上市发布会，每隔半小时一场模特走秀，参与展台互动活动还有好礼相送。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1125/479c582bc090af5ab12173205cefeb90.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em"><strong>潮车专区：</strong></p>
          <p style="text-indent: 2em">痛车、房车、机车，潮玩有FUN，带你解锁车展新玩法。</p>
          <p><img src="https://image.chezhanri.com/2021/1119/f90b9287400195f1bfcd907fd49b64d8.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em">
            岁末购车，就选东盟国际车展。11月25-29日，南宁国际会展中心，2021十四届东盟国际车展邀您共赴这场年度车市盛宴。
          </p>
          <p style="text-indent: 2em"><strong>附：观展攻略</strong></p>
          <p style="text-indent: 2em"><strong>Exhibition strategy</strong></p>
          <p style="text-indent: 2em"><strong>展位图</strong></p>
          <p><img src="https://image.chezhanri.com/2021/1125/d86a052c7dddff6385320e3b7e89c2c0.jpg" alt="东盟国际车展" /></p>
          <p style="text-indent: 2em">观众入场须知</p>
          <p style="text-indent: 2em">观展4件套：智能手机+口罩+身份证原件+门票</p>
          <p style="text-indent: 2em">*文中图片均为历届尚格车展现场实拍图，如有侵权，请联系删除，谢谢！</p>
          <p style="text-indent: 2em">2021第十四届东盟国际车展</p>
          <p style="text-indent: 2em">11月25-29日&nbsp; 南宁国际会展中心</p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT INTO news VALUES (4,'2021吉首大车展完美收官！成交1103台！销售额1.53亿!','https://image.chezhanri.com/2021/1123/d4306f1074872db3e95a8d73f6f4d0d9.jpg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>2021吉首大车展完美收官！成交1103台！销售额1.53亿!</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：11月22日下午，为期4天的【湘西比亚迪】2021吉首大车展活动在张吉怀高铁吉首东站完美收官。本次车展共销售车辆1103台，销售额1.53亿元，预计实现税收1500万元。
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">
            11月22日下午，为期4天的【湘西比亚迪】2021吉首大车展活动在张吉怀高铁吉首东站完美收官。本次车展共销售车辆1103台，销售额1.53亿元，预计实现税收1500万元。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/6d3e54bd36c8aa3a94fc5a2f35596fa9.jpg" alt="吉首大车展" /></p>
          <p style="text-indent: 2em">
            本次吉首车展参展商家38家，参展品牌47个，其中自主品牌23个、合资品牌17个、新能源品牌7个，展示车型200多台，满足了不同消费者的购车需求，不少市民远道而来，冒雨看车，试乘各类车型，争先体验最新汽车科技。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/359bc2931f4ccac2e107898af7426f32.jpg" alt="吉首大车展" /></p>
          <p style="text-indent: 2em">
            本届吉首车展是张吉怀高铁吉首东站建成后开展的首个大型活动，也是2021（第十四届）中国名城汽车巡展吉首站的活动。活动规模大、亮点多。吉首市出台了购车享1000元/台惠民补贴。组委会推出了观展免费公交，打造惠民车展；通过开展助力车展5.8折抢油卡，打卡车展瓜分万元红包，看直播车展领福利，打造互动车展。现场通过变形金刚展示、炫酷车技表演，打造人气车展。同时，汽车销售行业积极抱团取暖、厂家大力支持，打造惠民车展，经销商在汽车厂家的大力支持下推出了一系列的优惠和金融政策。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/b56d4af8ea4544b44a466dd86f54c1bb.jpg" alt="吉首大车展" /></p>
          <p style="text-indent: 2em">
            本届车展以“高铁喜圆梦&nbsp;
            汽车惠加速”为主题，遵循“政府搭台、企业唱戏、百姓受益”的理念，积极搭建优质的展示、交易平台，充分调动了全媒体宣传资源，营造良好的汽车消费氛围。推动我州汽车贸易行业消费稳定增长和会展经济的快速发展，达到促进消费、稳岗就业、产业升温、提振经济的目的。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/ff6084071ded235ac545b345d80dce6a.jpg" alt="吉首大车展" /></p>
          <p style="text-indent: 2em">
            据统计，本次车展合资品牌销量前十的依次是东风日产、别克、广汽丰田、上汽大众、雪佛兰、北京现代、一汽丰田、宝马、福特、起亚。而自主品牌销售前十分别为：红旗、比亚迪、吉利、长安、魏派、五菱、广汽传祺、奇瑞、江铃、荣威。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/dabe2a03fddef0a1df6b317a026de50b.jpg" alt="吉首大车展" /></p>
          <p style="text-indent: 2em">
            今年9月，湘西州第十二次党代会确立了“三区两地”发展定位和“五个湘西”主攻方向，吹响了“跑好全面建设现代化新湘西‘第一棒’”的号角。吉首大车展的成功举办，也是坚决贯彻落实州党代会精神、加快建设现代化新吉首的有力行动。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/d4306f1074872db3e95a8d73f6f4d0d9.jpg" alt="吉首大车展" /></p>
          <p style="text-indent: 2em">
            2021吉首大车展由中共吉首市委、市人民政府、湘西州商务局主办；吉首市商务局、吉首市工商联、湘西州汽车销售服务商会承办；吉首经济开发区管委会、吉首市腾达经济建设投资有限责任公司协办；湘西永晟比亚迪4S店总冠名；湘西华锋福特4S店分冠名；湘西州凤飞文化传媒（湘西生活网）、湘西汽车网、翼启车展策划执行。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/06756c6a9bdea8b04a9292befde920cf.jpg" alt="吉首大车展" /></p>
          <p><img src="https://image.chezhanri.com/2021/1123/fed212567e9d0184ea6e397ba6eaa8fa.jpg" alt="吉首大车展" /></p>
          <p><img src="https://image.chezhanri.com/2021/1123/c7bd5f9c5bd5f38426cee9650de6c1a1.jpg" alt="吉首大车展" /></p>
          <p><img src="https://image.chezhanri.com/2021/1123/324b6b1893a81707647f004fb5376470.jpg" alt="吉首大车展" /></p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT into news VALUES(5,'2021百色第十九届汽车交易会圆满落幕!','https://image.chezhanri.com/2021/1123/b47b01bebaad9990e0f832e33a3ebf7e.jpg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>2021百色第十九届汽车交易会圆满落幕!</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：11月21日，2021百色第十九届汽车交易会在百色市体育中心圆满落幕！第十九届汽车交易会作为2021年下半年的汽车消费主场，各品牌纷纷让新车亮相，在历时3天的车展中累计成交426台。
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">11月21日，2021百色第十九届汽车交易会在百色市体育中心圆满落幕！</p>
          <p><img src="https://image.chezhanri.com/2021/1123/3e4ec199fc36dc415da3d7dc27639962.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            本届百色汽车交易会由百色市商务局、百色市右江区人民政府主办，右江商务中心、百色市联润汽贸园、百色市汽车经销商协会承办，并得到了百色电视台、百色广播电台、今日头条、抖音、腾讯网、百度网、懂车帝、汽车之家和易车网的大力支持。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/5cbacd4ba8ac1bb0d090b1fcdfebba59.jpg" alt="百色汽车交易会" /></p>
          <p><img src="https://image.chezhanri.com/2021/1123/2f424447bf5f0e874297e3fc54f02184.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            第十九届汽车交易会作为2021年下半年的汽车消费主场，各品牌纷纷让新车亮相，在历时3天的车展中累计成交426台。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/b47b01bebaad9990e0f832e33a3ebf7e.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            围绕“拥抱，车生活”的主题，交易会组委会开拓全新互动模式，准备了超市大赢家、真人娃娃机、儿童周末大富翁“联润之旅”、“联润杯”王者荣耀争霸赛等活动。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/e90bdd1e9a899476e442b3e7f4ab56ce.jpg" alt="百色汽车交易会" /></p>
          <p><img src="https://image.chezhanri.com/2021/1123/986016d0d1b4ff8677ff779d530a3303.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            除此之外，汽车交易会承办方还与异业合作，推出了爵士舞、瑜伽舞、少年中国舞、钢管舞、架子鼓、模特走秀等表演。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/7e0b2c63a06c7837f04f2eb7535a371a.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            此次汽车交易会积极引导各大参展商开展促销活动，努力满足参展顾客的汽车消费需求，刺激汽车行业消费持续回暖，推动广西汽车行业稳步向前。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/531ed2d0d13804315a9a18ca5e72a47c.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">感谢每一家参展商</p>
          <p style="text-indent: 2em">一直以来对本届汽车交易会的鼎力支持</p>
          <p style="text-indent: 2em">感谢每一位顾客朋友</p>
          <p style="text-indent: 2em">一直以来对我们的热情捧场</p>
          <p style="text-indent: 2em">明年再会！</p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT into news VALUES(6,'第30届泉州国际车展圆满收官，明年五一再见！','https://image.chezhanri.com/2021/1123/630f34ed047a4bed6550861e9c52cc0d.jpg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>第30届泉州国际车展圆满收官，明年五一再见！</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：2021年11月14日，由晋江市人民政府、泉州晚报社支持，晋江市贸促会和泉州汽车同业协会主办，泉州市环亚展览策划有限公司承办的第30届泉州国际车展，在晋江国际会展中心圆满落幕！
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">
            欢乐的时光总是过得特别快，为期4天的第30届泉州国际车展已经圆满落下帷幕。车展期间亮点多多，精彩瞬间随即奉上，让我们一起回顾一下吧！
          </p>
          <p style="text-indent: 2em">
            2021年11月14日，由晋江市人民政府、泉州晚报社支持，晋江市贸促会和泉州汽车同业协会主办，泉州市环亚展览策划有限公司承办的第30届泉州国际车展，在晋江国际会展中心圆满落幕！
          </p>
          <p style="text-indent: 2em"><strong>值得信赖的品牌车展</strong></p>
          <p style="text-indent: 2em">
            作为本年度泉州地区高端车展的收官之战，第30届泉州国际车展助力汽车品牌实现产品曝光及销量突破，对泉州汽车行业贸易交出一份亮眼的成绩单。“看车、买车就去泉州国际车展”，
            “花更少的钱，买更好的车”也逐渐成为多年流传下来的口碑。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/c1bd510d0f913b8aab0a1139cb1e83c7.jpg" alt="泉州国际车展" /></p>
          <p style="text-indent: 2em"><strong>实实在在的购车优惠</strong></p>
          <p style="text-indent: 2em">
            第30届泉州国际车展延续了往届高规格、高标准的办展理念，国内众多主流汽车品牌纷纷参展，经销商从厂家申请了高标准展具，为参展车辆提供了全新的展示舞台。虽然受芯片短缺影响，但各品牌为了年终销量增长，都制定了相应的优惠政策来进行展销，斩获了可观的销量和订单，消费者也享受到了实实在在的优惠。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/630f34ed047a4bed6550861e9c52cc0d.jpg" alt="泉州国际车展" /></p>
          <p style="text-indent: 2em"><strong>丰富多彩的车展文化</strong></p>
          <p style="text-indent: 2em">
            除了切实的优惠，车展期间，各大汽车参展商举行了文艺演出、有奖问答、人工智能、互动游戏等形式多样的主题活动。不少展台都请来了外形靓丽的车模，舞台上各具特色的街舞、民族舞、长袖舞吸引了不少观众和摄影爱好者驻足观看、拍照留念。更有电台主持人、汽车网红主播现场“打卡”推介，这些精彩的瞬间也通过微信、抖音、快手等平台进行了全程直播。短短四天，车展活动多多、火爆异常，为市民、车友带来了一场刺激感官的视觉盛宴。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/3391d80f07bacd2c05617b6f0f0d97d4.jpg" alt="泉州国际车展" /></p>
          <p><img src="https://image.chezhanri.com/2021/1123/2448e13054dcdd7edd85c6385e48ac17.jpg" alt="泉州国际车展" /></p>
          <p><img src="https://image.chezhanri.com/2021/1123/1692eec47b5dbd87b8d7ccd5f80bc68f.jpg" alt="泉州国际车展" /></p>
          <p style="text-indent: 2em"><strong>安全舒心的汽车盛会</strong></p>
          <p style="text-indent: 2em">
            经过前期的精心筹备，本届车展服务更加精细化、人性化。组委会严格按照相关防控要求开展活动，严格执行相关要求，详细制定疫情防控工作方案。车展期间，为参（观）展人员免费提供口罩、进行红外测温、全方位消杀、无接触电子门票等一系列有效防控手段，为参展商和观众打造一场精彩、安全、舒心的汽车盛会。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/4980dbd69ac5b2ac4f47fc71adeedd69.jpg" alt="泉州国际车展" /></p>
          <p style="text-indent: 2em">
            车展组委会将继续打造盛大、便捷、安全，集专业性与参与性为一体的体验式国际车展。第31届泉州国际车展，将携手广大汽车厂商和经销商，在五一假期为观众和车迷朋友们带来更多惊喜。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1123/1d91ae4a796d0f41e3434c371eb3f084.jpg" alt="泉州国际车展" /></p>
          <p style="text-indent: 2em">第31届泉州国际车展2022.4.30—5.3，精彩再续...</p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT into news VALUES(7,'百色第十九届汽车交易会盛大开幕！','https://image.chezhanri.com/2021/1119/228f7c1757c2e41407f5ac2b6f3cb388.jpg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>百色第十九届汽车交易会盛大开幕！</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：2021年11月19日，百色第十九届汽车交易会于百色市体育中心盛大开幕！本届百色汽车交易会首次引进新活动和新福利，各大汽车品牌推出了新车型和新折扣，在客户购车、订车后，可以参与“超市大赢家”活动，限时抢货，现场气氛盛况空前。
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">
            为促进右江区汽车消费稳步提升、贯彻落实“冲刺四季度，打好收官战”工作部署，2021年11月19日，百色第十九届汽车交易会于百色市体育中心盛大开幕！
          </p>
          <p><img src="https://image.chezhanri.com/2021/1119/672646453bd2b177cf1705fd93def051.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            本次百色交易会邀请了百色市商务局党组书记局长兰田宁、百色市右江区常委、区人民政府副区长卢灵、百色市小微企业融资担保有限公司董事长林霖、中国华安财产保险股份有限公司百色支公司总经理马庆祥、百色市汽车经销商协会会长黄峰、百色市健稳汽车科技有限公司总经理郭杰以及各品牌参展商和社会各界人士参加开幕式。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1119/7dd07f9c97b4407c4a96610ac7203c9f.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            开幕式上，首先由百色市汽车经销商协会会长黄峰为本次展会致辞，他表示：“2021年是‘十四五’规划的开局之年，是右江区加快经济建设的关键之年。今年以来，右江区政府高度重视汽车行业的销售工作，在今年举办了多次汽车交易会和惠民车展。本届汽车交易会为百色市民提供了品牌更多样、展区更宽大、服务更优质的购车和看车平台，有效解决了百色市民获取汽车信息种类单一、信息渠道狭窄的问题，在2021年的末尾实现‘冲刺四季度，打好收官战’的目标。”随后由百色市右江区常委、区人民政府副区长卢灵先生为本次开幕式做重要讲话，他表示：“去年在政府和各大汽车企业的共同努力下，我区汽车销售行业取得了不错的成绩，本届汽车交易会以‘拥抱，车生活’为主题，旨在进一步释放消费市场潜力，刺激汽车行业消费持续回暖，推动全市消费曲线正增长。”卢灵副区长对本届汽车交易会给予了深切的厚望，他相信在各方积极参与下，本届汽车交易将会成为一届特色鲜明、优质高效的展会。
          </p>
          <table class="table" style="width: 100%" cellpadding="0" cellspacing="0" border="1">
            <tbody>
              <tr>
                <td>
                  <img src="https://image.chezhanri.com/2021/1119/f6f2331b90164563a1bb980c0b3e7f8e.jpg" alt="百色汽车交易会" />
                </td>
                <td>
                  <img src="https://image.chezhanri.com/2021/1119/37dadf0805cbe1b3422443366c3c815d.jpg" alt="百色汽车交易会" />
                </td>
              </tr>
            </tbody>
          </table>
          <p style="text-indent: 2em">
            在两位嘉宾致辞之后，主持人宣布剪彩仪式开始，由百色市商务局党组书记、局长兰田宁、右江区委常委、区人民政府副区长卢灵、百色市小微企业融资担保有限公司董事长林霖、中国华安财产保险股份有限公司百色支公司总经理马庆祥、百色市健稳汽车科技有限公司总经理郭杰、百色汽车流通协会会长黄峰先生上台共同进行剪彩。剪彩仪式上，礼花齐放，礼炮齐响，由百色市商务局党组书记、局长兰田宁宣布百色第十九届汽车交易会开幕！
          </p>
          <p><img src="https://image.chezhanri.com/2021/1119/2e6c155422dcde02c5f84737c1efed46.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            剪彩仪式结束后，开幕式来到了激动人心的神秘国产汽车揭幕式环节，本环节由百色市商务局兰局长、汽车经销商协会会长黄峰先生共同为“红旗H9”揭幕。
          </p>
          <p><img src="https://image.chezhanri.com/2021/1119/228f7c1757c2e41407f5ac2b6f3cb388.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">开幕式最后，由联润汽车公司副总经理李艳带领各领导和嘉宾参观展区。</p>
          <p><img src="https://image.chezhanri.com/2021/1119/9239a0c7cd24101931d5fee54d287384.jpg" alt="百色汽车交易会" /></p>
          <p style="text-indent: 2em">
            一年两届的百色汽车交易会迎来了下半年的战场，百色第十九届汽车交易会肩负着促进汽车市场消费、提升人民生活质量、扶持本地汽车企业、推动全市经济的重要使命。
          </p>
          <p style="text-indent: 2em">
            本届百色汽车交易会首次引进新活动和新福利，各大汽车品牌推出了新车型和新折扣，在客户购车、订车后，可以参与“超市大赢家”活动，限时抢货，现场气氛盛况空前。在展区内还设置了“真人娃娃机”活动区，各种零食在海洋球中等待客户来尽收囊中。王者荣耀争霸赛赛程第一日，开启电竞狂欢，现场路人队与俱乐部电竞选手决战王者峡谷，为最后的冠军之名而战。
          </p>
          <table class="table" style="width: 100%" cellpadding="0" cellspacing="0" border="1">
            <tbody>
              <tr>
                <td>
                  <img src="https://image.chezhanri.com/2021/1119/80e97bcbfa79d3e23d907ab91c748d37.jpg" alt="百色汽车交易会" />
                </td>
                <td>
                  <img src="https://image.chezhanri.com/2021/1119/bcc7766fb63868460bd26ca0f7ab0034.jpg" alt="百色汽车交易会" />
                </td>
              </tr>
              <tr>
                <td>
                  <img src="https://image.chezhanri.com/2021/1119/71395c670ea1964e5ba21c63cefe7f29.jpg" alt="百色汽车交易会" />
                </td>
                <td>
                  <img src="https://image.chezhanri.com/2021/1119/41b270706ff2d1e50b7794a92f3d7a35.jpg" alt="百色汽车交易会" />
                </td>
              </tr>
            </tbody>
          </table>
          <p style="text-indent: 2em">车展还剩最后两天，三两亲朋，四五好友，一起来百色市体育中心畅玩汽车交易会！</p>
          <p style="text-indent: 2em">一观展攻略一</p>
          <p style="text-indent: 2em">入场须知：</p>
          <p style="text-indent: 2em">科学规范佩戴口罩，一人一门票码身份核验</p>
          <p style="text-indent: 2em">公共交通：</p>
          <p style="text-indent: 2em">8路外环;13路;15路;20路;百色-田阳专线</p>
          <p style="text-indent: 2em">自驾出行：</p>
          <p style="text-indent: 2em">导航“百色市体育中心”</p>
          <p id="signupimg"></p>
        </div>
      </div>
      <div class="post-share-options clearfix">
        <div class="pull-left share">
          <div class="social-share text-center mt-2 mb-5" data-initialized="true" data-mode="prepend">
            <a
              href="javascript:"
              class="btn-style-more btn-like"
              data-action="vote"
              data-type="like"
              data-id="13249"
              data-channel="173"
              data-tag="archives"
              ><i class="fa fa-thumbs-up"></i> 点赞(<span>0</span>)</a
            >
            <a
              href="javascript:"
              class="btn-style-more btn-donate"
              data-action="donate"
              data-id="13249"
              data-image="https://image.chezhanri.com/2021/1109/983b47609124895f4da106913869be10.png"
              ><i class="fa fa-cny"></i> 打赏</a
            >
            <a href="javascript:;" class="social-share-icon icon-heart addbookbark"></a>
            <a href="#" class="social-share-icon icon-weibo" target="_blank"></a>
            <a href="#" class="social-share-icon icon-qq" target="_blank"></a>
            <a href="#" class="social-share-icon icon-qzone" target="_blank"></a>
            <a href="#" class="social-share-icon icon-wechat"></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT into news VALUES(8,'2021广州车展：保时捷718 GT4 RS上市','https://image.chezhanri.com/2021/1119/e6766adf64f0808019cd17cb32c26012.jpeg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>2021广州车展：保时捷718 GT4 RS上市</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要： 在2021广州车展上，保时捷718 GT4 RS和718 GT4 RS Clubsport正式上市。其中保时捷718 GT4
            RS的国内售价为157.8万；保时捷718 GT4 RS Clubsport的国内售价为171.0254万元。
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">
            在2021广州车展上，保时捷718 GT4 RS和718 GT4 RS Clubsport正式上市。其中保时捷718 GT4 RS的国内售价为157.8万；保时捷718
            GT4 RS&nbsp;Clubsport的国内售价为171.0254万元。
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/fc8e7d4a8051864ea17fc861b95762bc.jpeg"
              alt="广州车展,保时捷718 GT4 RS"
            />
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/e6766adf64f0808019cd17cb32c26012.jpeg"
              alt="广州车展,保时捷718 GT4 RS"
            />
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/d2dc67adc304b6a08ca3926fa25ce72c.jpeg"
              alt="广州车展,保时捷718 GT4 RS"
            />
          </p>
          <p style="text-indent: 2em">
            而保时捷718 GT4 RS
            Clubsport在外观方面与街道版车型有着几乎一致的空气动力学套件，但作为一款赛车，新车不可避免的配备了前后拖车钩、热熔胎等。同时其悬架与刹车也均是赛道规格的部件，搭配蓝黑搭配的使得新车整体看上去更加战斗。
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/2d32c58e97357f0fa4f5cc1351946933.jpg"
              alt="广州车展,保时捷718 GT4 RS"
            />
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/aae81a7d3e078d78a72774f7be363ca7.jpg"
              alt="广州车展,保时捷718 GT4 RS"
            />
          </p>
          <p style="text-indent: 2em">
            保时捷718 GT4 RS
            Clubsport的内饰就显得更加硬核，由于不需要照顾公路行驶的状况，新车内部几乎被拆空，取而代之的是大量的碳纤维、防滚架以及保护网等。同时，新车还配备了RECARO品牌的赛车座椅、六点式安全带、车内灭火系统以及30.4加仑的赛车油箱等。
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/9d3d70f95e571838c5075337a2844675.jpg"
              alt="广州车展,保时捷718 GT4 RS"
            />
          </p>
          <p style="text-indent: 2em">
            动力方面，保时捷718 GT4 RS Clubsport与街道版无异，搭载来自911
            GT3的4.0L水平对置六缸发动机，最大功率500马力，传动匹配7速PDK双离合变速箱。（文/汽车之家 马艾骏）
          </p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT into news VALUES(9,'2021广州车展：新宝马2系Coupe售29.98万元','https://image.chezhanri.com/2021/1119/3528d7085b99a7fc2ce91767f9de76a2.jpg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>2021广州车展：新宝马2系Coupe售29.98万元</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：2021广州车展正式开幕，全新宝马2系Coupe出现在宝马展台上，这是新车的国内首次亮相，同时，官方还公布了该车的售价：225i
            M运动曜夜套装价格为29.98万元。全新2系今年7月在海外正式发布，它基于宝马CLAR后驱平台打造，是宝马2系自2014年推出以来的首次换代。
          </div>
        </blockquote>
        <div class="text-content">
          <p style="text-indent: 2em">
            2021广州车展正式开幕，全新宝马2系Coupe出现在宝马展台上，这是新车的国内首次亮相，同时，官方还公布了该车的售价：225i
            M运动曜夜套装价格为29.98万元。全新2系今年7月在海外正式发布，它基于宝马CLAR后驱平台打造，是宝马2系自2014年推出以来的首次换代。
          </p>
          <p>
            <img src="https://image.chezhanri.com/2021/1119/3528d7085b99a7fc2ce91767f9de76a2.jpg" alt="广州车展,新宝马2系Coupe" />
          </p>
          <p>
            <img src="https://image.chezhanri.com/2021/1119/82a91089535979f9a5ae4776b2ac9731.jpg" alt="广州车展,新宝马2系Coupe" />
          </p>
          <p>
            <img src="https://image.chezhanri.com/2021/1119/3a40bd88a61d1a5b176acd5f3041e041.jpg" alt="广州车展,新宝马2系Coupe" />
          </p>
          <p style="text-indent: 2em">
            外观造型方面，全新宝马2系Coupe前脸带有宝马标志性的双肾形格栅设计。相比起现在宝马的新车尺寸夸张的双肾形格栅设计，全新宝马2系Coupe的设计就显得收敛许多。新车前大灯灯腔内部结构设计精致，折线形LED日间行车灯充满攻击性，前保险杠两侧的三角形进气口以及大尺寸前唇进一步点缀出新车的运动感。
          </p>
          <p>
            <img src="https://image.chezhanri.com/2021/1119/1010c4efcd94cc773a9973de6d908c2e.jpg" alt="广州车展,新宝马2系Coupe" />
          </p>
          <p>
            <img src="https://image.chezhanri.com/2021/1119/a8796e1558c4e0ddc668eb8d8df3cd1a.jpg" alt="广州车展,新宝马2系Coupe" />
          </p>
          <p style="text-indent: 2em">
            作为一款双门Coupe车型，全新宝马2系Coupe采用的是长车头、短车尾的经典Coupe造型设计。新车原车带有一定的宽体造型，配合大尺寸轮圈可谓是相得益彰。车尾造型紧致，通过复杂的线条来呈现出设计层次感。尾灯的灯带设计相当出彩，呈现出一种怒目而视的攻击性，在夜间有着非常高的辨识度。新车采用双边共两出的排气口设计，后保险杠上带有扩散器造型设计以彰显运动氛围。车身尺寸方面，新车长宽高分别为4537/1838/1390mm，轴距增加51mm至2741mm。
          </p>
          <p>
            <img src="https://image.chezhanri.com/2021/1119/1f14f93e30a78e71d34275d93da5a677.jpg" alt="广州车展,新宝马2系Coupe" />
          </p>
          <p style="text-indent: 2em">
            全新宝马2系Coupe的内饰设计风格没有跳出宝马惯用的设计风格，让人一眼就能认出它来自宝马。新车内饰彰显的是运动感和科技感的完美融合。三幅式运动型皮革多功能方向盘带有换挡拨片，前排标配的是运动型座椅。值得一提的是，M240i
            xDrive车型将会标配黑色Alcantara/Sensatec内饰，并带有蓝色缝线，带来与众不同的色彩碰撞感。
          </p>
          <p>
            <img src="https://image.chezhanri.com/2021/1119/28439b9f878731c06a855cbc1b74e55b.jpg" alt="广州车展,新宝马2系Coupe" />
          </p>
          <p>
            <img src="https://image.chezhanri.com/2021/1119/9d317b0862aba6d0107c4eb642be9279.jpg" alt="广州车展,新宝马2系Coupe" />
          </p>
          <p style="text-indent: 2em">
            配置方面，全新宝马2系Coupe将会提供20英寸M Performance锻造Y型铝合金轮圈、M
            Performance制动器、真皮方向盘、电动可调座椅（带记忆功能）、隔音玻璃、三区自动空调、雨量感应雨刷器、平时显示系统、Harman
            Kardon音响系统、正面碰撞预警、限速信息预警、车道偏移预警等。
          </p>
          <p style="text-indent: 2em">
            动力系统方面，新车提供2.0T和3.0T两种发动机供用户选择。后驱的220i搭载2.0T四缸汽油发动机，最大功率184马力；四驱的M240i
            xDrive将配备3.0T涡轮增压直列六缸发动机，最大功率374马力，性能版M2
            Coupe将会在2022年晚些时候才会发布。与上述两款发动机匹配的是8速手自一体变速箱。该车0-100km/h所需时间仅为4.3秒，极速为250km/h。（文/汽车之家
            王子平）
          </p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');
INSERT into news VALUES(10,'2021广州车展：MINI The Coopers首发','https://image.chezhanri.com/2021/1119/241102d1b042171267824b2861cbe9e8.jpg','<div class="news-block-two">
  <div class="inner-box">
    <div class="lower-box">
      <div class="content">
        <h1>2021广州车展：MINI The Coopers首发</h1>
        <blockquote>
          <div class="blockquote-text">
            摘要：2021广州车展于11月19日正式开幕。在车展媒体日当天，MINI The
            Coopers特别版正式首发。此前，新车已经正式公布了售价，全系六款车型售价25.49-35.69万元。
          </div>
        </blockquote>
        <div class="text-content">
          <p>
            2021广州车展于11月19日正式开幕。在车展媒体日当天，MINI The
            Coopers特别版正式首发。此前，新车已经正式公布了售价，全系六款车型售价25.49-35.69万元。
          </p>
          <table border="1" table="table">
            <tbody>
              <tr>
                <td colspan="2"><strong>MINI The Coopers纪念版 指导售价</strong></td>
              </tr>
              <tr>
                <td><strong>车型</strong></td>
                <td><strong>售价（万元）</strong></td>
              </tr>
              <tr>
                <td colspan="1" rowspan="1">MINI COOPER 三门版 The Coopers 纪念版</td>
                <td colspan="1" rowspan="1">25.49</td>
              </tr>
              <tr>
                <td colspan="1" rowspan="1">MINI COOPER S 三门版 The Coopers 纪念版</td>
                <td colspan="1" rowspan="1">29.39</td>
              </tr>
              <tr>
                <td colspan="1" rowspan="1">MINI COOPER 五门版 The Coopers 纪念版</td>
                <td colspan="1" rowspan="1">26.49</td>
              </tr>
              <tr>
                <td colspan="1" rowspan="1">MINI COOPER S 五门版 The Coopers 纪念版</td>
                <td colspan="1" rowspan="1">30.39</td>
              </tr>
              <tr>
                <td colspan="1" rowspan="1">MINI COOPER CABRIO The Coopers 纪念版</td>
                <td colspan="1" rowspan="1">31.89</td>
              </tr>
              <tr>
                <td colspan="1" rowspan="1">MINI COOPER S CABRIO The Coopers 纪念版</td>
                <td colspan="1" rowspan="1">35.69</td>
              </tr>
            </tbody>
          </table>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/ce45e7a2cd5d3380856e89a0d303d27b.jpg"
              alt="广州车展,MINI The Coopers"
            />
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/5677295d39ff2813d0341ceb2af9015f.jpg"
              alt="广州车展,MINI The Coopers"
            />
          </p>
          <p>
            MINI The Coopers纪念版是以MINI创始人家族姓氏“The
            Coopers”命名，车顶与车身采用撞色的设计，车辆顶部从深蓝、浅蓝到黑色的漆面过度。MINI官方表示，渐变色车漆源自MINI英国牛津工厂新型的Wet-on-wet喷漆，这项常用于油画的技术，需要将湿涂漆层涂在另一层湿涂漆层上，必须在第一层干燥之前完成。想要在车顶完成三色流动过度，需要较快的速度完成，对技术难度有一定要求。
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/241102d1b042171267824b2861cbe9e8.jpg"
              alt="广州车展,MINI The Coopers"
            />
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/8ee7b54e522c709796519b24a07f2f87.jpg"
              alt="广州车展,MINI The Coopers"
            />
          </p>
          <p>
            而这也将让每一辆车的车顶过度颜色都不一样，会产生微小的差异，让每一台车都是独立的存在。同时，在车辆的侧舷窗、迎宾踏板会加入“The
            Coopers”的专属标识，在发动机盖饰条上，加入白色的装饰条以及Cooper家族签名。
          </p>
          <p>
            <img
              src="https://image.chezhanri.com/2021/1119/207e7d94801cbf254dd220d22d752026.jpg"
              alt="广州车展,MINI The Coopers"
            />
          </p>
          <p>
            在整车颜色方面，将会有独角兽灰、青柠黄、细白银、海岛蓝、胡椒白、月表灰六种配色，其中青柠黄将只有CABRIO敞篷版车型可以选装。动力方面，新车将搭载136马力（100千瓦）的1.5T和192马力（141千瓦）的2.0T发动机，与之匹配的是7速双离合变速器。（文/汽车之家
            马艾骏）
          </p>
          <p id="signupimg"></p>
        </div>
      </div>
    </div>
  </div>
</div>');