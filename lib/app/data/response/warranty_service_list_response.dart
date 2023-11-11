class WarrantyServiceListResponse {
  String? code;
  String? message;
  List<WarrantyData>? data;

  WarrantyServiceListResponse({this.code, this.message, this.data});

  WarrantyServiceListResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  WarrantyServiceListResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <WarrantyData>[];
      json['data'].forEach((v) {
        data!.add(WarrantyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  List<ProductList>? products;
  String? urlCar;
  String? urlReceive;

  WarrantyData({
    this.id,
    this.warrantyNo,
    this.warrantyDate,
    this.dealerCode,
    this.dealerName,
    this.customerName,
    this.customerPhone,
    this.customerLicensePlate,
    this.customerEmail,
    this.customerMile,
    this.products,
    this.urlCar,
    this.urlReceive,
  });

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
      products = <ProductList>[];
      json['products'].forEach((v) {
        products!.add(ProductList.fromJson(v));
      });
    }
    urlCar = json['url_car'];
    urlReceive = json['url_receive'];
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
    data['url_car'] = urlCar;
    data['url_receive'] = urlReceive;
    return data;
  }
}

class ProductList {
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

  ProductList(
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

  ProductList.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['product_brand'] = productBrand;
    data['product_amount'] = productAmount;
    data['product_structure_expire'] = productStructureExpire;
    data['product_color_expire'] = productColorExpire;
    data['product_tire_expire'] = productTireExpire;
    data['product_mile_expire'] = productMileExpire;
    data['product_promotion_expire'] = productPromotionExpire;
    data['warranty_no'] = warrantyNo;
    data[':promotion'] = promotion;
    data[':promotion_day'] = promotionDay;
    data[':promotion_mile'] = promotionMile;
    data[':warranty_wheel_year'] = warrantyWheelYear;
    data[':warranty_wheel_color'] = warrantyWheelColor;
    data[':warranty_tire_year'] = warrantyTireYear;
    data[':warranty_tire_mile'] = warrantyTireMile;
    data[':warranty_tire_year_zestino'] = warrantyTireYearZestino;
    data[':warranty_tire_mile_zestino'] = warrantyTireMileZestino;
    return data;
  }
}
