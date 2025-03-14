import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 0)
class Character {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String status;

  @HiveField(4)
  final String species;

  @HiveField(5)
  final String gender;

  @HiveField(6)
  final String planet;

  @HiveField(7)
  final String endpoint;


  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.planet,
    required this.endpoint,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      planet: json['origin']['name'],
      endpoint: json['location']['name'],
    );
  }
}