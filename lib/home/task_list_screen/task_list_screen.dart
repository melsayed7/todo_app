import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/myTheme.dart';

import 'item_task_widget.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: MyTheme.blackColor,
            dayColor: MyTheme.blackColor,
            activeDayColor: MyTheme.primaryLightColor,
            activeBackgroundDayColor: MyTheme.whiteColor,
            dotsColor: MyTheme.primaryLightColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemTaskWidget();
              },
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
