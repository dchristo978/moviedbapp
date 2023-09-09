import 'package:get/get.dart';
import 'package:moviedbapp/core/app/strings.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/CustomHorizontalSlider/controller/CustomHorizontalSliderController.dart';

class HomeController extends GetxController {
  CustomHorizontalSliderController popularController = Get.put(
    CustomHorizontalSliderController(AppStrings.popularTag),
    tag: AppStrings.popularTag,
  );

  CustomHorizontalSliderController nowPlayingController = Get.put(
    CustomHorizontalSliderController(AppStrings.nowPlayingTag),
    tag: AppStrings.nowPlayingTag,
  );

  CustomHorizontalSliderController topRatedController = Get.put(
    CustomHorizontalSliderController(AppStrings.topRatedTag),
    tag: AppStrings.topRatedTag,
  );

  CustomHorizontalSliderController upcomingController = Get.put(
    CustomHorizontalSliderController(AppStrings.upcomingTag),
    tag: AppStrings.upcomingTag,
  );
}
