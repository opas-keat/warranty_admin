import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../responsive.dart';
import '../../../shared/constant.dart';
import '../../../shared/custom_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends StatelessWidget {
  SigninView({Key? key}) : super(key: key);
  final SigninController controller = Get.put(SigninController());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // usernameController.text = "user001";
    // passwordController.text = "123456";
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Center(
          child: Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(
                horizontal: Responsive.isSmallScreen(context) ? 30 : 60,
                vertical: Responsive.isSmallScreen(context) ? 30 : 60),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(defaultPadding))),
            child: Container(
              height: 650.0,
              decoration: const BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(defaultPadding)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    primaryColor,
                    accentColor,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(defaultPadding),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.network(
                                "assets/images/pp_white.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          CustomText(
                            text: "ชื่อผู้ใช้ ",
                            size: 20,
                            color: Colors.white.withOpacity(.9),
                          ),
                          const SizedBox(height: defaultPadding / 2),
                          TextFormField(
                            controller: usernameController,
                            autofocus: true,
                            keyboardType: TextInputType.text,
                            autofillHints: const <String>[
                              AutofillHints.username
                            ],
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              fillColor: Colors.white.withOpacity(.2),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.5),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2),
                              ),
                              // hintText: 'Enter a search term',
                            ),
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          CustomText(
                            text: "รหัสผ่าน",
                            size: 20,
                            color: Colors.white.withOpacity(.9),
                          ),
                          const SizedBox(height: defaultPadding / 2),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            cursorColor: primaryColor,
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              fillColor: Colors.white.withOpacity(.2),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.5),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding / 2),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 2),
                              ),
                            ),
                            // validator: (value) =>
                            //     validateNotEmpty(value!, 'Your Password'),
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          Center(
                            child: ElevatedButton.icon(
                              label: CustomText(
                                text: 'Sign In'.toUpperCase(),
                                size: 20,
                                color: Colors.white.withOpacity(.9),
                              ),
                              icon: const Icon(Icons.key_outlined),
                              style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  padding:
                                      const EdgeInsets.all(defaultPadding)),
                              // onPressed: () async {
                              //   Get.offAllNamed(Routes.WARRANTY);
                              // },
                              onPressed: () async {
                                Get.dialog(
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  barrierDismissible: false,
                                );
                                final result = await controller.signIn(
                                  userName: usernameController.text,
                                  password: passwordController.text,
                                );
                                Get.back();
                                result
                                    ? Get.offAllNamed(Routes.WARRANTY)
                                    : Get.snackbar(
                                        'Error',
                                        controller.authenError.value,
                                        backgroundColor: accentColor,
                                        snackPosition: SnackPosition.BOTTOM,
                                        colorText: Colors.white,
                                        icon: const Icon(
                                          Icons.lock_person_outlined,
                                          color: Colors.white,
                                        ),
                                        isDismissible: true,
                                        margin: const EdgeInsets.all(
                                          defaultPadding,
                                        ),
                                      );
                              },
                            ),
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Version 0.0.1",
                                color: Colors.white.withOpacity(.9),
                                scale: 0.9,
                              ),
                              IconButton(
                                onPressed: () {
                                  window.location.reload();
                                },
                                icon: const Icon(
                                  Icons.refresh_sharp,
                                ),
                                color: primaryColor,
                                iconSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                    if (!Responsive.isSmallScreen(context))
                      Expanded(
                          child: SvgPicture.network(
                        "assets/icons/undraw_delivery_truck_vt6p.svg",
                      )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   _textEmail.text = "admin@ppsuperwheels.com";
  //   _textPassword.text = "P@ssw0rd";
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: false,
  //       title: Row(
  //         children: [
  //           Container(
  //             alignment: Alignment.centerLeft,
  //             width: 120,
  //             child: Image.network(
  //               'assets/images/pp_white.png',
  //             ),
  //           ),
  //           const SizedBox(width: defaultPadding),
  //           const CustomText(
  //             text: 'Warranty Management',
  //             size: 18,
  //           ),
  //         ],
  //       ),
  //     ),
  //     body: Background(
  //       child: SingleChildScrollView(
  //         child: Responsive(
  //           mobile: Container(),
  //           desktop: Row(
  //             children: [
  //               Expanded(
  //                 child: Column(
  //                   children: [
  //                     Row(
  //                       children: [
  //                         const Spacer(),
  //                         Expanded(
  //                           flex: 6,
  //                           child: SvgPicture.network(
  //                               "assets/icons/undraw_access_account_re_8spm.svg"),
  //                         ),
  //                         const Spacer(),
  //                       ],
  //                     ),
  //                     const SizedBox(height: defaultPadding),
  //                   ],
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     SizedBox(
  //                       width: 450,
  //                       child: Form(
  //                         key: _formKey,
  //                         child: Column(
  //                           children: [
  //                             TextFormField(
  //                               textInputAction: TextInputAction.next,
  //                               cursorColor: primaryColor,
  //                               controller: _textEmail,
  //                               decoration: const InputDecoration(
  //                                 hintText: 'Your Email',
  //                                 prefixIcon: Icon(Icons.email_outlined),
  //                               ),
  //                               validator: (value) =>
  //                                   validateNotEmpty(value!, 'Your Email'),
  //                             ),
  //                             Padding(
  //                               padding: const EdgeInsets.symmetric(
  //                                   vertical: defaultPadding),
  //                               child: TextFormField(
  //                                 textInputAction: TextInputAction.done,
  //                                 obscureText: true,
  //                                 cursorColor: primaryColor,
  //                                 controller: _textPassword,
  //                                 decoration: const InputDecoration(
  //                                   hintText: 'Your Password',
  //                                   prefixIcon: Icon(Icons.lock),
  //                                 ),
  //                                 validator: (value) =>
  //                                     validateNotEmpty(value!, 'Your Password'),
  //                               ),
  //                             ),
  //                             Container(
  //                               margin: const EdgeInsets.symmetric(
  //                                   vertical: defaultPadding),
  //                               child: CustomFlatButton(
  //                                 label: 'Sign In'.toUpperCase(),
  //                                 onPressed: () async {
  //                                   Get.offAllNamed(Routes.HOME);
  //                                 },
  //                               ),
  //                             ),
  //                             const SizedBox(height: defaultPadding),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
