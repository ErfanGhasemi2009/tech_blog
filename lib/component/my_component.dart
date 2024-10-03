import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/dimens.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/controller/article_controllers/manage_article_controller.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final dynamic size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.2,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class TagItemHomeScreen extends StatelessWidget {
  const TagItemHomeScreen({
    super.key,
    required this.titleItem,
  });

  final String titleItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, left: 16),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Row(
        children: [
          Assets.icons.hashtagicon.image(width: 16, height: 16),
          const SizedBox(
            width: 8,
          ),
          Text(
            titleItem,
            style: Theme.of(context).textTheme.displayMedium,
          )
        ],
      ),
    );
  }
}

Future<void> myLaunchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      log("Failed to launch $url: $e");
    }
  } else {
    log("Could not launch ${uri.toString()}");
  }
}

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(
      color: SolidColors.primaryColor,
      size: 32,
    );
  }
}

AppBar appbar(BuildContext context, String title) {
  return AppBar(
    elevation: 3,
    backgroundColor: SolidColors.scaffoldBg,
    surfaceTintColor: SolidColors.scaffoldBg,
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 20),
        ),
      )
    ],
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: SolidColors.primaryColor),
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
      ),
    ),
  );
}
// ignore: must_be_immutable
class Cats extends StatelessWidget {
  Cats(
      {super.key,
      required this.homeScreenController,
      required this.manageArticleController,
      required this.textTheme});

  final HomeScreenController homeScreenController;
  final ManageArticleController manageArticleController;
  TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 1.7,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeScreenController.tagList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () async {
              manageArticleController.articleInfoModel.update((val) {
                val?.catName = homeScreenController.tagList[index].title!;
                val?.catId = homeScreenController.tagList[index].id!;
              });
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(left: Dimens.small),
              child: Container(
                height: Dimens.large - 2,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: SolidColors.primaryColor),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        Dimens.small, Dimens.small, Dimens.small, Dimens.small),
                    child: Center(
                      child: Text(
                        homeScreenController.tagList[index].title!,
                        style: textTheme.headlineMedium,
                      ),
                    )),
              ),
            ),
          );
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }
}