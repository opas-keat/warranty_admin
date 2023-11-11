import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';
import '../controllers/dealer_controller.dart';

class DealerAddWidget extends StatelessWidget {
  DealerAddWidget({
    Key? key,
  }) : super(key: key);
  final DealerController controller = Get.put(DealerController());

  final dealerCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('เพิ่มร้านค้า'),
      content: SizedBox(
        // color: Colors.amber,
        // padding: const EdgeInsets.symmetric(vertical: defaultPadding * 4),
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: dealerCode,
              decoration: InputDecoration(
                hintText: "",
                labelText: "รหัสร้านค้า",
                suffixIcon: IconButton(
                  color: primaryColor,
                  onPressed: () async {
                    await controller.listSystemLinkDealerByCode(
                      dealerCode.text,
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: controller.checkedBKKRegion.value,
            //       onChanged: (newValue) {
            //         controller.checkedBKKRegion.value = newValue!;
            //       },
            //     ),
            //     const CustomText(
            //       text: 'กรุงเทพและปริมณฑล',
            //     ),
            //     Checkbox(
            //       value: controller.checkedCentralRegion.value,
            //       onChanged: (newValue) {
            //         controller.checkedCentralRegion.value = newValue!;
            //       },
            //     ),
            //     const CustomText(
            //       text: 'ภาคกลาง',
            //     ),
            //     Checkbox(
            //       value: controller.checkedEastRegion.value,
            //       onChanged: (newValue) {
            //         controller.checkedEastRegion.value = newValue!;
            //       },
            //     ),
            //     const CustomText(
            //       text: 'ภาคตะวันออก',
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: controller.checkedNorthEastRegion.value,
            //       onChanged: (newValue) {
            //         controller.checkedNorthEastRegion.value = newValue!;
            //       },
            //     ),
            //     const CustomText(
            //       text: 'ภาคอีสาน',
            //     ),
            //     Checkbox(
            //       value: controller.checkedNorthRegion.value,
            //       onChanged: (newValue) {
            //         controller.checkedNorthRegion.value = newValue!;
            //       },
            //     ),
            //     const CustomText(
            //       text: 'ภาคเหนือ',
            //     ),
            //     Checkbox(
            //       value: controller.checkedSouthernRegion.value,
            //       onChanged: (newValue) {
            //         controller.checkedSouthernRegion.value = newValue!;
            //       },
            //     ),
            //     const CustomText(
            //       text: 'ภาคใต้',
            //     ),
            //     Checkbox(
            //       value: controller.checkedWestRegion.value,
            //       onChanged: (newValue) {
            //         controller.checkedWestRegion.value = newValue!;
            //       },
            //     ),
            //     const CustomText(
            //       text: 'ภาคตะวันตก',
            //     ),
            //   ],
            // ),
            // const SizedBox(height: defaultPadding),
            // const CustomText(
            //   text: 'รายชื่อร้านค้า',
            // ),
            Row(
              children: [
                const Expanded(
                  child: CustomText(
                    text: "รายชื่อร้านค้า",
                    weight: FontWeight.bold,
                    scale: 1.5,
                  ),
                ),
                Obx(
                  () => CustomText(
                    text:
                        "จำนวน : ${controller.dealerSystemLinkList.length} รายการ",
                    scale: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: defaultPadding),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            controller.dealerSystemLinkList.obs.value.length,
                        itemBuilder: (context, index) {
                          return Material(
                            color: Colors.grey.shade200,
                            child: ListTile(
                              onTap: () {},
                              selectedColor: primaryColor,
                              selectedTileColor: primaryColor,
                              title: CustomText(
                                maxLine: 2,
                                // scale: 0.9,
                                text:
                                    'รหัส ${controller.dealerSystemLinkList[index].code}: ${controller.dealerSystemLinkList.obs.value[index].name}',
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    maxLine: 4,
                                    scale: 0.9,
                                    text: controller.dealerSystemLinkList.obs
                                        .value[index].address,
                                  ),
                                  CustomText(
                                    maxLine: 4,
                                    scale: 0.9,
                                    text: controller.dealerSystemLinkList.obs
                                        .value[index].phone,
                                  ),
                                ],
                              ),
                              trailing: CircleAvatar(
                                radius: 20,
                                backgroundColor: primaryColor,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add_sharp,
                                    color: Colors.white,
                                  ),
                                  // label: const CustomText(
                                  //   scale: 0.8,
                                  //   text: "บันทึก",
                                  //   color: Colors.white,
                                  // ),
                                  onPressed: () async {
                                    final result = await controller.addDealer(
                                        controller.dealerSystemLinkList.obs
                                            .value[index]);
                                    if (result) {
                                      Get.dialog(
                                        AlertDialog(
                                          content: const CustomText(
                                              text:
                                                  'บันทึกร้านค้าเพิ่มไปยังระบบใหม่แล้ว'),
                                          actions: [
                                            TextButton(
                                              child: const CustomText(
                                                text: "ปิด",
                                                color: Colors.blue,
                                                weight: FontWeight.bold,
                                                scale: 1.2,
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                        barrierDismissible: false,
                                      );
                                    } else {
                                      Get.dialog(
                                        AlertDialog(
                                          content: const CustomText(
                                              text: 'มีรหัสร้านค้านี้อยู่แล้ว'),
                                          actions: [
                                            TextButton(
                                              child: const CustomText(
                                                text: "ปิด",
                                                color: Colors.blue,
                                                weight: FontWeight.bold,
                                                scale: 1.2,
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        ),
                                        barrierDismissible: false,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          );
                          // return Row(
                          //   children: [
                          //     Container(
                          //       padding: const EdgeInsets.all(defaultPadding / 2),
                          //       decoration: BoxDecoration(
                          //         borderRadius:
                          //             BorderRadius.circular(defaultPadding),
                          //       ),
                          //       child: Wrap(
                          //         direction: Axis.vertical,
                          //         children: [
                          //           Text(
                          //             "รหัส : ${controller.dealerList.value[index].code} ",
                          //           ),
                          //           const SizedBox(height: defaultPadding / 2),
                          //           Text(
                          //             "${controller.dealerList.value[index].name} ",
                          //             maxLines: 2,
                          //           ),
                          //           const SizedBox(height: defaultPadding / 2),
                          //           Text(
                          //             "${controller.dealerList.value[index].address}",
                          //           ),
                          //           const SizedBox(height: defaultPadding / 2),
                          //           Text(
                          //             "${controller.dealerList.value[index].phone}",
                          //           ),
                          //           const SizedBox(height: defaultPadding / 2),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const CustomText(
                text: "โหลดเพิ่ม",
                color: Colors.blue,
                weight: FontWeight.bold,
                scale: 1.2,
              ),
              onPressed: () {
                // controller.dealerSystemLinkList.clear();
                // Get.back();
              },
            ),
            TextButton(
              child: const CustomText(
                text: "ปิด",
                color: Colors.blue,
                weight: FontWeight.bold,
                scale: 1.2,
              ),
              onPressed: () {
                controller.dealerSystemLinkList.clear();
                Get.back();
              },
            ),
          ],
        ),

        // Expanded(
        //   child: const CustomText(
        //     text: "โหลดเพิ่ม",
        //     color: Colors.blue,
        //     weight: FontWeight.bold,
        //     scale: 1.2,
        //   ),
        // ),
        // const SizedBox(width: 1),
        // TextButton(
        //   child: const CustomText(
        //     text: "ปิด",
        //     color: Colors.blue,
        //     weight: FontWeight.bold,
        //     scale: 1.2,
        //   ),
        //   onPressed: () {
        //     controller.dealerSystemLinkList.clear();
        //     Get.back();
        //   },
        // ),
      ],
    );
  }
}
