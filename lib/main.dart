import 'package:day_counter_ex/screens/home.screen.dart';
import 'package:day_counter_ex/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day Counter',
      debugShowCheckedModeBanner: false,
      theme: appTheme(), // theme 설정을 다른 파일로 분리
      home: const HomeScreen(),
    );
  }
}
