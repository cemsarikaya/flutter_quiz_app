import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/model/pokemon_details_model.dart';
import 'package:flutter_quiz_app/service/pokemon_details_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonDetailsProvider extends ChangeNotifier {
  final IPokemonDetailsService pokemonService;

  List<Abilities> abilitiy = [];
  List<Types> typesItem = [];
  List<Stats> statsItem = [];
  int? weightItem;
  int? heightItem;
  String? nameItem;
  Sprites? sprites;

  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  bool isSeleceted = false;
  void changeSelected() {
    isSeleceted = !isSeleceted;
    saveBoolSharedPref(isSeleceted);
    notifyListeners();
  }

  PokemonDetailsProvider(this.pokemonService) {
    fetch();
    saveBoolSharedPref(isSeleceted);
    loadThemeSharedPref();
  }

  Future<void> fetch() async {
    _changeLoading();
    abilitiy = (await pokemonService.fetchResourceItem())?.abilities ?? [];
    typesItem = (await pokemonService.fetchResourceItem())?.types ?? [];
    statsItem = (await pokemonService.fetchResourceItem())?.stats ?? [];
    weightItem = (await pokemonService.fetchResourceItem())?.weight?.toInt();
    heightItem = (await pokemonService.fetchResourceItem())?.height?.toInt();
    nameItem = (await pokemonService.fetchResourceItem())?.name?.toString();
    sprites = (await pokemonService.fetchResourceItem())?.sprites;
    _changeLoading();
  }

  SharedPreferences? _sharedPreferObject;
  Future<void> createSheredPrefObject() async {
    _sharedPreferObject = await SharedPreferences.getInstance();
  }

  void saveBoolSharedPref(bool value) {
    _sharedPreferObject?.setBool('favorite', value);
  }

  Future<void> loadThemeSharedPref() async {
    await createSheredPrefObject();
    isSeleceted = _sharedPreferObject?.getBool('favorite') ?? true;
  }
}
