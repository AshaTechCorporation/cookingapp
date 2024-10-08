import 'package:cookingapp/account/accountPage.dart';
import 'package:flutter/material.dart';

const kbackgroundColor = Color(0xffEEF1F6);
const kprimaryColor = Color(0xff568A9F);
Color color1 = Color(int.parse('0xffcd7f32'));
Color color2 = Color(int.parse('0xfffbbc80'));
Color red1 = Color(0xffcb800b);
Color arrowcolor = Color(0xffd9d9d9);
Color background = Color(0xfff5f5f5);
Color white = Color(0xffffffff);
Color headingtext = Color(0xff606060);
Color pinkmess = Color(0xfff8d2d4);
Color greymess = Color(0xffe5e5ea);
Color greyuserinfo = Color(0xff606060);
Color skyorange = Color(0xffffe7d1);
Color oldred = Color(0xff8a1015);
Color youngpink = Color(0xffffe6e7);
Color green = Color(0xff3ace01);
Color blue = Color(0xff3c5a9a);
Color pinkser = Color(0xffffefe0);
Color pinkmessSixper = Color(0xffDE1E26);
Color brown = Color(0xff431d0a);
LinearGradient backgroundColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFFFFFF), // สีขาว (#FFFFFF)
    Color(0xFFF5F5F5), // สีเทาอ่อน (#F5F5F5)
  ],
  stops: [0.6, 1.0],
);

const String publicUrl = 'cooking-api.dev-asha9.com';

const kBackgroundColor = Color(0xff1B58B1);
const kSecondTextColor = Color(0xff7B7B7B);
const kConkgroundColor = Color(0xffFFFFFF);

List<MenuItem> menuItems = [
  MenuItem(imagePath: 'assets/icons/fav.png', text: 'รายการโปรด'),
  MenuItem(imagePath: 'assets/icons/yellomoney.png', text: 'ประวัติธุรกรรม'),
  MenuItem(imagePath: 'assets/icons/article.png', text: 'บทความ'),
  MenuItem(imagePath: 'assets/icons/guide.png', text: 'คู่มือการใช้งาน'),
  MenuItem(imagePath: 'assets/icons/report.png', text: 'แจ้งปัญหา'),
  MenuItem(imagePath: 'assets/icons/help.png', text: 'ช่วยเหลือ'),
  MenuItem(imagePath: 'assets/icons/contact.png', text: 'ติดต่อเรา'),
  MenuItem(imagePath: 'assets/icons/setting.png', text: 'ตั้งค่า'),
];

List<Map<String, dynamic>> itemfav = [
  {
    'storeName': 'ร้านค้าหนึ่ง',
    'storeItems': [
      {
        'id': 1,
        'name': 'Spicy Ramen Noodles',
        'imageAssetPath': 'assets/images/ramen-noodles.jpg',
      },
      {
        'id': 2,
        'name': 'Spicy Ramen Noodles',
        'imageAssetPath': 'assets/images/ramen-noodles.jpg',
      },
    ],
  },
  {
    'storeName': 'ร้านค้าสอง',
    'storeItems': [
      {
        'id': 1,
        'name': 'Butter Chicken',
        'imageAssetPath': 'assets/images/butter-chicken.jpg',
      },
      {
        'id': 2,
        'name': 'Butter Chicken',
        'imageAssetPath': 'assets/images/butter-chicken.jpg',
      },
    ],
  },
];

const List<String> topup = ['เติมเงิน', 'ถอนเงิน'];
const List<String> fistpagewidget = [
  'นำเข้าถูกต้อง',
  'นำเข้าเหมาภาษี',
];

final Map<String, String> guangzhouInfo = {
  '收货人': '阿苏 (AAAA)',
  '详细地址': 'TEG CARGO仓广东省广州市白云区唐自头村105A仓28号3栋',
  '邮编': '510450',
  '手机': '18520290139',
};

final Map<String, String> yiwuInfo = {
  '收货人': '王五 (AAAA)',
  '详细地址': 'TEG CARGO仓浙江省义乌市佛堂镇 105B仓22号1栋',
  '邮编': '322000',
  '手机': '18520290139',
};

