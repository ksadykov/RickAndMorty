import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/app/app_color.dart';
import 'package:rick_and_morty/core/app/app_fonts.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({
    super.key,
    required this.name,
    required this.species,
    required this.image,
  });

  final String name;
  final String species;
  final String image;

  @override
  State<CharacterList> createState() => _CharacterListState();
}

bool _expanded = true;
bool _dropdown = false;

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: 500,
            height: _expanded ? 125 : 200,
            decoration: BoxDecoration(
              color: AppColor.dark,
              border: Border.all(
                color: AppColor.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: NetworkImage(widget.image),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(widget.name, style: AppFonts.w300s20),
                      const SizedBox(height: 10),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: Text(
                          widget.species,
                        ),
                      ),
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
