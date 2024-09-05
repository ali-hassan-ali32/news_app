import 'package:flutter/material.dart';
import '../utils/assets_image_provider.dart';

class CustomBgWidget extends StatelessWidget {
  const CustomBgWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage(AssetsImageProvider.pattern))
        ),
        child: child
    );
  }
}
