import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/product/constant/light_theme.dart';
import 'package:flutter_quiz_app/view/pokemon_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LighTheme().theme,
      home: const PokemonView(),
    );
  }
}
