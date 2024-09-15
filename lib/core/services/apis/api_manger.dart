import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/models/source_model.dart';

import '../../models/news_model.dart';
import '../cache/cached_news.dart';

class NewsApi {
  static Future<NewsModel> getNews({required String sourceId}) async {
    var url = Uri.https('newsapi.org', 'v2/everything', {
      "searchIn": 'title',
      "sources": sourceId,
      "apiKey": 'e26fb348dda0416ca8945eb7bdf73f6f'
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    var news = NewsModel.fromJson(json);
    CachedNews.saveNews(news);
    return news;
  }

  static Future<SourceModel> getSources({required String id}) async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines/sources?apiKey=e26fb348dda0416ca8945eb7bdf73f6f&category=$id');

    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    var sources = SourceModel.fromJson(json);
    CachedNews.saveSources(sources);
    return sources;
  }
}
