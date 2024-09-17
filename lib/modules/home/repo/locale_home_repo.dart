import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/services/cache/cached_news.dart';
import 'package:news_app/modules/home/repo/home_repo.dart';

class LocaleHomeRepo implements HomeRepo {
  @override
  Future<NewsModel> getNews(
      {required String sourceId, String searchQuery = ''}) {
    return CachedNews.getNews();
  }

  @override
  Future<SourceModel> getSources({required String id}) {
    return CachedNews.getSources();
  }
}
