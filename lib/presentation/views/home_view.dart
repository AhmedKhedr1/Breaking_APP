import 'package:breaking_app/Core/app_colors.dart';
import 'package:breaking_app/business_logic/cubit/character_cubit.dart';
import 'package:breaking_app/presentation/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.MyGrey,
      appBar: AppBar(
        backgroundColor: Appcolors.MyYellow,
        title: Text('Characters'),
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is characterloading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is characterloaded) {
            return HomeViewBody(
              characters: state.characters,
            );
          } else if (state is characterError) {
            return Center(child: Text(state.message));
          }
          return SizedBox();
        },
      ),
    );
  }
}
