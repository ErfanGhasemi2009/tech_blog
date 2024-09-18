import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_component.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, 'لیست مقاله ها'),
    );
  }
}
