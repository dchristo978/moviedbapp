import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/features/detail/controller/DetailController.dart';

class DetailScreen extends StatelessWidget {
  final String movieId;

  const DetailScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.find();

    return Scaffold();
  }
}
