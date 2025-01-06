import 'package:breaking_app/Constants/Strings.dart';
import 'package:breaking_app/presentation/CharacterDetailsView.dart';
import 'package:breaking_app/presentation/CharacterView.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Characters_view:
        return MaterialPageRoute(
          builder: (context) => Charactersview(),
        );
      case Character_details_view:
        return MaterialPageRoute(
          builder: (context) => Characterdetailsview(),
        );
        ;
    }
  }
}
