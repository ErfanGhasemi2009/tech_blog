import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/api_key_constant.dart';
import 'package:tech_blog/constant/commands.dart';
import 'package:tech_blog/constant/storage_const.dart';
import 'package:tech_blog/constant/strings.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_services.dart';
import '../file_controller.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  RxBool loading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
    MyStrings.titelArticle,
    MyStrings.editOrginalTextArticle,
     "",
     )
      .obs;

  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }

  getManagedArticle() async {
    loading.value = true;
    // ignore: todo
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    // var response = await DioService().getMethod(ApiConstant.publishedByMe+GetStorage().read(StorageKey.userId));
    var response =
        await DioService().getServerResponse("${ApiConstant.publishedByMe}1");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }

  updateTitle() {
    articleInfoModel.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }

  storeArticle() async {
    var fileController = Get.find<FilePickerController>();
    loading.value = true;
    Map<String, dynamic> map = {
      ApiArticleKeyConstant.title: articleInfoModel.value.title,
      ApiArticleKeyConstant.content: articleInfoModel.value.content,
      ApiArticleKeyConstant.catId: articleInfoModel.value.catId,
      ApiArticleKeyConstant.userId: GetStorage().read(StorageKey.userId),
      ApiArticleKeyConstant.image:
          await dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiArticleKeyConstant.command: Commands.store,
      ApiArticleKeyConstant.tagList: "[]"
    };
    var response =
        await DioService().postServerResponse(map, ApiConstant.articlePost);
    log(response.data.toString());
    loading.value = false;
  }
}