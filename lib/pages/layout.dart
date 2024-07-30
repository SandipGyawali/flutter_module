import 'package:flutter/material.dart';
import 'package:flutter_m/components/bottom_navigation.dart';
import 'package:flutter_m/pages/home.dart';
import 'package:flutter_m/pages/news_list.dart';
import 'package:flutter_m/pages/photos.dart';
import 'package:flutter_m/pages/profile.dart';
import 'package:flutter_m/pages/weather.dart';

class LayoutPage extends StatefulWidget {
  @override
  State<LayoutPage> createState() => _LayoutPage();
}

class _LayoutPage extends State<LayoutPage> {
  // final User? user = Auth().currentUser;

  int _selectedIndex = 0;
  // page list.
  final List<Widget> _pages = [
    HomePage(),
    PhotoScreen(),
    WeatherPage(),
    NewsListScreen(),
    ProfilePage(),
  ];

  // bottom nav bar page navigation.
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
