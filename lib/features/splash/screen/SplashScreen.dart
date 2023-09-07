import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';

class SplashScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorIndex.primary,
        child: const Center(
          child: CupertinoActivityIndicator(
            radius: 20,
            color: ColorIndex.primaryText,
          ),
        ),
      ),
    );
  }
}