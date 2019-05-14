import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_wan_android/model/protocol/base_resp.dart';
import 'package:flutter_wan_android/net/apis.dart';
import 'package:flutter_wan_android/net/http_config.dart';

class DioDriver {
  factory DioDriver() => _getInstance();

  static DioDriver get instance => _getInstance();
  static DioDriver _instance;
  static Dio _dio;

  String _status = "status";

  /// BaseResp [int code]字段 key, 默认：errorCode.
  String _codeCode = "errorCode";

  /// BaseResp [String msg]字段 key, 默认：errorMsg.
  String _errorMsg = "errorMsg";

  /// BaseResp [T data]字段 key, 默认：data.
  String _dataKey = "data";

  static DioDriver _getInstance() {
    if (_instance == null) {
      _instance = new DioDriver._init();
    }
    return _instance;
  }

  DioDriver._init() {
    _dio = new Dio();
    BaseOptions options = getDefOptions();
    options.baseUrl = BaseUrl.wan_android;
    _dio.options = options;
  }

  /// get Def Options.
  static BaseOptions getDefOptions() {
    BaseOptions options = new BaseOptions();
    options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    options.connectTimeout = 1000 * 10;
    options.receiveTimeout = 1000 * 20;
    return options;
  }

  Future<BaseResp<T>> getData<T>(String path, {data, Options options}) async {
    Response response;
    response = await _dio.get(path, queryParameters: data);
    if (response.statusCode == HttpStatus.ok) {
      try {
        return BaseResp(response.data[_status], response.data[_codeCode],
            response.data[_errorMsg], response.data[_dataKey]);
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  Future<BaseResp<T>> postData<T>(String path, {data, Options options}) async {
    Response response;
    response = await _dio.post(path, queryParameters: data);
    if (response.statusCode == HttpStatus.ok) {
      try {
        return BaseResp(response.data[_status], response.data[_codeCode],
            response.data[_errorMsg], response.data[_dataKey]);
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }
}
