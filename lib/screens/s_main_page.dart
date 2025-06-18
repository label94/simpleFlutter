import 'package:flutter/material.dart';
import 'package:simple_flutter/screens/photo_screen.dart';
import 'package:simple_flutter/screens/s_simple_state_ful.dart';
import 'package:simple_flutter/screens/s_user_screen.dart';
import 'package:simple_flutter/utils/logger_dart.dart';

import '../widgets/shell/w_main_shell.dart';

/// StatelessWidget : state 가 변동되지 않는 화면
class MyApp extends StatelessWidget {
  final void Function(String routeName, Widget page, {required String title}) onNavigate;
  const MyApp({super.key, required this.onNavigate});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // main Shell 관련 상태
    final mainShellState = context.findAncestorStateOfType<MainShellState>();

    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('코딩백조'),
                  Text('2025')
                ],
              ),
            ),
            Text('안녕하세요!'),
            SizedBox(height: 40),
            Text('전 고양이를 좋아합니다'),
            SizedBox(height: 20),

            // 버튼
            ElevatedButton(
              onPressed: () {
                onNavigate('photo', const PhotoScreen(), title: "cat photo");
              },
              child: Text("cat photo"),
            ),

            SizedBox(height: 20),

            // 두 번째 버튼
            ElevatedButton(
              onPressed: () {
                onNavigate('posts', const PostListScreen(), title: "정보");
              },
              child: Text("실제 데이터 가져오기"),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                onNavigate('user', const Counter(initialCount: 0), title: "카운터");
              },
              child: Text('Stateful 위젯'),
            )

          ],
        );
  }
}