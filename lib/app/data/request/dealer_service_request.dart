class DealerServiceRequest {
  List<Dealers>? dealers;

  DealerServiceRequest({this.dealers});

  DealerServiceRequest.fromJson(Map<String, dynamic> json) {
    if (json['dealers'] != null) {
      dealers = <Dealers>[];
      json['dealers'].forEach((v) {
        dealers!.add(Dealers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dealers != null) {
      data['dealers'] = dealers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dealers {
  String? dealerCode;
  String? dealerName;
  String? dealerAddress;
  String? dealerPhone;
  String? dealerTax;
  int? dealerArea;

  Dealers(
      {this.dealerCode,
      this.dealerName,
      this.dealerAddress,
      this.dealerPhone,
      this.dealerTax,
      this.dealerArea});

  Dealers.fromJson(Map<String, dynamic> json) {
    dealerCode = json['dealer_code'];
    dealerName = json['dealer_name'];
    dealerAddress = json['dealer_address'];
    dealerPhone = json['dealer_phone'];
    dealerTax = json['dealer_tax'];
    dealerArea = json['dealer_area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dealer_code'] = dealerCode;
    data['dealer_name'] = dealerName;
    data['dealer_address'] = dealerAddress;
    data['dealer_phone'] = dealerPhone;
    data['dealer_tax'] = dealerTax;
    data['dealer_area'] = dealerArea;
    return data;
  }
}
