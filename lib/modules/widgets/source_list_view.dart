import 'package:flutter/material.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:provider/provider.dart';
import '../../core/models/source_model.dart';

class SourcesListView extends StatelessWidget {
  const SourcesListView({super.key, required this.sources});
  final List<Sources> sources;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => DefaultTabController(
          length: sources.length,
          child: TabBar(
            onTap: (value) => provider.setSource(value),
            labelPadding: const EdgeInsets.all(5),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            tabs: sources.map((e) {
              return Tab(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: sources.indexOf(e) == provider.selectedSourceTap
                        ? Colors.green
                        : Colors.white,
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    e.name!,
                    style: TextStyle(
                        color: sources.indexOf(e) == provider.selectedSourceTap
                            ? Colors.white
                            : Colors.green,
                        fontSize: 20),
                  ),
                ),
              );
            }).toList(),
          )),
    );
  }
}
