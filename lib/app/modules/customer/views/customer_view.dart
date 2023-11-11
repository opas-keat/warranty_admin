import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_controller.dart';

class CustomerView extends StatelessWidget {
  CustomerView({Key? key}) : super(key: key);
  final CustomerController controller = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ลงทะเบียนรับประกัน'),
        centerTitle: true,
        actions: null,
      ),
      body: const Center(
        child: Text(
          'CustomerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
