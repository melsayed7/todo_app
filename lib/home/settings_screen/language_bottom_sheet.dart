import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/myTheme.dart';
import 'package:todo_app/provider/app_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
            },
            child: provider.appLanguage == 'en'
                ? getSelectedLanguage(AppLocalizations.of(context)!.english)
                : getUnSelectedLanguage(AppLocalizations.of(context)!.english),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: provider.appLanguage == 'ar'
                ? getSelectedLanguage(AppLocalizations.of(context)!.arabic)
                : getUnSelectedLanguage(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget getSelectedLanguage(String text) {
    var provider = Provider.of<AppProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
        Icon(
          Icons.check,
          size: 30,
          color: MyTheme.primaryLightColor,
        )
      ],
    );
  }

  Widget getUnSelectedLanguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      ],
    );
  }
}
