import 'package:breaking_app/Constants/Strings.dart';
import 'package:breaking_app/data/models/Character.dart';
import 'package:dio/dio.dart';

class Charactersservices {
  Dio dio = Dio();

  Future<List<dynamic>> GetCharacter() async {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20));
    dio = Dio(options);
    try {
      final response = await dio.get('character');
      List<dynamic> character = response.data["results"];
      
      
      return character;
    } on Exception catch (e) {
      print('the error is $e ');
      return [];
    }
  }
}
