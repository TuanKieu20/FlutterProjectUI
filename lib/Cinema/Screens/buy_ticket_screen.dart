import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Cinema/Helpers/painter_screen.dart';
import 'package:flutter_projects/Cinema/Models/arm_chair_model.dart';
import 'package:flutter_projects/Cinema/Models/datetime_model.dart';
import 'package:flutter_projects/Cinema/Screens/detail_payment_screen.dart';
import 'package:flutter_projects/Cinema/Widgets/seats.dart';
import 'package:flutter_projects/Cinema/bloc/cinema_bloc.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';

class BuyTicketScreen extends StatelessWidget {
  final String imageMovie;
  final String nameMovie;
  const BuyTicketScreen(
      {Key? key, required this.nameMovie, required this.imageMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height,
            color: Color(0xff21242C),
          ),
          Container(
            width: size.width,
            height: size.height * .7,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageMovie), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Color(0xff21242C),
                    Color(0xff21242C).withOpacity(.9),
                    Color(0xff21242C).withOpacity(.1),
                  ],
                ),
              ),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY: 20.0,
                  ),
                  child: Container(
                    color: Color(0xff21242C).withOpacity(.1),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: Row(
              children: <Widget>[
                Container(
                  width: size.width,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20.0),
                        TextTK(
                          text: nameMovie,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    height: 90,
                    width: size.width,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: DateTimeModel.listDate.length,
                      itemBuilder: (context, index) {
                        return _ItemDate(date: DateTimeModel.listDate[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    height: 40,
                    width: size.width,
                    child: ListView.builder(
                      itemCount: DateTimeModel.listTime.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _ItemTime(time: DateTimeModel.listTime[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 15.0),
                  PainterScreen(),
                  TextTK(
                    text: "Screen",
                    color: Colors.white,
                    size: 26,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 300,
                    width: size.width,
                    child: Column(
                      children: List.generate(ArmChairModel.listChairs.length,
                          (index) {
                        return SeatRow(
                          numSeats: ArmChairModel.listChairs[index].seats,
                          freeSeats: ArmChairModel.listChairs[index].freeSeats,
                          rowSeats: ArmChairModel.listChairs[index].rowSeats,
                        );
                      }),
                    ),
                  ),
                  _ItemsDescription(size: size),
                  SizedBox(height: 30),
                  Center(
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailPayMentScreen();
                      })),
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * .6,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        child: TextTK(
                          text: "Buy ticket \$47.50",
                          size: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemsDescription extends StatelessWidget {
  const _ItemsDescription({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(Icons.circle, color: Colors.white, size: 10),
              SizedBox(width: 10.0),
              TextTK(text: 'Free', size: 20, color: Colors.white)
            ],
          ),
          Row(
            children: [
              Icon(Icons.circle, color: Color(0xff4A5660), size: 10),
              SizedBox(width: 10.0),
              TextTK(text: 'Reserved', size: 20, color: Color(0xff4A5660))
            ],
          ),
          Row(
            children: [
              Icon(Icons.circle, color: Colors.amber, size: 10),
              SizedBox(width: 10.0),
              TextTK(text: 'Selected', size: 20, color: Colors.amber)
            ],
          ),
        ],
      ),
    );
  }
}

class _ItemTime extends StatelessWidget {
  final String time;
  const _ItemTime({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          BlocProvider.of<CinemaBloc>(context).add(OnSelectedTimeEvent(time));
        },
        child: BlocBuilder<CinemaBloc, CinemaState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                  color: state.time == time ? Colors.amber : Color(0xff4D525A),
                  borderRadius: BorderRadius.circular(8)),
              child: TextTK(
                text: time,
                color: Colors.white,
                size: 18,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ItemDate extends StatelessWidget {
  final DateTimeModel date;
  const _ItemDate({Key? key, required this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<CinemaBloc>(context)
            .add(OnSelectedDateEvent(date.number));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: BlocBuilder<CinemaBloc, CinemaState>(
          builder: (context, state) {
            return Container(
              height: 100,
              width: 75,
              decoration: BoxDecoration(
                color: state.date == date.number
                    ? Colors.amber
                    : Color(0xff4A5660),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Color(0xff21242C).withOpacity(.8),
                    size: 12,
                  ),
                  SizedBox(height: 10.0),
                  TextTK(text: date.day, color: Colors.white, size: 17),
                  SizedBox(height: 5.0),
                  TextTK(text: date.number, color: Colors.white, size: 28),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
