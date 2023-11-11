class ConfigServiceRequest {
  List<Configs>? configs;

  ConfigServiceRequest({this.configs});

  ConfigServiceRequest.fromJson(Map<String, dynamic> json) {
    if (json['configs'] != null) {
      configs = <Configs>[];
      json['configs'].forEach((v) {
        configs!.add(Configs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (configs != null) {
      data['configs'] = configs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Configs {
  String? id;
  String? configCode;
  String? configDetail;
  String? configValue;

  Configs({this.id, this.configCode, this.configDetail, this.configValue});

  Configs.fromJson(Map<String, dynamic> json) {
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
