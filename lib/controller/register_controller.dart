import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/dimens.dart';
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
        // var box = GetStorage();
        BoxStorage.box.write(StorageKey.token, response.data['token']);
        BoxStorage.box.write(StorageKey.userId, response.data['user_id']);

        debugPrint("read::: " + BoxStorage.box.read(StorageKey.token));
        debugPrint("read::: " + BoxStorage.box.read(StorageKey.userId));

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
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegisterIntro());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 3,
      decoration: BoxDecoration(
          color: SolidColors.lightText,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.medium + 4),
              topRight: Radius.circular(Dimens.medium + 4))),
      child: Padding(
        padding: EdgeInsets.all(Dimens.medium),
        child: Column(children: [
          Row(
            children: [
              SvgPicture.asset(
                Assets.icons.tcbot,
                height: Dimens.large + 8,
              ),
              SizedBox(
                width: Dimens.small,
              ),
              Text(MyStrings.shareKnowledge)
            ],
          ),
          SizedBox(
            height: Dimens.small,
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
                        height: Dimens.large,
                      ),
                      SizedBox(
                        width: Dimens.small,
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
                        height: Dimens.large,
                      ),
                      SizedBox(
                        width: Dimens.small,
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
}
