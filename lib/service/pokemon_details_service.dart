import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_quiz_app/model/pokemon_details_model.dart';

abstract class IPokemonDetailsService {
  IPokemonDetailsService(this.deneme);
  final String deneme;

  Future<PokemonDetailsModel?> fetchResourceItem();
  Future<PokemonDetailsModel?> ImagesResourceItem();
}

class PokemonDetailsService extends IPokemonDetailsService {
  PokemonDetailsService(deneme) : super(deneme);

  @override
  Future<PokemonDetailsModel?> fetchResourceItem() async {
    final response = await Dio().get(deneme);

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return PokemonDetailsModel.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<PokemonDetailsModel?> ImagesResourceItem() async {
    final response = await Dio().get(deneme);

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Sprites) {}
    }
    return null;
  }
}
