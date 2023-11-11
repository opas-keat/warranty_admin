class ConfigServiceResponse {
  String? code;
  String? message;
  List<ConfigData>? data;

  ConfigServiceResponse({this.code, this.message, this.data});

  ConfigServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  ConfigServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ConfigData>[];
      json['data'].forEach((v) {
        data!.add(ConfigData.fromJson(v));
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

class ConfigData {
  String? id;
  String? configCode;
  String? configDetail;
  String? configValue;

  ConfigData({this.id, this.configCode, this.configDetail, this.configValue});

  ConfigData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    configCode = json['config_code'];
    configDetail = json['config_detail'];
    configValue = json['config_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['config_code'] = configCode;
    data['config_detail'] = configDetail;
    data['config_value'] = configValue;
    return data;
  }
}
