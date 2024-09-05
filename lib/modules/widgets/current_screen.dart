import 'package:flutter/material.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:news_app/modules/home/screens/categories_screen.dart';
import 'package:news_app/modules/home/screens/news_tap.dart';
import 'package:news_app/modules/home/screens/article_screen.dart';
import 'package:news_app/modules/home/screens/settings_screen.dart';
import 'package:provider/provider.dart';

import '../home/screens/searching_screen.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return provider.goToSettingsTap
            ? const SettingsScreen()
            : provider.currentCategory == null
                ? const CategoriesScreen()
                : provider.isSearching
                    ? const SearchingScreen()
                    : provider.currentArticle == null
                        ? NewsTab(categoryId: provider.currentCategory!.id)
                        : const ArticleScreen();
      },
    );
  }
}

// return provider.currentCategory == null
//     ? const CategoriesScreen()
//     : NewsTab(
//   categoryId: provider.currentCategory!.id,
