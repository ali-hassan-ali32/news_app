import 'package:flutter/material.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';

import '../../../../../../core/models/source_model.dart';

class SourcesListView extends StatelessWidget {
  const SourcesListView({super.key, required this.sources});

  final List<SourceData> sources;

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    return DefaultTabController(
        length: sources.length,
        child: TabBar(
          onTap: (value) => cubit.onTapPress(value),
          labelPadding: const EdgeInsets.all(5),
          isScrollable: true,
          indicatorColor: Colors.transparent,
          tabs: sources.map((e) {
            return Tab(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: sources.indexOf(e) == cubit.selectedSourceTap
                      ? Colors.green
                      : Colors.white,
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  e.name!,
                  style: TextStyle(
                      color: sources.indexOf(e) == cubit.selectedSourceTap
                          ? Colors.white
                          : Colors.green,
                      fontSize: 20),
                ),
              ),
            );
          }).toList(),
        ));
  }
}
