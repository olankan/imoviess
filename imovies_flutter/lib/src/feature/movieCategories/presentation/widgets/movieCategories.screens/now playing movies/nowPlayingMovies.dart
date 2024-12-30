// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieListViewBuilder/movieListViewBuilder.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieTypeText/movieTypeText.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/individualMovieProviders.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/widgets/reuseableMovieTypeList/reuseableMovieTypeList.dart';

import '../movie category exports/movieCategories.export.dart';

class NowPlayingMovies extends ConsumerWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    // final currentScreen = ref.read(onNavigateTo);

    return ReuseableMovieTypeList(
      movies: nowPlayingMovies,
      movieType: 'Now Playing Movies',
      navigateToWhere: 'nowPlayingMovies',
    );
  }
}
