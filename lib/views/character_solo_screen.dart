import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character.dart';

class CharacterSoloScreen extends StatelessWidget {
  Character character;

  CharacterSoloScreen({
    super.key,
    required this.character
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            character.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(),
                Text('Species: ${character.species}'),
                Text('Gender: ${character.gender}'),
                Text('Origin location: ${character.planet}'),
                Text('Last known location endpoint: ${character.endpoint}'),
                Text('Status: ${character.status}'),
                Text('data')
              ],
            ),
          )
        ],
      ),
    );
  }
}
