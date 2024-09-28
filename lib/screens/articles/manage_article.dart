import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/my_component.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/controller/article_controllers/manage_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  final ManageArticleController manageArticleController =
      Get.find<ManageArticleController>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Text(
                      MyStrings.textManageArticle,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 20),
                    ),
                  ),
                ),
          ],
        ),
      ),
        appBar: appbar(context, MyStrings.titleAppBarManageArticle),
        body: SafeArea(
          child: Obx(
            ()=> manageArticleController.articleList.isNotEmpty
                ? Obx(() => SizedBox(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: manageArticleController.articleList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              // manageArticleController.getArticleInfo(manageArticleController.articleList[index].id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: size.height / 6,
                                    width: size.width / 2.7,
                                    child: CachedNetworkImage(
                                      imageUrl: manageArticleController
                                          .articleList[index].image!,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      ),
                                      placeholder: (context, url) =>
                                          const LoadingAnimation(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(
                                              Icons.image_not_supported_outlined),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Column(
                                        children: [
                                          Text(
                                            manageArticleController
                                                .articleList[index].title!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(fontSize: 18),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                manageArticleController
                                                    .articleList[index].author!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    manageArticleController
                                                        .articleList[index].view!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  const Icon(
                                                    Icons.remove_red_eye_outlined,
                                                    color: SolidColors.hintText,
                                                    size: 16,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ))
                : const EmptyStateArticle(),
          ),
        ));
  }
}

class EmptyStateArticle extends StatelessWidget {
  const EmptyStateArticle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.emptyState.image(width: 96, height: 96),
          const SizedBox(
            height: 32,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: MyStrings.articleEmpty,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20))),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
