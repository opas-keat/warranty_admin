class AuthenServiceResponse {
  String? code;
  String? message;
  AuthenData? data;

  AuthenServiceResponse({this.code, this.message, this.data});

  AuthenServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  AuthenServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? AuthenData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AuthenData {
  List<Roles>? roles;
  String? token;
  String? username;

  AuthenData({this.roles, this.token, this.username});

  AuthenData.fromJson(Map<String, dynamic> json) {
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(Roles.fromJson(v));
      });
    }
    token = json['token'];
    username = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    data['user_name'] = username;
    return data;
  }
}

class Roles {
  String? role;

  Roles({this.role});

  Roles.fromJson(Map<String, dynamic> json) {
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    return data;
  }
}
