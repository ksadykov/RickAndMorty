part of 'rickmorty_bloc.dart';

@immutable
abstract class RickmortyState {}

class RickmortyInitial extends RickmortyState {}

class CharacterSucces extends RickmortyState {
  final CharacterModel model;
  CharacterSucces({required this.model});
}

class CharacterError extends RickmortyState {}

class CharacterLoading extends RickmortyState {}
