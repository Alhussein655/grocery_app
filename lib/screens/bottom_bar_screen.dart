import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocey_app/provider/dark_theme_provider.dart';
import 'package:grocey_app/screens/cart/cart_screen.dart';
import 'package:grocey_app/screens/categories_screen.dart';
import 'package:grocey_app/screens/home_screen.dart';
import 'package:grocey_app/screens/user_screen.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static const routeName='mainScreen';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, dynamic>> _pages = [
    {'page':  HomeScreen(), 'title': 'Home Screen'},
    {'page':  CategoriesScreen(), 'title': 'Categories Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'},
  ];
  int _selectedIndex = 3;
  void selectIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: _isDark ? Colors.white10 : Colors.black45,
          selectedItemColor: _isDark ? Colors.white : Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: selectIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category),
                label: 'category'),
            BottomNavigationBarItem(
                icon: badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -10,end:-20),
                  badgeContent: const Text('10',style: TextStyle(fontSize: 12),),

                  child: Icon(
                      _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
                ),
                label: 'cart'),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
                label: 'user'),
          ]),
    );
  }
}
