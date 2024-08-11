import 'package:flutter/material.dart';
import 'package:habit_tracker_app/DataBase/habit_database.dart';
import 'package:habit_tracker_app/provider/theme_provider.dart';
import 'package:habit_tracker_app/view/screen/home_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchData();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HabitDatabase(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
      },
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
