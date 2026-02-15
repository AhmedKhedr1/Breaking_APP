part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

class CharacterInitial extends CharacterState {}

class characterloading extends CharacterState {}

class characterloaded extends CharacterState {
  final List<CharacterModel> characters;
  characterloaded(this.characters);
}

class characterError extends CharacterState {
  final String message;

  characterError({required this.message});
}
