import 'package:breaking_app/data/WebServices/CharactersServices.dart';
import 'package:breaking_app/data/models/Character.dart';

class Charactersrepository {
  final Charactersservices charactersservices;
  Charactersrepository(this.charactersservices);
  Future<List<dynamic>> GetAllCharacters() async {
    final character = await charactersservices.GetCharacter();
    List<CharacterModel> characterList = [];
    for (int i = 0; i < character.length; i++) {
      characterList.add(CharacterModel.fromJson(character[i]));
    }
    print(characterList);
    return characterList;
  }
}
