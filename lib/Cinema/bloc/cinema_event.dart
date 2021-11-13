part of 'cinema_bloc.dart';

abstract class CinemaEvent extends Equatable {
  const CinemaEvent();

  @override
  List<Object> get props => [];
}

class OnSelectMovieEvent extends CinemaEvent {
  final String name;
  final String image;

  OnSelectMovieEvent(this.name, this.image);

  @override
  List<Object> get props => [name, image];
}

class OnSelectedDateEvent extends CinemaEvent {
  final String date;
  OnSelectedDateEvent(this.date);

  @override
  List<Object> get props => [date];
}

class OnSelectedTimeEvent extends CinemaEvent {
  final String time;

  OnSelectedTimeEvent(this.time);

  @override
  List<Object> get props => [time];
}

class OnSelectedSeatsEvent extends CinemaEvent {
  final String selectedSeats;

  OnSelectedSeatsEvent(this.selectedSeats);

  @override
  List<Object> get props => [selectedSeats];
}
