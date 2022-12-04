import 'package:flutter/material.dart';
import 'package:todo_app/myTheme.dart';

class ItemTaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: MyTheme.whiteColor,
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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 23),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyTheme.primaryLightColor),
            child: ImageIcon(
              const AssetImage('assets/images/Icon_check.png'),
              color: MyTheme.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}