import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/test_data.dart';

class ContentHomeScreen extends StatelessWidget {
  const ContentHomeScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          //poster
          PosterHomeScreen(size: size),

          const SizedBox(
            height: 16,
          ),
          //tag list
          const TagListHomeScreen(),

          const SizedBox(
            height: 12,
          ),
          //popular articles
          TitleListHomeScreen(title: MyStrings.viewHotestBlog, icon: Assets.icons.bluePen.image(height: 16, width: 16),),
          //articles list
          ArticleListHomeScreen(size: size),

          const SizedBox(
            height: 24,
          ),
          TitleListHomeScreen(
              title: MyStrings.viewHotestPodCasts,
              icon: Assets.icons.microphon.image(height: 16, width: 16)),
          const SizedBox(
            height: 8,
          ),
          PodcastListHomeScreen(size: size),
          const SizedBox(height: 96,)
        ],
      ),
    );
  }
}

class PodcastListHomeScreen extends StatelessWidget {
  const PodcastListHomeScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 36),
      child: SizedBox(
        height: size.height / 4.1,
        child: ListView.builder(
            itemCount: blogList.getRange(3, 8).length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: size.width / 2.4,
                    height: size.height / 5.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(blogList[index].imageUrl),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Text(
                    blogList[index].writer,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 24, color: Colors.black),
                  )
                ],
              );
            }),
      ),
    );
  }
}

class ArticleListHomeScreen extends StatelessWidget {
  const ArticleListHomeScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: SizedBox(
        height: size.height / 4.1,
        child: ListView.builder(
            itemCount: blogList.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    width: size.width / 2.4,
                    height: size.height / 5.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            blogList[index].imageUrl,
                          ),
                        )),
                    foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                            colors: GradientColors.blogPost,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                    margin: const EdgeInsets.all(12),
                  ),
                  Positioned(
                    bottom: 56,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(blogList[index].writer,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium),
                        Row(
                          children: [
                            Text(blogList[index].views,
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
                            blogList[index].content,
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
              );
            }),
      ),
    );
  }
}

class TitleListHomeScreen extends StatelessWidget {
  const TitleListHomeScreen({
    super.key, required this.title, required this.icon,
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

class TagListHomeScreen extends StatelessWidget {
  const TagListHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: tagList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(4, 8, index == 0 ? 32 : 4, 8),
              child: Container(
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
                      tagList[index].title,
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class PosterHomeScreen extends StatelessWidget {
  const PosterHomeScreen({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: size.width / 1.25,
          height: size.height / 4.2,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Assets.images.posterTest.image(fit: BoxFit.cover)),
        ),
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'ملیکا عزیزی - یک روز پیش',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "251",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Icon(
                        Icons.remove_red_eye_rounded,
                        color: SolidColors.lightText,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "دوازده قدم برای برنامه نویسی یک دوره",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 20),
              )
            ],
          ),
        )
      ],
    );
  }
}
