import 'package:dio/dio.dart';

class ProjectDioMixin {
  final service = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));
}
