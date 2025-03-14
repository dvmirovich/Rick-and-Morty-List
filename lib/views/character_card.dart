import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/blocs/favorite_cubit.dart';
import 'package:rickandmorty/models/character.dart';
import 'package:rickandmorty/views/character_solo_screen.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.watch<FavoriteCubit>().state.contains(widget.character);

    Color statusColor = widget.character.status == 'Alive'
        ? Colors.green.shade700
        : widget.character.status == 'Dead'
            ? Colors.red.shade700
            : Colors.yellow.shade700;

    print('Character ${widget.character.name} is Favorite? ${context.watch<FavoriteCubit>().state.contains(widget.character)}');

    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterSoloScreen(character: widget.character)));
        },
        child: Container(
          height: 280,
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: AnimatedSwitcher(
            duration: Duration(seconds: 3),
            child: Card(
              color: Color(0xff363636),
              key: ValueKey(widget.character.id),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                        child: Image.network(
                          widget.character.image,
                          width: 150,
                          height: 150,
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Stack(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.topRight,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 70,
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: (){
                                  context.read<FavoriteCubit>().toggleFavorite(widget.character);
                                },
                                style: IconButton.styleFrom(
                                    foregroundColor: Colors.yellow
                                ),
                                icon: Icon(isFavorite ? Icons.star : Icons.star_border, size: 30),
                              )
                            ],
                          )
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    alignment: Alignment.centerLeft,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.character.name,
                          style: TextStyle(
                              color: Colors.green.shade700,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Divider(),
                        Text("${widget.character.species} / ${widget.character.gender}"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Status: ${widget.character.status}'),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: statusColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: statusColor,
                                        blurRadius: 4,
                                        spreadRadius: 1)
                                  ]),
                            )
                          ],
                        )
                        // Text(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ),
    );
  }
}
