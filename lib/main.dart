// ignore_for_file: must_be_immutable
import 'package:breaking_app/Core/app_router.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(BreakingApp());
}

class BreakingApp extends StatelessWidget {
  BreakingApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
