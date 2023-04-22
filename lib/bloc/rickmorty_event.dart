part of 'rickmorty_bloc.dart';

@immutable
abstract class RickmortyEvent {}

class CharacterEvent extends RickmortyEvent {
  final int page;
  CharacterEvent({required this.page});
}
