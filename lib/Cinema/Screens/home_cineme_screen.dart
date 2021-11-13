import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_projects/Cinema/Models/movie_model.dart';
import 'package:flutter_projects/Cinema/Models/trailer_model.dart';
import 'package:flutter_projects/Cinema/Screens/detail_cinema_screen.dart';
import 'package:flutter_projects/Dashbroad/Widgets/TextTK.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeCinemaScreen extends StatelessWidget {
  const HomeCinemaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21242C),
      appBar: AppBar(
        backgroundColor: Color(0xff21242C),
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
              )),
          SizedBox(width: 10.0),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_rounded,
              size: 30,
            ),
          ),
          SizedBox(width: 15.0),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: TextTK(
              text: "TK",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 15.0),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: <Widget>[
          _ItemTitle(title: "Trailers"),
          SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            height: 200,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: TrailersModel.listTrailers.length,
              itemBuilder: (context, index) {
                return _ItemTrailers(
                    trailer: TrailersModel.listTrailers[index]);
              },
            ),
          ),
          SizedBox(height: 20),
          _ItemTitle(title: "Now in Cinemas"),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 280,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: MovieModel.listMovie.length,
              itemBuilder: (context, index) {
                return _ItemNowInCinema(movie: MovieModel.listMovie[index]);
              },
            ),
          ),
          SizedBox(height: 20),
          _ItemTitle(title: "Comming soon"),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 280,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: MovieModel.listMovie.length - 2,
              itemBuilder: (context, index) {
                return _ItemCommingSoon(movie: MovieModel.listMovie[index + 1]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCommingSoon extends StatelessWidget {
  final MovieModel movie;
  const _ItemCommingSoon({required this.movie});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => DetailCinemaScreen(movie: movie))),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 160,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(movie.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 160,
              child: TextTK(
                text: movie.name,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              itemSize: 22,
              initialRating: movie.qualification,
              itemBuilder: (_, i) => Icon(
                Icons.star_rate_rounded,
                color: Colors.amber,
              ),
              onRatingUpdate: (_) {},
            )
          ],
        ),
      ),
    );
  }
}

class _ItemNowInCinema extends StatelessWidget {
  final MovieModel movie;
  const _ItemNowInCinema({required this.movie});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => DetailCinemaScreen(movie: movie))),
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: "movie-hero-${movie.id}",
              child: Container(
                width: 160,
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(movie.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 160,
              child: TextTK(
                text: movie.name,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            RatingBar.builder(
              itemSize: 22,
              initialRating: movie.qualification,
              itemBuilder: (_, i) => Icon(
                Icons.star_rate_rounded,
                color: Colors.amber,
              ),
              onRatingUpdate: (_) {},
            )
          ],
        ),
      ),
    );
  }
}

class _ItemTrailers extends StatelessWidget {
  const _ItemTrailers({
    Key? key,
    required this.trailer,
  }) : super(key: key);

  final TrailersModel trailer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(trailer.image),
              ),
            ),
          ),
          Container(
            width: 300,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 10.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    color: Colors.white.withOpacity(0.3),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  const _ItemTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextTK(
              text: title,
              color: Colors.white,
              size: 25,
              fontWeight: FontWeight.w600,
            ),
            TextTK(
              text: "View all",
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
