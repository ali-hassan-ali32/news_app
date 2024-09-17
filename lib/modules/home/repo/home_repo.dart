import '../../../core/models/news_model.dart';
import '../../../core/models/source_model.dart';

abstract class HomeRepo {
  Future<NewsModel> getNews(
      {required String sourceId, String searchQuery = ''});

  Future<SourceModel> getSources({required String id});
}
