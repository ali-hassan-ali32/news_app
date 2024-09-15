import 'package:flutter/material.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';
import 'package:news_app/modules/home/screens/taps/article_tap.dart';
import 'package:news_app/modules/home/screens/taps/category_tap/screens/categories_tap.dart';
import 'package:news_app/modules/home/screens/taps/news_tap/screens/news_tap.dart';
import 'package:news_app/modules/home/screens/taps/settings_tap/screens/settings_tap.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    switch (cubit.currentTap) {
      case 0:
        return const CategoriesTap();
      case 1:
        return const SettingsTap();
      case 2:
        return NewsTab(
          cubit: cubit,
        );
      case 3:
        return const ArticleTap();

      default:
        return const SizedBox();
    }
  }
}

// return provider.currentCategory == null
//     ? const CategoriesScreen()
//     : NewsTab(
//   categoryId: provider.currentCategory!.id,

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
