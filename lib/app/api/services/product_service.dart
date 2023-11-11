import 'dart:convert';

import 'package:dio/dio.dart';
import '../../data/response/product_service_response.dart';
import '../../shared/utils.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_utils.dart';

class ProductService {
  final title = "ProductService";

  Future<ProductServiceResponse?> list(
    Map<String, String> qParams,
  ) async {
    try {
      final response = await apiUtils.get(
        url: Api.baseUrl +
            Api.apiContext +
            Api.apiVersion +
            ApiEndPoints.product,
        queryParameters: qParams,
        options: Options(
          headers: apiUtils.secureHeaders,
        ),
      );
      ProductServiceResponse productServiceResponse =
          ProductServiceResponse.fromJson(jsonDecode(response.toString()));
      return productServiceResponse;
    } catch (e) {
      talker.error(e);
    }
    return null;
  }
}
