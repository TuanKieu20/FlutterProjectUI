import 'package:flutter/material.dart';

class ProjectModel {
  final int id;
  final String title;
  final String designer;
  final String pathImage;
  final String route;
  final Color color;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.designer,
    required this.pathImage,
    required this.route,
    required this.color,
  });

  static const coffee = ProjectModel(
    id: 1,
    title: "Coffee-App",
    designer: "Jacob Janura",
    pathImage: "assets/logo-coffee.png",
    route: "/coffee-app",
    color: Color(0xffFFA136),
  );

  static const calculator = ProjectModel(
    id: 2,
    title: "Calculator-App",
    designer: "Jacob Janura",
    pathImage: "assets/logo-white.png",
    route: "/calculator",
    color: Color(0xff5A4A9E),
  );
  static const cinema = ProjectModel(
    id: 3,
    title: "Cinema-App",
    designer: "Tuan Kieu",
    pathImage: "assets/logo-TK.png",
    route: "/cinema-app",
    color: Colors.purple,
  );

  static const listProject = [
    coffee,
    calculator,
    cinema,
  ];
}
