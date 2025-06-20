
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ChangeNotifier 구현

class ChangeCounter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  // 값 증가
  void increment() {
    _count++;
    notifyListeners(); // 변경 사항을 구독자들에게 알림
  }
}

class ChangeCounterScreen extends StatelessWidget {
  const ChangeCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Consumer 위젯으로 상태 읽기
            // 내부 지정 타입에 대한 객체를 구독하며, 상태가 변경 되면(notifyListeners() 호출)) builder 안의 UI만 리빌드
            // child 매개변수를 통하여 재빌드 되지 않는 위젯 지정 가능
            Consumer<ChangeCounter>(
              builder: (context, counter, child) {
                return Text(
                  '카운트 : ${counter.count}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              // provider 에서 읽고 메서드 호출
              // listen => false : 데이터만 읽고 변경 감지는 하지 않음 / true : 데이터 변경 시 위젯 재 빌드
              // 데이터가 변경이 되고 그 데이터를 표시하는 UI는 consumer 가 하기 때문에 false로 설정!!
              // context.read<Counter>().increment() 와 동일!
              onPressed: () => Provider.of<ChangeCounter>(context, listen: false).increment(),
              child: Text('증가'),
            )
          ],
        ),
      ),
    );
  }
}