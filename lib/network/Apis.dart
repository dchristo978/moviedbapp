import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/models/genre.dart';
import 'package:moviedbapp/network/index.dart';

class Apis {
  static Apis? _instance;

  Apis._();

  factory Apis() => _instance ?? Apis._();

  final logger = Logger();

  // Future<List<User>> fetchUsers() async {
  //   var response = await Api().dio.get('/users');
  //
  //   List<User> listUser;
  //
  //   var temp = response.data as List;
  //   listUser = temp.map((item) => User.fromJson(item)).toList();
  //
  //   return listUser;
  // }

  Future <List<Genre>> fetchGenre() async {
    Response response = await Api().dio.get(Url.genre);

    List<Genre> listGenre;

    var temp = response.data as List;
    listGenre = temp.map((item) => Genre.fromJson(item)).toList();

    return listGenre;
  }

}
