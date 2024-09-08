import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/news_model.dart';

import '../models/category_model.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  CategoryModel? currentCategory;
  ArticleData? currentArticle;
  int currentTap = 0;
  String appBarTitle = 'news app';
  int selectedSourceTap = 0;

  bool canSearch = false;
  bool isSearching = false;
  bool isEnglish = true;

  void showTranslationSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      showDragHandle: true,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () =>
                    context.setLocale(const Locale('en')).then((value) {
                  notifyListeners();
                }),
                title: Text(
                  'English',
                  style: TextStyle(
                    fontSize: 22,
                    color: context.locale.toString() == 'en'
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.locale.toString() == 'en'
                        ? Colors.green
                        : Colors.grey,
                    width: 2,
                  ),
                ),
                trailing: Icon(
                  context.locale.toString() == 'en'
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () =>
                    context.setLocale(const Locale('ar')).then((value) {
                  notifyListeners();
                }),
                title: Text(
                  'العربية',
                  style: TextStyle(
                    fontSize: 22,
                    color: context.locale.toString() == 'ar'
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.locale.toString() == 'ar'
                        ? Colors.green
                        : Colors.grey,
                    width: 2,
                  ),
                ),
                trailing: Icon(
                  context.locale.toString() == 'ar'
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20,)
          ],
        );
      },
    );
  }

  void onSettingsPress(BuildContext context) {
    canSearch = false;
    currentTap = 1;
    selectedSourceTap = 0;
    appBarTitle = 'settings';

    notifyListeners();
    Navigator.pop(context);
  }

  void onSearchTap(BuildContext context) {
    canSearch = false;
    currentTap = 4;
    isSearching = true;
    notifyListeners();
  }

  void clearSearch(BuildContext context) {
    searchController.clear();
    FocusScope.of(context).unfocus();
    notifyListeners();
  }

  void searching(String value) {
    searchController.text = value.trim();
    notifyListeners();
  }

  void closeSearchBar(String value, BuildContext context) {
    canSearch = true;
    isSearching = false;
    currentTap = 2;

    clearSearch(context);
  }

  void onCategoryPress(category) {
    currentCategory = category;
    currentTap = 2;
    appBarTitle = currentCategory!.id;
    canSearch = true;
    notifyListeners();
  }

  void onArticlePress(arcticle) {
    currentArticle = arcticle;
    currentTap = 3;
    appBarTitle = 'news tile';
    canSearch = false;
    notifyListeners();
  }

  void setSource(int value) {
    selectedSourceTap = value;
    notifyListeners();
  }

  void goBackToCategoryScreen(BuildContext context) {
    currentCategory = null;
    currentArticle = null;
    canSearch = false;
    selectedSourceTap = 0;
    currentTap = 0;
    appBarTitle = 'News App';
    notifyListeners();
    Navigator.pop(context);
  }

  void goBackToNewsScreen() {
    appBarTitle = currentCategory!.id;
    canSearch = true;
    currentTap = 2;
    currentArticle = null;
    notifyListeners();
  }
}
