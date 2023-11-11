import 'package:get/get.dart';

import '../controllers/warranty_controller.dart';

class WarrantyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WarrantyController>(
      () => WarrantyController(),
    );
  }
}
