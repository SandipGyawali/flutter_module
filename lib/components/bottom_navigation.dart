import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final dynamic onItemTapped;

  @override
  const BottomNavigation({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double iconSize = 22;
    const Color selectedColor = Colors.grey;
    const Color unselectedColor = Colors.black87;

    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          iconSize: iconSize,
          currentIndex: selectedIndex,
          onTap: (value) {
            onItemTapped(value);
          },
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: selectedColor,
          unselectedItemColor: unselectedColor,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedHome13,
                color: selectedIndex == 0 ? selectedColor : unselectedColor,
                size: iconSize,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedScroll,
                color: selectedIndex == 1 ? selectedColor : unselectedColor,
                size: 24.0,
              ),
              label: "Sliver",
            ),
            BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedNews,
                color: selectedIndex == 2 ? selectedColor : unselectedColor,
                size: 24.0,
              ),
              label: "News",
            ),
            BottomNavigationBarItem(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedTestTube01,
                color: selectedIndex == 3 ? selectedColor : unselectedColor,
                size: 24.0,
              ),
              label: "Test",
            ),
          ],
        ),
      ),
    );
  }
}
