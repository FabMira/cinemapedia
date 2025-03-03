import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;
    final movies =
        await ref.read(popularMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final popularMovies = ref.watch(popularMoviesProvider);
    if (popularMovies.isEmpty) return FullScreenLoader();
    // return SizedBox();
    return Scaffold(
        body: MovieMasonry(loadNextPage: loadNextPage, movies: popularMovies));
  }
}
