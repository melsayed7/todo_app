import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/style/myColor.dart';

import '../../model/firebase_utils.dart';

class EditTaskWidget extends StatefulWidget {
  static const String routeName = 'edit_task_widget';

  @override
  State<EditTaskWidget> createState() => _EditTaskWidget();
}

class _EditTaskWidget extends State<EditTaskWidget> {
  DateTime selectedDate = DateTime.now();
  final formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  late TaskModel args;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      args = ModalRoute.of(context)?.settings.arguments as TaskModel;
      titleController.text = args.title;
      descriptionController.text = args.description;
      selectedDate = DateTime.fromMicrosecondsSinceEpoch(args.date);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.toDoList,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: provider.isDarkTheme()
              ? MyColor.bottomNavBarColor
              : MyColor.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.editTask,
                style: Theme.of(context).primaryTextTheme.headline2,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.entreTitle;
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: provider.isDarkTheme()
                              ? MyColor.whiteColor
                              : MyColor.blackColor),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enterTask,
                        hintStyle: TextStyle(
                            color: provider.isDarkTheme()
                                ? MyColor.whiteColor
                                : MyColor.blackColor),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return AppLocalizations.of(context)!.description;
                        }
                        return null;
                      },
                      style: TextStyle(
                          color: provider.isDarkTheme()
                              ? MyColor.whiteColor
                              : MyColor.blackColor),
                      decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.enterDescription,
                        hintStyle: TextStyle(
                            color: provider.isDarkTheme()
                                ? MyColor.whiteColor
                                : MyColor.blackColor),
                      ),
                      maxLines: 3,
                      minLines: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.selectDate,
                style: Theme.of(context).primaryTextTheme.headline2,
              ),
              const SizedBox(height: 20),
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
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    args.title = titleController.text;
                    args.description = descriptionController.text;
                    args.date = selectedDate.microsecondsSinceEpoch;
                    updateTaskFromFirebase(args);
                    Fluttertoast.showToast(
                        msg: 'Task updated successfully',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: MyColor.primaryLightColor,
                        textColor: Colors.white,
                        fontSize: 18.0);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColor.primaryLightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    AppLocalizations.of(context)!.saveChanges,
                    style: Theme.of(context).primaryTextTheme.headline1,
                  ),
                ),
              ),
              const Spacer(flex: 2),
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
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (dateShow != null) {
      selectedDate = dateShow;
    }
    setState(() {});
    print(selectedDate);
  }
}
