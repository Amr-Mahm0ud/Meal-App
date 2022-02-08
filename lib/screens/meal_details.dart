import 'package:flutter/material.dart';
import '../models/provider.dart';
import 'package:provider/provider.dart';

class MealDetails extends StatelessWidget {
  static const routeName = 'MealDetails';
  const MealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = Provider.of<MyProv>(context).dummyMeals.firstWhere((element) {
      return element.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Hero(
        tag: mealId,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(meal.imageUrl, fit: BoxFit.cover),
              ),
              titleWidget(context, 'Ingredients'),
              buildContainer(
                context,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: meal.ingredients
                      .map(
                        (ingredient) => SizedBox(
                          width: double.infinity,
                          child: Card(
                            elevation: 3,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(ingredient),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              titleWidget(context, 'Steps'),
              buildContainer(
                context,
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: meal.steps.map((step) {
                      index++;
                      return Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Text(
                                '#$index',
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                          title: Text(
                            step,
                            style: Theme.of(context).textTheme.bodyText2,
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      );
                    }).toList()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<MyProv>(context, listen: false).editFavorites(mealId);
        },
        child: Icon(
            Provider.of<MyProv>(context, listen: false).isFavorite(mealId)
                ? Icons.star
                : Icons.star_outline),
      ),
    );
  }

  Container buildContainer(BuildContext context, Column column) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.secondary),
        child: column);
  }

  Padding titleWidget(BuildContext context, String title) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ));
  }
}
