import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/modules/home/screens/taps/news_tap/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/models/news_model.dart';
import '../../../../../core/widgets/custom_background_widget.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.articleData});

  final ArticleData articleData;

  Future<void> _launchURL({required String url}) async {
    final Uri uri = Uri.parse(url); // Convert string to Uri
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBgWidget(
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          centerTitle: true,
          title: Text('news tile'.tr()),
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Section
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: CachedNetworkImage(
                            imageUrl: articleData.urlToImage ?? '',
                            height: 230,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const LoadingWidget(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error, size: 64),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Text and Article Details
                        Text(articleData.source!.name ?? ''),
                        const SizedBox(height: 5),
                        Text(
                          articleData.title ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 22, color: Colors.black87),
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            articleData.publishedAt!.substring(0, 10),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          articleData.content ?? '',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black87),
                        ),
                        const SizedBox(height: 20),

                        // Link Button
                        InkWell(
                          onTap: () => _launchURL(url: articleData.url ?? ''),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'view full article'.tr(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                              const SizedBox(width: 10),
                              const Icon(
                                Icons.web,
                                color: Colors.black,
                                size: 28,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
