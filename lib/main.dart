import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/rickmorty_bloc.dart';
import 'package:rick_and_morty/core/app/app_color.dart';
import 'package:rick_and_morty/core/app/app_fonts.dart';
import 'package:rick_and_morty/dio/dio_settings.dart';
import 'package:rick_and_morty/repositories/get_character_repo.dart';
import 'package:rick_and_morty/ui/rick_morty_ui.dart';
import 'package:bloc/bloc.dart';

void main() {
  runApp(const RickMorty());
}

class RickMorty extends StatelessWidget {
  const RickMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GetCharacterRepo(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => RickmortyBloc(
            repo: RepositoryProvider.of<GetCharacterRepo>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: const RickAndMorty(),
        ),
      ),
    );
  }
}
