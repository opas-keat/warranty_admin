class WarrantyDetailServiceResponse {
  String? code;
  String? message;
  List<WarrantyDetailData>? data;

  WarrantyDetailServiceResponse({this.code, this.message, this.data});

  WarrantyDetailServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <WarrantyDetailData>[];
      json['data'].forEach((v) {
        data!.add(WarrantyDetailData.fromJson(v));
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

class WarrantyDetailData {
  String? id;
  String? warrantyNo;
  String? warrantyDate;
  String? dealerCode;
  String? dealerName;
  List<Products>? products;

  WarrantyDetailData(
      {this.id,
      this.warrantyNo,
      this.warrantyDate,
      this.dealerCode,
      this.dealerName,
      this.products});

  WarrantyDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    warrantyNo = json['warranty_no'];
    warrantyDate = json['warranty_date'];
    dealerCode = json['dealer_code'];
    dealerName = json['dealer_name'];
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
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? type;
  String? detail;
  int? amount;

  Products({this.id, this.type, this.detail, this.amount});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    detail = json['detail'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['detail'] = detail;
    data['amount'] = amount;
    return data;
  }
}
