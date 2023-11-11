class WarrantyServiceRequest {
  Warranty? warranty;

  WarrantyServiceRequest({this.warranty});

  WarrantyServiceRequest.fromJson(Map<String, dynamic> json) {
    warranty =
        json['warranty'] != null ? Warranty.fromJson(json['warranty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (warranty != null) {
      data['warranty'] = warranty!.toJson();
    }
    return data;
  }
}

class Warranty {
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

  Warranty(
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

  Warranty.fromJson(Map<String, dynamic> json) {
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
  String? productType;
  String? productBrand;
  int? productAmount;
  String? warrantyNo;

  Products(
      {this.productType,
      this.productBrand,
      this.productAmount,
      this.warrantyNo});

  Products.fromJson(Map<String, dynamic> json) {
    productType = json['product_type'];
    productBrand = json['product_brand'];
    productAmount = json['product_amount'];
    warrantyNo = json['WarrantyNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_type'] = productType;
    data['product_brand'] = productBrand;
    data['product_amount'] = productAmount;
    data['WarrantyNo'] = warrantyNo;
    return data;
  }
}
