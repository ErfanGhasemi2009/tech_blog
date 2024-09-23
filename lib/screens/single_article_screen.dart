import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/my_component.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/controller/singel_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/screens/main_screen_content/content_home_screen.dart';

class SingleArticleScreen extends StatefulWidget {
  const SingleArticleScreen({super.key});

  @override
  State<SingleArticleScreen> createState() => _SingleArticleScreenState();
}

class _SingleArticleScreenState extends State<SingleArticleScreen> {
  final SingleArticleController singleArticleController =
      Get.put(SingleArticleController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleArticleController.getArticleInfo();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        singleArticleController.articleInfoModel.value.image!,
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    placeholder: (context, url) => const LoadingAnimation(),
                    errorWidget: (context, url, error) => Assets
                        .images.singlePlaceHolder
                        .image(fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: GradientColors.singleAppbarGradiant,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                )),
                            const Expanded(child: SizedBox()),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_border_rounded,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      singleArticleController.articleInfoModel.value.title!,
                      style: textTheme.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        children: [
                          Assets.icons.profileAvatar.image(height: 32),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            singleArticleController
                                .articleInfoModel.value.author!,
                            style: textTheme.headlineMedium!.copyWith(fontSize: 18,),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            singleArticleController
                                .articleInfoModel.value.createdAt!,
                            style: textTheme.headlineSmall!.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    HtmlWidget(
                      singleArticleController.articleInfoModel.value.content!,
                      textStyle: textTheme.headlineMedium!.copyWith(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: singleArticleController.tagList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                              child: TagItemHomeScreen(
                                  titleItem: singleArticleController
                                      .tagList[index].title!),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TitleListHomeScreen(
                title: MyStrings.relatedArticle,
                icon: Assets.icons.bluePen.image(height: 16, width: 16),
              ),
              //articles list
              relatedBlogs(size),
            ],
          ),
        ),
      )),
    );
  }

  Widget relatedBlogs(Size size) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: SizedBox(
        height: size.height / 4.1,
        child: Obx(
          () => ListView.builder(
              itemCount: singleArticleController.relatedList.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      width: size.width / 2.2,
                      height: size.height / 5.1,
                      child: CachedNetworkImage(
                        imageUrl:
                            singleArticleController.relatedList[index].image!,
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
                              singleArticleController
                                  .relatedList[index].author!,
                              style: Theme.of(context).textTheme.displayMedium),
                          Row(
                            children: [
                              Text(
                                  singleArticleController
                                      .relatedList[index].view!,
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
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
                              singleArticleController.relatedList[index].title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(fontSize: 16, color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            )),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}