import 'package:flutter/material.dart';
import 'package:news_app/core/models/news_model.dart';

import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key,required this.articles});

  final List<ArticleData> articles;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: articles.length,
        itemBuilder: (_, index) => NewsTile(article: articles[index]),
      ),
    );
  }
}
