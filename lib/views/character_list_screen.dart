import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/blocs/character_cubit.dart';
import 'package:rickandmorty/views/character_card.dart';
import 'package:rickandmorty/widgets/bottom_navbar.dart';
import 'package:svg_flutter/svg.dart';

import '../models/character.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late ScrollController _mainScrollController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CharacterCubit>();
    cubit.loadCharacters();

    _mainScrollController = ScrollController();
    _mainScrollController.addListener(() {
      if(_mainScrollController.position.pixels == _mainScrollController.position.maxScrollExtent) {
        cubit.loadCharacters();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(
          'assets/svg_pictures/randm_pic.svg',
          color: Colors.white,
          width: 10,
          height: 10,
        ),
        title: Text(
          'R&M characters',
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      body: BlocBuilder<CharacterCubit, List<Character>>(
        builder: (context, characters) {
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Wrap(
                spacing: 10,
                runSpacing: 8,
                children: characters.map((character) {
                  return CharacterCard(character: character,);
                }).toList(),
              ),
            )
          );
        }
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}
