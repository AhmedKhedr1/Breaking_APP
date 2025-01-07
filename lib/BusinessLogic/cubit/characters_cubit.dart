// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:breaking_app/data/Repository/CharactersRepository.dart';
import 'package:breaking_app/data/models/Character.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final Charactersrepository CharRepo;
 late List<CharacterModel> MycharacterList = [];
  CharactersCubit(this.CharRepo) : super(CharactersInitial());
  List<CharacterModel> GetAllCharacters() {
    CharRepo.GetAllCharacters().then(
      (characterList) {
        emit(CharactersLoaded(characterList));
        MycharacterList = characterList;
      },
    );
    return MycharacterList;
  }
}
