import 'package:breaking_app/Core/app_colors.dart';
import 'package:breaking_app/data/model/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailsView extends StatelessWidget {
  const CharacterDetailsView({super.key, required this.character});
  final CharacterModel character;

  Widget BuildSliverAppBar() {
    return SliverAppBar(
        expandedHeight: 600,
        pinned: true,
        stretch: true,
        backgroundColor: Appcolors.MyGrey,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            character.name,
            style: TextStyle(color: Colors.white),
          ),
          background: Hero(
            tag: character.image,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }

  Widget characterinfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: TextStyle(
                  color: Appcolors.MyWhaite,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          TextSpan(
              text: value,
              style: TextStyle(
                  color: Appcolors.MyWhaite,
                  fontWeight: FontWeight.w300,
                  fontSize: 16)),
        ]));
  }

  Widget builddivider(double endindent) {
    return Divider(
      height: 30,
      color: Appcolors.MyYellow,
      endIndent: endindent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.MyGrey,
      body: CustomScrollView(
        slivers: [
          BuildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterinfo('Status : ', character.status),
                  builddivider(290),
                  SizedBox(
                    height: 14,
                  ),
                  characterinfo('Species : ', character.species),
                  builddivider(280),
                  SizedBox(
                    height: 14,
                  ),
                  characterinfo('gender : ', character.gender),
                  builddivider(290),
                  SizedBox(
                    height: 14,
                  ),
                  characterinfo(
                      'epside : ', character.episode.length.toString()),
                  builddivider(300),
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}
