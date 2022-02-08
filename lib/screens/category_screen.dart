import 'package:flutter/material.dart';
import '../models/provider.dart';
import '../widgets/category_items.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: Provider.of<MyProv>(context)
          .dummyCategories
          .map((catItem) =>
              CategoryItem(catItem.id, catItem.title, catItem.color))
          .toList(),
    );
  }
}
