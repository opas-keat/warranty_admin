class DealerServiceResponse {
  String? code;
  String? message;
  List<DealerData>? data;

  DealerServiceResponse({this.code, this.message, this.data});

  DealerServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  DealerServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DealerData>[];
      json['data'].forEach((v) {
        data!.add(DealerData.fromJson(v));
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

class DealerData {
  String? id;
  String? dealerCode;
  String? dealerName;
  String? dealerAddress;
  String? dealerPhone;
  String? dealerTax;
  int? dealerArea;

  DealerData(
      {this.id,
      this.dealerCode,
      this.dealerName,
      this.dealerAddress,
      this.dealerPhone,
      this.dealerTax,
      this.dealerArea});

  DealerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dealerCode = json['dealer_code'];
    dealerName = json['dealer_name'];
    dealerAddress = json['dealer_address'];
    dealerPhone = json['dealer_phone'];
    dealerTax = json['dealer_tax'];
    dealerArea = json['dealer_area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dealer_code'] = dealerCode;
    data['dealer_name'] = dealerName;
    data['dealer_address'] = dealerAddress;
    data['dealer_phone'] = dealerPhone;
    data['dealer_tax'] = dealerTax;
    data['dealer_area'] = dealerArea;
    return data;
  }
}
