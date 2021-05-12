import 'package:flutter/material.dart';
import 'package:udemy_hotel/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          "Your Filters",
          style: Theme.of(context).textTheme.body2,
        ),
      ),
      body: Text("Filters Screen"),
    );
  }
}
