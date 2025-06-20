import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter/screens/photo_screen.dart';
import 'package:simple_flutter/screens/s_change_notifier_provider.dart';
import 'package:simple_flutter/screens/s_sample_provider.dart';
import 'package:simple_flutter/screens/s_sample_widget_page.dart';
import 'package:simple_flutter/screens/s_simple_state_ful.dart';
import 'package:simple_flutter/screens/s_user_screen.dart';
import 'package:simple_flutter/screens/s_value_notifier.dart';
import 'package:simple_flutter/utils/logger_dart.dart';

/// StatelessWidget : state 가 변동되지 않는 화면
class MyApp extends StatelessWidget {
  final void Function(String routeName, Widget page, {required String title}) onNavigate;
  const MyApp({super.key, required this.onNavigate});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('코딩백조'),
                  Text('2025')
                ],
              ),
            ),
            const Text('안녕하세요!'),

            const SizedBox(height: 40),

            const Text('전 고양이를 좋아합니다'),

            const SizedBox(height: 20),

            // 버튼
            ElevatedButton(
              onPressed: () {
                onNavigate('photo', const PhotoScreen(), title: "cat photo");
              },
              child: const Text("cat photo"),
            ),

            const SizedBox(height: 20),

            // 두 번째 버튼
            ElevatedButton(
              onPressed: () {
                onNavigate('posts', const PostListScreen(), title: "정보");
              },
              child: Text("실제 데이터 가져오기"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                onNavigate('user', const Counter(initialCount: 0), title: "카운터");
              },
              child: const Text('Stateful 위젯'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                onNavigate('valueNotifier', const TodoListWithValueNotifier(), title: "valueNotifier");
              },
              child: const Text('valueNotifier 예제'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                onNavigate('sample', const SampleBaseWidgetScreen(), title: "샘플 위젯");
              },
              child: const Text('샘플 위젯'),
            ),

            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // 가로 스크롤
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // 기본 Provider 사용
                      onNavigate('user', Provider<User>(
                        create: (_) => User(name: '홍길동', age: 30),
                        child: UserInfoPage(),
                      ), title: "사용자 정보");
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    child: const Text('기본 provider'),
                  ),

                  const SizedBox(width: 10),

                  OutlinedButton(
                    onPressed: () {
                      // ChangeNotifier provider 사용
                      onNavigate('changeNotifier', ChangeNotifierProvider<ChangeCounter>(
                        create: (_) => ChangeCounter(),
                        child: ChangeCounterScreen(),
                      ) , title: "ChangeNotifier provider");
                    },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    child: const Text('ChangeNotifier provider'),
                  ),

                ],
              ),
            ),

          ],
        ),
    );
  }
}