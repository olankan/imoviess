// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieListViewBuilder/movieListViewBuilder.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieTypeText/movieTypeText.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/individualMovieProviders.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/widgets/reuseableMovieTypeList/reuseableMovieTypeList.dart';

import '../../movieCategories.screens/movie category exports/movieCategories.export.dart';

class OnTheAirShows extends ConsumerWidget {
  const OnTheAirShows({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onTheAirTvShows = ref.watch(onTheAirTvShowsProvider);

    return ReuseableMovieTypeList(
      movies: onTheAirTvShows,
      movieType: 'On The Air Shows',
      navigateToWhere: 'onTheAirShows',
    );
  }
}
