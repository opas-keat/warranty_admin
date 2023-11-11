import 'dart:html' as html;

import 'package:get/get.dart';

import '../../../api/services/auth_service.dart';
import '../../../shared/utils.dart';

class SigninController extends GetxController {
  final logTitle = "SigninController";
  var isObscure = true.obs;
  var isLoading = true.obs;

  RxString authenError = ''.obs;

  @override
  void onInit() {
    talker.info('SigninController is started');
    super.onInit();
  }

  Future<bool> signIn(
      {required String userName, required String password}) async {
    talker.info('signIn');
    // talker.debug('userName:$userName');
    // talker.debug('password:$password');
    // userName = 'NPT001';
    // password = 'NPT#!123';
    try {
      final result = await AuthenService().login(userName, password);
      talker.debug('response message : ${result?.message}');
      if (result?.code == "000") {
        if (result!.data!.roles!.length > 1) {
          html.window.sessionStorage["roles"] = "admin";
        } else {
          html.window.sessionStorage["roles"] = "user";
        }
        html.window.sessionStorage["token"] = result.data!.token!;
        html.window.sessionStorage["profile"] = '${result.data!.username}';
        return true;
      }
      authenError.value = result!.message!;
      return false;
    } catch (e) {
      talker.error('$e');
      return false;
    }
  }
}
