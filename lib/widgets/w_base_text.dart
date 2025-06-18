import 'package:flutter/material.dart';

/// sample base text 위젯
class BaseText extends StatelessWidget {
  final String text; // 텍스트
  final double fontSize; // 폰트 사이즈
  final Color color; // 폰트 색상

  const BaseText({super.key, required this.text, required this.fontSize, this.color = Colors.black});

  /* UI 그리기 */
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        // style
        fontWeight: FontWeight.normal, // 굵기
        fontSize: fontSize, // 폰트 사이즈
        color: color, // 색상
        letterSpacing: 1.2, // 자간
        height: 1.4, // 줄 간격
      ),
      textAlign: TextAlign.center, // 텍스트 정렬 방법
      maxLines: 1, // 최대 표시 줄 수
      overflow: TextOverflow.ellipsis, // 내용이 공간을 초과할 때 처리
    );
  }
}