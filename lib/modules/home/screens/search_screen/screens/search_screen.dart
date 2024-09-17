import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';
import 'package:news_app/modules/home/cubit/state.dart';
import 'package:news_app/modules/home/screens/taps/news_tap/widgets/news_tile.dart';

import '../widgets/custom_search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBgWidget(
      child: Scaffold(
        appBar: const CustomSearchBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            HomeCubit homeCubit = HomeCubit.get(context);
            if (state is SearchingState) {
              return Center(
                  child: Text(
                'searching...'.tr(),
                style: const TextStyle(fontSize: 32, color: Colors.green),
              ));
            } else if (state is SearchFoundState) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeCubit.searchedArticles.length,
                itemBuilder: (context, index) {
                  return NewsTile(article: homeCubit.searchedArticles[index]);
                },
              );
            } else if (state is DidNotSearchYetState) {
              return Center(
                  child: Text(
                'Pleas enter a search query'.tr(),
                style: const TextStyle(fontSize: 16),
              ));
            } else if (state is SearchErrorState) {
              return const Center(
                child: Text(
                  'opps someting happen, try later',
                  style: TextStyle(fontSize: 16),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'no news with that title found'.tr(),
                  style: const TextStyle(fontSize: 16),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
