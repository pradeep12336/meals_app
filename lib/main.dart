import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_hotel/screen/category_screen.dart';
import 'package:udemy_hotel/screen/cateogry_screen_meals.dart';
import 'package:udemy_hotel/screen/filter_screen.dart';
import 'package:udemy_hotel/screen/meals_details_screen.dart';
import 'package:udemy_hotel/screen/tabs_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.yellow,
          canvasColor: Color.fromRGBO(
            255,
            254,
            225,
            1,
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontSize: 20, fontWeight: FontWeight.bold),
                title: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
              ),
          fontFamily: 'Raleway'),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryScreenMeals.routeName: (ctx) => CategoryScreenMeals(),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(),
        FilterScreen.routeName: (Ctx) => FilterScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
