import 'package:get/get.dart';
import 'package:moviedbapp/features/splash/binding/SplashBinding.dart';
import 'package:moviedbapp/features/splash/index.dart';
import 'package:moviedbapp/routes/app_routes.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<SplashScreen>(
      name: AppRoutes.START,
      page: () => SplashScreen(),
      binding: SplashBinding(),
      preventDuplicates: true,
    ),
  ];
}
