
import 'package:flutter/material.dart';

import '../utils/logger_dart.dart';

/* StateFul 예제 */
/// 위젯 사용 사례
/// 1) 사용자 입력 처리 : 폼, 텍스트 입력, 체크박스 등
/// 2) 애니메이션 및 변환 효과 : 상태에 따라 변하는 UI
/// 3) 데이터 로딩 및 진행 상황 표시 : 로딩 인디케이터, 진행 바
/// 4) 데이터 또는 주기적 업데이트 : 시계, 카운트 다운 타이머
/// 5) 내부적으로 데이터를 관리하는 컴포넌트 : 자체 상태가 필요한 경우
/// ex) => 로그인 폼, 이미지 슬라이더, 카운터, 토글 버튼

class Counter extends StatefulWidget {
  final int initialCount;

  // 상태 값을 유지하기 위해 key 를 사용
  const Counter({super.key, this.initialCount = 0});

  // 위젯의 State 객체를 생성
  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  // Log TAG
  static const tag = "TestLog_Counter";

  late int _count;

  /* 초기화 */
  @override
  void initState() {
    super.initState();
    LoggerDart.customLog(tag, "initState() Counter 위젯 초기화");

    // 위젯 초기화 (State 객체 생성 된 직후 한번만 호출!)
    _count = widget.initialCount;
  }

  /* 위젯이 업데이트 될 때 호출 */
  @override
  void didUpdateWidget(covariant Counter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialCount != widget.initialCount) {
      // 현재 상태가 이전에 있던 상태와 같지 않으면 해당 위젯 업데이트
      _count = widget.initialCount;
    }

    LoggerDart.customLog(tag, "didUpdateWidget() 초기 카운트 값 변경 ; $_count");
  }

  /* State 객체가 제거 될 때 호출(리소스 정리하는 데 사용) */
  @override
  void dispose() {
    LoggerDart.customLog(tag, "dispose() Counter 위젯 제거");
    super.dispose();
  }

  /* 상태 변경 함수 */
  void _increment() {
    // 상태 업데이트
    setState(() {
      _count++;
      LoggerDart.customLog(tag, "setState() 카운트 값 변경 ; $_count");
    });
  }

  /* UI 구성 */
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 5),
        borderRadius: BorderRadius.circular(19.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 컬럼의 크기를 자식 크기만큼 만 줄여서 꽉 차지 않게 설정
        children: [
          Text(
            '현재 카운트 : $_count',
            style: const TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: _increment,
            child: const Text('카운트 증가'),
          ),
        ],
      ),
    );
  }
}