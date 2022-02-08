import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/settings.dart';
import './screens/your_account.dart';
import './screens/contact.dart';
import './screens/about.dart';
import './screens/filter_screen.dart';
import './screens/meal_details.dart';
import './screens/meals_recipes.dart';
import './models/provider.dart';
import './screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProv>(
      create: (ctx) => MyProv(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: Provider.of<MyProv>(context).isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        routes: {
          '/': (context) => const MySplashScreen(),
          TabsScreen.routeName: (context) => const TabsScreen(),
          MealsRecipes.routeName: (context) => const MealsRecipes(),
          MealDetails.routeName: (context) => const MealDetails(),
          FilterScreen.routeName: (context) => const FilterScreen(),
          AboutUs.routeName: (context) => const AboutUs(),
          Contact.routeName: (context) => const Contact(),
          Settings.routeName: (context) => const Settings(),
          YourAccount.routeName: (context) => const YourAccount(),
        },
      ),
    );
  }
}
