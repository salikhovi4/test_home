
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test_home/Api.dart';
import 'package:test_home/model/HomeInfo.dart';

class HomeData {
  static Future<Map<String, dynamic>> getHomeData() async {
    String status = 'error';
    List<HomeInfo> homeData = [];
    String errorText = 'Неизвестная ошибка.';

    try {
      final List<dynamic> response = await Api.getHomes();
      for (var item in response) {
        homeData.add(HomeInfo(
          id: item['id'], name: item['name'], location: item['location'],
          price: item['price'], rating: item['rating'], homeType: item['type'],
          imageLinks: item['images'], reviewCount: item['review_count'],
          description: item['description'],
        ));
      }
      errorText = '';
      status = 'success';

    } on DioError catch (error) {
      log('HomeData.getHomeData: dio {${error.message}} /error {${error.error}}');
      if (error.type == DioErrorType.sendTimeout) {
        errorText = 'Ошибка подключения. '
            'Проверьте подключение к интернету и попробуйте снова.';
      }
      else if (error.type == DioErrorType.receiveTimeout) {
        errorText = 'Время ожидания истекло. '
            'Время ожидания ответа от сервера истекло. '
            'Попробуйте повторить действия позже.';
      }
    } catch (error) {
      log('HomeData.getHomeData: {$error}');
    }

    return {'status': status, 'data': homeData, 'errorText': errorText,};
  }
}
