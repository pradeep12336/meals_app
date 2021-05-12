import 'package:flutter/material.dart';
import 'package:udemy_hotel/models/meals.dart';
import 'package:udemy_hotel/widgets/meals_item.dart';

class CategoryScreenMeals extends StatelessWidget {
  static const routeName = '/categories-meals';
  final List<Meals> availableMeals;

  CategoryScreenMeals({this.availableMeals}); // final String CategoryTitle;
  // final String CategoryId;
  //
  // CategoryScreenMeals({
  //   @required this.CategoryTitle,
  //   @required this.CategoryId,
  // });

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final CategoryId = routeArgs['id'];
    final CategoryTitle = routeArgs['title'];
    print('category id is${CategoryId}');
    final CatMeals = availableMeals.where((meal) {
      return meal.categories.contains(CategoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(CategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: CatMeals[index].id,
            title: CatMeals[index].title,
            imgUrl: CatMeals[index].imgurl,
            complexity: CatMeals[index].complexity,
            duration: CatMeals[index].duration,
            affordability: CatMeals[index].affordability,
          );
        },
        itemCount: CatMeals.length,
      ),
    );
  }
}
