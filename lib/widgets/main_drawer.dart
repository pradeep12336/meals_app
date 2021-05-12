import 'package:flutter/material.dart';
import 'package:udemy_hotel/screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget selectListile(
    BuildContext ctx,
    String title,
    IconData iconData,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.black,
      ),
      title: Text(title, style: Theme.of(ctx).textTheme.body2),
      tileColor: Colors.yellow.withOpacity(0.1),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Image.network(
                  "https://www.englishclub.com/images/vocabulary/food/cooking/cooking.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 20,
                  left: 40,
                  child: Container(
                    width: 200,
                    color: Colors.black45,
                    child: Text(
                      "Coocked Up!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          selectListile(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(
            height: 10,
            thickness: 0,
            color: Colors.black,
          ),
          selectListile(context, 'Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
