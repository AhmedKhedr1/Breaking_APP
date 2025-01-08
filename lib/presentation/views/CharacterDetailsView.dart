import 'package:breaking_app/Constants/AppColors.dart';
import 'package:breaking_app/data/models/Character.dart';
import 'package:flutter/material.dart';

class Characterdetailsview extends StatelessWidget {
  const Characterdetailsview({super.key, required this.character});
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
            character.Name,
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
                  characterinfo('Status : ', character.Status),
                  builddivider(290),
                  SizedBox(
                    height: 14,
                  ),
                  characterinfo('Species : ', character.SpeCies),
                  builddivider(280),
                  SizedBox(
                    height: 14,
                  ),
                  characterinfo('gender : ', character.Gender),
                  builddivider(290),
                  SizedBox(
                    height: 14,
                  ),
                  characterinfo('epside : ', character.episode.length.toString()),
                  builddivider(300),
                  /*  EpsideInfo(),
                  SizedBox(
                    height: 16,
                  ),*/
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }

  Row EpsideInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Epside : ',
                style: TextStyle(
                    color: Appcolors.MyWhaite,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ],
        ),
        Column(
          children: [
            Container(
              height: 800,
              width: 250,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: character.episode.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      character.episode.join('/'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Appcolors.MyWhaite,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
