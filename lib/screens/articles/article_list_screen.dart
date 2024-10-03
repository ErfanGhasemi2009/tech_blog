import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/article_controllers/article_controller.dart';
import 'package:tech_blog/controller/article_controllers/singel_article_controller.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key, required this.titleAppbar});
  final String titleAppbar;
  final ArticleController articleController = Get.put(ArticleController());
  final SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(context, titleAppbar),
      body: SafeArea(
          child: Obx(() => SizedBox(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: articleController.articleList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        singleArticleController.getArticleInfo(articleController.articleList[index].id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                        child: Row(
                          children: [
                            SizedBox(
                              height: size.height / 6,
                              width: size.width / 2.7,
                              child: CachedNetworkImage(
                                imageUrl:
                                    articleController.articleList[index].image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
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
                                      articleController
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
                                          articleController
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
                                              articleController
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
              ))),
    );
  }
}
