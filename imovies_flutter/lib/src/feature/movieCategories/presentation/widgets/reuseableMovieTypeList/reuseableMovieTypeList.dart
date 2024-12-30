import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieListViewBuilder/movieListViewBuilder.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieTypeText/movieTypeText.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/pages/movieCategories/movieCategories.export.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';

class ReuseableMovieTypeList extends StatelessWidget {
  const ReuseableMovieTypeList({
    super.key,
    required this.movies,
    required this.movieType,
    required this.navigateToWhere,
  });

  final AsyncValue<List<MoviesVm>> movies;
  final String movieType;
  final String navigateToWhere;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        movies.when(
          data: (movies) {
            movies.shuffle();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    // key: Key(selectedGenreType),
                    padding: const EdgeInsets.only(left: 2.0, bottom: 2).r,
                    child: MovieTypeText(movieType: movieType)),
                MovieListViewBuilder(
                  navigateToWhere: navigateToWhere,
                  movies: movies,
                )
              ],
            );
          },
          loading: () {
            return Center(
              child: SizedBox(
                height: 170.0.h,
                child: Transform.scale(
                  scale: 1.3,
                  child: const Center(
                      child: CupertinoActivityIndicator(color: Colors.red)),
                ),
              ),
            );
          },
          error: (Object error, StackTrace stackTrace) {
            return Center(
              child: SizedBox(
                height: 170.0.h,
                child: SingleChildScrollView(child: Text(' $stackTrace')),
              ),
            );
          },
        )
      ],
    );
  }
}
