import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';
import 'package:news_app/modules/home/screens/articles_screen/screens/article_details_screen.dart';

import 'loading_widget.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.article});

  final ArticleData article;

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return InkWell(
      onTap: () {
        homeCubit.onArticlePress(article);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailsScreen(articleData: article),
            ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const LoadingWidget(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 64,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.source!.name!,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                article.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 22, color: Colors.black87),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                article.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  article.publishedAt?.substring(0, 10) ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
