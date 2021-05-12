import 'package:flutter/material.dart';
import 'package:udemy_hotel/dummy_data.dart';

import 'file:///E:/FlutterProjectsAndroidStudio/udemy_hotel/lib/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      children: Dummy_Data.map((data) {
        return CategoryItem(
          id: data.id,
          title: data.title,
          colors: data.colors,
        );
      }).toList(),
    );
  }
}
