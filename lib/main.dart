import 'package:breaking_app/App_Router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BreakingApp());
}

class BreakingApp extends StatelessWidget {
  const BreakingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:AppRouter().generateRoute ,
    );
  }
}
