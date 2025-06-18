
import 'package:flutter/material.dart';

import '../widgets/w_base_text.dart';

/// 기본 위젯 사용 샘플 화면
class SampleBaseWidgetScreen extends StatelessWidget {
  const SampleBaseWidgetScreen({super.key});

  /* UI 그리기 */
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width, // 현재 기기 사이즈 만큼 설정
        height: MediaQuery.of(context).size.height, // 현재 기기 사이즈 만큼 설정
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

                  BaseText(text: "Hello World", fontSize: 20), // 샘플 텍스트 위젯
                ]
          ),
        ),
      ),
    );
  }
}