import 'package:get/get.dart';

import '../modules/customer/bindings/customer_binding.dart';
import '../modules/customer/views/customer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/config/bindings/config_binding.dart';
import '../modules/home/config/views/config_view.dart';
import '../modules/home/dealer/bindings/dealer_binding.dart';
import '../modules/home/dealer/views/dealer_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/warranty/bindings/warranty_binding.dart';
import '../modules/home/warranty/views/warranty_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.DEALER,
          page: () => const DealerView(),
          binding: DealerBinding(),
        ),
        GetPage(
          name: _Paths.WARRANTY,
          page: () => const WarrantyView(),
          binding: WarrantyBinding(),
        ),
        GetPage(
          name: _Paths.CONFIG,
          page: () => const ConfigView(),
          binding: ConfigBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: '${_Paths.CUSTOMER}/:dealerId',
      page: () => CustomerView(),
      binding: CustomerBinding(),
    ),
  ];
}
