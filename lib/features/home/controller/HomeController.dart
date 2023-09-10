import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/app/strings.dart';
import 'package:moviedbapp/features/splash/controller/SplashController.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/Apis.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/CustomHorizontalSlider/controller/CustomHorizontalSliderController.dart';

class HomeController extends GetxController {
  CustomHorizontalSliderController popularController = Get.put(
    CustomHorizontalSliderController(AppStrings.popularTag, false),
    tag: AppStrings.popularTag,
  );

  CustomHorizontalSliderController nowPlayingController = Get.put(
    CustomHorizontalSliderController(AppStrings.nowPlayingTag, false),
    tag: AppStrings.nowPlayingTag,
  );

  CustomHorizontalSliderController topRatedController = Get.put(
    CustomHorizontalSliderController(AppStrings.topRatedTag, false),
    tag: AppStrings.topRatedTag,
  );

  CustomHorizontalSliderController upcomingController = Get.put(
    CustomHorizontalSliderController(AppStrings.upcomingTag, false),
    tag: AppStrings.upcomingTag,
  );

  SplashController splashController = Get.find();

  List<Genre> listGenre = <Genre>[];

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    isLoading.value = true;
    update();
    super.onInit();
  }

  @override
  void onReady() {
    listGenre = splashController.listGenre;
    isLoading.value = false;
    update();
    super.onReady();
  }
}
