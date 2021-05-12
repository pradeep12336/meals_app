import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_hotel/dummy_data.dart';
import 'package:udemy_hotel/screen/category_screen.dart';
import 'package:udemy_hotel/screen/cateogry_screen_meals.dart';
import 'package:udemy_hotel/screen/filter_screen.dart';
import 'package:udemy_hotel/screen/meals_details_screen.dart';
import 'package:udemy_hotel/screen/tabs_Screen.dart';

import 'models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactos': false,
    'vegeterian': false,
  };
  List<Meals> _availableMeals = Dummy_Meals;
  List<Meals> _favouriteMeals = [];
  void _toggleFavourites(String mealId) {
    final existingIndex = _favouriteMeals.indexWhere((meals) {
      return meals.id == mealId;
    });
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(
          Dummy_Meals.firstWhere((meals) {
            return meals.id == mealId;
          }),
        );
      });
    }
  }

  bool _isFavoourite(String id) {
    return _favouriteMeals.any((selected) {
      return selected.id == id;
    });
  }

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = Dummy_Meals.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactos'] && !meal.isLactosFree) {
          return false;
        }
        if (_filters['vegeterian'] && !meal.isVegeterian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
                  color: Colors.white,
                  fontSize: 20,
                ),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1), fontSize: 20, fontWeight: FontWeight.bold),
                title: TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
              ),
          fontFamily: 'Raleway'),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryScreenMeals.routeName: (ctx) => CategoryScreenMeals(
              availableMeals: _availableMeals,
            ),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(
              _toggleFavourites,
              _isFavoourite,
            ),
        FilterScreen.routeName: (Ctx) => FilterScreen(
              saveFilters: _setFilter,
              currentFilters: _filters,
            ),
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
