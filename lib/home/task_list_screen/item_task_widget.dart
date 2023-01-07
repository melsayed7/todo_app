import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/firebase_utils.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/style/myColor.dart';

import 'edit_task_widget.dart';

class ItemTaskWidget extends StatelessWidget {
  TaskModel taskModel;

  ItemTaskWidget({required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EditTaskWidget.routeName,
            arguments: taskModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Slidable(
          startActionPane: ActionPane(
              extentRatio: .25,
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    deleteTaskFromFirebase(taskModel);
                    Fluttertoast.showToast(
                        msg: 'Task deleted successfully',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: MyColor.redColor,
                        textColor: Colors.white,
                        fontSize: 20.0);
                  },
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: MyColor.redColor,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ]),
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: provider.isDarkTheme()
                  ? MyColor.bottomNavBarColor
                  : MyColor.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 62,
                  width: 4,
                  color: taskModel.isDone == true
                      ? MyColor.greenColor
                      : MyColor.primaryLightColor,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          taskModel.title,
                          style: taskModel.isDone == true
                              ? Theme.of(context).primaryTextTheme.bodyText2
                              : Theme.of(context).primaryTextTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          taskModel.description,
                          maxLines: 2,
                          style: Theme.of(context).primaryTextTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Have you finish task ?'),
                        content: const Text(
                            'If you finish task press (OK) \n not finish press (Cancel)'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              updateDoneTaskFromFirebase(taskModel);
                              Fluttertoast.showToast(
                                  msg: 'Congratulations you finished the task',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: MyColor.greenColor,
                                  textColor: Colors.white,
                                  fontSize: 18.0);
                              Navigator.pop(context, 'OK');
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: taskModel.isDone == true
                      ? Text(
                          'Done!',
                          style: Theme.of(context).primaryTextTheme.headline3,
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColor.primaryLightColor),
                          child: Image.asset(
                            'assets/images/Icon_check.png',
                            color: MyColor.whiteColor,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
