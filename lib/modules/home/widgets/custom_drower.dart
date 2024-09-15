import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';

import 'custom_drower_item.dart';

class CustomDrower extends StatelessWidget {
  const CustomDrower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Drawer(
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
              homeCubit.goBackToCategoryScreen(context);
            },
          ),
          //                             Setting
          CustomTextTileWidget(
            title: 'settings'.tr(),
            icon: Icons.settings,
            onTap: () => homeCubit.onSettingsPress(context),
          ),
        ],
      ),
    );
  }
}
