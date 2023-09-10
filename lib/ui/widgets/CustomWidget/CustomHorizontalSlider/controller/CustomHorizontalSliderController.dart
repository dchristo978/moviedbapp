import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/core/app/strings.dart';
import 'package:moviedbapp/core/utils/FToast.dart';
import 'package:moviedbapp/features/List/screen/ListMovies.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/Apis.dart';

class CustomHorizontalSliderController extends GetxController {
  final String tag;
  final bool? isGenre;
  final String title;

  CustomHorizontalSliderController(this.tag, this.isGenre, this.title);

  RxBool isLoading = false.obs;
  var page = 0.obs;
  var totalPage = 0.obs;
  var listMovies = <Movie>[].obs;
  ScrollController scrollController = ScrollController();
  ScrollController stagScrollController = ScrollController();
  bool isToastExist = false;

  var logger = Logger();

  @override
  void onInit() {
    listMovies.value = [];
    scrollController = ScrollController()..addListener(_scrollListener);
    stagScrollController = ScrollController()
      ..addListener(_stagScrollController);

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    stagScrollController.removeListener(_stagScrollController);
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    if (!isGenre!) {
      getMovieList();
    } else {
      populateListFromExistedData();
      getMovieListByGenre(genreId: tag.toString());
    }
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

  void addItemsIntoListMovie(List<Movie> data) {
    data.removeWhere((element) => element.checkIfAnyIsNull());
    listMovies.value.addAll(data);
    update();

    listMovies.refresh();

    if (EasyLoading.isShow) EasyLoading.dismiss();
  }

  void _scrollListener() async {
    if (scrollController.position.extentAfter < 300 && !isToastExist) {
      isToastExist = true;
      FToast().informationToast('Tap \'See All\' to view more of this');
      await Future.delayed(const Duration(seconds: 5)).then((_) {
        isToastExist = false;
      });
    }
  }

  void _stagScrollController() async {
    if (stagScrollController.position.extentAfter < 300 && !isLoading.value) {
      EasyLoading.show();
      if (!isGenre!) {
        getMovieList();
      } else {
        getMovieListByGenre(genreId: tag.toString());
      }
    }
  }

  Future<void> getMovieList() async {
    setLoading(true);

    MovieWrapper? response = await Apis()
        .fetchMovies(typeParam: getUrlTagFromType(tag), page: page.value + 1);

    if (response != null) {
      page.value = response.page!;
      totalPage.value = response.totalPages!;

      addItemsIntoListMovie(response.results as List<Movie>);
    }

    setLoading(false);
  }

  Future<void> getMovieListByGenre({String? genreId}) async {
    setLoading(true);

    MovieWrapper? response =
        await Apis().fetchMoviesByGenre(page: page.value + 1, genre: tag);

    if (response != null) {
      page.value = response.page!;
      totalPage.value = response.totalPages!;
      addItemsIntoListMovie(response.results as List<Movie>);
    }

    setLoading(false);
  }

  Future<void> populateListFromExistedData() async {
    List<Movie> tempListMovies = <Movie>[];
    setLoading(true);

    List<CustomHorizontalSliderController> listController =
        <CustomHorizontalSliderController>[];

    CustomHorizontalSliderController popularController =
        Get.find(tag: AppStrings.popularTag);
    listController.add(popularController);

    CustomHorizontalSliderController topRatedController =
        Get.find(tag: AppStrings.topRatedTag);
    listController.add(topRatedController);

    CustomHorizontalSliderController upcomingController =
        Get.find(tag: AppStrings.upcomingTag);
    listController.add(upcomingController);

    CustomHorizontalSliderController nowPlayingController =
        Get.find(tag: AppStrings.nowPlayingTag);
    listController.add(nowPlayingController);

    for (var controller in listController) {
      // Looped for every Controller
      for (var movie in controller.listMovies.value) {
        // Looped for every Movie in each controller
        movie.genreIds?.forEach((genreId) {
          // Looped of every Genre ID exist in each Movie
          if (genreId.toString() == tag) {
            // Check if Genre ID is Equal Controller Tag
            bool alreadyExist = false;
            for (var savedMovie in tempListMovies) {
              // Looped for every temporary saved list of movies for this controller
              if (savedMovie.id == movie.id) {
                alreadyExist = true;
                break;
              }
            }
            if (!alreadyExist) {
              tempListMovies.add(movie);
            }
          }
        });
      }
    }

    addItemsIntoListMovie(tempListMovies);

    setLoading(false);
  }

  void navigateToSeeAll() {
    Get.to(() => ListMovies(
          type: tag,
          title: title,
        ));
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
