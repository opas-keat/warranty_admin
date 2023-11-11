class DealerSystemLinkRequest {
  DealerSystemLinkCriteria? criteria;
  int? limit;

  DealerSystemLinkRequest({this.criteria, this.limit});

  DealerSystemLinkRequest.fromJson(Map<String, dynamic> json) {
    criteria = json['criteria'] != null
        ? DealerSystemLinkCriteria.fromJson(json['criteria'])
        : null;
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (criteria != null) {
      data['criteria'] = criteria!.toJson();
    }
    data['limit'] = limit;
    return data;
  }
}

class DealerSystemLinkCriteria {
  String? dealerCode;

  DealerSystemLinkCriteria({this.dealerCode});

  DealerSystemLinkCriteria.fromJson(Map<String, dynamic> json) {
    dealerCode = json['dealer_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dealer_code'] = dealerCode;
    return data;
  }
}
