import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/home_provider.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            controller: provider.searchController,
            onChanged: provider.searching,
            cursorColor: Colors.green,
            decoration: InputDecoration(
              hintText: 'search...'.tr(),
              suffixIcon: IconButton(onPressed: () => provider.onSearchSubmitted('',context),icon: const Icon(Icons.search,color: Colors.green,)),
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.green,
                ),
                onPressed: () => provider.clearSearch(context),
              ),
              hintStyle: const TextStyle(color: Colors.green),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Colors.white, // Border color when focused
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            ),
            style: const TextStyle(color: Colors.green, fontSize: 20),
            onFieldSubmitted: (value) {
              provider.onSearchSubmitted(value,context);
            },
          ),
        ),
      ),
    );
  }
}
