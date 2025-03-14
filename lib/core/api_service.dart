import 'package:dio/dio.dart';
import '../models/character.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Character>> fetchCharacters (int page) async {
    final response = await _dio.get('https://rickandmortyapi.com/api/character?page=$page');

    return (response.data['results'] as List)
      .map((json) => Character.fromJson(json))
      .toList();
  }
}