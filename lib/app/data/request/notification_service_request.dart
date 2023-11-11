class NotificationServiceRequest {
  String? id;

  NotificationServiceRequest({this.id});

  NotificationServiceRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    return data;
  }
}
