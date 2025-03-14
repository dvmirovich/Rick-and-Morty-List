import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/database.dart';
import 'package:rickandmorty/models/character.dart';

class FavoriteCubit extends Cubit<List<Character>> {
  FavoriteCubit() : super(DatabaseService.getFavorites());

  void toggleFavorite(Character character) {
    DatabaseService.toggleFavorite(character);
    emit(DatabaseService.getFavorites());
  }
}