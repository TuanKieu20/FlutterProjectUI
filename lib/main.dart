import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Cinema/bloc/cinema_bloc.dart';
import 'package:flutter_projects/Coffee/bloc/coffee_bloc.dart';
import 'package:flutter_projects/Routes/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoffeeBloc>(
          create: (context) => CoffeeBloc(),
        ),
        BlocProvider<CinemaBloc>(
          create: (context) => CinemaBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}
