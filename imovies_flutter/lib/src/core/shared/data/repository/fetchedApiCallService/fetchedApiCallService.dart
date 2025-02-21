import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovies_flutter/src/core/shared/data/repository/apiCallService/apiCallService.dart';
import 'package:imovies_flutter/src/core/shared/domain/models/movie%20credits%20model/movieCredits.model.dart';
import 'package:imovies_flutter/src/core/shared/domain/models/movie%20reviews%20model/movieReviews.model.dart';
import 'package:imovies_flutter/src/core/shared/domain/models/movie/movieModel.dart';
import 'package:imovies_flutter/src/core/shared/domain/models/movieVideos%20model/movieVideos.model.dart';
import 'package:imovies_flutter/src/core/shared/domain/models/movie_watch%20providers%20model/movieWatchProviders.model.dart';
import 'package:imovies_flutter/src/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';
// import 'package:movie_sample/core/shared/data/repository/apiCallService/apiCallService.dart';

import '../../../domain/repository/fetchedMoviesApiServiceInterface/movieApiServiceInterface.dart';

class FetchedMoviesApiService implements FetchedMoviesApiServiceInterface {
  ApiCallService apiCall = ApiCallService();

  @override
  Future<MovieModel?> getFetchedDiscoveredMovies() async {
    final Response? response = await apiCall.getDiscoveredMovies();
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  Future<MoviesVm?> getFetchedMovieById(id, FutureProviderRef ref) async {
    final onNavigateToProv = ref.watch(onNavigateTo);

    final Response? response = (onNavigateToProv == 'airingTodayMovies' ||
            onNavigateToProv == 'onTheAirShows')
        ? await apiCall.getTvShowById(id)
        : await apiCall.getMovieById(id);
    if (response != null) {
      final movie = UltimateResultModel.fromJson(response.data);
      print(movie.name);
      return MoviesVm(movie: movie);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedAiringToday() async {
    final Response? response = await apiCall.getAiringToday();
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedMoviesByGenre(id) async {
    final Response? response = await apiCall.getMoviesByGenre(id);
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedMovieRecommendations(id) async {
    final Response? response = await apiCall.getMovieRecommendations(id);
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedNowPlayingMovies() async {
    final Response? response = await apiCall.getNowPlayingMovies();
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedOnTheAirMovies() async {
    final Response? response = await apiCall.getOnTheAirMovies();
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedPopularMovies() async {
    final Response? response = await apiCall.getPopularMovies();
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedPopularTvShows() async {
    final Response? response = await apiCall.getPopularTvShows();
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedSimilarMovies(id) async {
    final Response? response = await apiCall.getSimilarMovies(id);
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedTopRatedMovies() async {
    final Response? response = await apiCall.getTopRatedMovies();
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedUpcomingMovies() async {
    final Response? response = await apiCall.getUpcomingMovies();
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieCreditsModel?> getFetchedMovieCredits(id) async {
    final Response? response = await apiCall.getMovieCredits(id);
    if (response != null) {
      return MovieCreditsModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieReviewsModel?> getFetchedMovieReviews(id) async {
    final Response? response = await apiCall.getMovieReviews(id);
    if (response != null) {
      // print(response.data);
      return MovieReviewsModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieVideosModel?> getFetchedMovieVideos(id) async {
    final Response? response = await apiCall.getMovieVideos(id);
    if (response != null) {
      return MovieVideosModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieWatchProvidersModel?> getFetchedMovieWatchProviders(id) async {
    final Response? response = await apiCall.getMovieWatchProviders(id);
    if (response != null) {
      return MovieWatchProvidersModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<MovieModel?> getFetchedSearchedMovie(movieTitle) async {
    final Response? response =
        await apiCall.getSearchedMovie(movieTitle: movieTitle);
    if (response != null) {
      return MovieModel.fromJson(response.data);
    }
    return null;
  }
}
