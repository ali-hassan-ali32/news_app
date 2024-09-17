import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/models/source_model.dart';

import '../../models/news_model.dart';
import '../cache/cached_news.dart';

class NewsApi {
  static Future<NewsModel> getSearchedNews(
      {required String searchQuery, required String category}) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?category=$category&q=$searchQuery&apiKey=e26fb348dda0416ca8945eb7bdf73f6f');
      NewsModel newsModel = NewsModel.fromJson(response.data);
      return newsModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'opps there was and error, try later';
      log(errorMessage);
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('opps there was and error, try later');
    }
  }

  static Future<NewsModel> getNews(
      {required String sourceId, String searchQuery = ''}) async {
    var url = Uri.https('newsapi.org', 'v2/everything', {
      "searchIn": 'title',
      "sources": sourceId,
      'q': searchQuery,
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
