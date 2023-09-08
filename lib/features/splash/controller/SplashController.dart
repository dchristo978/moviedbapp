import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:moviedbapp/features/home/screen/HomeScreen.dart';
import 'package:moviedbapp/network/Apis.dart';

class SplashController extends GetxController{

  var logger = Logger();

  @override
  void onInit() async {
    // TODO: implement onInit
    await Future.delayed(const Duration(seconds: 2));
    Get.to(HomeScreen());
  }

}