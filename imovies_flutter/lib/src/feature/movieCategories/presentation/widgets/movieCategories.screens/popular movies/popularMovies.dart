// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:imovies_flutter/src/core/shared/presentation/providers/sharedProviders.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieListViewBuilder/movieListViewBuilder.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieTypeText/movieTypeText.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/individualMovieProviders.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/widgets/reuseableMovieTypeList/reuseableMovieTypeList.dart';

import '../movie category exports/movieCategories.export.dart';

class PopularMovies extends ConsumerWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMovies = ref.watch(popularMoviesProvider);
    // final currentScreen = ref.read(onNavigateTo);

    return ReuseableMovieTypeList(
      movies: popularMovies,
      movieType: 'Popular Movies',
      navigateToWhere: 'popularMovies',
    );
  }
}
