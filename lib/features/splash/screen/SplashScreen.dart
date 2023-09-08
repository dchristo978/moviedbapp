import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/features/splash/controller/SplashController.dart';
import 'package:moviedbapp/ui/widgets/BaseText.dart';

class SplashScreen extends StatelessWidget {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: ColorIndex.primary,
        child: const Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BaseText(text: 'Please Wait'),
            CupertinoActivityIndicator(
              radius: 20,
              color: ColorIndex.primaryText,
            ),
          ],
        ),
      ),
    );
  }
}
