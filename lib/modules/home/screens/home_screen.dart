import 'package:flutter/material.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/modules/widgets/current_screen.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_drower.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = HomeProvider();

    return ChangeNotifierProvider.value(
      value: homeProvider,
      child: CustomBgWidget(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CustomAppBar(),
          drawer: const CustomDrower(),
          body: Consumer<HomeProvider>(
            builder: (context, provider, child) {
              return const CurrentScreen();
            },
          ),
        ),
      ),
    );
  }
}