const List<Map<String, dynamic>> tracktransport = [
  // {
  //   'id': 1,
  //   'images': 'assets/icons/atwerehousechinese.png',
  //   'title': 'ถึงโกดังจีน',
  //   'process': 'x',
  // },
  // {
  //   'id': 2,
  //   'images': 'assets/icons/duringimport.png',
  //   'title': 'อยู่ระหว่างการขนส่ง',
  //   'process': 'x',
  // },
  {
    'id': 1,
    'images': 'assets/icons/atwerehousethai.png',
    'title': 'ร้านค้า',
    'process': 'x',
  },
  {
    'id': 2,
    'images': 'assets/icons/duringimport.png',
    'title': 'อยู่ระหว่างการขนส่ง',
    'process': 'x',
  },
  {
    'id': 3,
    'images': 'assets/icons/waitingorderpayment.png',
    'title': 'รอชำระคำขนส่ง',
    'process': 'x',
  },
  {
    'id': 4,
    'images': 'assets/icons/delivery.png',
    'title': 'จัดส่งสำเร็จ',
    'process': 'x',
  },
];

const List<Map<String, dynamic>> palceanorder = [
  {
    'id': 1,
    'images': 'assets/icons/waitsum.png',
    'title': 'สั่งซื้อ',
    'process': 'x',
  },
  {
    'id': 2,
    'images': 'assets/icons/waitingorderpayment.png',
    'title': 'ชำระเงิน',
    'process': 'x',
  },
  {
    'id': 3,
    'images': 'assets/icons/orderpending.png',
    'title': 'รอผลิต',
    'process': 'x',
  },
  {
    'id': 4,
    'images': 'assets/icons/packingtrack.png',
    'title': 'รอรับ',
    'process': 'x',
  },
  {
    'id': 5,
    'images': 'assets/icons/sended.png',
    'title': 'เสร็จสิ้น',
    'process': 'x',
  },
];

const List<Map<String, dynamic>> importwidget = [
  {
    'id': 1,
    'name': 'กราฟสรุปจองอาหาร',
    'images': 'assets/images/Screenshot2024.png',
  },
  {
    'id': 2,
    'name': 'กราฟสรุปรายงาน',
    'images': 'assets/images/Screenshot2024.png',
  },
];

const List<String> titleData = [
  'ขนส่งทางบก\nและทางทะเล',
  'จัดส่งแบบ\nเหมาตู้ FCL',
  'จัดส่งแบบ FCL',
  'ส่งถึงหน้าบ้าน',
  'ขนส่งพร้อม\nออกหนังสือ',
  'ล่าม ไกด์ทัวร์\nตั๋วเครื่องบิน',
  'การคำนวน\nค่าขนส่ง',
  'เรทราคานำเข้า'
];

List<String> Imgservice = [
  'assets/icons/exportboktale.png',
  'assets/icons/fcl.png',
  'assets/icons/lcl.png',
  'assets/icons/dellitohome.png',
  'assets/icons/withlisecse.png',
  'assets/icons/translater.png',
  'assets/icons/calculator.png',
  'assets/icons/priceimport.png',
  'assets/icons/etc.png',
];

List<String> payment = [
  'assets/images/leaveorder.png',
  'assets/images/alipay.png',
  'assets/images/paymentcomp.png',
];

const List<Map<String, dynamic>> importcard = [
  {
    'id': 1,
    'Importercode': 'AAAA',
    'Sendbycar': 'AAAA/EK',
    'Sendbyboat': 'AAAA/SEA',
  },
];

List<String> catagoryrecom = ['เสื้อผ้า', 'เครื่องประดับ', 'อุปกรณ์กีฬา', 'สินค้าเด็ก', 'เครื่องใช้ในบ้าน', 'อุปกรณ์สวนและสำนักงาน', 'อาหาร', 'เครื่องสำอาง'];

