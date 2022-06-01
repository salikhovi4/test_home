
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_home/Config.dart';

class Api {

  static Future<Response> get(String url) async {
    Dio dio = Dio();

    Response response = await dio.get(
      url,
      options: Options(
        sendTimeout: Config.sendTimeout,
        responseType: ResponseType.bytes,
        receiveTimeout: Config.receiveTimeout,
      ),
    );

    return response;
  }

  static Future<List<dynamic>> getHomes() async {
    final Response response = await get(Config.getHomesInfo);

    log('Api.getHomes: status code ${response.statusCode}');

    return jsonDecode(utf8.decode(response.data));
  }
}