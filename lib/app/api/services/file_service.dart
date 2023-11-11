import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../../data/response/file_service_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_params.dart';
import '../api_utils.dart';

class FileService {
  final title = "FileService";

  Future<FileServiceResponse?> create(
    String fileName,
    int fileSize,
    Uint8List bytes,
    String? warrantyNo,
    String linkType,
  ) async {
    try {
      var formData = FormData.fromMap({
        'id': 0,
        'file_name': fileName,
        'file_size': fileSize,
        'link_type': linkType,
        'link_id': warrantyNo,
        linkType: MultipartFile.fromBytes(
          bytes,
          filename: fileName,
        ),
      });
      final response = await apiUtils.post(
        url: Api.baseUrl + Api.apiContext + Api.apiVersion + ApiEndPoints.file,
        data: formData,
        options: Options(headers: {
          "Authorization": 'Bearer ${window.sessionStorage["token"]}',
          Headers.contentLengthHeader: formData.length
        }),
      );
      FileServiceResponse fileServiceResponse =
          FileServiceResponse.fromJson(jsonDecode(response.toString()));
      talker.debug('code:: ${fileServiceResponse.code}');
      if (fileServiceResponse.code == "000") {
        return FileServiceResponse(
          code: fileServiceResponse.code,
          message: response.data["message"],
          data: fileServiceResponse.data,
        );
      }
      return FileServiceResponse.withError(
          code: codeResponseNull, msg: response.data["message"]);
    } catch (e) {
      talker.error(e);
      return FileServiceResponse.withError(
          code: codeError, msg: apiUtils.handleError(e));
    }
  }
}
