/*
 * @Author: your name
 * @Date: 2020-07-12 19:54:08
 * @LastEditTime: 2020-07-12 19:54:08
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /hsk_flutter/lib/app/request.dart
 */

import 'API.dart';
import 'package:dio/dio.dart'; //处理网络请求
import 'dart:convert';
import 'ResultCode.dart';
import 'package:hsk_flutter/constant/GlobalConfig.dart';

class RequestManager {
  static RequestManager _instance;

  static RequestManager getInstance() {
    if (_instance == null) {
      _instance = RequestManager();
    }
    return _instance;
  }

  Dio dio = new Dio();
  RequestManager() {
    dio.options.headers = {
      //设置请求头
      "Content-Type": 'application/json',
    };
    dio.options.baseUrl =
        API.BASE_URL; //'http://apiwl3.atjubo.com/atapiwuliu/';
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;

    // dio.interceptors.add(LogInterceptor(responseBody: GlobalConfig.isDebug)); //是否开启请求日志
    // dio.interceptors.add(CookieManager(CookieJar()));//缓存相关类，具体设置见https://github.com/flutterchina/cookie_jar
  }

  //get请求
  get(String url, Map params, Function successCallBack,
      Function errorCallBack) async {
    print('6666' + url);
    _requstHttp(url, successCallBack, 'get', params, errorCallBack);
  }

  //post请求
  post(String url, params, Function successCallBack,
      Function errorCallBack) async {
    _requstHttp(url, successCallBack, "post", params, errorCallBack);
  }

  _requstHttp(String url, Function successCallBack,
      [String method, Map params, Function errorCallBack]) async {
    Response response;
    try {
      if (method == 'get') {
        if (params != null) {
          response = await dio.get(url, queryParameters: params);
        } else {
          response = await dio.get(url);
        }
      } else if (method == 'post') {
        if (params != null) {
          // && params.isNotEmpty
          FormData p = FormData.fromMap(params);
          response = await dio.post(url, data: p);
        } else {
          response = await dio.post(url);
        }
      }
    } on DioError catch (error) {
      // 请求错误处理
      Response errorResponse;
      if (error.response != null) {
        errorResponse = error.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      // 请求超时
      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = ResultCode.CONNECT_TIMEOUT;
      }
      // 一般服务器错误
      else if (error.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = ResultCode.RECEIVE_TIMEOUT;
      }

      // debug模式才打印
      if (GlobalConfig.isDebug) {
        print('请求pp异常: ' + error.toString());
        print('请求异常url: ' + url);
        print('请求头: ' + dio.options.headers.toString());
        print('method: ' + dio.options.method);
        print('请求参数:' + params.toString());
      }
      _error(errorCallBack, error.message);
      return '';
    }
    // debug模式打印相关数据
    if (GlobalConfig.isDebug) {
      print('请求url: ' + url);
      print('请求头: ' + dio.options.headers.toString());
      if (params != null) {
        print('请求参数: ' + params.toString());
      }
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    String dataStr = json.encode(response.data);
    Map<String, dynamic> dataMap = json.decode(dataStr);
    if (dataMap == null || dataMap['Success'] == -1) {
      _error(errorCallBack, response.data.toString());
    } else if (successCallBack != null) {
      successCallBack(dataMap);
    }
  }

  _error(Function errorCallBack, String error) {
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }
}
