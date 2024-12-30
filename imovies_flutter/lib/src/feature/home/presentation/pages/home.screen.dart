// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/core/shared/presentation/providers/sharedProviders.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/customContainer/customContainer.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/glassmorphicBackground/glassmorphicBackground.dart';
import 'package:imovies_flutter/src/core/widgets/Custom_draggable_bottom_modal_sheet/draggable_bottom_sheet.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_bottom_modal_sheet/custom_bottom_sheet.widget.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:imovies_flutter/src/feature/home/presentation/Widgets/searchMovie/searchMovie.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';
import '../../../../core/shared/presentation/reuasable widgets/MovieInfoHeader/movieInfoHeader.dart';
import '../Widgets/homePageCarousel/homePageCarousel.widget.dart';
import '../Widgets/watchTrailer/watchTrailer.widget.dart';

class HomeNew extends ConsumerWidget {
  const HomeNew({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageStorageBucket bucket = PageStorageBucket();
    final _movies = ref.watch(movieProvider);
    final _currentMovieIndex = ref.watch(homeMovieIndexProvider);
    final isNotified = ref.watch(onNotifyProvider);

    return Scaffold(
        backgroundColor: Colors.black,
        body: _movies.when(
          data: (movies) {
            final selectedMovie =
                movies.isNotEmpty ? movies[_currentMovieIndex!] : null;

            return Stack(
              children: [
                CachedNetworkImage(
                  key: Key('$imageURL${movies[_currentMovieIndex!].poster}'),
                  cacheKey: '$imageURL${movies[_currentMovieIndex].poster}',
                  imageUrl: '$imageURL${movies[_currentMovieIndex].poster}',
                  imageBuilder: (context, image) => Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(90.r),
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ).animate().fadeIn(duration: 800.ms, begin: 0.5),
                  placeholder: (context, url) => Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      // borderRadius: BorderRadius.circular(90.r),
                    ),
                    child: Transform.scale(
                      scale: 1.3,
                      child: const Center(
                          child: CupertinoActivityIndicator(color: Colors.red)),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    // height: 240.h,
                    // width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                  ),
                ),
                GlassMorphicBackground(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 79.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0).r,
                          child: MovieInfoHeader(
                              selectedMovie: selectedMovie,
                              isNotified: isNotified),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        HomePageCarousel(
                          bucket: bucket,
                          movies: movies,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 292.w,
                    top: 95.h,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0).r,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            SearchMoviesScreen()
                                                .animate()
                                                .fadeIn());
                                  },
                                  child: Icon(
                                    Icons.search,
                                    size: 25.r,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 15.w),
                                GestureDetector(
                                  onTap: () {
                                    ref.watch(onNotifyProvider.notifier).state =
                                        !isNotified;
                                  },
                                  child: Icon(
                                    isNotified
                                        ? EvaIcons.bell
                                        : EvaIcons.bellOutline,
                                    color: Colors.white,
                                    size: 25.r,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          WatchTrailer(currentMovieIndex: _currentMovieIndex),
                        ],
                      ),
                    )),
              ],
            );
          },
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => Center(
            child: Transform.scale(
              scale: 1.3,
              child: CupertinoActivityIndicator(color: Colors.red),
            ),
          ),
        ));
  }
}
