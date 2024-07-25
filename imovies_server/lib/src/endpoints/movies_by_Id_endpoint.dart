import 'package:imovies_server/src/generated/movies_by_Id.dart';
import 'package:imovies_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MovieIdEndpoint extends Endpoint {
  Future<MoviesById> addMovieId(Session session, MoviesById movieId) async {
    if (movieId.id == null) {
      throw Exception('No id found');
    }
    final newMovieId = await MoviesById.db.insertRow(session, movieId);
    return newMovieId;
  }

  Future<List<MoviesById>> getAllMovieIds(Session session) async {
    final allMovieIds = await MoviesById.db.find(session);
    return allMovieIds;
  }

  Future<MoviesById> updateMovieId(Session session, MoviesById movieId) async {
    if (movieId.id == null) {
      throw Exception('No id found');
    }
    final updateMovieId = await MoviesById.db.updateRow(session, movieId);

    return updateMovieId;
  }

  Future<MoviesById> deleteMovieId(Session session, MoviesById movieId) async {
    if (movieId.id == null) {
      throw Exception('No id found');
    }
    final deleteMovieId = await MoviesById.db.deleteRow(session, movieId);

    return deleteMovieId;
  }
}
