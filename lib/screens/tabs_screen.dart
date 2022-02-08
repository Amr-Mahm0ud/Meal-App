import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import 'category_screen.dart';
import 'favorites.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = 'TabsScreen';
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': const CategoryScreen(), 'title': 'Categories'},
    {'page': const FavoritesScreen(), 'title': 'Favorites'}
  ];

  int _currentIndex = 0;
  void changeTab(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_currentIndex]['title'] as String)),
      body: _pages[_currentIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(size: 30),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
        onTap: changeTab,
      ),
      drawer: MainDrawer('Meal'),
    );
  }
}
