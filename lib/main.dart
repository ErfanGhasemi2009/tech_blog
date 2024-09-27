import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/route_manager/binding.dart';
import 'package:tech_blog/route_manager/pages.dart';
import 'package:tech_blog/screens/splash_screen.dart';
import 'package:tech_blog/theme/app_theme.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: RegisterBinding(),
        title: 'Flutter Demo',
        theme: AppThemes.lightTheme,
        locale: const Locale('fa'),
        getPages: Pages.pages,
        home:  const SplashScreen());
  }
}
