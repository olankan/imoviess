import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/shared/data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';
import '../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

final movieGenreID = StateProvider<int>((ref) => 16);
final movieGenreType = StateProvider<String>((ref) => 'Action');
final movieByGenreIndex = StateProvider((ref) => 0);
final selectedGenreIndex = StateProvider((ref) => 0);


final movieByGenreProvider = FutureProvider<List<MoviesVm>>((ref) async {
  int genreId = ref.watch(movieGenreID);
  try {
    FetchedMoviesListService fetchedMoviesListService =
        FetchedMoviesListService();
    return await fetchedMoviesListService.getFetchedMoviesByGenreList(genreId);
  } catch (e) {
    print(e);
    return [];
  }
});
