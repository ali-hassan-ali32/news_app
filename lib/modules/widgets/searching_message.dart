import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchingMessage extends StatelessWidget {
  const SearchingMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('searching...'.tr(),style: const TextStyle(fontSize: 25,color: Colors.green),));
  }
}
