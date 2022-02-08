import 'package:flutter/material.dart';
import '../models/provider.dart';
import '../screens/meal_details.dart';
import 'package:provider/provider.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String itemId;
  const MealItem(this.itemId, {Key? key}) : super(key: key);

  String complexity(Meal item) {
    switch (item.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
    }
  }

  String affordability(Meal item) {
    switch (item.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetails.routeName, arguments: itemId);
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProv>(context);
    return InkWell(
      onTap: () => selectMeal(context),
      child: Hero(
        tag: itemId,
        child: Card(
          elevation: 5,
          margin: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.network(
                      prov.dummyMeals
                          .firstWhere((element) => element.id == itemId)
                          .imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      width: 200,
                      color:
                          Theme.of(context).colorScheme.primary.withOpacity(0.8),
                      child: Text(
                        prov.dummyMeals
                            .firstWhere((element) => element.id == itemId)
                            .title,
                        style: Theme.of(context).textTheme.bodyText1,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(width: 5),
                        Text('${prov.dummyMeals.firstWhere((element) {
                          return element.id == itemId;
                        }).duration} min'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(width: 5),
                        Text(complexity(prov.dummyMeals
                                .firstWhere((element) => element.id == itemId))
                            .toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(width: 5),
                        Text(affordability(prov.dummyMeals
                                .firstWhere((element) => element.id == itemId))
                            .toString()),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
