import 'package:flutter/material.dart';
import 'package:udemy_hotel/screen/cateogry_screen_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color colors;

  CategoryItem({this.title, this.colors, this.id});

  void _seleceCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryScreenMeals.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        _seleceCategory(context);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colors.withOpacity(0.7),
              colors,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
