// ignore_for_file: non_constant_identifier_names

import 'package:breaking_app/BusinessLogic/cubit/characters_cubit.dart';
import 'package:breaking_app/Constants/AppColors.dart';
import 'package:breaking_app/data/models/Character.dart';
import 'package:breaking_app/presentation/widgets/CharacterCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Charactersview extends StatefulWidget {
  const Charactersview({super.key});

  @override
  State<Charactersview> createState() => _CharactersviewState();
}

class _CharactersviewState extends State<Charactersview> {
  List<CharacterModel> AllCharaters = [];
  @override
  void initState() {
    AllCharaters = BlocProvider.of<CharactersCubit>(context).GetAllCharacters();
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          AllCharaters = (state).characters;
          return BuildLoadedWidget;
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Appcolors.MyYellow,
            ),
          );
        }
      },
    );
  }

  Widget get BuildLoadedWidget {
    return SingleChildScrollView(
      child: Container(
        color: Appcolors.MyGrey,
        child: Column(
          children: [
            BuildCharactersList,
          ],
        ),
      ),
    );
  }

  Widget get BuildCharactersList {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: AllCharaters.length,
      itemBuilder: (context, index) {
        return Charactercard(
          character: AllCharaters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.MyYellow,
          title: Text(
            'Characters',
            style: TextStyle(color: Appcolors.MyGrey),
          ),
        ),
        body: BuildBlocWidget());
  }
}
