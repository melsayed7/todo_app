import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/firebase_utils.dart';
import 'package:todo_app/model/task_model.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/style/MyColor.dart';

import 'item_task_widget.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.dateTime,
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) {
              provider.getChosenDate(date);
            },
            leftMargin: 20,
            monthColor: provider.isDarkTheme()
                ? MyColor.whiteColor
                : MyColor.blackColor,
            dayColor: provider.isDarkTheme()
                ? MyColor.whiteColor
                : MyColor.blackColor,
            activeDayColor: MyColor.primaryLightColor,
            activeBackgroundDayColor: MyColor.whiteColor,
            dotsColor: MyColor.primaryLightColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
              stream: getDataFromFirebase(provider.dateTime),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  const Center(child: CircularProgressIndicator());
                }
                var tasks =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ItemTaskWidget(taskModel: tasks[index]);
                  },
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

