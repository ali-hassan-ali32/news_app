import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';

class CategroyItemWidget extends StatelessWidget {
  final CategoryModel category;
  final bool isRight;

  const CategroyItemWidget({
    super.key,
    required this.category,
    this.isRight = false,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return InkWell(
      onTap: () {
        cubit.onCategoryPress(category);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: category.color,
            borderRadius: BorderRadius.only(
                bottomRight: isRight ? Radius.zero : const Radius.circular(25),
                bottomLeft: isRight ? const Radius.circular(25) : Radius.zero,
                topRight: const Radius.circular(25),
                topLeft: const Radius.circular(25))),
        child: Column(
          children: [
            Image.asset('assets/images/${category.image}'),
            const Spacer(),
            Text(
              category.title.tr(),
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 22),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
