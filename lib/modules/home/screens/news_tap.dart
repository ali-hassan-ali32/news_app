import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:news_app/core/services/apis/api_manger.dart';
import 'package:provider/provider.dart';
import '../../widgets/error_message.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/news_tile.dart';
import '../../widgets/source_list_view.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.categoryId});
  final String categoryId;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  late Future<SourceModel> futureSources;

  @override
  void initState() {
    super.initState();
    futureSources = NewsApi.getSources(id: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<HomeProvider, int>(
      selector: (context, provider) => provider.selectedSourceTap,
      builder: (context, selectedSource, child) => FutureBuilder<SourceModel>(
          future: futureSources,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.sources!.isEmpty) {
              return const ErrorMessage();
            }

            List<Sources> sources = snapshot.data!.sources ?? [];

            return Column(
              children: [
                // Sources Viewer
                SourcesListView(sources: sources),
                // News of Source
                Expanded(
                  child: FutureBuilder<NewModel>(
                    future: NewsApi.getNews(
                        sourceId: sources[selectedSource].id ?? ''),
                    builder: (context, newsSnapshot) {
                      if (newsSnapshot.connectionState == ConnectionState.waiting) {
                        return const LoadingWidget();
                      } else if (newsSnapshot.hasError) {
                        return const ErrorMessage();
                      } else if (!newsSnapshot.hasData || newsSnapshot.data!.articles!.isEmpty) {
                        return const ErrorMessage();
                      }

                      List<Articles> articles = newsSnapshot.data!.articles!;
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return NewsTile(article: articles[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
