import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/screens/content_home_screen.dart';
import 'package:tech_blog/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;

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
                onTap: () {},
                title: MyStrings.shareTec,
                icon: Icons.share,
              ),
              const SizedBox(
                height: 32,
              ),
              TabRowDrawerHomeScreen(
                onTap: () {},
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
        child: Stack(
          children: [
            Positioned.fill(
                child: IndexedStack(
              index: selectedTab,
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
                setState(() {
                  selectedTab = value;
                });
              },
            )
          ],
        ),
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
    return GestureDetector(
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
