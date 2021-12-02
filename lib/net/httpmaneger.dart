import 'package:dio/dio.dart';

import 'interceptor_log.dart';
import 'path.dart';

class HttpUtils {

  static final HttpUtils _instance = HttpUtils._internal( baseUrl:  UrlPath.BASE_URL);
  Dio? _dio;
  static const CODE_SUCCESS = 200;
  static const CODE_TIME_OUT = -1;
  static const CONNECT_TIMEOUT = 15000;

  factory HttpUtils() => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpUtils._internal({required String baseUrl}) {
    if (null == _dio) {
      _dio =  Dio(BaseOptions(
        //请求基地址,可以包含子路径
        baseUrl: UrlPath.BASE_URL,
        //连接服务器超时时间，单位是毫秒.
        connectTimeout: 10000,
        //响应流上前后两次接受到数据的间隔，单位为毫秒。
        receiveTimeout: 5000,
        //Http请求头.
        headers: {
          //do something
          "version": "1.0.0",
          "source": "android",
          "siteCode": "site241962"

        },
        //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
        contentType: Headers.formUrlEncodedContentType,
        //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
        responseType: ResponseType.plain,

      ));
      _dio!.interceptors.add(DioLogInterceptor());
    }
  }

  static HttpUtils getInstance() {
    return _instance._normal();
  }
  static HttpUtils getBaseUrlInstance({required String baseUrl}) {
    return _instance._baseUrl(baseUrl);
  }
  //用于指定特定域名
  HttpUtils _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio!.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  HttpUtils _normal() {
    if (_dio != null) {
      if (_dio!.options.baseUrl != UrlPath.BASE_URL) {
        _dio!.options.baseUrl = UrlPath.BASE_URL;
      }
    }
    return this;
  }
  /*
   * get请求
   */
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio!.get(url, queryParameters: data, options: options, cancelToken: cancelToken);
      return response;
    } on DioError catch (e) {
      print('get error---------$e');
      formatError(e);
    }
  }

  /*
   * post请求
   */
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio!.post(url, queryParameters: data, options: options, cancelToken: cancelToken);
      print('post success---------${response.data}');
      return response;
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }

  }

  /*
   * 下载文件
   */
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await _dio!.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
            //进度
            print("$count $total");
          });
      print('downloadFile success---------${response.data}');
      return response.data;
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }

  }

  /*
   * error统一处理
   */
  void formatError(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      // It occurs when url is opened timeout.
      print("连接超时");
    } else if (e.type == DioErrorType.sendTimeout) {
      // It occurs when url is sent timeout.
      print("请求超时");
    } else if (e.type == DioErrorType.receiveTimeout) {
      //It occurs when receiving timeout
      print("响应超时");
    } else if (e.type == DioErrorType.response) {
      // When the server response, but with a incorrect status, such as 404, 503...
      print("出现异常");
    } else if (e.type == DioErrorType.cancel) {
      // When the request is cancelled, dio will throw a error with this type.
      print("请求取消");
    } else {
      //DEFAULT Default error type, Some other Error. In this case, you can read the DioError.error if it is not null.
      print("未知错误");
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}

