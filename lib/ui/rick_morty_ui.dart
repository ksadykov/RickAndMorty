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
  final controller = ScrollController();
  int page = 0;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      pagination(context);
    });
    BlocProvider.of<RickmortyBloc>(context).add(CharacterEvent(page: 0));
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
                controller: controller,
                shrinkWrap: false,
                itemCount: state.model.results?.length,
                itemBuilder: (context, index) => CharacterList(
                    name: state.model.results?[index].name ?? '',
                    species: state.model.results?[index].species ?? '',
                    image: state.model.results?[index].image ?? ''));
          }
          if (state is CharacterLoading) {}

          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
            ),
          );
        }),
      ),
    );
  }

  void pagination(BuildContext context) {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      BlocProvider.of<RickmortyBloc>(context).add(CharacterEvent(page: page++));
    } else {
      print('end');
    }
  }
}
