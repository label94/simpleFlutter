
library;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 기본 Provider 예제

/* 데이터 모델 */
class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});
}

/* Provider */
class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  // ui 그리기
  @override
  Widget build(BuildContext context) {
    // Provider 에서 데이터 가져오기
    final user = Provider.of<User>(context);

    return Container(
      width: MediaQuery.of(context).size.width, // 현재 기기 사이즈 만큼 설정,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('이름 : ${user.name}'),
            Text('나이 : ${user.age}')
          ],
        ),
      ),
    );
  }
}

