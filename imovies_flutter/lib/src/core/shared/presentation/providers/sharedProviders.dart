import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovies_flutter/src/core/shared/data/repository/fetchedApiCallService/fetchedApiCallService.dart';
import 'package:imovies_flutter/src/core/shared/domain/models/movie/movieModel.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';

import '../../data/repository/fetchedMoviesListService/fetchedMoviesListService.dart';

final movieProvider = FutureProvider<List<MoviesVm>>((ref) async {
  try {
    FetchedMoviesListService fetchedMoviesListService =
        FetchedMoviesListService();

    return await fetchedMoviesListService.getFetchedDiscoveredMoviesList();
  } catch (e) {
    print(e);
    return [];
  }
});

final movieIndexProvider = StateProvider<int?>((ref) => 0);
final homeMovieIndexProvider = StateProvider<int?>((ref) => 0);
final movieIDProvider = StateProvider<int?>((ref) => 0);
final previousMovieIndex = StateProvider<int?>((ref) => -1);
final onNotifyProvider = StateProvider<bool>((ref) => false);
final navIndex = StateProvider<int>((ref) => 0);
final movieDescriptionProvider = StateProvider<int>((ref) => 0);
final storedMovieIndexProvider = StateProvider<int>((ref) => 0);

final onPressedProvider = StateProvider<bool>((ref) => false);
final heroTagProvider = StateProvider<dynamic>((ref) => '');
// final isChanged = StateProvider<bool>((ref) => true);
