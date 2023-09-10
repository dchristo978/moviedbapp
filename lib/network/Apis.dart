import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/core/utils/FToast.dart';
import 'package:moviedbapp/models/genre.dart';
import 'package:moviedbapp/models/index.dart';
import 'package:moviedbapp/network/index.dart';

abstract class APIsRepository {
  Future<List<Genre>?> fetchGenre();

  Future<MovieWrapper?> fetchMovies(String typeParam, int page);
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
  Future<MovieWrapper?> fetchMovies(String typeParam, int page) async {
    try {
      String parsedUrl = Url.listMovies +
          typeParam +
          Url.languageENUS +
          Url.page +
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
}
