import 'package:get/get.dart';
import 'package:moviedbapp/features/detail/screen/DetailScreen.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/Apis.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailController extends GetxController {
  RxString movieId = ''.obs;

  var movieDetail = MovieDetail().obs;
  var trailerKeys = TrailerKeys().obs;
  var reviewWrapper = ReviewWrapper().obs;

  RxBool isScreenLoading = false.obs;
  RxBool isLoading = false.obs;
  RxBool isTrailerExist = false.obs;
  RxString trailerKey = ''.obs;

  var trailerController = YoutubePlayerController(initialVideoId: '').obs;

  @override
  void onReady() {
    super.onReady();
  }

  void navigateToDetailScreen(String paramMovieId) {
    movieId.value = paramMovieId;
    isScreenLoading.value = true;

    update();
    Get.to(() => DetailScreen());
    getMovieDetails();
    getTrailerKeys();
    getMovieReviews();
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

  Future<void> getMovieDetails() async {
    setLoading(true);

    MovieDetail? response =
        await Apis().fetchMovieDetail(movieId: movieId.value);

    if (response != null) {
      movieDetail.value = response;

      update();
    }
    isScreenLoading.value = false;
    setLoading(false);
  }

  Future<void> getTrailerKeys() async {
    setLoading(true);

    TrailerKeys? response = await Apis().fetchMovieKey(movieId: movieId.value);

    if (response != null) {
      trailerKeys.value = response;
      update();

      findFirstYoutubeKey();
    }
    setLoading(false);
  }

  Future<void> getMovieReviews() async {
    setLoading(true);

    ReviewWrapper? response = await Apis().fetchReviews(movieId: movieId.value);

    if (response != null) {
      reviewWrapper.value = response;

      update();
    }
    isScreenLoading.value = false;
    setLoading(false);
  }

  void bindTrailerToController(String key) {
    trailerController.value = YoutubePlayerController(
      initialVideoId: key,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    update();
  }

  void findFirstYoutubeKey() {
    if (trailerKeys.value.results!.isNotEmpty) {
      for (var key in trailerKeys.value.results!) {
        if (key.site == 'YouTube') {
          isTrailerExist.value = true;
          trailerKey.value = key.key!;
          bindTrailerToController(key.key!);
          break;
        }
      }
    }
  }

  void nextTrailer() {}
}
