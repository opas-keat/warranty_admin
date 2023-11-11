class NotificationServiceResponse {
  String? code;
  String? message;
  String? data;

  NotificationServiceResponse({this.code, this.message, this.data});

  NotificationServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  NotificationServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
