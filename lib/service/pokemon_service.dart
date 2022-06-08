import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_quiz_app/model/pokemon_model.dart';

abstract class IPokemonService {
  Future<PokemonModel?> fetchResourceItem();
}

class PokemonService extends IPokemonService {
  @override
  Future<PokemonModel?> fetchResourceItem() async {
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return PokemonModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
