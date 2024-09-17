import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';
import 'package:news_app/modules/home/cubit/state.dart';
import 'package:news_app/modules/home/widgets/current_screen.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drower.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetSourceLoadingState || state is GetNewsLoadingState) {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              );
            },
          );
        }
        if (state is GetSourceErrorState) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(state.error),
              );
            },
          );
        }
        if (state is GetSourceSuccessState || state is GetNewsSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return CustomBgWidget(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(),
            drawer: const CustomDrower(),
            body: CurrentScreen(cubit: cubit),
          ),
        );
      },
    );
  }
}