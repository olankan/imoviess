import 'package:flutter/foundation.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';
import 'package:intl/intl.dart';

class MethodUtils {
  static String formatDate(String dateString) {
    try {
      final dateWithoutUTC = dateString.replaceAll(' UTC', '').trim();

      debugPrint('Formatted date string: $dateWithoutUTC');

      final dateTime = DateTime.parse(dateWithoutUTC);

      return DateFormat('MMMM d, y').format(dateTime);
    } on FormatException {
      return 'Invalid date';
    }
  }

  static int storedMovieIndex(
      {required List<MoviesVm>? movies, String? movieTitleQuery}) {
    if (movies == null || movieTitleQuery == null) {
      return 0;
    }

    final movieIndex =
        movies.indexWhere((movie) => movie.title == movieTitleQuery);
    print('RECOMMENDED MOVIE INDEX IS $movieIndex');

    return movieIndex;
  }
}
