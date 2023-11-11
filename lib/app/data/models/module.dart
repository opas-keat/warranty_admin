import 'package:flutter/material.dart';

import '../../routes/app_pages.dart';

List<Module> listModule = [
  Module(
    id: 1,
    nameTH: "การรับประกัน",
    nameEn: "home",
    icon: Icons.dashboard_sharp,
    url: Routes.WARRANTY,
  ),
  Module(
    id: 2,
    nameTH: "ร้านค้า",
    nameEn: "dealer",
    icon: Icons.account_balance_sharp,
    url: Routes.DEALER,
  ),
  Module(
    id: 3,
    nameTH: "ตั้งค่า",
    nameEn: "config",
    icon: Icons.account_box_sharp,
    url: Routes.CONFIG,
  ),
  Module(
    id: 11,
    nameTH: "ออกจากระบบ",
    nameEn: "logout",
    icon: Icons.logout_sharp,
    url: Routes.SIGNIN,
  ),
];

Module getModuleByIndex(int index) {
  return listModule[index];
  // return listModule.where((element) => element.id == index).first;
}

Module getModuleByNameEn(String nameEn) {
  return listModule.where((element) => element.nameEn == nameEn).first;
}

// final Map<String, String> optionModuleSelected = {
//   '2': 'ศส.ปชต.',
//   '3': 'กรรมการ',
//   '4': 'วิทยากรประชาธิปไตย',
//   '5': 'หมู่บ้านไม่ขายเสียง',
// };

class Module {
  int id;
  String nameTH;
  String nameEn;
  IconData icon;
  String url;
  Module({
    required this.id,
    required this.nameTH,
    required this.nameEn,
    required this.icon,
    required this.url,
  });
}
