class WarrantyCustomerServiceResponse {
  String? code;
  String? message;
  List<WarrantyCustomerData>? data;

  WarrantyCustomerServiceResponse({this.code, this.message, this.data});

  WarrantyCustomerServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <WarrantyCustomerData>[];
      json['data'].forEach((v) {
        data!.add(WarrantyCustomerData.fromJson(v));
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

class WarrantyCustomerData {
  String? id;
  String? fullName;
  String? licensePlate;
  String? telephone;
  String? email;

  WarrantyCustomerData(
      {this.id, this.fullName, this.licensePlate, this.telephone, this.email});

  WarrantyCustomerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    licensePlate = json['license_plate'];
    telephone = json['telephone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['license_plate'] = licensePlate;
    data['telephone'] = telephone;
    data['email'] = email;
    return data;
  }
}
