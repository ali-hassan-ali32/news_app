import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:news_app/modules/widgets/searching_message.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/news_model.dart';
import '../../../../core/services/apis/api_manger.dart';
import '../../../widgets/error_message.dart';
import '../../../widgets/news_tile.dart';

class SearchingTap extends StatelessWidget {
  const SearchingTap({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        if (provider.searchController.text.isEmpty) {
          return Center(
              child: Text(
            'please enter a search term.'.tr(),
            style: const TextStyle(fontSize: 18),
          ));
        }

        return FutureBuilder<List<ArticleData>>(
          future: NewsApi().getSearchedNews(
              searchQuery: provider.searchController.text,
              category: provider.currentCategory!.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SearchingMessage();
            } else if (snapshot.hasError || !snapshot.hasData) {
              return const ErrorMessage();
            }

            final List<ArticleData> articles = snapshot.data ?? [];

            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return NewsTile(article: articles[index]);
              },
            );
          },
        );
      },
    );
  }
}
