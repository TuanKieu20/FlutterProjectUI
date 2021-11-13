import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cinema_event.dart';
part 'cinema_state.dart';

class CinemaBloc extends Bloc<CinemaEvent, CinemaState> {
  List<String> seats = [];

  CinemaBloc() : super(CinemaState());
  @override
  Stream<CinemaState> mapEventToState(CinemaEvent event) async* {
    if (event is OnSelectedDateEvent) {
      yield state.copyWith(date: event.date);
    } else if (event is OnSelectedTimeEvent) {
      yield state.copyWith(time: event.time);
    } else if (event is OnSelectMovieEvent) {
      yield state.copyWith(nameMovie: event.name, imageMovie: event.image);
    } else if (event is OnSelectedSeatsEvent) {
      if (seats.contains(event.selectedSeats)) {
        seats.remove(event.selectedSeats);
        yield state.copyWith(selectedSeats: seats);
      } else {
        seats.add(event.selectedSeats);
        yield state.copyWith(selectedSeats: seats);
      }
    }
  }
}
