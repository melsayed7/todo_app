import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/settings_screen/language_bottom_sheet.dart';
import 'package:todo_app/home/settings_screen/theme_bottom_sheet.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/style/myColor.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: provider.isDarkTheme()
                ? Theme.of(context).primaryTextTheme.headline2
                : Theme.of(context).primaryTextTheme.headline2,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: provider.isDarkTheme()
                  ? MyColor.bottomNavBarColor
                  : MyColor.whiteColor,
              border: Border.all(color: MyColor.primaryLightColor),
            ),
            child: InkWell(
              onTap: () {
                showLanguageBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                    color: MyColor.primaryLightColor,
                  )
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: provider.isDarkTheme()
                ? Theme.of(context).primaryTextTheme.headline2
                : Theme.of(context).primaryTextTheme.headline2,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                color: provider.isDarkTheme()
                    ? MyColor.bottomNavBarColor
                    : MyColor.whiteColor,
                border: Border.all(color: MyColor.primaryLightColor)),
            child: InkWell(
              onTap: () {
                showThemeBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkTheme()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                    color: MyColor.primaryLightColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }
}