const List<String> catagoryimg = [
  'assets/images/cloth.png',
  'assets/images/accessory.png',
  'assets/images/sport.png',
  'assets/images/kids.png',
  'assets/images/hometools.png',
  'assets/images/garden.png',
  'assets/images/food.png',
  'assets/images/makeup.png',
];

const List<Map<String, dynamic>> listProducts = [
  {
    'id': 1,
    'image': 'assets/images/shelf.png',
    'imagedetail1': 'assets/images/image23.png',
    'imagedetail2': 'assets/images/image25.png',
    'imagedetail3': 'assets/images/image26.png',
    'price': 4.88,
    'detail': 'ชั้นวางพลาสติกในครัว, ชั้นวางของในห้องน้ําแบบไม่มีรูพรุน, สุขโครกติดผนัง, เครื่องใช้ในห้องน้ํา, กล่องเก็บของ',
    'send': '48 ชั่วโมง',
    'sale': '5000+ '
  },
  {
    'id': 2,
    'image': 'assets/images/box.png',
    'imagedetail1': 'assets/images/image23.png',
    'imagedetail2': 'assets/images/image25.png',
    'imagedetail3': 'assets/images/image26.png',
    'price': 11.19,
    'detail': 'กล่องเก็บผ้าฝ้ายและผ้าลินิน Tianshan, ตะกร้าเก็บเสื้อผ้าในครัวเรือน,กล่องเก็บกํามะหยี่,ที่เก็บผ้านวม',
    'send': '48 ชั่วโมง',
    'sale': '4000+ '
  },
  {
    'id': 3,
    'image': 'assets/images/pant.png',
    'imagedetail1': 'assets/images/image23.png',
    'imagedetail2': 'assets/images/image25.png',
    'imagedetail3': 'assets/images/image26.png',
    'price': 9.40,
    'detail': 'กางเกงขาสั้นผู้ชาย, กางเกงขาสั้นลําลอง, กางเกงใหญ่ผู้ชาย, ฤดูร้อนผู้ชาย, วัยรุ่น, วัยกลางคนและผู้สูงอายุ',
    'send': '48 ชั่วโมง',
    'sale': '3000+ '
  },
  {
    'id': 4,
    'image': 'assets/images/headband.png',
    'imagedetail1': 'assets/images/image23.png',
    'imagedetail2': 'assets/images/image25.png',
    'imagedetail3': 'assets/images/image26.png',
    'price': 3,
    'detail': 'ผ้าพันคอลายพรางผ้าไหมมัลติฟังก์ชั่น, ผ้าพันคอฤดูร้อนปั่นจักรยาน',
    'send': '48 ชั่วโมง',
    'sale': '3000+ '
  },
  {
    'id': 5,
    'image': 'assets/images/bellser.png',
    'imagedetail1': 'assets/images/image23.png',
    'imagedetail2': 'assets/images/image25.png',
    'imagedetail3': 'assets/images/image26.png',
    'price': 55.60,
    'detail': 'เสื้อเบลเซอร์สีกาแฟผู้หญิง 2023 ฤดูใบไม้ผลิและฤดูใบไม้ร่วงชายตัวน้อยทอดถนนแฟชั่นใหม่',
    'send': '48 ชั่วโมง',
    'sale': '2000+ '
  },
  {
    'id': 6,
    'image': 'assets/images/cardigan.png',
    'imagedetail1': 'assets/images/image23.png',
    'imagedetail2': 'assets/images/image25.png',
    'imagedetail3': 'assets/images/image26.png',
    'price': 23,
    'detail': 'เสื้อคาร์ดิแกนเสื้อถักทับแจ็คเก็ตผู้หญิงรุ่นเกาหลีของฤดูใบไม้ร่วง',
    'send': '48 ชั่วโมง',
    'sale': '1000+ '
  },
];

const List<Map<String, dynamic>> topuphis = [
  {
    'id': 1,
    'date': '26 ก.ย. 67',
    'time': '16:50:54',
    'detailLink': 'ดูรายละเอียด',
    'by': 'mobile banking',
    'amount': '500.00'
  },
  {
    'id': 2,
    'date': '26 ก.ย. 67',
    'time': '16:50:54',
    'detailLink': 'ดูรายละเอียด',
    'by': 'mobile banking',
    'amount': '500.00'
  }
];

