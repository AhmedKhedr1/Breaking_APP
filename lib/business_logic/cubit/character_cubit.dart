import 'package:breaking_app/data/model/character_model.dart';
import 'package:breaking_app/data/repository/character_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharacterRepo characterrepo;
  CharacterCubit(this.characterrepo) : super(CharacterInitial());

  Future<void> getAllCharacter() async {
    emit(characterloading());
    try {
      final characters = await characterrepo.getAllCharacters();
      emit(characterloaded(characters));
    } catch (e) {
      emit(characterError(message: e.toString()));
    }
  }
}
