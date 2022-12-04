import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/settings_screen/settings_screen.dart';
import 'package:todo_app/home/task_list_screen/task_list_bottom_sheet.dart';
import 'package:todo_app/home/task_list_screen/task_list_screen.dart';
import 'package:todo_app/myTheme.dart';
import 'package:todo_app/provider/app_provider.dart';

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
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.toDoList,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
            side: BorderSide(
                color: provider.isDarkTheme()
                    ? MyTheme.bottomNavBarColor
                    : MyTheme.whiteColor,
                width: 4)),
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
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage('assets/images/icon_task_list.png'),
              ),
              label: '',
              backgroundColor: MyTheme.bottomNavBarColor,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage('assets/images/Icon_settings.png'),
              ),
              label: '',
              backgroundColor: provider.isDarkTheme()
                  ? MyTheme.bottomNavBarColor
                  : MyTheme.whiteColor,
            ),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => TaskListBottomSheet(),
    );
  }
}
