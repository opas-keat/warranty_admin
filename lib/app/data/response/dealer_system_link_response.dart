class DealerSystemLinkResponse {
  int? statusCode;
  String? code;
  String? message;
  DealerSystemLinkData? data;

  DealerSystemLinkResponse(
      {this.statusCode, this.code, this.message, this.data});

  DealerSystemLinkResponse.withError({
    this.statusCode,
    String? msg,
  }) : message = msg;

  DealerSystemLinkResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? DealerSystemLinkData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DealerSystemLinkData {
  List<DealerSystemLinkRows>? rows;
  int? totalCount;

  DealerSystemLinkData({this.rows, this.totalCount});

  DealerSystemLinkData.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      rows = <DealerSystemLinkRows>[];
      json['rows'].forEach((v) {
        rows!.add(DealerSystemLinkRows.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = totalCount;
    return data;
  }
}

class DealerSystemLinkRows {
  String? id;
  String? code;
  String? name;
  String? address;
  String? phone;
  String? tax;

  DealerSystemLinkRows(
      {this.id, this.code, this.name, this.address, this.phone, this.tax});

  DealerSystemLinkRows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['tax'] = tax;
    return data;
  }
}
