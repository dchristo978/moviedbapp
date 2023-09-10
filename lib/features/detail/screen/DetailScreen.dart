import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/features/detail/controller/DetailController.dart';
import 'package:moviedbapp/ui/widgets/index.dart';

class DetailScreen extends StatelessWidget {
  final String movieId;

  const DetailScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.find();

    return Container(
        color: ColorIndex.primary,
        child: SafeArea(
            bottom: false,
            child: Scaffold(
                appBar: AppBar(
                  title: BaseText(
                    text: ' Movies',
                  ),
                ),
                body: Container())));
  }
}
