import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data/request/dealer_system_link_service_request.dart';
import '../../data/response/dealer_system_link_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_utils.dart';

class SystemLinkService {
  final title = "SystemLinkService";

  Future<DealerSystemLinkResponse?> list(
    String dealerCode,
  ) async {
    try {
      final response = await apiUtils.post(
        url: Api.baseUrlSystemLink + ApiEndPoints.systemLinkDealers,
        data: DealerSystemLinkRequest(
          limit: 20,
          criteria: DealerSystemLinkCriteria(
            dealerCode: dealerCode,
          ),
        ).toJson(),
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      DealerSystemLinkResponse dealerServiceResponse =
          DealerSystemLinkResponse.fromJson(jsonDecode(response.toString()));
      return dealerServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }

  // Future<DealerSystemLinkResponse?> listDealerByCode(
  //   String dealerCode,
  // ) async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     return DealerSystemLinkResponse.withError(
  //         statusCode: codeNoInternet, msg: apiUtils.getNetworkError());
  //   }

  //   try {
  //     final result = await apiUtils.post(
  //       url: Api.baseUrlSystemLink + ApiEndPoints.systemLinkDealers,
  //       data: DealerSystemLinkRequest(
  //         limit: 20,
  //         criteria: DealerSystemLinkCriteria(
  //           dealerCode: dealerCode,
  //         ),
  //       ).toJson(),
  //     );
  //     talker.debug('$title::listDealerByCode:: ${result.data['status_code']}');
  //     if (result.data['status_code'] == 200) {
  //       return DealerSystemLinkResponse.fromJson(result.data);
  //     }
  //     return DealerSystemLinkResponse.withError(
  //         statusCode: codeResponseNull, msg: "");
  //   } catch (e) {
  //     return DealerSystemLinkResponse.withError(
  //         statusCode: codeError, msg: apiUtils.handleError(e));
  //   }
  // }
}
