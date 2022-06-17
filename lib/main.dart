import 'package:flutter/material.dart';
import 'package:matrix_clouds/layout/home_layout.dart';
import 'network/dio.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
        ),
        primarySwatch: Colors.teal,
      ),
      home: HomeLayout(),
    );
  }
}
