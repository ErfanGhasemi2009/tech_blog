import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;
import 'package:get_storage/get_storage.dart';

class DioService {
      Dio dio = Dio();
  Future<dynamic> getServerResponse(String url) async {

    dio.options.headers['content_Type'] = 'application/json';

    return await dio
        .get(url,
            options: Options(method: 'GET', responseType: ResponseType.json))
        .then((response) {
      return response;
    });
  }

  Future<dynamic> postServerResponse(
      Map<String, dynamic> mapData, String url) async {
    try {
    dio.options.headers['content-Type'] = 'application/json';
    var token = GetStorage().read('token');
    if (token != null) {
      dio.options.headers['authorization'] = '$token';
    }

    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(mapData),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((response) {
      log(response.headers.toString());
      log(response.data.toString());
      log(response.statusCode.toString());
      return response;
    // ignore: body_might_complete_normally_catch_error
    }).catchError((err) {
      log(err.toString());
      if (err is DioException) {
        return err.response!;
      }
    });
         }catch (e) {
      
      print(e.toString());
    }
  }
}
