import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/screens/home_screen.dart';
import 'package:tech_blog/services/dio_services.dart';
import 'package:tech_blog/theme/app_theme.dart';

void main() {
  DioService().getServerResponse(ApiConstant.getHomeItems);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppThemes.lightTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa'), // farsi
        ],
        home: const HomeScreen());
  }
}
