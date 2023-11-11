class WarrantyServiceResponse {
  String? code;
  String? message;
  WarrantyData? data;

  WarrantyServiceResponse({this.code, this.message, this.data});

  WarrantyServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  WarrantyServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? WarrantyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WarrantyData {
  String? id;
  String? warrantyNo;
  String? warrantyDate;
  String? dealerCode;
  String? dealerName;
  String? customerName;
  String? customerPhone;
  String? customerLicensePlate;
  String? customerEmail;
  String? customerMile;
  List<Products>? products;

  WarrantyData(
      {this.id,
      this.warrantyNo,
      this.warrantyDate,
      this.dealerCode,
      this.dealerName,
      this.customerName,
      this.customerPhone,
      this.customerLicensePlate,
      this.customerEmail,
      this.customerMile,
      this.products});

  WarrantyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    warrantyNo = json['warranty_no'];
    warrantyDate = json['warranty_date'];
    dealerCode = json['dealer_code'];
    dealerName = json['dealer_name'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerLicensePlate = json['customer_license_plate'];
    customerEmail = json['customer_email'];
    customerMile = json['customer_mile'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['warranty_no'] = warrantyNo;
    data['warranty_date'] = warrantyDate;
    data['dealer_code'] = dealerCode;
    data['dealer_name'] = dealerName;
    data['customer_name'] = customerName;
    data['customer_phone'] = customerPhone;
    data['customer_license_plate'] = customerLicensePlate;
    data['customer_email'] = customerEmail;
    data['customer_mile'] = customerMile;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  String? productType;
  String? productBrand;
  int? productAmount;
  String? productStructureExpire;
  String? productColorExpire;
  String? productTireExpire;
  String? productMileExpire;
  String? productPromotionExpire;
  String? warrantyNo;
  String? promotion;
  int? promotionDay;
  int? promotionMile;
  int? warrantyWheelYear;
  int? warrantyWheelColor;
  int? warrantyTireYear;
  int? warrantyTireMile;
  int? warrantyTireYearZestino;
  int? warrantyTireMileZestino;

  Products(
      {this.id,
      this.productType,
      this.productBrand,
      this.productAmount,
      this.productStructureExpire,
      this.productColorExpire,
      this.productTireExpire,
      this.productMileExpire,
      this.productPromotionExpire,
      this.warrantyNo,
      this.promotion,
      this.promotionDay,
      this.promotionMile,
      this.warrantyWheelYear,
      this.warrantyWheelColor,
      this.warrantyTireYear,
      this.warrantyTireMile,
      this.warrantyTireYearZestino,
      this.warrantyTireMileZestino});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    productBrand = json['product_brand'];
    productAmount = json['product_amount'];
    productStructureExpire = json['product_structure_expire'];
    productColorExpire = json['product_color_expire'];
    productTireExpire = json['product_tire_expire'];
    productMileExpire = json['product_mile_expire'];
    productPromotionExpire = json['product_promotion_expire'];
    warrantyNo = json['warranty_no'];
    promotion = json[':promotion'];
    promotionDay = json[':promotion_day'];
    promotionMile = json[':promotion_mile'];
    warrantyWheelYear = json[':warranty_wheel_year'];
    warrantyWheelColor = json[':warranty_wheel_color'];
    warrantyTireYear = json[':warranty_tire_year'];
    warrantyTireMile = json[':warranty_tire_mile'];
    warrantyTireYearZestino = json[':warranty_tire_year_zestino'];
    warrantyTireMileZestino = json[':warranty_tire_mile_zestino'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_type'] = this.productType;
    data['product_brand'] = this.productBrand;
    data['product_amount'] = this.productAmount;
    data['product_structure_expire'] = this.productStructureExpire;
    data['product_color_expire'] = this.productColorExpire;
    data['product_tire_expire'] = this.productTireExpire;
    data['product_mile_expire'] = this.productMileExpire;
    data['product_promotion_expire'] = this.productPromotionExpire;
    data['warranty_no'] = this.warrantyNo;
    data[':promotion'] = this.promotion;
    data[':promotion_day'] = this.promotionDay;
    data[':promotion_mile'] = this.promotionMile;
    data[':warranty_wheel_year'] = this.warrantyWheelYear;
    data[':warranty_wheel_color'] = this.warrantyWheelColor;
    data[':warranty_tire_year'] = this.warrantyTireYear;
    data[':warranty_tire_mile'] = this.warrantyTireMile;
    data[':warranty_tire_year_zestino'] = this.warrantyTireYearZestino;
    data[':warranty_tire_mile_zestino'] = this.warrantyTireMileZestino;
    return data;
  }
}
