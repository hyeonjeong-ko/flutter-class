import 'package:flutter/material.dart';
import 'package:splash_screen/screen/home_screen.dart';

void main() {
  // Flutter프레임워크가 앱을 실행할 준비가 될때까지 기다린다. 웹뷰최신플러그인 쓸때필요
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
