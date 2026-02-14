import 'package:breaking_app/data/Web_services/dio_client.dart';

class ApiServices {
  final DioClient _dioClient = DioClient();

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _dioClient.dio.get(endpoint);
      return response.data;
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
