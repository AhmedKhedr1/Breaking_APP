import 'package:breaking_app/Core/app_colors.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      cursorColor: Appcolors.MyGrey,
      decoration: InputDecoration(
        hintText: 'Find Character',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Appcolors.MyGrey,fontSize: 18,),
        
      ),
      style: TextStyle(color: Appcolors.MyGrey,fontSize: 18),
      onChanged: (value) {
        
      },
    );
  }
}