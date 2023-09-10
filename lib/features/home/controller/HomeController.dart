import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/core/app/strings.dart';
import 'package:moviedbapp/features/splash/controller/SplashController.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/Apis.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/CustomHorizontalSlider/controller/CustomHorizontalSliderController.dart';

class HomeController extends GetxController {
  CustomHorizontalSliderController popularController = Get.put(
    CustomHorizontalSliderController(
        AppStrings.popularTag, false, AppStrings.popularTag),
    tag: AppStrings.popularTag,
  );

  CustomHorizontalSliderController nowPlayingController = Get.put(
    CustomHorizontalSliderController(
        AppStrings.nowPlayingTag, false, AppStrings.nowPlayingTag),
    tag: AppStrings.nowPlayingTag,
  );

  CustomHorizontalSliderController topRatedController = Get.put(
    CustomHorizontalSliderController(
        AppStrings.topRatedTag, false, AppStrings.topRatedTag),
    tag: AppStrings.topRatedTag,
  );

  CustomHorizontalSliderController upcomingController = Get.put(
    CustomHorizontalSliderController(
        AppStrings.upcomingTag, false, AppStrings.upcomingTag),
    tag: AppStrings.upcomingTag,
  );

  ScrollController scrollController = ScrollController();

  SplashController splashController = Get.find();

  var listGenre = <Genre>[].obs;
  RxBool isLoading = false.obs;
  var logger = Logger();

  var listGenreLength = 0.obs;

  @override
  void onInit() {
    isLoading.value = true;
    update();

    scrollController = ScrollController()..addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onReady() {
    listGenreLength.value = 3;
    listGenre.value = splashController.listGenre.sublist(0, 3);
    isLoading.value = false;
    update();
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    super.onClose();
  }

  void _scrollListener() async {
    if (scrollController.position.extentAfter < 300 &&
        !isLoading.value &&
        listGenreLength.value < splashController.listGenre.length) {
      EasyLoading.show();
      isLoading.value = true;
      update();

      await Future.delayed(const Duration(milliseconds: 1500)).then((value) {
        int currentIndex = listGenreLength.value;
        int nextIndex =
            listGenreLength.value + 3 <= splashController.listGenre.length
                ? listGenreLength.value + 3
                : splashController.listGenre.length;

        listGenre.value.addAll(
            splashController.listGenre.sublist(currentIndex, nextIndex));

        listGenreLength.value = nextIndex;
        update();
      });

      isLoading.value = false;
      update();
      EasyLoading.dismiss();
    }
  }
}
