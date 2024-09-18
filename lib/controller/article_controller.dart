import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class ArticleController extends GetxController {
  @override
  onInit() {
    super.onInit();
    getArticleList();
  }

  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;
  getArticleList() async {
    loading.value = true;

    var response =
        await DioService().getServerResponse(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((body) {
        articleList.add(ArticleModel.fromJson(body));
      });

      loading.value = false;
    }
  }
}
