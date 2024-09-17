import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/core/services/apis/api_manger.dart';
import 'package:news_app/modules/home/cubit/state.dart';
import 'package:news_app/modules/home/repo/home_repo.dart';
import 'package:news_app/modules/home/repo/locale_home_repo.dart';
import 'package:news_app/modules/home/repo/remote_home.dart';
import 'package:news_app/modules/home/screens/search_screen/screens/search_screen.dart';

import '../../../core/models/source_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitalHomeState());

  static HomeCubit get(context) => BlocProvider.of(context);

  SourceModel? sourceModel;
  NewsModel? newsModel;
  late HomeRepo homeRepo;

  TextEditingController searchController = TextEditingController();
  CategoryModel? currentCategory;
  ArticleData? currentArticle;
  int currentTap = 0;
  String appBarTitle = 'news app';
  int selectedSourceTap = 0;
  String searchQuery = '';

  List<SourceData> sources = [];
  List<ArticleData> articles = [];
  List<ArticleData> searchedArticles = [];

  bool canSearch = false;
  bool isEnglish = true;

  // i put this (UI) here to fix the settings title translation refresh => value.then(emit())
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
                  emit(ChangePageState());
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
                  emit(ChangePageState());
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
            const SizedBox(
              height: 20,
            )
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
    emit(ChangeCategoryState());
    Navigator.pop(context);
  }

  void clearSearch() {
    searchController.clear();
    searchQuery = '';
  }

  void onSearchTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        ));
    emit(DidNotSearchYetState());
  }

  Future<void> getSearchNews({required String searchQuery}) async {
    emit(SearchingState());
    try {
      NewsModel news = await NewsApi.getSearchedNews(
          searchQuery: searchQuery, category: currentCategory!.id);
      searchedArticles = news.articles ?? [];
      if (searchedArticles.isEmpty) {
        emit(SearchIsNotExistState());
      } else {
        emit(SearchFoundState());
      }
    } catch (e) {
      emit(SearchErrorState());
    }
  }

  void onCategoryPress(category) {
    currentCategory = category;
    currentTap = 2;
    appBarTitle = currentCategory!.id;
    canSearch = true;
    emit(ChangeCategoryState());
  }

  void onArticlePress(arcticle) {
    currentArticle = arcticle;
  }

  void onTapPress(int value) {
    selectedSourceTap = value;
    getNews();
    emit(ChangeTapState());
  }

  void goBackToCategoryScreen(BuildContext context) {
    currentCategory = null;
    currentArticle = null;
    canSearch = false;
    sources = [];
    articles = [];
    selectedSourceTap = 0;
    currentTap = 0;
    appBarTitle = 'News App';
    emit(ChangeCategoryState());
    Navigator.pop(context);
  }

  Future<void> getSources() async {
    emit(GetSourceLoadingState());
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      homeRepo = RemoteHomeRepo();
    } else {
      homeRepo = LocaleHomeRepo();
    }
    try {
      sourceModel = await homeRepo.getSources(id: currentCategory!.id);
      sources = sourceModel?.sources ?? [];
      emit(GetSourceSuccessState());
      getNews();
    } catch (e) {
      emit(GetSourceErrorState(e.toString()));
    }
  }

  Future<void> getNews() async {
    emit(GetNewsLoadingState());
    bool isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      homeRepo = RemoteHomeRepo();
    } else {
      homeRepo = LocaleHomeRepo();
    }

    try {
      newsModel =
          await homeRepo.getNews(sourceId: sources[selectedSourceTap].id!);

      articles = newsModel?.articles ?? [];
      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErrorState(e.toString()));
    }
  }
}
