import 'dart:convert';

import 'package:dio/dio.dart';
import '../../data/request/warranty_service_request.dart';
import '../../data/response/customer_service_response.dart';
import '../../data/response/warranty_service_list_response.dart';
import '../../data/response/warranty_service_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_params.dart';
import '../api_utils.dart';

class WarrantyService {
  final title = "WarrantyService";

  Future<WarrantyServiceResponse?> create(
    Warranty warranty,
  ) async {
    try {
      final response = await apiUtils.post(
        url: Api.baseUrl +
            Api.apiContext +
            Api.apiVersion +
            ApiEndPoints.warranty,
        data: WarrantyServiceRequest(warranty: warranty),
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      WarrantyServiceResponse warrantyServiceResponse =
          WarrantyServiceResponse.fromJson(jsonDecode(response.toString()));
      if (warrantyServiceResponse.code == "000") {
        return WarrantyServiceResponse(
          code: warrantyServiceResponse.code,
          message: response.data["message"],
          data: warrantyServiceResponse.data,
        );
      }
      return WarrantyServiceResponse.withError(
          code: codeResponseNull, msg: response.data["message"]);
    } catch (e) {
      talker.error(e);
      return WarrantyServiceResponse.withError(
          code: codeError, msg: apiUtils.handleError(e));
    }
  }

  // Future<WarrantyServiceResponse?> update(
  //   Warranty warranty,
  // ) async {
  //   talker.debug(WarrantyServiceRequest(Warrantys: listWarrantys).toJson());
  //   try {
  //     final response = await apiUtils.put(
  //       url: Api.ectApiContext + Api.ectApiVersion + ApiEndPoints.Warranty,
  //       data: WarrantyServiceRequest(Warrantys: listWarrantys),
  //       options: Options(
  //         headers: apiUtils.secureHeaders,
  //       ),
  //     );
  //     WarrantyServiceResponse WarrantyServiceResponse =
  //         WarrantyServiceResponse.fromJson(jsonDecode(response.toString()));
  //     talker.debug('code:: ${WarrantyServiceResponse.code}');
  //     if (WarrantyServiceResponse.code == "000") {
  //       return WarrantyServiceResponse(
  //         code: WarrantyServiceResponse.code,
  //         message: response.data["message"],
  //         data: WarrantyServiceResponse.data,
  //       );
  //     }
  //     return WarrantyServiceResponse.withError(
  //         code: codeResponseNull, msg: response.data["message"]);
  //   } catch (e) {
  //     talker.error(e);
  //     return WarrantyServiceResponse.withError(
  //         code: codeError, msg: apiUtils.handleError(e));
  //   }
  // }

  // Future<DeleteServiceResponse?> delete(
  //   int id,
  // ) async {
  //   try {
  //     final response = await apiUtils.delete(
  //       url:
  //           "${Api.ectApiContext}${Api.ectApiVersion}${ApiEndPoints.Warranty}/$id",
  //       options: Options(
  //         headers: apiUtils.secureHeaders,
  //       ),
  //     );
  //     DeleteServiceResponse deleteServiceResponse =
  //         DeleteServiceResponse.fromJson(jsonDecode(response.toString()));
  //     return deleteServiceResponse;
  //   } catch (e) {
  //     talker.error(e);
  //   }
  //   return null;
  // }

  Future<WarrantyServiceResponse?> getById(
    String id,
  ) async {
    try {
      final response = await apiUtils.get(
        url:
            '${Api.baseUrl}${Api.apiContext}${Api.apiVersion}${ApiEndPoints.warranty}/$id',
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      WarrantyServiceResponse warrantyServiceResponse =
          WarrantyServiceResponse.fromJson(jsonDecode(response.toString()));
      // talker.debug("WarrantyServiceResponse $WarrantyServiceResponse");
      return warrantyServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }

  Future<WarrantyServiceListResponse?> list(
    Map<String, String> qParams,
  ) async {
    try {
      final response = await apiUtils.get(
        url: Api.baseUrl +
            Api.apiContext +
            Api.apiVersion +
            ApiEndPoints.warranty,
        queryParameters: qParams,
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      WarrantyServiceListResponse warrantyServiceListResponse =
          WarrantyServiceListResponse.fromJson(jsonDecode(response.toString()));
      // talker.debug("warrantyServiceListResponse $warrantyServiceListResponse");
      return warrantyServiceListResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }

  Future<CustomerServiceResponse?> listCustomer(
    Map<String, String> qParams,
  ) async {
    try {
      final response = await apiUtils.get(
        url:
            '${Api.baseUrl}${Api.apiContext}${Api.apiVersion}${ApiEndPoints.warranty}/customer',
        queryParameters: qParams,
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      CustomerServiceResponse customerServiceResponse =
          CustomerServiceResponse.fromJson(jsonDecode(response.toString()));
      // talker.debug("WarrantyServiceResponse $WarrantyServiceResponse");
      return customerServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }
}
