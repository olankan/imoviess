// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:imovies_flutter/src/core/components/constants.dart';
import 'package:imovies_flutter/src/feature/movieCategories/presentation/pages/movieCategories/movieCategories.export.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/pages/description.export.dart';
import 'package:imovies_flutter/src/feature/movie_description/presentation/widgets/Movie_credits/Movie%20Crew%20character%20Ui/movieCrewCharacter.dart';

class MovieCrewInfoUi extends ConsumerWidget {
  const MovieCrewInfoUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieCrewCredit = ref.watch(movieCrewCreditsProvider);
    return movieCrewCredit.when(
      data: (credits) {
        return credits.isEmpty
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  credits.isEmpty
                      ? const SizedBox()
                      : Text(
                          'Crew',
                          style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 172.h,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: credits.length,
                        itemBuilder: (BuildContext context, int index) {
                          final credit = credits[index];
                          return Row(
                            children: [
                              credit.crewPoster == null
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0)
                                          .r,
                                      child: Column(
                                        // mainAxisSize:
                                        //     MainAxisSize
                                        //         .min,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                Colors.black.withOpacity(0.5),
                                            radius: 30.r,
                                            child: Icon(
                                              Icons.person_off_rounded,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              size: 35.r,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120.w,
                                            child: Text(
                                              credit.crewName.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: fontFamily,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          CrewCharacter(credit: credit)
                                        ],
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0)
                                          .r,
                                      child: Column(
                                        // mainAxisSize:
                                        //     MainAxisSize
                                        //         .min,
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl:
                                                '$imageURL${credit.crewPoster}',
                                            imageBuilder: (context, image) =>
                                                CircleAvatar(
                                                    backgroundColor: Colors
                                                        .black
                                                        .withOpacity(0.5),
                                                    radius: 30.r,
                                                    backgroundImage: image),
                                            placeholder: (context, url) =>
                                                CircleAvatar(
                                              backgroundColor:
                                                  Colors.black.withOpacity(0.5),
                                              radius: 30.r,
                                              child: Transform.scale(
                                                scale: 1.3,
                                                child: Center(
                                                    child:
                                                        CupertinoActivityIndicator(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.8))),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    CircleAvatar(
                                              backgroundColor:
                                                  Colors.black.withOpacity(0.5),
                                              radius: 30.r,
                                              child: Text('Error: $error'),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 120.w,
                                            child: Text(
                                              credit.crewName.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: fontFamily,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          CrewCharacter(credit: credit),
                                        ],
                                      ),
                                    ),
                            ],
                          );
                        }),
                  ),
                ],
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
    );
  }
}
