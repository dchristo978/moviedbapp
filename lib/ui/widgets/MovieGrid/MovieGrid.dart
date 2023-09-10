import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/features/detail/controller/DetailController.dart';
import 'package:moviedbapp/features/detail/screen/DetailScreen.dart';
import 'package:moviedbapp/network/url.dart';

class MovieGrid extends StatelessWidget {
  final String posterPath;
  final String movieId;

  const MovieGrid({
    Key? key,
    required this.posterPath,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 2,
      child: InkWell(
        onTap: () => _onTap(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            Url.basePosterUrl + posterPath,
            height: 300,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    DetailController controller = Get.find();

    controller.navigateToDetailScreen(movieId);
  }
}