const List<Map<String, dynamic>> withdrownhis = [
  {
    'id': 1,
    'date': '26 ก.ย. 67',
    'time': '16:50:54',
    'detailLink': 'ดูรายละเอียด',
    'by': 'mobile banking',
    'amount': '500.00'
  },
  {
    'id': 2,
    'date': '26 ก.ย. 67',
    'time': '16:50:54',
    'detailLink': 'ดูรายละเอียด',
    'by': 'mobile banking',
    'amount': '500.00'
  }
];

const List<Map<String, dynamic>> statement = [
  {
    'id': 1,
    'po': ' A523456',
    'time': '20 ส.ค. 67 10:00',
    'detailLink': 'ดูรายละเอียด',
    'by': 'ค่าบริการ',
    'amount': '00,000'
  },
  {
    'id': 2,
    'po': ' A523226',
    'time': '21 ส.ค. 67 12:02',
    'detailLink': 'ดูรายละเอียด',
    'by': 'ค่าสินค้า',
    'amount': '00,000'
  },
];

const List<Map<String, dynamic>> accumulatedpoints = [
  {
    'id': 1,
    'user': ' A523456',
    'time': '20 ส.ค. 67 10:00',
    'point': '10',
    'status': true,
  },
  {
    'id': 2,
    'user': ' A523456',
    'time': '20 ส.ค. 67 10:00',
    'point': '10',
    'status': false,
  },
  {
    'id': 3,
    'user': ' A231226',
    'time': '23 ส.ค. 67 19:24',
    'point': '10',
    'status': true,
  },
  {
    'id': 4,
    'user': ' A123456',
    'time': '20 ส.ค. 67 10:00',
    'point': '300',
    'status': false,
  },
];

List<Map<String, dynamic>> guidelist = [
  {
    // 'image': 'assets/images/tag1.png',
    'title': 'วิธี ...',
    'subtitle': '',
  },
  {
    // 'image': 'assets/images/tag1.png',
    'title': 'วิธี ...',
    'subtitle': '',
  },
  // เพิ่มรายการอื่น ๆ ตามต้องการ
];

const List<String> aboutQuestion = [
  'คำถามที่พบบ่อย',
  'เกี่ยวกับ Cooking',
];

List<Map<String, dynamic>> problemData = [
  {
    'id': 1,
    'imagePath': 'assets/icons/byredcar.png',
    'title': 'ติดตามสถานะบิลสั่งซื้อ และสินค้า',
    'options': [
      'ติดตามการสั่งซื้อ',
      'ติดตามการจัดส่งสินค้า',
      'ติดตามการรับเงินจากร้านค้า',
      'ตรวจสอบยอดรวมที่ไม่ถูกต้อง',
    ],
  },
  {
    'id': 2,
    'imagePath': 'assets/icons/byredcar.png',
    'title': 'ปัญหาด้านการขนส่ง',
    'options': [
      'ติดตามการจัดส่งสินค้าในไทย',
      'ขออัปเดตสินค้าไปยังสถานที่จัดส่ง',
      'เปลี่ยนเส้นทางการจัดส่ง',
      'ปัญหาสินค้าหาย / ปริมาณไม่ถูกต้อง',
      'แจ้งสินค้าเสียหายที่เกิดขึ้นในไทย',
    ],
  },
  {
    'id': 3,
    'imagePath': 'assets/icons/byredcar.png',
    'title': 'ปัญหาด้านการเงิน',
    'options': [
      'เพิ่มเงิน / คืนเงิน / ถอนเงิน',
      'ติดตามการรับเงินจากร้านของขวัญ',
      'สอบถามการเปลี่ยนแปลง / ใบกำกับภาษี',
      'ค่าธรรมเนียมที่ไม่ได้ถูกต้อง',
    ],
  },
];
