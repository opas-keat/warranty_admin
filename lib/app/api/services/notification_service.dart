import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/request/notification_service_request.dart';
import '../../data/response/notification_service_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_params.dart';
import '../api_utils.dart';

class NotificationService {
  final title = "NotificationService";

  Future<NotificationServiceResponse?> email(
    String id,
  ) async {
    try {
      final response = await apiUtils.post(
        url:
            "${Api.baseUrl}${Api.apiContext}${Api.apiVersion}${ApiEndPoints.notification}/email",
        data: NotificationServiceRequest(id: id),
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      NotificationServiceResponse notificationServiceResponse =
          NotificationServiceResponse.fromJson(jsonDecode(response.toString()));
      if (notificationServiceResponse.code == "000") {
        return NotificationServiceResponse(
          code: notificationServiceResponse.code,
          message: response.data["message"],
          data: notificationServiceResponse.data,
        );
      }
      return NotificationServiceResponse.withError(
          code: codeResponseNull, msg: response.data["message"]);
    } catch (e) {
      talker.error(e);
      return NotificationServiceResponse.withError(
          code: codeError, msg: apiUtils.handleError(e));
    }
  }
}
