import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/colors.dart';
import 'package:tech_blog/constant/storage_const.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/route_manager/names.dart';
import 'package:tech_blog/screens/main_screen_content/home_screen.dart';
import 'package:tech_blog/screens/register/register_intro.dart';
import 'package:tech_blog/services/dio_services.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activeCodeTextEditingController =
      TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register'
    };

    var response =
        await DioService().postServerResponse(map, ApiConstant.postRegister);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];
    debugPrint(response.toString());
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activeCodeTextEditingController.text,
      'command': 'verify'
    };

    debugPrint(map.toString());
    var response =
        await DioService().postServerResponse(map, ApiConstant.postRegister);
    debugPrint(response.data.toString());
    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write('token', response.data['token']);
        box.write(StorageKey.userId, response.data['user_id']);

        debugPrint("read::: " + box.read(StorageKey.token));
        debugPrint("read::: " + box.read(StorageKey.userId));

        Get.offAll(const HomeScreen());

        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعالسازی غلط است');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعالسازی منقضی شده است');
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(StorageKey.token) != null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }
}

class Storagekey {
}

routeToWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration:  const BoxDecoration(
          color: SolidColors.lightText,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding:  const EdgeInsets.all(16),
        child: Column(children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.icons.tcbot,
                height: 40,
              ),
               const SizedBox(
                width: 8,
              ),
               Text(MyStrings.shareKnowledge)
            ],
          ),
           const SizedBox(
            height: 8,
          ),
           Text(MyStrings.gigTech),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (() {
                  // debugPrint("write article");
                  Get.toNamed(NamedRoute.manageArticle);
                }),
                child: Container(
                  color: SolidColors.lightIcon,
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.writeArticleIcon.path,
                        height: 36,
                      ),
                       const SizedBox(
                        width: 8,
                      ),
                       Text(MyStrings.titleAppBarManageArticle)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (() {
                  Get.toNamed(NamedRoute.podcastManageList);
                  debugPrint(MyStrings.writePodcast);
                }),
                child: Container(
                  color: SolidColors.lightIcon,
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.icons.writePodcastIcon.path,
                        height:36,
                      ),
                       const SizedBox(
                        width:8,
                      ),
                       Text(MyStrings.managePodcast)
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
