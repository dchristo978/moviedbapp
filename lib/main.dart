import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moviedbapp/core/theme/ColorIndex.dart';
import 'package:moviedbapp/features/splash/index.dart';
import 'package:moviedbapp/routes/app_pages.dart';
import 'package:moviedbapp/routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorIndex.primary,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ColorIndex colorIndex = ColorIndex();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: ColorIndex.primary),
        primaryColor: ColorIndex.primary,
        disabledColor: ColorIndex.disabled,
      ),
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.START,
    );
  }
}
