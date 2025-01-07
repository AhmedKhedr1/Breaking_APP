// ignore_for_file: must_be_immutable

part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersLoaded extends CharactersState {
  List<CharacterModel> characters = [];
  CharactersLoaded(this.characters);
}

final class CharactersFailed extends CharactersState {
  
}
final class CharactersLoading extends CharactersState {
  
}
