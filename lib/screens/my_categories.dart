import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/my_component.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/test_data.dart';

class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 26, 32, 16),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  Assets.icons.tcbot,
                  width: 96,
                  height: 96,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  MyStrings.successfulRegistration,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 20),
                    decoration: InputDecoration(
                        hintText: MyStrings.nameAndFamilyName,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 18)),
                  ),
                ),
                Text(
                  MyStrings.chooseCats,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 130,
                  width: double.infinity,
                  child: GridView.builder(
                    itemCount: tagList.length,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTags.contains(tagList[index])) {
                                selectedTags.add
                                    (tagList[index]);
                              }
                            });
                          },
                          child: TagItemHomeScreen(
                              titleItem: tagList[index].title));
                    },
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  scale: 2,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: selectedTags.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.fromLTRB(4, 8, index == 0 ? 32 : 4, 8),
                          child: Container(
                            padding: const EdgeInsets.only(right: 16, left: 16),
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: SolidColors.dividerColor
                                          .withOpacity(0.4),
                                      blurRadius: 10)
                                ],
                                borderRadius: BorderRadius.circular(18),
                                color: SolidColors.surface),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedTags
                                              .remove(selectedTags[index]);
                                        });
                                      },
                                      child: const Icon(
                                        CupertinoIcons.delete,
                                        size: 24,
                                      )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    selectedTags[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                      child: Text(
                        MyStrings.continuation,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
