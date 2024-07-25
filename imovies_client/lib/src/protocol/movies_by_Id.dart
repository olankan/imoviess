/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class MoviesById implements _i1.SerializableModel {
  MoviesById._({
    this.id,
    required this.title,
    required this.movieId,
    required this.userId,
  });

  factory MoviesById({
    int? id,
    required String title,
    required int movieId,
    required int userId,
  }) = _MoviesByIdImpl;

  factory MoviesById.fromJson(Map<String, dynamic> jsonSerialization) {
    return MoviesById(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      movieId: jsonSerialization['movieId'] as int,
      userId: jsonSerialization['userId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  int movieId;

  int userId;

  MoviesById copyWith({
    int? id,
    String? title,
    int? movieId,
    int? userId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'movieId': movieId,
      'userId': userId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MoviesByIdImpl extends MoviesById {
  _MoviesByIdImpl({
    int? id,
    required String title,
    required int movieId,
    required int userId,
  }) : super._(
          id: id,
          title: title,
          movieId: movieId,
          userId: userId,
        );

  @override
  MoviesById copyWith({
    Object? id = _Undefined,
    String? title,
    int? movieId,
    int? userId,
  }) {
    return MoviesById(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      movieId: movieId ?? this.movieId,
      userId: userId ?? this.userId,
    );
  }
}
