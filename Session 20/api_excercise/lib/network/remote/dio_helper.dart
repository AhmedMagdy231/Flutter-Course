import 'package:dio/dio.dart';

import '../end_points.dart';

class DioHelper{
 static late Dio _dio;

  static void init(){
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }


 static Future<Response> getRequest({
   required int size,
})async{
    return await _dio.get(
      USER,
      queryParameters: {
        "size" : size,
       },
    );
  }



}