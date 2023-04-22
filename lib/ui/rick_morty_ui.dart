import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/rickmorty_bloc.dart';
import 'package:rick_and_morty/core/app/app_color.dart';
import 'package:rick_and_morty/core/app/app_fonts.dart';
import 'package:rick_and_morty/ui/widget/character_list.dart';

class RickAndMorty extends StatefulWidget {
  const RickAndMorty({super.key});

  @override
  State<RickAndMorty> createState() => _RickAndMortyState();
}

class _RickAndMortyState extends State<RickAndMorty> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RickmortyBloc>(context).add(CharacterEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Rick and Morty",
            style: AppFonts.w500s30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<RickmortyBloc, RickmortyState>(
            builder: (context, state) {
          if (state is CharacterSucces) {
            return ListView.builder(
                shrinkWrap: false,
                itemCount: 10,
                itemBuilder: (context, index) => CharacterList(
                    name: state.model.results?[index].name ?? '',
                    species: state.model.results?[index].species ?? '',
                    image: state.model.results?[index].image ?? ''));
          }

          return Text('Error');
        }),
      ),
    );
  }
}
