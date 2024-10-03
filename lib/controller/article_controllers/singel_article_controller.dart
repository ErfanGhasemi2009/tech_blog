import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/route_manager/names.dart';
import 'package:tech_blog/services/dio_services.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel =
      ArticleInfoModel(null, null, null).obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel(null, null, null).obs;
 
  
    Get.toNamed(NamedRoute.routeSingleArticle);
 

    loading.value = true;
    var userId = '';
    debugPrint('${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');
    // ignore: todo
    //TODO user id is hard code

    var response = await DioService().getServerResponse('${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromJson(element));
    });

    relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
    });
  }
}