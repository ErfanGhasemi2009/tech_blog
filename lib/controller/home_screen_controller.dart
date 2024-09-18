import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/podcast_model.dart';
import 'package:tech_blog/models/poster_model.dart';
import 'package:tech_blog/models/tags_model.dart';
import 'package:tech_blog/services/dio_services.dart';

class HomeScreenController extends GetxController {
  @override
  onInit() {
    super.onInit();
    getHomeScreenItem();
  }

  Rx<PosterModel> poster = PosterModel().obs;

  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcasts = RxList();

  RxBool loading = false.obs;
  getHomeScreenItem() async {
    loading.value = true;

    var response =
        await DioService().getServerResponse(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((body) {
        topVisitedList.add(ArticleModel.fromJson(body));
      });

      response.data['top_podcasts'].forEach((body) {
        topPodcasts.add(PodcastModel.fromJson(body));
      });

      response.data['tags'].forEach((body) {
        tagList.add(TagsModel.fromJson(body));
      });

      poster.value = PosterModel.fromJson(response.data['poster']);


      loading.value = false;
    }
  }
}
