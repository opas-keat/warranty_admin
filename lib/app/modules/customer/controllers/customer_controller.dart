import 'package:get/get.dart';

class CustomerController extends GetxController {
  final logTitle = "CustomerController";
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    print("onInit");
    var dealerId = Get.parameters["dealerId"];
    print(dealerId);
  }


}
