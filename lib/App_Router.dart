import 'package:breaking_app/BusinessLogic/cubit/characters_cubit.dart';
import 'package:breaking_app/Constants/Strings.dart';
import 'package:breaking_app/data/Repository/CharactersRepository.dart';
import 'package:breaking_app/data/WebServices/CharactersServices.dart';
import 'package:breaking_app/presentation/CharacterDetailsView.dart';
import 'package:breaking_app/presentation/CharacterView.dart';
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
            create: (context) => charactersCubit(charactersrepository),
            child: Charactersview(),
          ),
        );
      case Character_details_view:
        return MaterialPageRoute(
          builder: (context) => Characterdetailsview(),
        );
        ;
    }
  }
}
