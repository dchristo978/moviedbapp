import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/ui/widgets/BaseText.dart';

class ReviewDetail extends StatelessWidget {
  final Review review;
  final MovieDetail movieDetail;

  const ReviewDetail(
      {Key? key, required this.review, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorIndex.primary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: ColorIndex.primary,
          appBar: AppBar(
            title: BaseText(text: '${review.author!} Said'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                BaseText(
                  text: movieDetail.title!,
                  fontSize: 42,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 16, top: 8),
                      child: RatingBar.builder(
                        initialRating: (movieDetail.voteAverage! / 2),
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemSize: 20,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        ignoreGestures: true,
                        onRatingUpdate: (double value) {},
                      ),
                    ),
                    BaseText(
                      text: movieDetail.voteAverage.toString(),
                      fontSize: 14,
                      paddings: const EdgeInsets.only(left: 16, top: 8),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Divider(
                    color: ColorIndex.primaryText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.person,
                        color: ColorIndex.primaryText,
                        size: 48,
                      ),
                      BaseText(text: review.author!),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 16, top: 8),
                        child: RatingBar.builder(
                          initialRating: (review.authorDetails!.rating! / 2),
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 20,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          ignoreGestures: true,
                          onRatingUpdate: (double value) {},
                        ),
                      ),
                      BaseText(
                        text: review.authorDetails!.rating.toString(),
                        fontSize: 14,
                        paddings: const EdgeInsets.only(left: 16, top: 8),
                      )
                    ],
                  ),
                ),
                BaseText(
                    text: review.content!,
                    paddings: EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
