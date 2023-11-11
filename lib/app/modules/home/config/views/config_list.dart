import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/request/promotion_service_request.dart';
import '../../../../shared/constant.dart';
import '../../../../shared/custom_text.dart';
import '../controllers/config_controller.dart';

class ConfigList extends StatelessWidget {
  const ConfigList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultPadding),
          ),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                ConfigWheel(),
                SizedBox(height: defaultPadding * 2),
                ConfigTire(),
                SizedBox(height: defaultPadding * 2),
                ConfigCampaign(),
                // const Row(
                //   children: [
                //     Expanded(
                //       child: CustomText(
                //         text: "ผู้ใช้งาน",
                //         weight: FontWeight.bold,
                //         scale: 1.8,
                //       ),
                //     ),
                //   ],
                // ),
                // accentDividerTop,
              ],
            ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}

class ConfigCampaign extends StatelessWidget {
  const ConfigCampaign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ConfigController controller = Get.put(ConfigController());
    return Column(
      children: [
        const SizedBox(height: defaultPadding),
        const Row(
          children: [
            Expanded(
              child: CustomText(
                text: "Campaign",
                weight: FontWeight.bold,
                scale: 1.8,
              ),
            ),
          ],
        ),
        accentDividerTop,
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.add_sharp,
              ),
              label: const CustomText(
                text: "เพิ่ม",
                color: Colors.white,
              ),
              onPressed: () {
                controller.promotionList.add(
                  Promotions(
                    id: "",
                    promotionBrand: "COSMIS",
                    promotionDetail: "",
                    promotionFrom: "",
                    promotionStatus: "active",
                    promotionTo: "",
                    promotionType: "wheel",
                    promotionWarrantyDay: 0,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Obx(
                  () => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: controller.promotionList.length,
                    itemBuilder: (context, index) {
                      return PromotionList(
                        index: index,
                        controller: controller,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PromotionList extends StatelessWidget {
  const PromotionList({
    super.key,
    required this.index,
    required this.controller,
  });
  final int index;
  final ConfigController controller;

  @override
  Widget build(BuildContext context) {
    final dateRangeController = TextEditingController(
      text:
          "${controller.promotionList[index].promotionFrom} - ${controller.promotionList[index].promotionTo}",
    );
    // print(controller.promotionList[index].promotionFrom!.isEmpty);
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                isCollapsed: false,
                isDense: true,
                label: CustomText(
                  text: "สถานะ",
                  color: Colors.black87.withOpacity(.9),
                ),
              ),
              value: controller.promotionList[index].promotionStatus,
              onChanged: (value) {
                controller.promotionList[index].promotionStatus = value!;
              },
              items: controller.promotionStatus.obs.value.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: CustomText(
                    scale: 1.0,
                    text: (item == "active") ? "เปิดใช้งาน" : "ปิดใช้งาน",
                    color: (item == "active") ? Colors.green : Colors.red,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          SizedBox(
            width: 100,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                isCollapsed: false,
                isDense: true,
                label: CustomText(
                  text: "ประเภท",
                  color: Colors.black87.withOpacity(.9),
                ),
              ),
              value: controller.promotionList[index].promotionType,
              onChanged: (value) {
                controller.promotionList[index].promotionType = value!;
                controller.promotionList[index].promotionBrand = "COSMIS";
                controller.promotionList.refresh();
              },
              items: controller.promotionType.obs.value.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: CustomText(
                    scale: 1.0,
                    text: (item == "wheel") ? "ล้อ" : "ยาง",
                    color: Colors.black87.withOpacity(.9),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          SizedBox(
            width: 150,
            child: Obx(
              () => controller.promotionList[index].promotionType == 'wheel'
                  ? DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(.8),
                        filled: true,
                        isCollapsed: false,
                        isDense: true,
                        label: CustomText(
                          text: "ประเภท",
                          color: Colors.black87.withOpacity(.9),
                        ),
                      ),
                      value: controller.promotionList[index].promotionBrand,
                      onChanged: (value) {
                        controller.promotionList[index].promotionBrand = value!;
                      },
                      items: controller.wheelBrand.obs.value.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: CustomText(
                            scale: 1.0,
                            text: item,
                            color: Colors.black87.withOpacity(.9),
                          ),
                        );
                      }).toList(),
                    )
                  : DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: Colors.white.withOpacity(.8),
                        filled: true,
                        isCollapsed: false,
                        isDense: true,
                        label: CustomText(
                          text: "ประเภท",
                          color: Colors.black87.withOpacity(.9),
                        ),
                      ),
                      value: controller.promotionList[index].promotionBrand,
                      onChanged: (value) {
                        controller.promotionList[index].promotionBrand = value!;
                      },
                      items: controller.tireBrand.obs.value.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: CustomText(
                            scale: 1.0,
                            text: item,
                            color: Colors.black87.withOpacity(.9),
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Flexible(
            flex: 2,
            child: TextFormField(
              keyboardType: TextInputType.text,
              initialValue:
                  controller.promotionList[index].promotionDetail.toString(),
              onChanged: (value) {
                controller.promotionList[index].promotionDetail = value;
              },
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding / 2),
                  borderSide: const BorderSide(color: Colors.black54, width: 1),
                ),
                isCollapsed: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                hintText: "รายละเอียดแคมเปญ",
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          SizedBox(
            width: 150,
            child: TextFormField(
              initialValue: controller.promotionList[index].promotionWarrantyDay
                  .toString(),
              onChanged: (value) {
                controller.promotionList[index].promotionWarrantyDay =
                    int.tryParse(value);
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(5),
              ],
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding / 2),
                  borderSide: const BorderSide(color: Colors.black54, width: 1),
                ),
                isCollapsed: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                hintText: "เวลารับประกัน",
                suffixText: "วัน",
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Flexible(
            flex: 1,
            child: TextFormField(
              readOnly: true,
              controller: dateRangeController,
              onChanged: (value) {},
              onTap: () async {
                final selectedDateRange = await showDateRangePicker(
                  context: context,
                  locale: const Locale("th", "TH"),
                  helpText: 'ช่วงวันที่',
                  cancelText: 'ปิด',
                  confirmText: 'ตกลง',
                  saveText: 'บันทึก',
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 2),
                  initialDateRange: DateTimeRange(
                    // end: DateTime(DateTime.now().year, DateTime.now().month,
                    //     DateTime.now().day + 30),
                    // start: DateTime.now(),
                    start:
                        controller.promotionList[index].promotionFrom!.isEmpty
                            ? DateTime.now()
                            : DateFormat('dd/MM/yyyy').parse(
                                controller.promotionList[index].promotionFrom!),
                    end: controller.promotionList[index].promotionTo!.isEmpty
                        ? DateTime(DateTime.now().year, DateTime.now().month,
                            DateTime.now().day + 30)
                        : DateFormat('dd/MM/yyyy').parse(
                            controller.promotionList[index].promotionTo!),
                  ),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Theme.of(context).colorScheme.primary,
                          onPrimary: Colors.white,
                          surface: Colors.white,
                          onSurface: Colors.black,
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 500.0,
                          child: child!,
                        ),
                      ),
                    );
                  },
                );
                controller.promotionList[index].promotionFrom =
                    DateFormat("dd/MM/yyyy").format(selectedDateRange!.start);
                controller.promotionList[index].promotionTo =
                    DateFormat("dd/MM/yyyy").format(selectedDateRange.end);
                // _dateRangeController.text = selectedDateRange.toString();
                controller.promotionList.refresh();
              },
              decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(.8),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultPadding / 2),
                  borderSide: const BorderSide(color: Colors.black54, width: 1),
                ),
                isCollapsed: true,
                contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                hintText: "ช่วงระยะเวลาแคมเปญ",
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          controller.promotionList[index].id!.isEmpty
              ? ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding,
                        horizontal: defaultPadding / 2),
                  ),
                  icon: const Icon(
                    Icons.save_sharp,
                  ),
                  label: const CustomText(
                    text: "บันทึก",
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.createPromotion(
                      index,
                      controller.promotionList[index],
                    );
                  },
                )
              : Container(),
          controller.promotionList[index].id!.isNotEmpty
              ? ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding,
                        horizontal: defaultPadding / 2),
                  ),
                  icon: const Icon(
                    Icons.edit_sharp,
                  ),
                  label: const CustomText(
                    text: "อัพเดต",
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.updatePromotion(
                      index,
                      controller.promotionList[index],
                    );
                  },
                )
              : Container(),
          const SizedBox(width: defaultPadding / 2),
          controller.promotionList[index].id!.isNotEmpty
              ? ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding,
                        horizontal: defaultPadding / 2),
                  ),
                  icon: const Icon(
                    Icons.delete_sharp,
                  ),
                  label: const CustomText(
                    text: "ลบ",
                    color: Colors.white,
                  ),
                  onPressed: () {
                    controller.deletePromotion(
                      controller.promotionList[index],
                    );
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}

