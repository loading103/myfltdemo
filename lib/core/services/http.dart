import 'package:dio/dio.dart';
import 'config.dart';
import 'interceptor_log.dart';


enum HttpMethod {
  get,
  post
}

class HttpRequest {

  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseURL,
      connectTimeout: HttpConfig.timeout
  );
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
        HttpMethod method = HttpMethod.get,
        Map<String, dynamic>? params,
        bool islog = false}) async {

    // 创建单独配置
    String methodString = method==HttpMethod.get?'get':'post';
    final options = Options(method: methodString);

    // 创建默认的全局拦截器
    dio.interceptors.add(ResponseInterceptors());
    dio.interceptors.add(DioLogInterceptor(islog));
    // 发送网络请求
    try {
      Response response = await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch(e) {
      return Future.error(e);
    }

  }
}

// 拦截类
class ResponseInterceptors extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: 请求拦截 - 加入参数
    options.queryParameters['publishChannel'] = 'MICRO_SITE';
    options.queryParameters['siteCode'] = 'site241962';
    options.queryParameters['clientType'] = 'web';
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: 响应拦截 - 数据预处理
    super.onResponse(response, handler);
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: 错误拦截 - 失败预处理

    super.onError(err, handler);
  }
}