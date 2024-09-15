import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/home/cubit/home_cudit.dart';

class SettingsTap extends StatelessWidget {
  const SettingsTap({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'language'.tr(),
            style: const TextStyle(fontSize: 22, color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              onTap: () => cubit.showTranslationSettings(context),
              title: Text(
                  context.locale.toString() == 'en' ? 'English' : 'العربية',
                  style: const TextStyle(color: Colors.green, fontSize: 22)),
              trailing: const Icon(
                Icons.translate,
                color: Colors.green,
              ),
              shape: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2)),
            ),
          )
        ],
      ),
    );
  }
}
