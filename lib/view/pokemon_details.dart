import 'package:flutter/material.dart';

class PokemonDetailsView extends StatefulWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);
  @override
  State<PokemonDetailsView> createState() => _PokemonDetailsViewState();
}

class _PokemonDetailsViewState extends State<PokemonDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
