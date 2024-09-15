import 'package:flutter/material.dart';

import '../../../../../../core/models/category_model.dart';
import 'category_item_widget.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
          itemCount: CategoryModel.categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
          childAspectRatio: 140 / 145,
          crossAxisCount: 2),
          itemBuilder: (context, index) => CategroyItemWidget(
            category: CategoryModel.categories[index],
            isRight: (index % 2 == 0),
          ),
    ));
  }
}
