import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';

import '../widgets/news_tile.dart';
import '../widgets/source_list_view.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.cubit});

  final HomeCubit cubit;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.cubit.getSources();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sources Viewer
        SourcesListView(sources: widget.cubit.sources),
        // News of Source
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.cubit.articles.length,
            itemBuilder: (context, index) {
              return NewsTile(article: widget.cubit.articles[index]);
            },
          ),
        )
      ],
    );
  }
}
