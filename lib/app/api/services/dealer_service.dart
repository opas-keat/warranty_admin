import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/request/dealer_service_request.dart';
import '../../data/response/dealer_service_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_params.dart';
import '../api_utils.dart';

class DealerService {
  final title = "DealerService";

  Future<DealerServiceResponse?> create(
    List<Dealers> listDealers,
  ) async {
    talker.debug(DealerServiceRequest(dealers: listDealers).toJson());
    try {
      final response = await apiUtils.post(
        url:
            Api.baseUrl + Api.apiContext + Api.apiVersion + ApiEndPoints.dealer,
        data: DealerServiceRequest(dealers: listDealers),
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      DealerServiceResponse dealerServiceResponse =
          DealerServiceResponse.fromJson(jsonDecode(response.toString()));
      talker.debug('code:: ${dealerServiceResponse.code}');
      if (dealerServiceResponse.code == "000") {
        return DealerServiceResponse(
          code: dealerServiceResponse.code,
          message: response.data["message"],
          data: dealerServiceResponse.data,
        );
      }
      return DealerServiceResponse.withError(
          code: codeResponseNull, msg: response.data["message"]);
    } catch (e) {
      talker.error(e);
      return DealerServiceResponse.withError(
          code: codeError, msg: apiUtils.handleError(e));
    }
  }

  Future<DealerServiceResponse?> getById(
    Map<String, String> qParams,
  ) async {
    try {
      final response = await apiUtils.get(
        url:
            Api.baseUrl + Api.apiContext + Api.apiVersion + ApiEndPoints.dealer,
        queryParameters: qParams,
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      DealerServiceResponse dealerServiceResponse =
          DealerServiceResponse.fromJson(jsonDecode(response.toString()));
      return dealerServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }

  Future<DealerServiceResponse?> list(
    Map<String, String> qParams,
  ) async {
    try {
      final response = await apiUtils.get(
        url:
            Api.baseUrl + Api.apiContext + Api.apiVersion + ApiEndPoints.dealer,
        queryParameters: qParams,
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      DealerServiceResponse dealerServiceResponse =
          DealerServiceResponse.fromJson(jsonDecode(response.toString()));
      return dealerServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }
}
