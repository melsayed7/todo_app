import 'package:flutter/material.dart';

class TaskListBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Task',
            style: Theme.of(context).primaryTextTheme.headline2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 18,
          ),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Enter your task title'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Enter your task description'),
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
            'Select Date',
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          const SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              '7/12/2022',
              style: Theme.of(context).primaryTextTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'ADD',
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
