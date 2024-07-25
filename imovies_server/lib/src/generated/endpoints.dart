/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/movies_by_Id_endpoint.dart' as _i3;
import 'package:imovies_server/src/generated/movies_by_Id.dart' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'movieId': _i3.MovieIdEndpoint()
        ..initialize(
          server,
          'movieId',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            name: params['name'],
          ),
        )
      },
    );
    connectors['movieId'] = _i1.EndpointConnector(
      name: 'movieId',
      endpoint: endpoints['movieId']!,
      methodConnectors: {
        'addMovieId': _i1.MethodConnector(
          name: 'addMovieId',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<_i4.MoviesById>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movieId'] as _i3.MovieIdEndpoint).addMovieId(
            session,
            params['movieId'],
          ),
        ),
        'getAllMovieIds': _i1.MethodConnector(
          name: 'getAllMovieIds',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movieId'] as _i3.MovieIdEndpoint)
                  .getAllMovieIds(session),
        ),
        'updateMovieId': _i1.MethodConnector(
          name: 'updateMovieId',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<_i4.MoviesById>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movieId'] as _i3.MovieIdEndpoint).updateMovieId(
            session,
            params['movieId'],
          ),
        ),
        'deleteMovieId': _i1.MethodConnector(
          name: 'deleteMovieId',
          params: {
            'movieId': _i1.ParameterDescription(
              name: 'movieId',
              type: _i1.getType<_i4.MoviesById>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['movieId'] as _i3.MovieIdEndpoint).deleteMovieId(
            session,
            params['movieId'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
