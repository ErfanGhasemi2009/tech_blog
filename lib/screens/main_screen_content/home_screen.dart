import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/my_component.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/screens/main_screen_content/content_home_screen.dart';
import 'package:tech_blog/screens/main_screen_content/profile_screen.dart';

final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
RxInt selectedTab = 0.obs;


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoldBg,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 4, 32, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                margin: const EdgeInsets.only(bottom: 32),
                child: Assets.images.logo.image(scale: 2.5),
              ),
              TabRowDrawerHomeScreen(
                onTap: () {},
                title: MyStrings.userProfile,
                icon: Icons.person,
              ),
              const SizedBox(
                height: 32,
              ),
              TabRowDrawerHomeScreen(
                onTap: () {},
                title: MyStrings.aboutTec,
                icon: Icons.group,
              ),
              const SizedBox(
                height: 32,
              ),
              TabRowDrawerHomeScreen(
                onTap: () async {
                  await Share.share(MyStrings.shareText);
                },
                title: MyStrings.shareTec,
                icon: Icons.share,
              ),
              const SizedBox(
                height: 32,
              ),
              TabRowDrawerHomeScreen(
                onTap: () async{
                  await myLaunchUrl(MyStrings.techBlogGithubUrl);
                },
                title: MyStrings.tecIngithub,
                icon: Icons.hub_rounded,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColors.scaffoldBg,
        surfaceTintColor: SolidColors.scaffoldBg,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    _globalKey.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu_rounded)),
              Assets.images.logo.image(height: size.height / 13.6),
              const Icon(Icons.search),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              Positioned.fill(
                  child: IndexedStack(
                index: selectedTab.value,
                children: [
                  ContentHomeScreen(size: size),
                  ProfileScreen(
                    size: size,
                  )
                ],
              )),
              // bottomNavigation app
              BottomNavigationHomeScreen(
                size: size,
                changeBodyHomeScreen: (value) {
                  selectedTab.value = value;
                },
              )
            ],
          );
        }),
      ),
    );
  }
}

class TabRowDrawerHomeScreen extends StatelessWidget {
  const TabRowDrawerHomeScreen({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final Function() onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationHomeScreen extends StatelessWidget {
  const BottomNavigationHomeScreen({
    super.key,
    required this.size,
    required this.changeBodyHomeScreen,
  });

  final Size size;
  final Function(int) changeBodyHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
              gradient: const LinearGradient(colors: GradientColors.bottomNav)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    changeBodyHomeScreen(0);
                  },
                  icon: Assets.icons.home.image(color: SolidColors.lightIcon)),
              IconButton(
                  onPressed: () {},
                  icon: Assets.icons.write.image(color: SolidColors.lightIcon)),
              IconButton(
                  onPressed: () {
                    changeBodyHomeScreen(1);
                  },
                  icon: Assets.icons.user.image(color: SolidColors.lightIcon)),
            ],
          ),
        ),
      ),
    );
  }
}
