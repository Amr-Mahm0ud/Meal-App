import 'package:flutter/material.dart';
import '../models/provider.dart';
import 'package:provider/provider.dart';

import 'meal_details.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Widget buildFavoritesMeal(String id) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(MealDetails.routeName, arguments: id),
      child: Hero(
        tag: id,
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
                      Provider.of<MyProv>(context)
                          .dummyMeals
                          .firstWhere((element) => element.id == id)
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      width: 200,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.8),
                      child: Text(
                        Provider.of<MyProv>(context)
                            .dummyMeals
                            .firstWhere((element) => element.id == id)
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: IconButton(
                  onPressed: () {
                    Provider.of<MyProv>(context, listen: false)
                        .editFavorites(id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<MyProv>(context, listen: false).favoriteMeals.isEmpty
        ? const Center(
            child: Text('You have no favorite meals'),
          )
        : ListView(
            children: Provider.of<MyProv>(context, listen: false)
                .favoriteMeals
                .map((meal) => buildFavoritesMeal(meal.id))
                .toList(),
          );
  }
}
