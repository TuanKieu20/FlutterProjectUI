import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Cinema/Helpers/paint_chair.dart';
import 'package:flutter_projects/Cinema/bloc/cinema_bloc.dart';

class SeatRow extends StatelessWidget {
  final int numSeats;
  final List<int> freeSeats;
  final String rowSeats;
  const SeatRow({
    Key? key,
    required this.numSeats,
    required this.freeSeats,
    required this.rowSeats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cinemaBloc = BlocProvider.of<CinemaBloc>(context);
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(numSeats, (index) {
          if (freeSeats.contains(index + 1)) {
            return InkWell(
              onTap: () {
                cinemaBloc.add(OnSelectedSeatsEvent("$rowSeats${index + 1}"));
                print("$rowSeats${index + 1}");
              },
              child: BlocBuilder<CinemaBloc, CinemaState>(
                builder: (_, state) {
                  return PaintChair(
                    color: state.selectedSeats.contains("$rowSeats${index + 1}")
                        ? Colors.amber
                        : Colors.white,
                  );
                },
              ),
            );
          }
          return PaintChair();
        }),
      ),
    );
  }
}
