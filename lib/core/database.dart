import 'package:hive/hive.dart';
import 'package:rickandmorty/models/character.dart';

class DatabaseService {
  static late Box<Character> _box;

  static Future<void> init() async {
    _box = await Hive.openBox<Character>('favorites');
  }

  static List<Character> getFavorites() => _box.values.toList();

  static void toggleFavorite(Character character) {
    if(_box.containsKey(character.id)) {
      _box.delete(character.id);

      ///logs
      print('\n\nCharacter ${character.name} deleted.\nFull list\n--------------------');
      for (var pers in _box.values.toList()) {
        print(pers.name);
      }
      print('--------------------');

    } else {
      _box.put(character.id, character);

      ///logs
      print('Character ${character.name} added.\nFull list\n--------------------');
      for (var pers in _box.values.toList()) {
        print(pers.name);
      }
      print('--------------------');

    }
  }
}