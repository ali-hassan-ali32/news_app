// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import '../../cubit/home_cudit.dart';
// import 'news_tap/widgets/loading_widget.dart';
//
// class ArticleTap extends StatelessWidget {
//   const ArticleTap({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     HomeCubit homeCubit = HomeCubit.get(context);
//     return Column(
//       children: [
//         Expanded(
//           child: Center(
//             child: Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(6),
//                       child: CachedNetworkImage(
//                         imageUrl: homeCubit.currentArticle!.urlToImage!,
//                         height: 230,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                         placeholder: (context, url) => const LoadingWidget(),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.error),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       homeCubit.currentArticle!.source!.name!,
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       homeCubit.currentArticle!.title!,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style:
//                           const TextStyle(fontSize: 22, color: Colors.black87),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         homeCubit.currentArticle!.publishedAt!.substring(0, 10),
//                         style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       homeCubit.currentArticle!.content!,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     InkWell(
//                       onTap: homeCubit.goBackToNewsScreen,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             'go back'.tr(),
//                             style: const TextStyle(
//                                 color: Colors.black, fontSize: 22),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           const Icon(
//                             Icons.arrow_forward_ios,
//                             color: Colors.black,
//                             size: 28,
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
