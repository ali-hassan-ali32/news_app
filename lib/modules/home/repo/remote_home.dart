import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/services/apis/api_manger.dart';
import 'package:news_app/modules/home/repo/home_repo.dart';

class RemoteHomeRepo implements HomeRepo {
  @override
  Future<NewsModel> getNews(
      {required String sourceId, String searchQuery = ''}) async {
    return await NewsApi.getNews(sourceId: sourceId, searchQuery: searchQuery);
  }

  @override
  Future<SourceModel> getSources({required String id}) async {
    return await NewsApi.getSources(id: id);
  }
}
