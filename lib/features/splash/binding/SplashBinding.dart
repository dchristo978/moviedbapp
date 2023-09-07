import 'package:get/get.dart';
import 'package:moviedbapp/features/splash/controller/SplashController.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
