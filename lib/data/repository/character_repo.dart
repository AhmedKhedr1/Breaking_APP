import 'package:breaking_app/data/Web_services/api_services.dart';
import 'package:breaking_app/data/model/character_model.dart';

class CharacterRepo {
  ApiServices _apiServices = ApiServices();
  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await _apiServices.get('/character');
    return (response['results'] as List)
        .map(
          (e) => CharacterModel.fromjson(e),
        )
        .toList();
  }
}
