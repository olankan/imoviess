import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:imovies_flutter/src/core/shared/presentation/providers/sharedProviders.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieGestureDetector/MovieGestureDetector.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';

class MovieListViewBuilder extends ConsumerWidget {
  const MovieListViewBuilder({
    super.key,
    required this.navigateToWhere,
    required this.movies,
  });

  final List<MoviesVm> movies;
  final String navigateToWhere;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 175.0.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final selectedMovie = movies[index];

            return MovieGestureDetector(
              selectedMovie: selectedMovie,
              onTap: () {
                ref.watch(heroTagProvider.notifier).state = selectedMovie;
                ref.watch(movieIDProvider.notifier).state =
                    selectedMovie.movieID;
                print(selectedMovie.title);
                print(
                    '''MOVIE'S MOVIE ID IS ${selectedMovie.title} ${selectedMovie.movieID}''');

                ref.watch(onNavigateTo.notifier).state = navigateToWhere;
                // ref.watch(movieIndexProvider.notifier).state = index;
                context.push('/description');
              },
            );
          }),
    );
  }
}
