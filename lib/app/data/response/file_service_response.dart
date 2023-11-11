class FileServiceResponse {
  String? code;
  String? message;
  Data? data;

  FileServiceResponse({this.code, this.message, this.data});

  FileServiceResponse.withError({
    code,
    String? msg,
  }) : message = msg;

  FileServiceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  String? id;
  String? fileName;
  String? fileType;
  int? fileSize;
  String? module;
  String? linkType;
  String? linkId;

  Data(
      {this.id,
      this.fileName,
      this.fileType,
      this.fileSize,
      this.module,
      this.linkType,
      this.linkId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['file_name'];
    fileType = json['file_type'];
    fileSize = json['file_size'];
    module = json['module'];
    linkType = json['link_type'];
    linkId = json['link_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['file_name'] = fileName;
    data['file_type'] = fileType;
    data['file_size'] = fileSize;
    data['module'] = module;
    data['link_type'] = linkType;
    data['link_id'] = linkId;
    return data;
  }
}
