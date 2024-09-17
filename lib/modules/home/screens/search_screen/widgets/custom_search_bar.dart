import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../cubit/home_cudit.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);

    return AppBar(
      backgroundColor: Colors.green,
      leading: IconButton(
        onPressed: () {
          homeCubit.clearSearch();
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 28,
        ),
      ),
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50),
        bottomLeft: Radius.circular(50),
      )),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      title: TextField(
        controller: homeCubit.searchController,
        onChanged: (value) {
          homeCubit.searchQuery = value;
        },
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            homeCubit.getSearchNews(searchQuery: value);
          }
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'search article'.tr(),
            hintStyle: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w300,
            ),
            prefixIcon: IconButton(
              onPressed: homeCubit.clearSearch,
              icon: const Icon(
                Icons.clear,
                color: Colors.green,
                size: 32,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                if (homeCubit.searchQuery.isNotEmpty) {
                  homeCubit.getSearchNews(searchQuery: homeCubit.searchQuery);
                }
              },
              icon: const Icon(Icons.search, color: Colors.green, size: 32),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
