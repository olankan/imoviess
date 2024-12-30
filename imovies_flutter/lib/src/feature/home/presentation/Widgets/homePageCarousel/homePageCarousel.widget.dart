import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/feature/home/presentation/provider/providers.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';
import '../../../../../core/shared/presentation/providers/sharedProviders.dart';
import '../../../../../core/shared/presentation/view models/movies vm/moviesVm.dart';

class HomePageCarousel extends ConsumerStatefulWidget {
  const HomePageCarousel({
    super.key,
    required this.movies,
    required this.bucket,
  });
  final PageStorageBucket bucket;
  final List<MoviesVm> movies;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomePageCarouselState();
}

class _HomePageCarouselState extends ConsumerState<HomePageCarousel> {
  // @override
  // void didPopNext() {
  //   // Called when returning to this widget
  //   ref.read(carouselMotionProvider.notifier).state = true;
  // }

  @override
  Widget build(BuildContext context) {
    final carouselMotionCondition = ref.watch(carouselMotionProvider);

    // final _previousMovieIndex = ref.watch(previousMovieIndex);
    final currentMovieIndex = ref.watch(movieIndexProvider);
    return SizedBox(
      height: 620.h,
      width: 390.w,
      child: PageStorage(
        bucket: widget.bucket,
        child: CarouselSlider.builder(
          itemCount: widget.movies.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            final selectedMovie = widget.movies[itemIndex];
            return Hero(
              tag: selectedMovie,
              child: GestureDetector(
                onTap: () {
                  ref.read(carouselMotionProvider.notifier).state = false;
                  ref.watch(heroTagProvider.notifier).state = selectedMovie;
                  ref.watch(onNavigateTo.notifier).state = 'discoveredMovies';
                  ref.watch(movieIDProvider.notifier).state =
                      selectedMovie.movieID;
                  ref.watch(movieIndexProvider.notifier).state = itemIndex;

                  debugPrint(selectedMovie.movieID.toString());
                  context.push('/description');
                },
                child: CachedNetworkImage(
                  imageUrl: '$imageURL${selectedMovie.poster}',
                  imageBuilder: (context, image) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90.r),
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: 620.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(90.r),
                    ),
                    child: Transform.scale(
                      scale: 1.3,
                      child: const Center(
                          child: CupertinoActivityIndicator(color: Colors.red)),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 620.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(90.r),
                    ),
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            pageViewKey: const PageStorageKey('home'),
            scrollDirection: Axis.horizontal,
            enableInfiniteScroll: true,
            autoPlay: carouselMotionCondition,
            pauseAutoPlayOnTouch: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            enlargeCenterPage: true,
            viewportFraction: 1,
            aspectRatio: 0.1,
            onPageChanged: (index, reason) {
              ref.watch(movieIndexProvider.notifier).state = index;
              ref.watch(previousMovieIndex.notifier).state = currentMovieIndex;
              ref.watch(homeMovieIndexProvider.notifier).state = index;
              // ref.watch(isChanged.notifier).state = !pageChanged;
              // print(pageChanged);
            },
          ),
        ),
      ),
    );
  }
}
