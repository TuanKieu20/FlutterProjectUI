import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Cinema/bloc/cinema_bloc.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';

class DetailPayMentScreen extends StatelessWidget {
  const DetailPayMentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cinemaBloc = BlocProvider.of<CinemaBloc>(context);
    return Scaffold(
      backgroundColor: Color(0xff21242C),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * .45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: AssetImage(cinemaBloc.state.imageMovie),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              TextTK(
                                  text: "DATE", color: Colors.grey, size: 16),
                              TextTK(text: cinemaBloc.state.date),
                            ],
                          ),
                          Column(
                            children: [
                              TextTK(
                                  text: "TICKET", color: Colors.grey, size: 16),
                              TextTK(
                                text: cinemaBloc.state.selectedSeats.length
                                    .toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              TextTK(
                                  text: "TIME", color: Colors.grey, size: 16),
                              TextTK(text: cinemaBloc.state.time),
                            ],
                          ),
                          Column(
                            children: [
                              TextTK(
                                  text: "SEATS", color: Colors.grey, size: 16),
                              Row(
                                children: List.generate(
                                    cinemaBloc.state.selectedSeats.length,
                                    (index) {
                                  return TextTK(
                                      text:
                                          "${cinemaBloc.state.selectedSeats[index]}");
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(35, (index) {
                        return TextTK(
                          text: "-",
                          color: Colors.grey,
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset("assets/qr-code-fb.png"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
