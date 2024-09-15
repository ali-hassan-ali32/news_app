import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate(this.homeCubit);

  HomeCubit homeCubit;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xff39A552),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.green,
          fontSize: 18,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 8),
        fillColor: Colors.white,
        filled: true,

        hintStyle: TextStyle(color: Colors.green),
        // Hint text color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(color: Colors.white), // Border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide:
              BorderSide(color: Colors.white), // Border color when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide:
              BorderSide(color: Colors.white), // Border color when focused
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // Build the clear button.
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Build the leading icon.
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Build the search results.
    List<String> searchTitleList =
        homeCubit.articles.map((e) => e.title.toString()).toList();
    final List<String> searchResults = searchTitleList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            // Handle the selected search result.
            homeCubit.onArticlePress(homeCubit.articles.firstWhere(
                (article) => article.title == searchResults[index]));
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Build the search suggestions.
    List<String> searchTitleList =
        homeCubit.articles.map((e) => e.title.toString()).toList();
    final List<String> suggestionList = query.isEmpty
        ? []
        : searchTitleList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            homeCubit.onArticlePress(homeCubit.articles.firstWhere(
                (article) => article.title == suggestionList[index]));
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}
