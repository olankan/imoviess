/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class MoviesById extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  MoviesById._({
    int? id,
    required this.title,
    required this.movieId,
    required this.userId,
  }) : super(id);

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

  static final t = MoviesByIdTable();

  static const db = MoviesByIdRepository._();

  String title;

  int movieId;

  int userId;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'movieId': movieId,
      'userId': userId,
    };
  }

  static MoviesByIdInclude include() {
    return MoviesByIdInclude._();
  }

  static MoviesByIdIncludeList includeList({
    _i1.WhereExpressionBuilder<MoviesByIdTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MoviesByIdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MoviesByIdTable>? orderByList,
    MoviesByIdInclude? include,
  }) {
    return MoviesByIdIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MoviesById.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MoviesById.t),
      include: include,
    );
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

class MoviesByIdTable extends _i1.Table {
  MoviesByIdTable({super.tableRelation}) : super(tableName: 'movies_by_id') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    movieId = _i1.ColumnInt(
      'movieId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnInt movieId;

  late final _i1.ColumnInt userId;

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        movieId,
        userId,
      ];
}

class MoviesByIdInclude extends _i1.IncludeObject {
  MoviesByIdInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => MoviesById.t;
}

class MoviesByIdIncludeList extends _i1.IncludeList {
  MoviesByIdIncludeList._({
    _i1.WhereExpressionBuilder<MoviesByIdTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MoviesById.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => MoviesById.t;
}

class MoviesByIdRepository {
  const MoviesByIdRepository._();

  Future<List<MoviesById>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoviesByIdTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MoviesByIdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MoviesByIdTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MoviesById>(
      where: where?.call(MoviesById.t),
      orderBy: orderBy?.call(MoviesById.t),
      orderByList: orderByList?.call(MoviesById.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<MoviesById?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoviesByIdTable>? where,
    int? offset,
    _i1.OrderByBuilder<MoviesByIdTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MoviesByIdTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MoviesById>(
      where: where?.call(MoviesById.t),
      orderBy: orderBy?.call(MoviesById.t),
      orderByList: orderByList?.call(MoviesById.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<MoviesById?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MoviesById>(
      id,
      transaction: transaction,
    );
  }

  Future<List<MoviesById>> insert(
    _i1.Session session,
    List<MoviesById> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MoviesById>(
      rows,
      transaction: transaction,
    );
  }

  Future<MoviesById> insertRow(
    _i1.Session session,
    MoviesById row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MoviesById>(
      row,
      transaction: transaction,
    );
  }

  Future<List<MoviesById>> update(
    _i1.Session session,
    List<MoviesById> rows, {
    _i1.ColumnSelections<MoviesByIdTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MoviesById>(
      rows,
      columns: columns?.call(MoviesById.t),
      transaction: transaction,
    );
  }

  Future<MoviesById> updateRow(
    _i1.Session session,
    MoviesById row, {
    _i1.ColumnSelections<MoviesByIdTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MoviesById>(
      row,
      columns: columns?.call(MoviesById.t),
      transaction: transaction,
    );
  }

  Future<List<MoviesById>> delete(
    _i1.Session session,
    List<MoviesById> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MoviesById>(
      rows,
      transaction: transaction,
    );
  }

  Future<MoviesById> deleteRow(
    _i1.Session session,
    MoviesById row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MoviesById>(
      row,
      transaction: transaction,
    );
  }

  Future<List<MoviesById>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MoviesByIdTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MoviesById>(
      where: where(MoviesById.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MoviesByIdTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MoviesById>(
      where: where?.call(MoviesById.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
