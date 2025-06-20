import 'package:flutter/material.dart';

import '../screens/s_product_list.dart';

// 해당 클래스 안에 별도의 Navigator 를 생성하여
// 그 안에서의 Navigator 이동되는 페이지 들은 ProductFlow 를 감싸고 있는
// MultiProvider 범위에 속한다!
// 즉 ProductListPage 내 Navigator 로 이동하는 페이지 들은 MultiProvider 트리 안에 존재 한다!
class ProductFlow extends StatelessWidget {
  const ProductFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const ProductListPage(),
        );
      },
    );
  }
}
