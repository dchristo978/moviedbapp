import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
  final Float? popularity;
  final Float? voteAverage;
  final Int? voteCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Image.network(
              Url.basePosterUrl + posterPath,
              height: (Get.height / 4) - 100,
            ),
          ),
          BaseText(
            text: title,
            isOverflow: true,
          ),
        ],
      ),
    );
  }
}
