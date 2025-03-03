import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const CustomBottomNavigation({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home) , label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.thumbs_up_down_outlined), activeIcon: Icon(Icons.thumbs_up_down), label: 'Populares'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), activeIcon: Icon(Icons.favorite), label: 'Favoritos'),
      ],
      currentIndex: navigationShell.currentIndex,
      onTap: (int index) => navigationShell.goBranch(index),
    );
  }
}
