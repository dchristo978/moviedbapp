import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/features/detail/controller/DetailController.dart';
import 'package:moviedbapp/features/reviewDetail/screen/ReviewDetail.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/index.dart';
import 'package:moviedbapp/ui/widgets/index.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.find();

    return Container(
      color: ColorIndex.primary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: ColorIndex.primary,
          appBar: AppBar(
            title: Obx(() => controller.isScreenLoading.value
                ? const BaseText(
                    text: 'Loading...',
                  )
                : BaseText(text: controller.movieDetail.value.title!)),
          ),
          body: Obx(
            () => controller.isScreenLoading.value
                ? const Center(
                    child: CupertinoActivityIndicator(
                      color: ColorIndex.primaryText,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Obx(
                          () => controller.isTrailerExist.value
                              ? YoutubePlayer(
                                  controller:
                                      controller.trailerController.value,
                                  showVideoProgressIndicator: true,
                                )
                              : Image.network(
                                  Url.baseBackdropUrl +
                                      controller
                                          .movieDetail.value.backdropPath!,
                                ),
                        ),
                        // Detail
                        Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BaseText(
                                          text: controller
                                              .movieDetail.value.title!,
                                          fontSize: 36,
                                          paddings: const EdgeInsets.only(
                                              left: 16, top: 20),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 16, top: 8),
                                              child: RatingBar.builder(
                                                initialRating: (controller
                                                        .movieDetail
                                                        .value
                                                        .voteAverage! /
                                                    2),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                itemSize: 20,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                ignoreGestures: true,
                                                onRatingUpdate:
                                                    (double value) {},
                                              ),
                                            ),
                                            BaseText(
                                              text: controller
                                                  .movieDetail.value.voteAverage
                                                  .toString(),
                                              fontSize: 14,
                                              paddings: const EdgeInsets.only(
                                                  left: 16, top: 8),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 6,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          right: 16, top: 20),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                        Color>(
                                                    ColorIndex.secondary)),
                                        onPressed: () =>
                                            controller.nextTrailer(),
                                        child: const BaseText(
                                          text: 'Next Trailer',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                height: 62,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller
                                        .movieDetail.value.genres!.length,
                                    separatorBuilder: (_, __) {
                                      return const SizedBox(
                                        width: 16,
                                      );
                                    },
                                    itemBuilder: (_, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: ColorIndex.mateYellow),
                                        ),
                                        child: BaseText(
                                          paddings: const EdgeInsets.all(5),
                                          text: controller.movieDetail.value
                                              .genres![index].name!,
                                          textColor: ColorIndex.mateYellow,
                                        ),
                                      );
                                    }),
                              ),
                              BaseText(
                                paddings:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                text: controller.movieDetail.value.overview!,
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 0),
                                child: const Divider(
                                  height: 3,
                                  color: ColorIndex.primaryText,
                                ),
                              ),
                              controller.reviewWrapper.value.review!.isNotEmpty
                                  ? Container(
                                      child: Column(
                                        children: [
                                          const BaseText(
                                              text: 'What People Says?',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 16),
                                            child: ListView.separated(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: controller
                                                    .reviewWrapper
                                                    .value
                                                    .review!
                                                    .length,
                                                separatorBuilder: (_, __) {
                                                  return const SizedBox(
                                                    height: 24,
                                                  );
                                                },
                                                itemBuilder: (_, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            child: BaseText(
                                                              paddings:
                                                                  const EdgeInsets
                                                                      .all(5),
                                                              text: controller
                                                                  .reviewWrapper
                                                                  .value
                                                                  .review![
                                                                      index]
                                                                  .author!,
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 16,
                                                                      top: 8),
                                                              child: RatingBar
                                                                  .builder(
                                                                initialRating: (controller
                                                                        .movieDetail
                                                                        .value
                                                                        .voteAverage! /
                                                                    2),
                                                                minRating: 1,
                                                                direction: Axis
                                                                    .horizontal,
                                                                itemSize: 20,
                                                                allowHalfRating:
                                                                    true,
                                                                itemCount: 5,
                                                                itemPadding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            4.0),
                                                                itemBuilder:
                                                                    (context,
                                                                            _) =>
                                                                        const Icon(
                                                                  Icons.star,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                                ignoreGestures:
                                                                    true,
                                                                onRatingUpdate:
                                                                    (double
                                                                        value) {},
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      wrapReviewContent(
                                                          movieDetail:
                                                              controller
                                                                  .movieDetail
                                                                  .value,
                                                          review: controller
                                                              .reviewWrapper
                                                              .value
                                                              .review![index])
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      child: const BaseText(
                                          text: 'No Reviews Yet'),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  InkWell wrapReviewContent(
      {required Review review, required MovieDetail movieDetail}) {
    var showedText = review.content;

    if (showedText!.length >= 255) {
      showedText = '${showedText.substring(0, 255)}....... \nSee More...';
    }

    return InkWell(
      onTap: () =>
          Get.to(() => ReviewDetail(review: review, movieDetail: movieDetail)),
      child: BaseText(
        paddings: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        text: showedText,
      ),
    );
  }
}
