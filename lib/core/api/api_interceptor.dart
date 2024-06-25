

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'ar';
    //options.headers['Authorization'] = CacheHelper().getData(key: ApiKey.token);

    super.onRequest(options, handler);
  }
}