class PromotionServiceResponse {
  String? code;
  String? message;
  List<PromotionData>? data;

  PromotionServiceResponse({this.code, this.message, this.data});

  PromotionServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  PromotionServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <PromotionData>[];
      json['data'].forEach((v) {
        data!.add(PromotionData.fromJson(v));
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

class PromotionData {
  String? id;
  String? promotionType;
  String? promotionBrand;
  String? promotionDetail;
  int? promotionWarrantyDay;
  String? promotionStatus;
  String? promotionFrom;
  String? promotionTo;

  PromotionData(
      {this.id,
      this.promotionType,
      this.promotionBrand,
      this.promotionDetail,
      this.promotionWarrantyDay,
      this.promotionStatus,
      this.promotionFrom,
      this.promotionTo});

  PromotionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    promotionType = json['promotion_type'];
    promotionBrand = json['promotion_brand'];
    promotionDetail = json['promotion_detail'];
    promotionWarrantyDay = json['promotion_warranty_day'];
    promotionStatus = json['promotion_status'];
    promotionFrom = json['promotion_from'];
    promotionTo = json['promotion_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['promotion_type'] = promotionType;
    data['promotion_brand'] = promotionBrand;
    data['promotion_detail'] = promotionDetail;
    data['promotion_warranty_day'] = promotionWarrantyDay;
    data['promotion_status'] = promotionStatus;
    data['promotion_from'] = promotionFrom;
    data['promotion_to'] = promotionTo;
    return data;
  }
}
