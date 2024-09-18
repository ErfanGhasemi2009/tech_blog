import 'package:tech_blog/constant/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel({
    this.id,
    this.title,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
  });

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster =ApiConstant.hostDlUrl+ element["poster"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}

















/* "id": "127",
            "title": "تست هستم",
            "poster": "''",
            "cat_name": "اخبار و مقالات",
            "author": "بهرام امینی",
            "view": "15",
            "status": "0",
            "created_at": "۱۴۰۳/۴/۱۳" */