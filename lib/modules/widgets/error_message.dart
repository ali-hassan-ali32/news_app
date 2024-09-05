import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('error Something Wrong Happen Try Again Later'.tr(),style: const TextStyle(fontSize: 18),));
  }
}