class ConfigTire extends StatelessWidget {
  const ConfigTire({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ConfigController controller = Get.put(ConfigController());
    return Column(
      children: [
        const SizedBox(height: defaultPadding),
        const Row(
          children: [
            Expanded(
              child: CustomText(
                text: "เงื่อนไขรับประกันยาง",
                weight: FontWeight.bold,
                scale: 1.8,
              ),
            ),
          ],
        ),
        accentDividerTop,
        const SizedBox(height: defaultPadding),
        const Row(
          children: [
            Expanded(
              child: CustomText(
                text: "ยาง COSMIS",
                weight: FontWeight.bold,
                scale: 1.4,
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "รับประกันคุณภาพ",
                scale: 1.6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 100,
              child: TextFormField(
                controller: controller.configWarrantyTireYear,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            const SizedBox(
              width: 100,
              child: CustomText(
                text: "ปี",
                scale: 1.6,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyTireYear",
                  controller.configWarrantyTireYear.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "รับประกันระยะ",
                scale: 1.6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 100,
              child: TextFormField(
                controller: controller.configWarrantyTireMile,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            const SizedBox(
              width: 100,
              child: CustomText(
                text: "ก.ม.",
                scale: 1.6,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyTireMile",
                  controller.configWarrantyTireMile.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
        const Row(
          children: [
            Expanded(
              child: CustomText(
                text: "ยาง ZESTINO",
                weight: FontWeight.bold,
                scale: 1.4,
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "รับประกันคุณภาพ",
                scale: 1.6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 100,
              child: TextFormField(
                controller: controller.configWarrantyTireYearZestino,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            const SizedBox(
              width: 100,
              child: CustomText(
                text: "ปี",
                scale: 1.6,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyTireYearZestino",
                  controller.configWarrantyTireYearZestino.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "รับประกันระยะ",
                scale: 1.6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 100,
              child: TextFormField(
                controller: controller.configWarrantyTireMileZestino,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            const SizedBox(
              width: 100,
              child: CustomText(
                text: "ก.ม.",
                scale: 1.6,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyTireMileZestino",
                  controller.configWarrantyTireMileZestino.text,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class ConfigWheel extends StatelessWidget {
  const ConfigWheel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ConfigController controller = Get.put(ConfigController());
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: CustomText(
                text: "เงื่อนไขรับประกันล้อ",
                weight: FontWeight.bold,
                scale: 1.8,
              ),
            ),
          ],
        ),
        accentDividerTop,
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "รับประกันโครงสร้าง",
                scale: 1.6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 100,
              child: TextFormField(
                controller: controller.configWarrantyWheelYear,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            const SizedBox(
              width: 100,
              child: CustomText(
                text: "ปี",
                scale: 1.6,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyWheelYear",
                  controller.configWarrantyWheelYear.text,
                );
              },
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            const SizedBox(
              width: 200,
              child: CustomText(
                text: "รับประกันสี",
                scale: 1.6,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: defaultPadding),
              width: 100,
              child: TextFormField(
                controller: controller.configWarrantyWheelColor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                    borderSide:
                        const BorderSide(color: Colors.black54, width: 1),
                  ),
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            const SizedBox(
              width: 100,
              child: CustomText(
                text: "เดือน",
                scale: 1.6,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding / 2),
              ),
              icon: const Icon(
                Icons.edit_sharp,
              ),
              label: const CustomText(
                text: "อัพเดต",
                color: Colors.white,
              ),
              onPressed: () async {
                await controller.updateConfig(
                  "WarrantyWheelColor",
                  controller.configWarrantyWheelColor.text,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

// class ConfigDetail extends StatelessWidget {
//   const ConfigDetail({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ConfigController controller = Get.put(ConfigController());
//     return Column(
//       children: [
//         const SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const SizedBox(
//               width: 200,
//               child: CustomText(
//                 text: "WarrantyWheelColor",
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: defaultPadding),
//               width: 300,
//               child: TextFormField(
//                 controller: controller.configWarrantyWheelColor,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white.withOpacity(.8),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(defaultPadding / 2),
//                     borderSide:
//                         const BorderSide(color: Colors.black54, width: 1),
//                   ),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//                 ),
//               ),
//             ),
//             const SizedBox(width: defaultPadding),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: defaultPadding, horizontal: defaultPadding / 2),
//               ),
//               icon: const Icon(
//                 Icons.edit_sharp,
//               ),
//               label: const CustomText(
//                 text: "อัพเดต",
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await controller.updateConfig(
//                   "WarrantyWheelColor",
//                   controller.configWarrantyWheelColor.text,
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const SizedBox(
//               width: 200,
//               child: CustomText(
//                 text: "WarrantyTireMileZestino",
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: defaultPadding),
//               width: 300,
//               child: TextFormField(
//                 controller: controller.configWarrantyTireMileZestino,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white.withOpacity(.8),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(defaultPadding / 2),
//                     borderSide:
//                         const BorderSide(color: Colors.black54, width: 1),
//                   ),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//                 ),
//               ),
//             ),
//             const SizedBox(width: defaultPadding),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: defaultPadding, horizontal: defaultPadding / 2),
//               ),
//               icon: const Icon(
//                 Icons.edit_sharp,
//               ),
//               label: const CustomText(
//                 text: "อัพเดต",
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await controller.updateConfig(
//                   "WarrantyTireMileZestino",
//                   controller.configWarrantyTireMileZestino.text,
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const SizedBox(
//               width: 200,
//               child: CustomText(
//                 text: "WarrantyTireYear",
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: defaultPadding),
//               width: 300,
//               child: TextFormField(
//                 controller: controller.configWarrantyTireYear,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white.withOpacity(.8),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(defaultPadding / 2),
//                     borderSide:
//                         const BorderSide(color: Colors.black54, width: 1),
//                   ),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//                 ),
//               ),
//             ),
//             const SizedBox(width: defaultPadding),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: defaultPadding, horizontal: defaultPadding / 2),
//               ),
//               icon: const Icon(
//                 Icons.edit_sharp,
//               ),
//               label: const CustomText(
//                 text: "อัพเดต",
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await controller.updateConfig(
//                   "WarrantyTireYear",
//                   controller.configWarrantyTireYear.text,
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const SizedBox(
//               width: 200,
//               child: CustomText(
//                 text: "WarrantyTireYearZestino",
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: defaultPadding),
//               width: 300,
//               child: TextFormField(
//                 controller: controller.configWarrantyTireYearZestino,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white.withOpacity(.8),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(defaultPadding / 2),
//                     borderSide:
//                         const BorderSide(color: Colors.black54, width: 1),
//                   ),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//                 ),
//               ),
//             ),
//             const SizedBox(width: defaultPadding),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: defaultPadding, horizontal: defaultPadding / 2),
//               ),
//               icon: const Icon(
//                 Icons.edit_sharp,
//               ),
//               label: const CustomText(
//                 text: "อัพเดต",
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await controller.updateConfig(
//                   "WarrantyTireYearZestino",
//                   controller.configWarrantyTireYearZestino.text,
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const SizedBox(
//               width: 200,
//               child: CustomText(
//                 text: "WarrantyPromotionTire",
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: defaultPadding),
//               width: 300,
//               child: TextFormField(
//                 controller: controller.configWarrantyPromotionTire,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white.withOpacity(.8),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(defaultPadding / 2),
//                     borderSide:
//                         const BorderSide(color: Colors.black54, width: 1),
//                   ),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//                 ),
//               ),
//             ),
//             const SizedBox(width: defaultPadding),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: defaultPadding, horizontal: defaultPadding / 2),
//               ),
//               icon: const Icon(
//                 Icons.edit_sharp,
//               ),
//               label: const CustomText(
//                 text: "อัพเดต",
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await controller.updateConfig(
//                   "WarrantyPromotionTire",
//                   controller.configWarrantyPromotionTire.text,
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const SizedBox(
//               width: 200,
//               child: CustomText(
//                 text: "WarrantyTireMile",
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: defaultPadding),
//               width: 300,
//               child: TextFormField(
//                 controller: controller.configWarrantyTireMile,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white.withOpacity(.8),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(defaultPadding / 2),
//                     borderSide:
//                         const BorderSide(color: Colors.black54, width: 1),
//                   ),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//                 ),
//               ),
//             ),
//             const SizedBox(width: defaultPadding),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: defaultPadding, horizontal: defaultPadding / 2),
//               ),
//               icon: const Icon(
//                 Icons.edit_sharp,
//               ),
//               label: const CustomText(
//                 text: "อัพเดต",
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await controller.updateConfig(
//                   "WarrantyTireMile",
//                   controller.configWarrantyTireMile.text,
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const SizedBox(
//               width: 200,
//               child: CustomText(
//                 text: "WarrantyWheelYear",
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: defaultPadding),
//               width: 300,
//               child: TextFormField(
//                 controller: controller.configWarrantyWheelYear,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white.withOpacity(.8),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(defaultPadding / 2),
//                     borderSide:
//                         const BorderSide(color: Colors.black54, width: 1),
//                   ),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//                 ),
//               ),
//             ),
//             const SizedBox(width: defaultPadding),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: defaultPadding, horizontal: defaultPadding / 2),
//               ),
//               icon: const Icon(
//                 Icons.edit_sharp,
//               ),
//               label: const CustomText(
//                 text: "อัพเดต",
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await controller.updateConfig(
//                   "WarrantyWheelYear",
//                   controller.configWarrantyWheelYear.text,
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         Row(
//           children: [
//             const SizedBox(
//               width: 200,
//               child: CustomText(
//                 text: "Campange",
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: defaultPadding),
//               width: 300,
//               child: TextFormField(
//                 controller: controller.configCampange,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white.withOpacity(.8),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(defaultPadding / 2),
//                     borderSide:
//                         const BorderSide(color: Colors.black54, width: 1),
//                   ),
//                   isCollapsed: true,
//                   contentPadding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
//                 ),
//               ),
//             ),
//             const SizedBox(width: defaultPadding),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: defaultPadding, horizontal: defaultPadding / 2),
//               ),
//               icon: const Icon(
//                 Icons.edit_sharp,
//               ),
//               label: const CustomText(
//                 text: "อัพเดต",
//                 color: Colors.white,
//               ),
//               onPressed: () async {
//                 await controller.updateConfig(
//                   "Campange",
//                   controller.configCampange.text,
//                 );
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: defaultPadding),
//         // Row(
//         //   children: [
//         //     const SizedBox(
//         //       width: 200,
//         //     ),
//         //     Container(
//         //       padding: const EdgeInsets.only(left: defaultPadding),
//         //       width: 300,
//         //       child: Row(
//         //         children: [
//         //           ElevatedButton.icon(
//         //             style: ElevatedButton.styleFrom(
//         //               padding: const EdgeInsets.symmetric(
//         //                   vertical: defaultPadding,
//         //                   horizontal: defaultPadding / 2),
//         //             ),
//         //             icon: const Icon(
//         //               Icons.save_sharp,
//         //             ),
//         //             label: const CustomText(
//         //               text: "บันทึก",
//         //               color: Colors.white,
//         //             ),
//         //             onPressed: () {},
//         //           ),
//         //         ],
//         //       ),
//         //     ),
//         //   ],
//         // ),
//       ],
//     );
//   }
// }
