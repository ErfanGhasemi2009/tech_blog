import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tech_blog/route_manager/binding.dart';
import 'package:tech_blog/route_manager/names.dart';
import 'package:tech_blog/screens/articles/single_article_screen.dart';
import 'package:tech_blog/screens/main_screen_content/home_screen.dart';
import 'package:tech_blog/screens/splash_screen.dart';

class Pages{

  Pages._();

  static List<GetPage<dynamic>>  pages =  [
          GetPage(
              name: NamedRoute.initialRoute,
              page: () => const SplashScreen(),
             ),
          GetPage(
              name: NamedRoute.routeMainScreen,
              page: () => const HomeScreen(),
              binding: RegisterBinding()),
          GetPage(
              name: NamedRoute.routeSingleArticle,
              page: () => const SingleArticleScreen(),
              binding: ArticleBinding()),
          // GetPage(
          //     name: NamedRoute.manageArticle,
          //     page: () => ManageArticle(),
          //     binding: ArticleManagerBinding()),
          // GetPage(
          //     name: NamedRoute.singleManageArticle,
          //     page: () => SingleManageArticle(),
          //     binding: ArticleManagerBinding()),
          // GetPage(
          //     name: NamedRoute.singlePodcast,
          //     page: () => PodcastSingle(),
          //     binding: SinglePodcastBinding()
          //     ),
              //  GetPage(
              // name: NamedRoute.singleManagePodcast,
              // page: () => SingleManagePodcast(),
              // binding: podcastManagerBinding(), 
              // ),
              //  GetPage(
              // name: NamedRoute.podcastManageList,
              // page: () => ManagePodcast(),
              // binding: podcastManagerBinding(),
              // ),


        ];


}