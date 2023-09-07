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
    // GetPage<HomeMovieScreen>(
    //   name: AppRoutes.HOME_MOVIE,
    //   page: () => const HomeMovieScreen(),
    //   transition: Transition.fadeIn,
    //   binding: HomeMovieBinding(),
    //   preventDuplicates: true,
    // ),
    // GetPage<HomeTvScreen>(
    //   name: AppRoutes.HOME_TV,
    //   page: () => const HomeTvScreen(),
    //   transition: Transition.fadeIn,
    //   binding: HomeTvBinding(),
    //   preventDuplicates: true,
    // ),
    // GetPage<DetailScreen>(
    //   name: AppRoutes.DETAIL,
    //   page: () => const DetailScreen(),
    //   transition: Transition.fadeIn,
    //   binding: DetailPageBinding(),
    //   preventDuplicates: true,
    // ),
  ];
}
