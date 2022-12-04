import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/settings_screen/language_bottom_sheet.dart';
import 'package:todo_app/myTheme.dart';
import 'package:todo_app/provider/app_provider.dart';

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
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: MyTheme.whiteColor,
              border: Border.all(color: MyTheme.primaryLightColor),
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
                    color: MyTheme.primaryLightColor,
                  )
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                color: MyTheme.whiteColor,
                border: Border.all(color: MyTheme.primaryLightColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Light',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 30,
                  color: MyTheme.primaryLightColor,
                )
              ],
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
}
