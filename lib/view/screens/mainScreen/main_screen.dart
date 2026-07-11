import 'package:flutter/material.dart';
import 'package:poultry_pro/view/screens/mainScreen/finance_screen.dart';
import 'package:poultry_pro/view/widgets/bottom_navigation.dart';
import 'home_screen.dart';
import 'flocks_screen.dart';
import 'settings_screen.dart';
import 'production_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    Flocks(),
    ProductionScreen(),
    Home(),
    Finance(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}
