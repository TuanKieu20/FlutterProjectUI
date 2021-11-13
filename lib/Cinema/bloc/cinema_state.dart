part of 'cinema_bloc.dart';

class CinemaState {
  final String nameMovie;
  final String imageMovie;
  final String date;
  final String time;
  final List<String> selectedSeats;

  CinemaState({
    this.nameMovie = "",
    this.imageMovie = "",
    this.date = '0',
    this.time = '00',
    List<String>? selectedSeats,
  }) : this.selectedSeats = selectedSeats ?? [];

  CinemaState copyWith(
      {String? nameMovie,
      String? imageMovie,
      String? date,
      String? time,
      List<String>? selectedSeats}) {
    return CinemaState(
      nameMovie: nameMovie ?? this.nameMovie,
      imageMovie: imageMovie ?? this.imageMovie,
      date: date ?? this.date,
      time: time ?? this.time,
      selectedSeats: selectedSeats ?? this.selectedSeats,
    );
  }
}
