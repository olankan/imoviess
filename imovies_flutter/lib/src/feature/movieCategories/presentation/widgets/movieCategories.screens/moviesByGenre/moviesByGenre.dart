// ignore_for_file: file_names, unnecessary_null_comparison
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieListViewBuilder/movieListViewBuilder.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieTypeText/movieTypeText.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/pages/movieCategories/movieCategories.export.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/individualMovieProviders.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/moviesByGenreProvider.dart';

class MoviesByGenre extends ConsumerWidget {
  const MoviesByGenre({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesByGenre = ref.watch(movieByGenreProvider);
    final selectedGenreType = ref.watch(movieGenreType);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          key: Key(selectedGenreType),
          padding: const EdgeInsets.only(left: 2.0, bottom: 2).r,
          child: RichText(
                  text: TextSpan(children: [
            TextSpan(
                text: selectedGenreType,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontFamily,
                    fontSize: 20.sp)),
            TextSpan(
                text: ' movies',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: fontFamily,
                    fontSize: 20.sp))
          ]))
              .animate()
              .fadeIn(begin: 0.5, duration: 200.ms, curve: Curves.easeInOut),
        ),
        moviesByGenre.when(
          data: (genreMovies) {
            // genreMovies.shuffle();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieListViewBuilder(
                  navigateToWhere: 'moviesByGenre',
                  movies: genreMovies,
                )
              ],
            );
          },
          loading: () {
            return Center(
              child: SizedBox(
                height: 175.0.h,
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
                height: 175.0.h,
                child: SingleChildScrollView(child: Text(' $stackTrace')),
              ),
            );
          },
        )
      ],
    );
  }
}
