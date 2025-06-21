import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = CacheHelper.getData(key: ApiEndpoints.token);

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    String? language = CacheHelper.getData(key: 'language_code');
    if (language != null) {
      options.headers['Accept-Language'] = language;
    }

    // options.headers['Accept-Language'] = "ar";

    super.onRequest(options, handler);
  }
}
