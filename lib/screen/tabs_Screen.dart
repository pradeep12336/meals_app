import 'package:flutter/material.dart';
import 'package:udemy_hotel/models/meals.dart';
import 'package:udemy_hotel/screen/category_screen.dart';
import 'package:udemy_hotel/screen/favourites-screen.dart';
import 'package:udemy_hotel/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meals> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPages = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPages = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'pages': CategoriesScreen(), 'title': 'Categories'},
      {'pages': FavouritesScreen(widget.favouriteMeals), 'title': 'Your Favourite'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _pages[_selectedPages]['title'],
        ),
      ),
      body: _pages[_selectedPages]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 18,
        currentIndex: _selectedPages,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          _selectPage(index);
        },
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.category,
              size: _selectedPages == 0 ? 28 : 14,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.favorite,
              size: _selectedPages == 1 ? 28 : 14,
            ),
            label: 'Favourite',
          )
        ],
      ),
    );
  }
}
