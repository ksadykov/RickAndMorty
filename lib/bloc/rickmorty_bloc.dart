import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/model/character_model.dart';
import 'package:rick_and_morty/repositories/get_character_repo.dart';

part 'rickmorty_event.dart';
part 'rickmorty_state.dart';

class RickmortyBloc extends Bloc<RickmortyEvent, RickmortyState> {
  RickmortyBloc({required this.repo}) : super(RickmortyInitial()) {
    on<CharacterEvent>((event, emit) async {
      try {
        emit(CharacterLoading());
        final model = await repo.getCharacterData(event.page);
        emit(CharacterSucces(model: model));
      } catch (e) {
        emit(CharacterError());
      }
    });
  }
  final GetCharacterRepo repo;
}
