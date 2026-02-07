// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

void main() {
  runApp(BreakingApp());
}

class BreakingApp extends StatelessWidget {
  BreakingApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
