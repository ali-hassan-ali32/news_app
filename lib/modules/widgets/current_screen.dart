import 'package:flutter/material.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:news_app/modules/home/screens/taps/article_tap.dart';
import 'package:news_app/modules/home/screens/taps/categories_tap.dart';
import 'package:news_app/modules/home/screens/taps/news_tap.dart';
import 'package:news_app/modules/home/screens/taps/settings_tap.dart';
import 'package:provider/provider.dart';

import '../home/screens/taps/searching_tap.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        switch (provider.currentTap) {
          case 0:
            return const CategoriesTap();
          case 1:
            return const SettingsTap();
          case 2:
            return NewsTab(categoryId: provider.currentCategory!.id);
          case 3:
            return const ArticleTap();
          case 4:
            return const SearchingTap();

          default:
            return const SizedBox();
        }
      },
    );

    // return Consumer<HomeProvider>(
    //   builder: (context, provider, child) {
    //     return provider.goToSettingsTap
    //         ? const SettingsScreen()
    //         : provider.currentCategory == null
    //             ? const CategoriesScreen()
    //             : provider.isSearching
    //                 ? const SearchingScreen()
    //                 : provider.currentArticle == null
    //                     ? NewsTab(categoryId: provider.currentCategory!.id)
    //                     : const ArticleScreen();
    //   },
    // );
  }
}

// return provider.currentCategory == null
//     ? const CategoriesScreen()
//     : NewsTab(
//   categoryId: provider.currentCategory!.id,
