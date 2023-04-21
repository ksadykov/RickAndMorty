import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rickmorty_event.dart';
part 'rickmorty_state.dart';

class RickmortyBloc extends Bloc<RickmortyEvent, RickmortyState> {
  RickmortyBloc() : super(RickmortyInitial()) {
    on<RickmortyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
