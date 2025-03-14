import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<BottomNavigationBarItem> navbarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt),
      label: 'List'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorites'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.green.shade700,
      items: navbarItems
    );
  }
}
