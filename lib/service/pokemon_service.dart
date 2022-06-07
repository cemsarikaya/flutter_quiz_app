import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_quiz_app/model/pokemon_model.dart';

abstract class IPokemonService {
  IPokemonService(this.dio);
  final Dio dio;

  Future<PokemonModel?> fetchResourceItem();
}

class PokemonService extends IPokemonService {
  PokemonService(Dio dio) : super(dio);

  @override
  Future<PokemonModel?> fetchResourceItem() async {
    final response = await dio.get('/pokemon');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return PokemonModel.fromJson(jsonBody);
      }
    }
    return null;
  }
}
