import 'dart:convert';

import 'package:dio/dio.dart';
import '../../data/request/promotion_service_request.dart';
import '../../data/response/delete_service_response.dart';
import '../../data/response/promotion_service_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_params.dart';
import '../api_utils.dart';

class PromotionService {
  final title = "PromotionService";

  Future<PromotionServiceResponse?> create(
    List<Promotions> listPromotions,
  ) async {
    try {
      final response = await apiUtils.post(
        url: Api.baseUrl +
            Api.apiContext +
            Api.apiVersion +
            ApiEndPoints.promotion,
        data: PromotionServiceRequest(promotions: listPromotions),
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      PromotionServiceResponse promotionServiceResponse =
          PromotionServiceResponse.fromJson(jsonDecode(response.toString()));
      if (promotionServiceResponse.code == "000") {
        return PromotionServiceResponse(
          code: promotionServiceResponse.code,
          message: response.data["message"],
          data: promotionServiceResponse.data,
        );
      }
      return PromotionServiceResponse.withError(
          code: codeResponseNull, msg: response.data["message"]);
    } catch (e) {
      talker.error(e);
      return PromotionServiceResponse.withError(
          code: codeError, msg: apiUtils.handleError(e));
    }
  }

  Future<PromotionServiceResponse?> update(
    List<Promotions> listPromotions,
  ) async {
    try {
      final response = await apiUtils.put(
        url: Api.baseUrl +
            Api.apiContext +
            Api.apiVersion +
            ApiEndPoints.promotion,
        data: PromotionServiceRequest(promotions: listPromotions),
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      PromotionServiceResponse promotionServiceResponse =
          PromotionServiceResponse.fromJson(jsonDecode(response.toString()));
      if (promotionServiceResponse.code == "000") {
        return PromotionServiceResponse(
          code: promotionServiceResponse.code,
          message: response.data["message"],
          data: promotionServiceResponse.data,
        );
      }
      return PromotionServiceResponse.withError(
          code: codeResponseNull, msg: response.data["message"]);
    } catch (e) {
      talker.error(e);
      return PromotionServiceResponse.withError(
          code: codeError, msg: apiUtils.handleError(e));
    }
  }

  Future<PromotionServiceResponse?> list(
    Map<String, String> qParams,
  ) async {
    try {
      final response = await apiUtils.get(
        url: Api.baseUrl +
            Api.apiContext +
            Api.apiVersion +
            ApiEndPoints.promotion,
        queryParameters: qParams,
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      PromotionServiceResponse promotionServiceResponse =
          PromotionServiceResponse.fromJson(jsonDecode(response.toString()));
      return promotionServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }

  Future<DeleteServiceResponse?> delete(
    String id,
  ) async {
    try {
      final response = await apiUtils.delete(
        url:
            "${Api.baseUrl}${Api.apiContext}${Api.apiVersion}${ApiEndPoints.promotion}/$id",
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      DeleteServiceResponse deleteServiceResponse =
          DeleteServiceResponse.fromJson(jsonDecode(response.toString()));
      return deleteServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }
}
