import 'package:flutter/material.dart';
import 'package:meal_app/models/provider.dart';
import 'package:provider/provider.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = 'FilterScreen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  SwitchListTile buildSwitchListTile(
      String title, String description, bool val, void Function(bool) update) {
    return SwitchListTile(
        title: Text(title, style: Theme.of(context).textTheme.bodyText1),
        subtitle:
            Text(description, style: Theme.of(context).textTheme.bodyText2),
        value: val,
        onChanged: update);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> filters = Provider.of<MyProv>(context).filters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            const Text('Adjust your meals selection',
                style: TextStyle(fontSize: 30)),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-free',
                    "show meals that doesn't contain gluten",
                    filters['gluten']!, (newVal) {
                  setState(() {
                    filters['gluten'] = newVal;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-free',
                    "show meals that doesn't contain lactose",
                    filters['lactose']!, (newVal) {
                  setState(() {
                    filters['lactose'] = newVal;
                  });
                }),
                buildSwitchListTile('Vegetarian', "show vegetarian meals only",
                    filters['vegetarian']!, (newVal) {
                  setState(() {
                    filters['vegetarian'] = newVal;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', "show vegan meals only", filters['vegan']!,
                    (newVal) {
                  setState(() {
                    filters['vegan'] = newVal;
                  });
                }),
              ],
            ))
          ],
        ),
      ),
      drawer: MainDrawer('Filters'),
    );
  }
}
