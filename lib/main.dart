import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:joke_app/utility/colors.dart';
import 'package:joke_app/view%20models/home_view_model.dart';
import 'package:joke_app/view/screens/home_screen.dart';

import 'service/hive.dart';

HomeViewModel? homeVM;
void main() {
  initiateVM();
  runApp(const MyApp());
}

void initiateVM() {
  homeVM=HomeViewModel();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppHive.init();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: BrandColors.primary,useMaterial3: false),
      home:const HomeScreen(),
    );
  }
}