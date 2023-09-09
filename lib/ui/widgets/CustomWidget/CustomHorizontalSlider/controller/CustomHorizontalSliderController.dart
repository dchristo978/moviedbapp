import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/core/app/strings.dart';
import 'package:moviedbapp/core/utils/FToast.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/Apis.dart';

class CustomHorizontalSliderController extends GetxController {
  final String tag;

  CustomHorizontalSliderController(this.tag);

  RxBool isLoading = false.obs;

  var page = 0.obs;
  var totalPage = 0.obs;
  List<Movie> listMovies = <Movie>[];
  var logger = Logger();

  @override
  void onInit() {
    super.onInit();
    listMovies = [];
  }

  @override
  void onReady() {
    super.onReady();
    getMovieList();
  }

  void setLoading(bool loading) {
    if (loading) {
      isLoading.value = true;
      EasyLoading.show();
      update();
    } else {
      isLoading.value = false;
      EasyLoading.dismiss();
      update();
    }
  }

  Future<void> getMovieList() async {
    setLoading(true);

    MovieWrapper? response =
        await Apis().fetchMovies(getUrlTagFromType(tag), page.value + 1);

    if (response != null) {
      page.value = response.page!;
      totalPage.value = response.totalPages!;
      listMovies.addAll(response.results as Iterable<Movie>);
      update();
    }

    setLoading(false);
  }

  String getUrlTagFromType(String type) {
    switch (type) {
      case AppStrings.nowPlayingTag:
        return '/now_playing';
      case AppStrings.popularTag:
        return '/popular';
      case AppStrings.upcomingTag:
        return '/upcoming';
      case AppStrings.topRatedTag:
        return '/top_rated';
      default:
        return '';
    }
  }
}
