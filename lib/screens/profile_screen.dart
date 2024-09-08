import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_component.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/screens/content_home_screen.dart';

class ProfileScreen extends StatelessWidget {
  final size;

  const ProfileScreen({super.key, this.size});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.icons.profileAvatar.image(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleListHomeScreen(
                    title: MyStrings.imageProfileEdit,
                    icon: Assets.icons.bluePen.image(height: 16, width: 16)),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text('عرفان قاسمی',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20)),
            Text('erfanghasemi1309@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20)),
            const SizedBox(
              height: 64,
            ),
            TechDivider(size: size),
            InkWell(
                onTap: () {
                  //TODO
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(MyStrings.myFavBlog,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 20)),
                  ],
                )),
            TechDivider(size: size),
            InkWell(
                onTap: () {
                  //TODO
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(MyStrings.myFavPodcast,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 20)),
                  ],
                )),
            TechDivider(size: size),
            InkWell(
                onTap: () {
                  //TODO
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(MyStrings.logOut,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 20)),
                  ],
                )),
            TechDivider(size: size),
            const SizedBox(height: 128,),
          ],
        ),
      ),
    );
  }
}
