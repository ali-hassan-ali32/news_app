import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:news_app/modules/widgets/searching_message.dart';
import 'package:provider/provider.dart';
import '../../../core/models/news_model.dart';
import '../../../core/services/apis/api_manger.dart';
import '../../widgets/error_message.dart';
import '../../widgets/news_tile.dart';

class SearchingScreen extends StatelessWidget {
  const SearchingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        final searchText = provider.searchController.text.trim();
        var futureNews = NewsApi.getNews(search: searchText);

        if (searchText.isEmpty) {
          return Center(child: Text('please enter a search term.'.tr(),style: const TextStyle(fontSize: 22),));
        }


        return FutureBuilder<NewModel>(
          future: futureNews,
          builder: (context, newsSnapshot) {
            if (newsSnapshot.connectionState == ConnectionState.waiting) {
              return const SearchingMessage();
            } else if (newsSnapshot.hasError || !newsSnapshot.hasData) {
              return const ErrorMessage();
            }

            final articles = newsSnapshot.data?.articles;
            if (articles == null || articles.isEmpty) {
              return const ErrorMessage();
            }

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
