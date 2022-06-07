import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/model/pokemon_model.dart';
import 'package:flutter_quiz_app/service/pokemon_service.dart';

class PokemonProvider extends ChangeNotifier {
  final IPokemonService pokemonService;

  List<Results> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  PokemonProvider(this.pokemonService) {
    fetch();
  }

  Future<void> fetch() async {
    _changeLoading();
    resources = (await pokemonService.fetchResourceItem())?.results ?? [];
    _changeLoading();
  }
}
