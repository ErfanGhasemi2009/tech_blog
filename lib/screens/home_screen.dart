import 'package:flutter/material.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/screens/content_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SolidColors.surface,
        surfaceTintColor: SolidColors.surface,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.menu_rounded),
              Assets.images.logo.image(height: size.height / 13.6),
              const Icon(Icons.search),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ContentHomeScreen(size: size),
            
            // bottomNavigation app
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height / 8,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: GradientColors.bottomNavBackground,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Container(
                  height: size.height / 9,
                  margin: const EdgeInsets.only(right: 32, left: 32, bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: const LinearGradient(
                          colors: GradientColors.bottomNav)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Assets.icons.home
                              .image(color: SolidColors.lightIcon)),
                      IconButton(
                          onPressed: () {},
                          icon: Assets.icons.write
                              .image(color: SolidColors.lightIcon)),
                      IconButton(
                          onPressed: () {},
                          icon: Assets.icons.user
                              .image(color: SolidColors.lightIcon)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}