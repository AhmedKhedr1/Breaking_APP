import 'package:breaking_app/Core/app_colors.dart';
import 'package:breaking_app/Core/app_router.dart';
import 'package:breaking_app/data/model/character_model.dart';
import 'package:breaking_app/presentation/widgets/character_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.characters});
  final List<CharacterModel> characters;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Appcolors.MyGrey,
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: characters.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => GoRouter.of(context).push(
                      AppRouter.KcharacterdetailsView,
                      extra: characters[index]),
                  child: Charactercard(character: characters[index])),
            )
          ],
        ),
      ),
    );
  }
}
