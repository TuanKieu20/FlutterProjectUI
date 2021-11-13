import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Cinema/Models/movie_model.dart';
import 'package:flutter_projects/Cinema/Screens/buy_ticket_screen.dart';
import 'package:flutter_projects/Cinema/bloc/cinema_bloc.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailCinemaScreen extends StatelessWidget {
  final MovieModel movie;
  const DetailCinemaScreen({Key? key, required this.movie}) : super(key: key);

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
            height: size.height * 0.6,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(movie.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Color(0xff21242C),
                    Color(0xff21242C).withOpacity(.8),
                    Color(0xff21242C).withOpacity(.1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 250,
            child: Column(
              children: <Widget>[
                Container(
                  height: 80,
                  width: size.width,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                            padding: EdgeInsets.all(15),
                            color: Colors.white.withOpacity(0.3),
                            child: Icon(Icons.play_arrow_rounded,
                                color: Colors.white, size: 45)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: size.width * .7,
                  height: 50,
                  child: TextTK(
                    text: movie.name,
                    color: Colors.white,
                    size: 25,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 20.0),
                RatingBar.builder(
                  unratedColor: Colors.white,
                  itemSize: 40,
                  initialRating: movie.qualification,
                  itemBuilder: (_, i) => Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (_) {},
                ),
                SizedBox(height: 20.0),
                TextTK(
                  text:
                      "${movie.year}  |  ${movie.duration}  |  ${movie.genre}",
                  color: Colors.white70,
                  size: 20,
                ),
                SizedBox(height: 25.0),
                TextTK(
                    text: 'Storyline',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 30),
                SizedBox(height: 15.0),
                Container(
                  width: size.width * .9,
                  child: Wrap(
                    children: [
                      TextTK(
                        text: movie.description,
                        color: Colors.white,
                        maxLines: 6,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 60,
            right: 60,
            bottom: 30,
            child: InkWell(
              onTap: () {
                BlocProvider.of<CinemaBloc>(context)
                    .add(OnSelectMovieEvent(movie.name, movie.image));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuyTicketScreen(
                      nameMovie: movie.name,
                      imageMovie: movie.image,
                    ),
                  ),
                );
              },
              child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextTK(
                    text: "Buy Ticket",
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
