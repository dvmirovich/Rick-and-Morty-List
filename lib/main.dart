import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rickandmorty/blocs/character_cubit.dart';
import 'package:rickandmorty/core/api_service.dart';
import 'package:rickandmorty/views/character_list_screen.dart';

import 'blocs/favorite_cubit.dart';
import 'core/database.dart';
import 'models/character.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
    Hive.registerAdapter(CharacterAdapter());

    await DatabaseService.init();

    runApp(const MyApp());
  }, (error, stackTrace) {});

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CharacterCubit(ApiService())),
          BlocProvider(create: (_) => FavoriteCubit()),
        ],
        child: MaterialApp(
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.green.shade700),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      foregroundColor: Colors.white)),
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(),
            home: CharacterListScreen()));
  }
}
