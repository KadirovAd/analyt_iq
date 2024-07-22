import 'package:flutter/material.dart';
import 'package:history_trade/src/presemtation/add_screen/add_screen.dart';
import 'package:history_trade/src/presemtation/home_screen/home_screen.dart';
import 'package:history_trade/src/presemtation/minus_screen/minus_screen.dart';
import 'package:history_trade/src/presemtation/profil_screen/profil_screen.dart';
import 'package:history_trade/src/presemtation/star_screen/star_screen.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const AppScreen(),
    const MinusScreen(),
    const StarScreen(),
    const ProfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF84B3FA),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF100A60),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(
                0,
                'assets/images/home.png',
                'assets/images/home1.png',
              ),
              _buildNavItem(
                1,
                'assets/images/add.png',
                'assets/images/add1.png',
              ),
              _buildNavItem(
                2,
                'assets/images/minus.png',
                'assets/images/minus1.png',
              ),
              _buildNavItem(
                3,
                'assets/images/star.png',
                'assets/images/star1.png',
              ),
              _buildNavItem(
                4,
                'assets/images/profil.png',
                'assets/images/profil1.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      int index, String defaultAssetPath, String selectedAssetPath) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: Image.asset(
                _selectedIndex == index ? selectedAssetPath : defaultAssetPath),
          ),
        ],
      ),
    );
  }
}
