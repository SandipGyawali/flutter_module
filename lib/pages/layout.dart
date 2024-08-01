import 'package:flutter/material.dart';
import 'package:flutter_m/components/app_bar.dart';
import 'package:flutter_m/components/bottom_navigation.dart';
import 'package:flutter_m/components/drawer.dart';
import 'package:flutter_m/pages/home.dart';
import 'package:flutter_m/pages/news_list.dart';
import 'package:flutter_m/pages/photos.dart';
import 'package:flutter_m/pages/test_page.dart';

class LayoutPage extends StatefulWidget {
  @override
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPage();
}

class _LayoutPage extends State<LayoutPage> {
  // final User? user = Auth().currentUser;

  int _selectedIndex = 0;
  // page list.
  final List<Widget> _pages = [
    const HomePage(),
    const PhotoScreen(),
    const NewsListScreen(),
    const TestPage()
  ];

  // bottom nav bar page navigation.
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      key: _key,
      backgroundColor: Colors.grey.shade200,
      drawer: const DrawerWidget(),
      appBar: AppBarWidget(key_: _key),
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
