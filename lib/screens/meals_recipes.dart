import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../models/provider.dart';
import '../widgets/meal_item.dart';
import 'package:provider/provider.dart';

class MealsRecipes extends StatefulWidget {
  const MealsRecipes({Key? key}) : super(key: key);
  static const routeName = 'mealsRecipes';

  @override
  _MealsRecipesState createState() => _MealsRecipesState();
}

class _MealsRecipesState extends State<MealsRecipes> {
  late String title;
  late List<Meal> mealsList;

  @override
  void didChangeDependencies() {
    Provider.of<MyProv>(context).filteredMeals =
        Provider.of<MyProv>(context).dummyMeals;
    Provider.of<MyProv>(context, listen: false).filterMeals();
    final recipesArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = recipesArg['id'];
    title = recipesArg['title']!;
    mealsList = Provider.of<MyProv>(context).filteredMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: mealsList.map(
          (item) {
            return MealItem(item.id);
          },
        ).toList(),
      ),
    );
  }
}
