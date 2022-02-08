import 'package:flutter/material.dart';
import '../models/provider.dart';
import '../screens/about.dart';
import '../screens/contact.dart';
import '../screens/filter_screen.dart';
import '../screens/settings.dart';
import '../screens/tabs_screen.dart';
import '../screens/your_account.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainDrawer extends StatelessWidget {
  MainDrawer(
    this.fromWhere, {
    Key? key,
  }) : super(key: key);

  String fromWhere;

  ListTile buildListTile(BuildContext context, String title, IconData icon) {
    return ListTile(
      tileColor: fromWhere == title
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).scaffoldBackgroundColor,
      onTap: () {
        if (fromWhere == title) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pushReplacementNamed(choosePage(title)!);
        }
      },
      title: Text(title),
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
    );
  }

  String? choosePage(String name) {
    switch (name) {
      case 'Your Account':
        return YourAccount.routeName;
      case 'Settings':
        return Settings.routeName;
      case 'Filters':
        return FilterScreen.routeName;
      case 'Contact':
        return Contact.routeName;
      case 'About':
        return AboutUs.routeName;
      case 'Log-out':
        return TabsScreen.routeName;
      case 'Meal':
        return TabsScreen.routeName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            color: Theme.of(context).colorScheme.primary,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Meal App',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<MyProv>(context, listen: false).changeTheme();
                    },
                    icon: Icon(
                      Provider.of<MyProv>(context).isDark
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                  )
                ],
              ),
            ),
          ),
          buildListTile(context, 'Your Account', Icons.person_outline),
          buildListTile(context, 'Settings', Icons.settings_outlined),
          buildListTile(context, 'Meal', Icons.restaurant_menu_outlined),
          buildListTile(context, 'Filters', Icons.tune_outlined),
          buildListTile(context, 'Contact', Icons.question_answer_outlined),
          buildListTile(context, 'About', Icons.info_outline),
          buildListTile(context, 'Log-out', Icons.logout_outlined),
        ],
      ),
    );
  }
}
