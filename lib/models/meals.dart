import 'package:flutter/cupertino.dart';

enum Complexity {
  simple,
  challenging,
  hard,
}
enum Affordability {
  affordable,
  pricey,
  luxirious,
}

class Meals {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final String imgurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isLactosFree;
  final bool isGlutenFree;
  final bool isVegeterian;

  const Meals({
    @required this.id,
    @required this.title,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.imgurl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactosFree,
    @required this.isVegeterian,
  });
}
