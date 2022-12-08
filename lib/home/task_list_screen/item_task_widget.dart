import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/myTheme.dart';
import 'package:todo_app/provider/app_provider.dart';

import 'edit_task_widget.dart';

class ItemTaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EditTaskWidget.routeName);
      },
      child: Slidable(
        startActionPane: ActionPane(motion: const DrawerMotion(), children: [
          SlidableAction(
            autoClose: false,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context) {},
            backgroundColor: MyTheme.redColor,
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
                ? MyTheme.bottomNavBarColor
                : MyTheme.whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 62,
                width: 4,
                color: MyTheme.primaryLightColor,
              ),
              Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Play Basket ball',
                    style: Theme.of(context).primaryTextTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Description',
                    style: Theme.of(context).primaryTextTheme.subtitle1,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyTheme.primaryLightColor),
                child: IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    const AssetImage('assets/images/Icon_check.png'),
                    color: MyTheme.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
