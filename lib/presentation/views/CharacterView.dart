// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

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
  List<CharacterModel> Searchedforcharacters = [];
  bool issearching = false;
  final _searchTextController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).GetAllCharacters();
  }

  Widget buildsearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Appcolors.MyGrey,
      decoration: InputDecoration(
        hintText: 'Find a Character',
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18, color: Appcolors.MyGrey),
      ),
      style: TextStyle(fontSize: 18, color: Appcolors.MyGrey),
      onChanged: (value) {
        searchfuncation(value);
      },
    );
  }

  Void? searchfuncation(String value) {
    Searchedforcharacters = AllCharaters.where(
      (element) => element.Name.toLowerCase().startsWith(value),
    ).toList();
    setState(() {});
  }

  List<Widget> _buildAppBarAction() {
    if (issearching) {
      return [
        IconButton(
            onPressed: () {
              setState(() {
                _searchTextController.clear();
                Navigator.pop(context);
              });
            },
            icon: Icon(
              Icons.clear,
              color: Appcolors.MyGrey,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
                onRemove: () {
                  setState(() {
                    _searchTextController.clear();
                  });
                  setState(() {
                    issearching = false;
                  });
                },
              ));
              setState(() {
                issearching = true;
              });
            },
            icon: Icon(
              Icons.search,
              color: Appcolors.MyGrey,
            ))
      ];
    }
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
      itemCount: _searchTextController.text.isEmpty
          ? AllCharaters.length
          : Searchedforcharacters.length,
      itemBuilder: (context, index) {
        return Charactercard(
          character: _searchTextController.text.isEmpty
              ? AllCharaters[index]
              : Searchedforcharacters[index],
        );
      },
    );
  }

  Widget _BuildAppBarTitle() {
    return Text(
      'characters',
      style: TextStyle(color: Appcolors.MyGrey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.MyYellow,
          title: issearching ? buildsearchField() : _BuildAppBarTitle(),
          actions: _buildAppBarAction(),
        ),
        body: BuildBlocWidget());
  }
}
