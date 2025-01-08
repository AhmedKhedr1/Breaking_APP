import 'package:breaking_app/Constants/AppColors.dart';
import 'package:breaking_app/data/models/Character.dart';
import 'package:flutter/material.dart';

class Charactercard extends StatelessWidget {
  Charactercard({super.key, required this.character});
  final CharacterModel character;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Appcolors.MyWhaite, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.Name,
            style: TextStyle(
                color: Appcolors.MyWhaite,
                fontSize: 16,
                fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: Appcolors.MyGrey,
          child: character.image.isNotEmpty
              ? FadeInImage(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: AssetImage('assets/images/loading anmition.gif'),
                  image: NetworkImage(
                    character.image,
                  ),
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/error.jpg'),
        ),
      ),
    );
  }
}
