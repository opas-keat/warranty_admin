import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../api/api_params.dart';
import '../../../../api/services/warranty_service.dart';
import '../../../../data/response/warranty_customer_service_response.dart';
import '../../../../data/response/warranty_service_list_response.dart';
import '../../../../shared/utils.dart';

class WarrantyController extends GetxController {
  final logTitle = "WarrantyController";
  RxBool isLoading = true.obs;

  final customerList = <WarrantyCustomerData>[].obs;

  final offset = 0.obs;
  final limit = 50.obs;
  final warrantyList = <WarrantyData>[].obs;

  int selectedIndexFromTable = -1;

  final email = TextEditingController();
  final licensePlate = TextEditingController();
  final mobile = TextEditingController();

  @override
  void onInit() {
    talker.info('$logTitle:onInit:');
    super.onInit();
  }

  @override
  void onReady() {
    talker.info('$logTitle:onReady:');
    super.onReady();
  }

  @override
  void onClose() {
    talker.info('$logTitle:onClose:');
    super.onClose();
  }

  searchData() async {
    talker.info('$logTitle:searchData:');
    customerList.clear();
    warrantyList.clear();
    try {
      Map<String, String> qParams = {
        "offset": offset.value.toString(),
        "limit": queryParamLimit,
        "order": queryParamOrderBy,
        "customer_phone": mobile.text,
        "customer_license_plate": licensePlate.text,
        "customer_email": email.text,
      };
      final response = await WarrantyService().listCustomer(qParams);
      if (response!.code! == "000") {
        for (final item in response.data!) {
          // talker.info('$logTitle:warrantyNo:${item.warrantyNo}');
          customerList.add(
            WarrantyCustomerData(
              id: item.id,
              email: item.customerEmail,
              fullName: item.customerName,
              licensePlate: item.customerLicensePlate,
              telephone: item.customerPhone,
            ),
          );
        }
      }
      customerList.refresh();
    } catch (e) {
      talker.error('$e');
    }
    // customerList.clear();
    // isLoading.value =
    //     await Future.delayed(Duration(seconds: randomValue(1, 3)), () {
    //   customerList.addAll(listWarrantyCustomer);
    //   return false;
    // });
    // customerList.refresh();
    // isLoading.refresh();
  }

  selectDataFromTable(int index, WarrantyCustomerData customer) async {
    talker.info('$logTitle::selectDataFromTable:${customer.id}');
    warrantyList.clear();
    try {
      Map<String, String> qParams = {
        "offset": offset.value.toString(),
        "limit": queryParamLimit,
        "order": queryParamOrderBy,
        "customer_phone": customer.telephone!,
        "customer_license_plate": customer.licensePlate!,
        "customer_email": customer.email!,
      };
      final response = await WarrantyService().list(qParams);
      if (response!.code! == "000") {
        // warrantyList.clear();
        for (final item in response.data!) {
          talker.info('$logTitle:warrantyNo:${item.warrantyNo}');
          List<ProductList> listProduct = <ProductList>[];
          for (final product in item.products!) {
            listProduct.add(ProductList(
              id: product.id,
              productAmount: product.productAmount,
              productBrand: product.productBrand,
              productColorExpire: product.productColorExpire,
              productMileExpire: product.productMileExpire,
              productPromotionExpire: product.productPromotionExpire,
              productStructureExpire: product.productStructureExpire,
              productTireExpire: product.productTireExpire,
              promotion: product.promotion,
              promotionDay: product.promotionDay,
              promotionMile: product.promotionMile,
              warrantyTireMile: product.warrantyTireMile,
              warrantyTireMileZestino: product.warrantyTireMileZestino,
              warrantyTireYear: product.warrantyTireYear,
              warrantyTireYearZestino: product.warrantyTireYearZestino,
              warrantyWheelColor: product.warrantyWheelColor,
              warrantyWheelYear: product.warrantyWheelYear,
              productType: product.productType,
            ));
          }
          // listProduct.addAll(item.products! as Iterable<Products>);
          warrantyList.add(WarrantyData(
            id: item.id,
            warrantyNo: item.warrantyNo,
            warrantyDate: item.warrantyDate,
            dealerCode: item.dealerCode,
            dealerName: item.dealerName,
            products: listProduct,
            urlCar: item.urlCar,
            urlReceive: item.urlReceive,
          ));
          // customerList.add(
          //   WarrantyCustomerData(
          //     id: item.id,
          //     email: item.customerEmail,
          //     fullName: item.customerName,
          //     licensePlate: item.customerLicensePlate,
          //     telephone: item.customerPhone,
          //   ),
          // );
          //         WarrantyDetailData(
          //   id: randomValue(100, 10000),
          //   receiveNo: "${randomValue(100, 999)}",
          //   receiveDate: "18/08/2003",
          //   dealerCode: "CL${randomValue(100, 999)}",
          //   dealerName: "PPSUPERWHEEL SUPER STORE.",
          //   products: <Products>[
          //     Products(
          //       id: randomValue(100, 1000),
          //       type: "ล้อแม็ก",
          //       detail:
          //           "Cosmic DEVIL-M8(YA9987) 16X9.0 6X139.7 ET0 CB.106 BLK-W-(R)Z  (สีดำ+CNCข้างก้าน+ตัวหนังสือแดง)",
          //       amount: 4,
          //     ),
          //     Products(
          //       id: randomValue(100, 1000),
          //       type: "ล้อแม็ก",
          //       detail: "Cosmic ขนาด 19 นิ้ว",
          //       amount: 4,
          //     ),
          //     Products(
          //       id: randomValue(100, 1000),
          //       type: "ยาง",
          //       detail: "AUSTONE 215-55-17 (D2) ปี 2020",
          //       amount: 4,
          //     ),
          //   ],
          // ),
        }
      }
      warrantyList.refresh();
    } catch (e) {
      talker.error('$e');
    }
    // warrantyList.clear();
    // isLoading.value =
    //     await Future.delayed(Duration(seconds: randomValue(1, 3)), () {
    //   warrantyList.addAll(listWarrantyDetail);
    //   return false;
    // });
    // warrantyList.refresh();
    // isLoading.refresh();
  }
}
