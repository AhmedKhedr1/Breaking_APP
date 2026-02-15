// ignore_for_file: must_be_immutable
import 'package:breaking_app/Core/app_router.dart';
import 'package:breaking_app/business_logic/cubit/character_cubit.dart';
import 'package:breaking_app/data/repository/character_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(BreakingApp());
}

class BreakingApp extends StatelessWidget {
  BreakingApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCubit(CharacterRepo())..getAllCharacter(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
