import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/myTheme.dart';
import 'package:todo_app/provider/app_provider.dart';

import 'home/home_screen.dart';
import 'home/task_list_screen/edit_task_widget.dart';

String saveLanguage = 'en';
ThemeMode saveTheme = ThemeMode.light;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  //shared preference
  final prefs = await SharedPreferences.getInstance();
  saveLanguage = prefs.getString('language') ?? '';
  if (prefs.getString('theme') == 'light') {
    saveTheme = ThemeMode.light;
  } else if (prefs.getString('theme') == 'dark') {
    saveTheme = ThemeMode.dark;
  }
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        EditTaskWidget.routeName: (context) => EditTaskWidget(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.appTheme,
    );
  }
}
