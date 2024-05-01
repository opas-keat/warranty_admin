import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:html' as html;

import '../../data/request/config_service_request.dart';
import '../../data/response/config_service_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_params.dart';
import '../api_utils.dart';

class ConfigService {
  final title = "ConfigService";

  Future<void> downloadExcels() async {
    try {
      final response = await Dio().get(
          '${Api.baseUrl}${Api.apiContext}${Api.apiVersion}${ApiEndPoints.warranty}/excels',
          options: Options(
            headers: {
              "Authorization": 'Bearer ${html.window.sessionStorage["token"]}',
            },
            responseType: ResponseType.bytes,
          ));

// base64Encode is from dart:convert
      final base64 = base64Encode(response.data);

// Create the link with the file
// AnchorElement comes from the
      final anchor = html.AnchorElement(
          href: 'data:application/octet-stream;base64,$base64')
        ..target = 'blank';

// add the name and extension
      anchor.download = 'excels.xlsx';

// add the anchor to the document body
      html.document.body?.append(anchor);

// trigger download
      anchor.click();

// remove the anchor
      anchor.remove();
      // talker.info(path);
    } catch (e) {
      talker.error(e);
    }
  }

  Future<ConfigServiceResponse?> list(
    Map<String, String> qParams,
  ) async {
    try {
      final response = await apiUtils.get(
        url:
            Api.baseUrl + Api.apiContext + Api.apiVersion + ApiEndPoints.config,
        queryParameters: qParams,
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      ConfigServiceResponse configServiceResponse =
          ConfigServiceResponse.fromJson(jsonDecode(response.toString()));
      return configServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }

  Future<ConfigServiceResponse?> update(
    List<Configs> listConfigs,
  ) async {
    talker.debug(ConfigServiceRequest(configs: listConfigs).toJson());
    try {
      final response = await apiUtils.put(
        url:
            Api.baseUrl + Api.apiContext + Api.apiVersion + ApiEndPoints.config,
        data: ConfigServiceRequest(configs: listConfigs),
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      ConfigServiceResponse configServiceResponse =
          ConfigServiceResponse.fromJson(jsonDecode(response.toString()));
      talker.debug('code:: ${configServiceResponse.code}');
      if (configServiceResponse.code == "000") {
        return ConfigServiceResponse(
          code: configServiceResponse.code,
          message: response.data["message"],
          data: configServiceResponse.data,
        );
      }
      return ConfigServiceResponse.withError(
          code: codeResponseNull, msg: response.data["message"]);
    } catch (e) {
      talker.error(e);
      return ConfigServiceResponse.withError(
          code: codeError, msg: apiUtils.handleError(e));
    }
  }
}
