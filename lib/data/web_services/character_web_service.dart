import 'package:dio/dio.dart';
import 'package:flutter_application_bloc/constants/strings.dart';

class CharacterWebServices {
  late Dio dio;
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      print(response.data["results"].toString());
      return response.data["results"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
