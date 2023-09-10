import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/features/detail/controller/DetailController.dart';
import 'package:moviedbapp/features/detail/screen/DetailScreen.dart';
import 'package:moviedbapp/network/index.dart';
import 'package:moviedbapp/ui/widgets/BaseText.dart';

class ItemSlider extends StatelessWidget {
  const ItemSlider({
    Key? key,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.id,
    required this.releaseDate,
    this.popularity,
    this.voteAverage,
    this.voteCount,
  }) : super(key: key);

  final String title;
  final String backdropPath;
  final String posterPath;
  final String id;
  final String releaseDate;
  final double? popularity;
  final double? voteAverage;
  final Int? voteCount;

  @override
  Widget build(BuildContext context) {
    DetailController detailController = Get.find();

    return InkWell(
      onTap: () {
        detailController.navigateToDetailScreen(id);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              Url.basePosterUrl + posterPath,
              height: 300,
            ),
          ),
          BaseText(text: parseTitle(title)),
          RatingBar.builder(
            initialRating: (voteAverage! / 2),
            minRating: 1,
            direction: Axis.horizontal,
            itemSize: 20,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            ignoreGestures: true,
            onRatingUpdate: (double value) {},
          )
        ],
      ),
    );
  }

  String parseTitle(String title) {
    if (title.length > 21) {
      return '${title.substring(0, 18)}...';
    } else {
      return title;
    }
  }
}
