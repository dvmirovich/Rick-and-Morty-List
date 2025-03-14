import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/api_service.dart';
import 'package:rickandmorty/models/character.dart';

class CharacterCubit extends Cubit<List<Character>> {
  final ApiService _apiService;
  int _page = 1;
  bool _isLoaded = false;

  CharacterCubit(this._apiService) : super([]);

  Future<void> loadCharacters() async {
    if( _isLoaded) return;
    _isLoaded = true;

    try {
      final newCharacter = await _apiService.fetchCharacters(_page);
      emit([...state, ...newCharacter]);
      _page++;
    } catch (e) {
      debugPrint('Load character error $e');
    }

    _isLoaded = false;
  }
}