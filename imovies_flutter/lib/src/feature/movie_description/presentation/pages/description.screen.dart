// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/MovieInfoHeader/movieInfoHeader.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/customContainer/customContainer.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/glassmorphicBackground/glassmorphicBackground.dart';
import 'package:imovies_flutter/src/feature/home/presentation/provider/providers.dart';
import 'description.export.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final movieById = ref.watch(movieByIdProvider);
      final videoProvider = ref.watch(movieVideosProvider);
      // final currentMovieIndex = ref.watch(movieIndexProvider);
      final movieVmAsHeroTag = ref.watch(heroTagProvider);

      return movieById.when(
        data: (movie) {
          final selectedMovie = movie;
          print(
              '''PROVIDED MOVIE IS ${selectedMovie!.title} ${selectedMovie!.movieID}''');

          return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: '$imageURL${selectedMovie!.poster}',
                    imageBuilder: (context, image) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Transform.scale(
                        scale: 1.3,
                        child: Center(
                            child: CupertinoActivityIndicator(
                                color: Colors.white.withOpacity(0.8))),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  GlassMorphicBackground(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 450.h,
                          child: CachedNetworkImage(
                            imageUrl: '$imageURL${selectedMovie.poster}',
                            imageBuilder: (context, image) => Hero(
                              tag: movieVmAsHeroTag,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(90),
                                    bottomRight: Radius.circular(90),
                                  ),
                                  image: DecorationImage(
                                    image: image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              height: 400.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(90),
                                  bottomRight: Radius.circular(90),
                                ),
                                color: Colors.black54,
                              ),
                              child: Transform.scale(
                                scale: 1.3,
                                child: Center(
                                    child: CupertinoActivityIndicator(
                                        color: Colors.white.withOpacity(0.8))),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 400.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(90.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20.0).r,
                          child: SizedBox(
                            height: 450.h,
                            child: SingleChildScrollView(
                              child: selectedMovie.overview.isEmpty
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          selectedMovie.title,
                                          style: TextStyle(
                                            fontSize: 30.sp,
                                            fontFamily: fontFamily,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ).animate().fadeIn(
                                            begin: 0.5,
                                            duration: 500.ms,
                                            curve: Curves.easeInOut),
                                        150.verticalSpace,
                                        Align(
                                            alignment: Alignment.center,
                                            child: Text('No additional info')),
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MovieInfoHeader(
                                          selectedMovie: selectedMovie,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Divider(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Text(
                                          'About the movie',
                                          style: TextStyle(
                                            fontFamily: fontFamily,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          selectedMovie.overview,
                                          style: TextStyle(
                                            fontFamily: fontFamily,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        MovieReviewCard(),
                                        WatchProviders(),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        RecommendedMovies(),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        SimilarMovies()
                                      ],
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // WidgetsBinding.instance.addPostFrameCallback((_) {
                      ref.read(carouselMotionProvider.notifier).state = true;

                      context.pop();
                      // });
                      // ref.watch(onNavigateToMoviesByGenre.notifier).state =
                      //     !isNavigatedToMBG;
                      // print('Tapped');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0, left: 20.0).r,
                      child: GlassMorphicBackground(
                        height: 50.h,
                        width: 50.w,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20.r,
                            color: Colors.white,
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(
                            duration: 100.ms,
                            delay: 0.ms,
                          )
                          .slide(
                            duration: 200.ms,
                            delay: 100.ms,
                          ),
                    ),
                  ),
                  Positioned(
                    top: 190.h,
                    left: 180.w,
                    child: GestureDetector(
                      onTap: () {
                        //TODO create a boolean provide that says if watchTrailer is true, show dialog, we can then use that provider in the home screen where we have the watch trailer buttton, on clicking on it, it should take you first to the next screen then set watchTrailer provider to true so we can watch the trailer then...the aim of it is to be able to trigger the watch youtube func. from the home screen.
                        showDialog(
                          barrierColor: Colors.transparent,
                          useSafeArea: false,
                          context: context,
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 450.h,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.8),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(90).r,
                                        bottomRight: Radius.circular(90).r,
                                      )),
                                ),
                                YoutubeTrailerPlayer(),
                              ],
                            );
                          },
                        );
                        // context.go('/youtube');
                      },
                      child: videoProvider.value != null
                          ? (CustomContainer(
                                  key: GlobalKey(),
                                  width: 80.w,
                                  height: 50.h,
                                  backgroundColor: Colors.red,
                                  child: Center(
                                      child: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ))).animate().fadeIn(
                                duration: 200.ms,
                                delay: 0.ms,
                              ))
                          : SizedBox(),
                    ),
                  )
                ],
              ));
        },
        error: (Object error, StackTrace stackTrace) => Container(),
        loading: () => const CupertinoActivityIndicator(color: Colors.red),
      );
    });
  }
}
