import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/features/home/screen/HomeScreen.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/Apis.dart';
import 'package:moviedbapp/ui/widgets/CustomWidget/CustomHorizontalSlider/controller/CustomHorizontalSliderController.dart';

class SplashController extends GetxController {
  var logger = Logger();

  List<Genre> listGenre = <Genre>[];
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    listGenre = [];
  }

  @override
  void onReady() async {
    super.onReady();

    getGenreList();
  }

  void setLoading(bool loading) {
    if (loading) {
      isLoading.value = true;
      update();
    } else {
      isLoading.value = false;
      update();
    }
  }

  Future<void> getGenreList() async {
    listGenre = [];

    setLoading(true);

    List<Genre>? response = await Apis().fetchGenre();

    if (response != null) {
      listGenre.addAll(response);
      await createGenresController(response);
      update();

      await Future.delayed(const Duration(seconds: 2));
      Get.to(HomeScreen());
    }

    setLoading(false);
  }

  Future<void> createGenresController(List<Genre> genres) async {
    for (var genre in genres) {
      Get.lazyPut(
        () => CustomHorizontalSliderController(
            genre.id!.toString(), true, genre.name!),
        tag: genre.id!.toString(),
      );
    }
  }
}
