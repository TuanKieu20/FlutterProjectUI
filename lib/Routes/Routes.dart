import 'package:flutter/material.dart';
import 'package:flutter_projects/Cinema/screens/home_cineme_screen.dart';
import 'package:flutter_projects/Coffee/Screens/home_coffee_screen.dart';
import 'package:flutter_projects/Dashbroad/Screens/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (_) => HomeScreen(),
  '/coffee-app': (_) => HomeCoffeeScreen(),
  '/cinema-app': (_) => HomeCinemaScreen(),
};
