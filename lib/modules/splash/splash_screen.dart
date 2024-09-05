import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_image_provider.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import '../home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return CustomBgWidget(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: ZoomIn(
          duration: const Duration(seconds: 2),
          child: Center(child: Image.asset(AssetsImageProvider.logo))),
    ));
  }
}
