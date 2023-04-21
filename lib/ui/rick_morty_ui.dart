import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app/app_color.dart';
import 'package:rick_and_morty/core/app/app_fonts.dart';

class RickAndMorty extends StatefulWidget {
  const RickAndMorty({super.key});

  @override
  State<RickAndMorty> createState() => _RickAndMortyState();
}

class _RickAndMortyState extends State<RickAndMorty> {
  bool _expanded = false;
  bool _dropdown = false;
  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: 500,
                height: _expanded ? 120 : 200,
                decoration: BoxDecoration(
                  color: AppColor.dark,
                  border: Border.all(
                    color: AppColor.white,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(
                            "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const Text("Ricki Morti", style: AppFonts.w300s20),
                          const SizedBox(height: 10),
                          Container(
                            child: Text(
                              "Hi my name \n is Rick,  What's your name?\n dgdfgdfg dsgdfgdsf ",
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _expanded = !_expanded;
                            _dropdown = !_dropdown;
                          });
                        },
                        icon: Icon(_dropdown
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
