
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/core/utils/FToast.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/index.dart';

abstract class APIsRepository {
  Future<List<Genre>?> fetchGenre();

  Future<MovieWrapper?> fetchMovies(
      {required String typeParam, required int page});

  Future<MovieWrapper?> fetchMoviesByGenre(
      {required int page, required String genre});

  Future<MovieDetail?> fetchMovieDetail({required String movieId});

  Future<TrailerKeys?> fetchMovieKey({required String movieId});
}

class Apis implements APIsRepository {
  static Apis? _instance;

  Apis._();

  factory Apis() => _instance ?? Apis._();

  final logger = Logger();

  @override
  Future<List<Genre>?> fetchGenre() async {
    try {
      Response response = await Api().dio.get(Url.genre);

      List<Genre> listGenre;

      var temp = response.data['genres'] as List;
      listGenre = temp.map((item) => Genre.fromJson(item)).toList();

      return listGenre;
    } on DioException catch (e) {
      FToast().errorToast(e.message!);
      return null;
    } catch (e) {
      logger.e('Error in Fetch Genre ' + e.toString());
      return null;
    }
  }

  @override
  Future<MovieWrapper?> fetchMovies(
      {required String typeParam, required int page}) async {
    try {
      String parsedUrl = Url.listMovies +
          typeParam +
          Url.languageENUS +
          Url.pageQueryParam +
          page.toString();

      Response response = await Api().dio.get(parsedUrl);

      return MovieWrapper.fromJson(response.data);
    } on DioException catch (e) {
      FToast().errorToast(e.message!);
      return null;
    } catch (e) {
      logger.e('Error in Fetch Movies ' + e.toString());
      return null;
    }
  }

  @override
  Future<MovieWrapper?> fetchMoviesByGenre(
      {required int page, required String genre}) async {
    try {
      String parsedUrl = Url.discoverMovies +
          Url.languageENUS +
          Url.pageQueryParam +
          page.toString() +
          Url.genreQueryParam +
          genre;

      Response response = await Api().dio.get(parsedUrl);

      return MovieWrapper.fromJson(response.data);
    } on DioException catch (e) {
      FToast().errorToast(e.message!);
      return null;
    } catch (e) {
      logger.e('Error in Fetch Movies By Genre ' + e.toString());
      return null;
    }
  }

  @override
  Future<MovieDetail?> fetchMovieDetail({required String movieId}) async {
    try {
      String parsedUrl = '${Url.listMovies}/$movieId${Url.appendVideoParam}';

      Response response = await Api().dio.get(parsedUrl);

      return MovieDetail.fromJson(response.data);
    } on DioException catch (e) {
      FToast().errorToast(e.message!);
      return null;
    } catch (e) {
      logger.e('Error in Fetch Movie Detail ' + e.toString());
      return null;
    }
  }

  @override
  Future<TrailerKeys?> fetchMovieKey({required String movieId}) async {
    try {
      //http://api.themoviedb.org/3/movie/968051/videos
      String parsedUrl = '${Url.listMovies}/$movieId${Url.videos}';

      Response response = await Api().dio.get(parsedUrl);

      return TrailerKeys.fromJson(response.data);
    } on DioException catch (e) {
      FToast().errorToast(e.message!);
      return null;
    } catch (e) {
      logger.e('Error in Fetch Movie Trailer Keys ' + e.toString());
      return null;
    }
  }
}
