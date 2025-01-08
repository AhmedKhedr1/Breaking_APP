import '../WebServices/CharactersServices.dart';
import '../models/Character.dart';

class Charactersrepository {
  final Charactersservices charactersservices;
  Charactersrepository(this.charactersservices);
  Future<List<CharacterModel>> GetAllCharacters() async {
    final character = await charactersservices.GetCharacter();
    List<CharacterModel> characterList = [];
    for (int i = 0; i < character.length; i++) {
      characterList.add(CharacterModel.fromJson(character[i]));
    }
    return characterList;
  }
}
