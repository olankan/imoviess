import 'package:flutter/material.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/core/widgets/custom_text_field/custom_text_field.widget.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';

class SearchMoviesScreen extends ConsumerWidget {
  const SearchMoviesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedMovieRef = ref.watch(searchedMovieProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GlassmorphicContainer(
        width: double.infinity,
        height: ScreenUtil().screenHeight,
        borderRadius: 0,
        linearGradient:
            LinearGradient(colors: [Colors.transparent, Colors.transparent]),
        border: 0,
        blur: 5,
        borderGradient:
            LinearGradient(colors: [Colors.transparent, Colors.transparent]),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: CustomTextFormField.search(
                  onChanged: (value) {
                    ref.read(movieTitleProvider.notifier).state = value!;
                  },
                  fillColor: Colors.white,
                  width: 400.w,
                  hintText: 'Search Movie',
                ),
              ),
              20.verticalSpace,
              searchedMovieRef.when(
                data: (movies) {
                  return movies.isEmpty
                      ? SizedBox()
                      : SizedBox(
                          height: ScreenUtil().screenHeight - 150.h,
                          width: 400.w,
                          child: ListView.builder(
                            itemCount: movies.length,
                            itemBuilder: (BuildContext context, int index) {
                              final movie = movies[index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      ref
                                          .watch(movieIDProvider.notifier)
                                          .state = movie.movieID;
                                      context.push('/description');
                                    },
                                    child: Row(children: [
                                      movie.poster == null
                                          ? Container(
                                              height: 150.h,
                                              width: 130.w,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(15.r),
                                              ),
                                              child: Center(
                                                  child: Icon(
                                                      Icons
                                                          .image_not_supported_outlined,
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                      size: 50)),
                                            ).animate().fadeIn(
                                              begin: 0.5,
                                              duration: 1000.ms,
                                              curve: Curves.easeInOutCubic)
                                          : CachedNetworkImage(
                                              imageUrl:
                                                  '$imageURL${movie.poster}',
                                              imageBuilder: (context, image) =>
                                                  Container(
                                                height: 150.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                  image: DecorationImage(
                                                    image: image,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  Container(
                                                height: 150.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                ),
                                                child: Transform.scale(
                                                  scale: 1.3,
                                                  child: const Center(
                                                      child:
                                                          CupertinoActivityIndicator(
                                                              color:
                                                                  Colors.red)),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Container(
                                                height: 150.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                ),
                                              ),
                                            ).animate().fadeIn(
                                              begin: 0.5,
                                              duration: 1000.ms,
                                              curve: Curves.easeInOutCubic),
                                      15.horizontalSpace,
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 5).r,
                                        child: Column(
                                          children: [
                                            10.horizontalSpace,
                                            SizedBox(
                                              height: 150.h,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  5.verticalSpace,
                                                  SizedBox(
                                                    width: 230.w,
                                                    height: 22.h,
                                                    child: Text(
                                                      movie.title,
                                                      softWrap: true,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          height: 0.8,
                                                          fontSize: 20.sp,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  6.verticalSpace,
                                                  SizedBox(
                                                    width: 230.w,
                                                    child: Text(
                                                      movie.overview,
                                                      maxLines: 4,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  7.verticalSpace,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(Icons.star,
                                                                  color: Colors
                                                                      .yellow,
                                                                  size: 18.r)
                                                              .animate()
                                                              .fadeIn(
                                                                  begin: 0.5,
                                                                  duration:
                                                                      1000.ms,
                                                                  curve: Curves
                                                                      .easeInOutCubic),
                                                          Text(
                                                            '${movie.rating.toStringAsFixed(1)}/10',

                                                            // textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  fontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14.sp,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '...See more',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                  20.verticalSpace,
                                ],
                              );
                            },
                          ),
                        );
                },
                error: (error, stackTrace) => Text('Error: $error'),
                loading: () => Center(
                  child: Transform.scale(
                    scale: 1.3,
                    child: SizedBox(
                      height: 160.h,
                      child: CupertinoActivityIndicator(
                          color: Colors.white.withOpacity(0.8)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// CustomContainer(
    //   height: ScreenUtil().screenHeight,
    //   width: double.infinity,
    //   backgroundColor: Colors.black.withOpacity(0.5),
    // );