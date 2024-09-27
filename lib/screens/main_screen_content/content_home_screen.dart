import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/my_component.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/controller/singel_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/screens/articles/article_list_screen.dart';

class ContentHomeScreen extends StatelessWidget {
  ContentHomeScreen({
    super.key,
    required this.size,
  });

  final Size size;
  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(0),
          child: homeScreenController.loading.value == false
              ? Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    //poster
                    posterHomeScreen(context),

                    const SizedBox(
                      height: 16,
                    ),
                    //tag list
                    tagsVisited(),

                    const SizedBox(
                      height: 12,
                    ),
                    //popular articles
                    GestureDetector(
                      onTap: () {
                        Get.to(ArticleListScreen(titleAppbar: 'مقالات جدید'));
                      },
                      child: TitleListHomeScreen(
                        title: MyStrings.viewHotestBlog,
                        icon: Assets.icons.bluePen.image(height: 16, width: 16),
                      ),
                    ),
                    //articles list
                    topVisited(),

                    const SizedBox(
                      height: 24,
                    ),
                    TitleListHomeScreen(
                        title: MyStrings.viewHotestPodCasts,
                        icon: Assets.icons.microphon
                            .image(height: 16, width: 16)),
                    const SizedBox(
                      height: 8,
                    ),
                    topPodcasts(),
                    const SizedBox(
                      height: 96,
                    )
                  ],
                )
              : const Center(
                  child: LoadingAnimation(),
                ),
        ),
      ),
    );
  }

  Widget topVisited() {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: SizedBox(
        height: size.height / 4.1,
        child: Obx(
          () => ListView.builder(
              itemCount: homeScreenController.topVisitedList.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    singleArticleController.getArticleInfo(
                        homeScreenController.topVisitedList[index].id);
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: size.width / 2.2,
                        height: size.height / 5.1,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider,
                                )),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                    colors: GradientColors.blogPost,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                            margin: const EdgeInsets.all(12),
                          ),
                          placeholder: ((context, url) =>
                              const LoadingAnimation()),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 32,
                            color: SolidColors.primaryColor,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        right: 8,
                        left: 8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                homeScreenController
                                    .topVisitedList[index].author!,
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                            Row(
                              children: [
                                Text(
                                    homeScreenController
                                        .topVisitedList[index].view!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Icon(
                                  CupertinoIcons.heart_fill,
                                  color: SolidColors.lightBackColor,
                                  size: 18,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                              width: size.width / 2.4,
                              child: Text(
                                homeScreenController
                                    .topVisitedList[index].title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontSize: 16, color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget topPodcasts() {
    return Padding(
      padding: const EdgeInsets.only(right: 36),
      child: SizedBox(
        height: size.height / 4.1,
        child: Obx(
          () => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: homeScreenController.topPodcasts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      width: size.width / 2.4,
                      height: size.height / 5.6,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcasts[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                        placeholder: ((context, url) =>
                            const LoadingAnimation()),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 32,
                          color: SolidColors.primaryColor,
                        ),
                      ),
                    ),
                    Text(homeScreenController.topPodcasts[index].title!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 16, color: Colors.black))
                  ],
                );
              }),
        ),
      ),
    );
  }

  Widget posterHomeScreen(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          SizedBox(
              width: size.width / 1.25,
              height: size.height / 4.2,
              child: CachedNetworkImage(
                imageUrl: homeScreenController.poster.value.image!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
                placeholder: (context, url) => const LoadingAnimation(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 32,
                  color: SolidColors.primaryColor,
                ),
              )),
          Container(
            width: size.width / 1.25,
            height: size.height / 4.2,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                    colors: GradientColors.homePosterCoverGradiant,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    homeScreenController.poster.value.title!,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 18),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tagsVisited() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: homeScreenController.tagList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async{
                  var id = homeScreenController.tagList[index].id!;
                  Get.find<ArticleController>().getArticleListWithTagsId(id);
                  var title = homeScreenController.tagList[index].title!;
                  Get.to(ArticleListScreen(
                    titleAppbar: title,
                  ));
                },
              child: Padding(
                padding: EdgeInsets.fromLTRB(4, 8, index == 0 ? 32 : 4, 8),
                child: TagItemHomeScreen(
                  titleItem: homeScreenController.tagList[index].title!,
                ),
              ),
            );
          }),
    );
  }
}

class TitleListHomeScreen extends StatelessWidget {
  const TitleListHomeScreen({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 32, 8),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
