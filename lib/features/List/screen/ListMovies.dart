import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/ui/widgets/BaseText.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/CustomHorizontalSlider/controller/CustomHorizontalSliderController.dart';

class ListMovies extends StatelessWidget {
  const ListMovies({
    Key? key,
    required this.type,
    required this.title,
  }) : super(key: key);

  final String type;
  final String title;

  @override
  Widget build(BuildContext context) {
    CustomHorizontalSliderController controller = Get.find(tag: type);

    return Container(
      color: ColorIndex.primary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: BaseText(
              text: '$title Movies',
            ),
          ),
          body: Center(
            child: BaseText(
              text: 'List of Movies',
            ),
          ),
        ),
      ),
    );
  }
}
