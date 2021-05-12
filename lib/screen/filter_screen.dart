import 'package:flutter/material.dart';
import 'package:udemy_hotel/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen({this.saveFilters, this.currentFilters});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gultenFree = false;
  bool _lactosFree = false;
  bool _vegeterian = false;
  @override
  initState() {
    _lactosFree = widget.currentFilters['lactos'];
    _gultenFree = widget.currentFilters['gluten'];
    _vegeterian = widget.currentFilters['vegeterian'];
    super.initState();
  }

  Widget _buildWidget(
    BuildContext context,
    String title,
    String description,
    Function updateValue,
    bool value,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      value: value,
      onChanged: updateValue,
      subtitle: Text(
        description,
        style: TextStyle(
          color: Colors.black45,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: [
            FlatButton.icon(
              onPressed: () {
                final SeelctedFilters = {
                  'gluten': _gultenFree,
                  'lactos': _lactosFree,
                  'vegeterian': _vegeterian,
                };
                widget.saveFilters(SeelctedFilters);
                Navigator.of(context).popAndPushNamed('/');
              },
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
          title: Text(
            "Your Filters",
            style: Theme.of(context).textTheme.body2,
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust Your Meal Selection",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildWidget(
                  context,
                  'Gluten-Free',
                  "Only Include Gluten-Free Meals",
                  (newVal) {
                    setState(() {
                      _gultenFree = newVal;
                    });
                  },
                  _gultenFree,
                ),
                _buildWidget(
                  context,
                  'Lactos-free',
                  "Only Include Lactos-Free Meals",
                  (newVal) {
                    setState(() {
                      _lactosFree = newVal;
                    });
                  },
                  _lactosFree,
                ),
                _buildWidget(
                  context,
                  'vegeterian',
                  "Only Include Vegeterian Meals",
                  (newVal) {
                    setState(() {
                      _vegeterian = newVal;
                    });
                  },
                  _vegeterian,
                ),
              ],
            ))
          ],
        ));
  }
}
