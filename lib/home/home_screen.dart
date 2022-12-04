import 'package:flutter/material.dart';
import 'package:todo_app/home/settings_screen/settings_screen.dart';
import 'package:todo_app/home/task_list_screen/task_list_bottom_sheet.dart';
import 'package:todo_app/home/task_list_screen/task_list_screen.dart';
import 'package:todo_app/myTheme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    TaskListScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 157,
        title: Padding(
          padding: const EdgeInsets.only(left: 52),
          child: Text(
            'To Do List',
            style: Theme.of(context).primaryTextTheme.headline1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
            side: BorderSide(color: MyTheme.whiteColor, width: 4)),
        child: Icon(
          Icons.add,
          color: MyTheme.whiteColor,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/icon_task_list.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/Icon_settings.png'),
                ),
                label: ''),
          ],
        ),
      ),
      //body: tabs[selectedIndex],
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => TaskListBottomSheet(),
    );
  }
}
