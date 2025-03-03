import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouter =
    GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/', routes: [
  StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/',
              builder: (context, state) => HomeView(),
              routes: [
                GoRoute(
                  path: '/movie/:id',
                  name: MovieScreen.name,
                  builder: (context, state) {
                    final movieId = state.pathParameters['id'] ?? 'no-id';
                    return MovieScreen(movieId: movieId);
                  },
                )
              ])
        ]),
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/popular',
            builder: (context, state) => PopularView(),
          )
        ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => FavoritesView(),
          )]
        )
      ])
]);
