import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/myTheme.dart';
import 'package:todo_app/provider/app_provider.dart';

class TaskListBottomSheet extends StatefulWidget {
  @override
  State<TaskListBottomSheet> createState() => _TaskListBottomSheetState();
}

class _TaskListBottomSheetState extends State<TaskListBottomSheet> {
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return SingleChildScrollView(
      child: Container(
        //margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: provider.isDarkTheme()
              ? MyTheme.bottomNavBarColor
              : MyTheme.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.addNewTask,
                style: Theme.of(context).primaryTextTheme.headline2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.entreTitle;
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: provider.isDarkTheme()
                              ? MyTheme.whiteColor
                              : MyTheme.blackColor),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enterTask,
                        hintStyle: TextStyle(
                            color: provider.isDarkTheme()
                                ? MyTheme.whiteColor
                                : MyTheme.blackColor),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.description;
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: provider.isDarkTheme()
                              ? MyTheme.whiteColor
                              : MyTheme.blackColor),
                      decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.enterDescription,
                        hintStyle: TextStyle(
                            color: provider.isDarkTheme()
                                ? MyTheme.whiteColor
                                : MyTheme.blackColor),
                      ),
                      maxLines: 4,
                      minLines: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                AppLocalizations.of(context)!.selectDate,
                style: Theme.of(context).primaryTextTheme.headline2,
              ),
              const SizedBox(
                height: 18,
              ),
              InkWell(
                onTap: () {
                  showDate();
                },
                child: Text(
                  '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.primaryLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    AppLocalizations.of(context)!.add,
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showDate() async {
    var dateShow = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (dateShow == null) {
      return;
    }
    selectedDate = dateShow;
    setState(() {});
    print(selectedDate);
  }
}
