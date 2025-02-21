// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/core/shared/presentation/reuasable%20widgets/customContainer/customContainer.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/individualMovieProviders.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';

import 'package:imovies_flutter/src/feature/movieCategories/presentation/providers/individualMovieProviders.dart';

class WatchProviders extends ConsumerWidget {
  const WatchProviders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchProvider = ref.watch(movieWatchProvider);

    return watchProvider.when(
      data: (watchProviders) {
        print('this is sjxsxjn ${watchProviders.length}');
        return watchProviders.isEmpty
            ? SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Watch Providers',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: watchProviders.length,
                        itemBuilder: (BuildContext context, int index) {
                          final watchProvider = watchProviders[index];

                          return watchProvider.backDropPaths == null
                              ? SizedBox(height: 0, width: 0)
                              : CachedNetworkImage(
                                  imageUrl:
                                      '$imageURL${watchProvider.backDropPaths}',
                                  imageBuilder: (context, image) => Container(
                                    margin: EdgeInsets.only(right: 15).r,
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14).r,
                                      image: DecorationImage(
                                        image: image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => Container(
                                    margin: EdgeInsets.only(right: 15).r,
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14).r,
                                      color: Colors.black54,
                                    ),
                                    child: Transform.scale(
                                      scale: 1.3,
                                      child: Center(
                                          child: CupertinoActivityIndicator(
                                              color: Colors.white
                                                  .withOpacity(0.8))),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    margin: EdgeInsets.only(right: 15).r,
                                    height: 50.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14).r,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                        }),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              );
      },
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => Center(
        child: Transform.scale(
          scale: 1.3,
          child:
              CupertinoActivityIndicator(color: Colors.white.withOpacity(0.8)),
        ),
      ),
    );
  }
}
