import 'BusinessLogic/cubit/characters_cubit.dart';
import 'Constants/Strings.dart';
import 'data/Repository/CharactersRepository.dart';
import 'data/WebServices/CharactersServices.dart';
import 'data/models/Character.dart';
import 'presentation/views/CharacterDetailsView.dart';
import 'presentation/views/CharacterView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late Charactersrepository charactersrepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersrepository = Charactersrepository(Charactersservices());
    charactersCubit = CharactersCubit(charactersrepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Characters_view:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => charactersCubit,
            child: Charactersview(),
          ),
        );
      case Character_details_view:
        final selectedcharacter = settings.arguments as CharacterModel;
        return MaterialPageRoute(
          builder: (context) => Characterdetailsview(character: selectedcharacter),
        );
        ;
    }
  }
}
