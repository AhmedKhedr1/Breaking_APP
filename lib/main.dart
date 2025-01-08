import 'App_Router.dart';
import 'data/WebServices/CharactersServices.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakingApp());
}

class BreakingApp extends StatelessWidget {
  Charactersservices cha = Charactersservices();
  BreakingApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    cha.GetCharacter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
