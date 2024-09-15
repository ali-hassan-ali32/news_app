import 'dart:io';

import 'package:hive/hive.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:path_provider/path_provider.dart';

class CachedNews {
  static Future<void> saveSources(SourceModel sourceModel) async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'News', // Name of your database
      {'Sources'}, // Names of your boxes
      path: appDocumentsDir
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );

    final sourcesBox =
        await collection.openBox<Map<String, dynamic>>('Sources');
    await sourcesBox.put('sourceModel', sourceModel.toJson());
  }

  static Future<SourceModel> getSources() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'News', // Name of your database
      {'Sources'}, // Names of your boxes
      path: appDocumentsDir
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );

    final sourcesBox =
        await collection.openBox<Map<dynamic, dynamic>>('Sources');
    var json = await sourcesBox.get('sourceModel');
    return SourceModel.fromJson(json);
  }

  static Future<void> saveNews(NewsModel newsModel) async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'News', // Name of your database
      {'news'}, // Names of your boxes
      path: appDocumentsDir
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );

    final newsBox = await collection.openBox<Map<String, dynamic>>('news');
    await newsBox.put('newsModel', newsModel.toJson());
  }

  static Future<NewsModel> getNews() async {
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final collection = await BoxCollection.open(
      'News', // Name of your database
      {'news'}, // Names of your boxes
      path: appDocumentsDir
          .path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );

    final newsBox = await collection.openBox<Map<dynamic, dynamic>>('news');
    var json = await newsBox.get('newsModel');
    return NewsModel.fromJson(json);
  }
}
