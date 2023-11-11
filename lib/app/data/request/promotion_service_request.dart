class PromotionServiceRequest {
  List<Promotions>? promotions;

  PromotionServiceRequest({this.promotions});

  PromotionServiceRequest.fromJson(Map<String, dynamic> json) {
    if (json['promotions'] != null) {
      promotions = <Promotions>[];
      json['promotions'].forEach((v) {
        promotions!.add(Promotions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (promotions != null) {
      data['promotions'] = promotions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promotions {
  String? id;
  String? promotionType;
  String? promotionBrand;
  String? promotionDetail;
  int? promotionWarrantyDay;
  String? promotionStatus;
  String? promotionFrom;
  String? promotionTo;

  Promotions(
      {this.id,
      this.promotionType,
      this.promotionBrand,
      this.promotionDetail,
      this.promotionWarrantyDay,
      this.promotionStatus,
      this.promotionFrom,
      this.promotionTo});

  Promotions.fromJson(Map<String, dynamic> json) {
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
