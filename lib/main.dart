import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:objetive_test/constants/marvel_colors.dart';
import 'package:objetive_test/repositories/characters_repository.dart';
import 'package:objetive_test/repositories/impl/marvel_characters_repository_impl.dart';
import 'package:objetive_test/views/heroes_view.dart';

void setup() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<CharactersRepository>(
      () => MarvelCharactersRepositoryImpl());
}

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
          primaryColor: MarvelColors.primary,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1),
            ),
            border: const OutlineInputBorder(),
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle:
                  TextStyle(fontSize: 16, color: MarvelColors.textTitleColor))),
      initialRoute: '/',
      routes: {'/': (context) => const HeroesView()},
    );
  }
}
