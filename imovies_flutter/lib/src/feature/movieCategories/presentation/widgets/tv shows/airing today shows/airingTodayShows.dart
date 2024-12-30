import 'package:flutter/cupertino.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieListViewBuilder/movieListViewBuilder.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieTypeText/movieTypeText.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/individualMovieProviders.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/widgets/reuseableMovieTypeList/reuseableMovieTypeList.dart';

import '../../movieCategories.screens/movie category exports/movieCategories.export.dart';

class AiringTodayMovies extends ConsumerWidget {
  const AiringTodayMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airingTodayMovies = ref.watch(airingTodayProvider);

    // final currentScreen = ref.read(onNavigateTo);

    return ReuseableMovieTypeList(
      movies: airingTodayMovies,
      movieType: 'Airing Today Shows',
      navigateToWhere: 'airingTodayMovies',
    );
  }
}
