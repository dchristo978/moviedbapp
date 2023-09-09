import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/app/strings.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/features/home/controller/HomeController.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/CustomHorizontalSlider/index.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorIndex.primary,
      child: const SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: ColorIndex.primary,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomHorizontalSlider(type: AppStrings.nowPlayingTag),
                  CustomHorizontalSlider(type: AppStrings.upcomingTag),
                  CustomHorizontalSlider(type: AppStrings.popularTag),
                  CustomHorizontalSlider(type: AppStrings.topRatedTag),
                ],
              ),
            ),
          )),
    );
  }
}
