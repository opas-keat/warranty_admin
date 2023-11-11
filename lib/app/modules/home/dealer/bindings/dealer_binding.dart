import 'package:get/get.dart';

import '../controllers/dealer_controller.dart';

class DealerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DealerController>(
      () => DealerController(),
    );
  }
}
