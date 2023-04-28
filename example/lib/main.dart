import 'dart:io';

import 'package:flutter/material.dart';

import 'home_page_android.dart';
import 'home_page_ios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Platform.isAndroid
            ? const HomePageAndroid(title: 'Flutter Demo Home Page')
            : const HomePageIos(title: 'Flutter Demo Home Page'));
  }
}
