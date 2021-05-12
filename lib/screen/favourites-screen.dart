import 'package:flutter/material.dart';
import 'package:udemy_hotel/models/meals.dart';
import 'package:udemy_hotel/widgets/meals_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meals> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text(
          "You Have no Favourites  yet - Start Adding Some!",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imgUrl: favouriteMeals[index].imgurl,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
