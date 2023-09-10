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
      child: SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: ColorIndex.primary,
            body: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  const CustomHorizontalSlider(
                    type: AppStrings.nowPlayingTag,
                    title: AppStrings.nowPlayingTag,
                    isGenre: false,
                  ),
                  const CustomHorizontalSlider(
                    type: AppStrings.upcomingTag,
                    title: AppStrings.upcomingTag,
                    isGenre: false,
                  ),
                  const CustomHorizontalSlider(
                    type: AppStrings.popularTag,
                    title: AppStrings.popularTag,
                    isGenre: false,
                  ),
                  const CustomHorizontalSlider(
                    type: AppStrings.topRatedTag,
                    title: AppStrings.topRatedTag,
                    isGenre: false,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(
                    () => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.listGenreLength.value,
                      itemBuilder: (_, index) {
                        return CustomHorizontalSlider(
                          type:
                              controller.listGenre.value[index].id!.toString(),
                          title: controller.listGenre.value[index].name!,
                          isGenre: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
