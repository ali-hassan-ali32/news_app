import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:news_app/modules/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => AppBar(
        automaticallyImplyLeading: !provider.isSearching,
        backgroundColor: const Color(0xff39A552),
        title: Visibility(
          visible: !provider.isSearching,
          child: Text(provider.appBarTitle.tr()),
        ),
        actions: [
          provider.isSearching
              ? const SearchAppBar()
              : Visibility(
                visible: provider.canSearch,
                child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => provider.onSearchTap(context),
                  ),
              ),
        ],
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
