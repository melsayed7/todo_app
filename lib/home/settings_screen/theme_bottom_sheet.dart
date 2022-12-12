import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/style/myColor.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      color: provider.isDarkTheme()
          ? MyColor.backgroundDarkColor
          : MyColor.backgroundLightColor,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.appTheme == ThemeMode.dark
                  ? getSelectedTheme(AppLocalizations.of(context)!.dark)
                  : getUnSelectedTheme(AppLocalizations.of(context)!.dark),
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light
                  ? getSelectedTheme(AppLocalizations.of(context)!.light)
                  : getUnSelectedTheme(AppLocalizations.of(context)!.light),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedTheme(String text) {
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
          color: MyColor.primaryLightColor,
        ),
      ],
    );
  }

  Widget getUnSelectedTheme(String text) {
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
