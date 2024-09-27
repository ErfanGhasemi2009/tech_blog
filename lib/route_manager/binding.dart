import 'package:get/get.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/controller/singel_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(ArticleController());
    Get.lazyPut(() => SingleArticleController());
  }
}


class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}

class SinglePodcastBinding implements Bindings {
  @override
  void dependencies() {
    // ignore: todo
    // TODO: implement dependencies
    Get.put(SinglePodcastController());
  }
}

class SinglePodcastController {
}

class podcastManagerBinding implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => SinglePodcastController());
  }
}