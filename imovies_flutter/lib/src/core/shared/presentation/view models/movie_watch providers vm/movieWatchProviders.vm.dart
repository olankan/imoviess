import "package:imovies_flutter/src/core/shared/domain/models/movie_watch%20providers%20model/movieWatchProviders.model.dart";
 
class MovieWatchProvidersVm {
  final Buy? watchProviders;
  MovieWatchProvidersVm({this.watchProviders});

String? get backDropPaths {
  // print('here is ${watchProviders!.logoPath}');
  return watchProviders!.logoPath;

}


  
}
