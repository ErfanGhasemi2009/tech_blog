import 'dart:math';

import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getServerResponse(String url) async {
    Dio dio = Dio();
    dio.options.headers['content_Type'] = 'application/json';

    return await dio
        .get(url,
            options: Options(method: 'GET', responseType: ResponseType.json))
        .then((response) {
      log(response.data);
      return response;
    });
  }
}
