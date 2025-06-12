import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:simple_flutter/photo_screen.dart';

/// Flutter 의 맨 처음 시작점
void main() {
  // runApp() 함수를 통해 괄호() 안에 주어진 위젯을 실행 시킴!
  runApp( const MaterialApp(home: MyApp() ) );
}

/// StatelessWidget : state 가 변동되지 않는 화면
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const TAG = "TestLog";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    // 테스트 코드
    testCode();

    return Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
          backgroundColor: Colors.blue[100],
        ),
        body: Column(
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
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PhotoScreen()
                  )
              ),
              child: Text("cat photo"),
            )

          ],
        )
    );
  }

  /*
  * 기본 문법 관련 테스트 코드
  * */
  void testCode() {
    debugPrint("$TAG => dart start!!");

    // 숫자 타입
    int i = 42; // 정수
    double d = 3.14; // 상수
    num n = 10; // int나 double의 상위 타입

    // 문자열 타입
    String str = "안녕하세요.";

    // boolean 타입
    bool isTrue = true;
    bool isFalse = false;

    // 리스트 배열
    List<int> numList = [1,2,3,4];

    // 맵
    Map<String, dynamic> maps = {
      'name': '홍길동',
      'age': 30,
      'isStudent': false
    };

    // 집합 (중복 없는 컬렉션)
    Set<String> uniqueNames = {'홍길동', '김철수', '이영희'};

    // final: 런타임에 값이 결정되는 상수(값 재할당 불가)
    final String name = '홍길동';

    // const: 컴파일 타임에 값이 결정되는 상수(값 재할당 불가)
    const int max = 100;

    // late 변수는 초기화 전에 접근하면 런타임 오류 발생
    late String address;

    // 동적타입: dynamic 타입은 변수의 타입을 런타임까지 확정하지 않음. 타입 안전성이 필요하지 않을 때 사용!
    dynamic v = '문자열';
    v = 42;
    v = true;

    // 원시 문자열
    String escaped = 'C:\\Program Files\\Dart';
    String raw = r'C:\\Program FIles\Dart'; // 원시 문자열(이스케이프 처리 안함)
  }
}
