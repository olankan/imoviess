// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieListViewBuilder/movieListViewBuilder.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieTypeText/movieTypeText.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/individualMovieProviders.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/widgets/reuseableMovieTypeList/reuseableMovieTypeList.dart';

import '../movie category exports/movieCategories.export.dart';
import '../movie category exports/movieCategories.export.dart';

class TopRatedMovies extends ConsumerWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    // final currentScreen = ref.read(onNavigateTo);

    return ReuseableMovieTypeList(
      movies: topRatedMovies,
      movieType: 'Top Rated Movies',
      navigateToWhere: 'topRatedMovies',
    );
  }
}
