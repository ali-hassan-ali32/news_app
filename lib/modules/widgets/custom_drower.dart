import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'custom_drower_item.dart';

class CustomDrower extends StatefulWidget {
  const CustomDrower({
    super.key,
  });

  @override
  State<CustomDrower> createState() => _CustomDrowerState();
}

class _CustomDrowerState extends State<CustomDrower> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xff39A552),
              ),
              child: Center(
                  child: Text(
                    'news app'.tr(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            //                          Categroy Menue
            CustomTextTileWidget(
              title: 'categories'.tr(),
              icon: Icons.menu,
              onTap: () {
                provider.goBackToCategoryScreen(context);
              },
            ),
            //                             Setting
            CustomTextTileWidget(
              title: 'settings'.tr(),
              icon: Icons.settings,
              onTap: () => provider.onSettingsPress(context),
            ),
          ],
        ),
      ),
    );
  }
}
