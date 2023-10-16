import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//단축키 stful
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(
    initialPage: 0,
  );

  // initState에서 Hot reload를 했을때는 build 만 다시 실행됨
  // 변경사항을 반영하려면 재시작을 해주어야 함
  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      print('Timer!');
      int currentPage = controller.page!.toInt(); // ! 컨트롤러-페이지연결 확신
      int nextPage = currentPage + 1;

      // 이미지 끝에서 -> 다시 맨 앞으로
      if (nextPage > 4) {
        nextPage = 0;
      }

      // 이미지 자동으로 다음페이지로 이동
      controller.animateToPage(
        nextPage,
        duration: const Duration(microseconds: 400),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    // State가 죽을때 실행됨
    controller.dispose(); // 컨트롤러는 반드시 해제해야함!

    if (timer != null) {
      timer!.cancel(); // !는 null이 될 수 없다는 가정을 강제로 넣어주는 문법
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 상태바 색깔 변경
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
        body: PageView(
      // PageView가 생성될때 controller가 붙음
      controller: controller,
      // 자동스크롤
      children: [1, 2, 3, 4, 5]
          .map(
            (e) => Image.asset(
              'asset/img/image_$e.jpeg',
              fit: BoxFit.cover,
            ),
          )
          .toList(),
    ));
  }
}
