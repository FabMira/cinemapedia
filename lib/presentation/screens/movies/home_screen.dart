import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';

import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-scren';
  final StatefulNavigationShell navigationShell;
  const HomeScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigation(navigationShell: navigationShell,),
    );
  }
}

