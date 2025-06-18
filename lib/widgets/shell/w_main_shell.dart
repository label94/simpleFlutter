
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_flutter/main.dart';

import '../../screens/s_main_page.dart';

/// 공통 App bar 가 있는 Main Shell widget
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  // 위젯의 state 객체 생성
  @override
  State<MainShell> createState() => MainShellState();
}

class MainShellState extends State<MainShell> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  String _appBarTitle = "홈";

  // 현재 페이지가 홈인지 유무
  bool _isHome = true;

  void _onNavigate(String routeName, Widget page, {required String title}) {
    _navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    );

    setState(() {
      _appBarTitle = title;
      _isHome = title == "홈";
    });
  }

  void _onBack() {
    if (_navigatorKey.currentState?.canPop() ?? false) {
      _navigatorKey.currentState?.pop();

      setState(() {
        _appBarTitle = '홈';
        _isHome = true;
      });
    }
  }

  // 안드로이드 전용 백 물리키 처리
  Future<void> _handlePopInvoked(bool didPop) async {
    final navigator = _navigatorKey.currentState;
    if (navigator != null && navigator.canPop()) {
      navigator.pop();
      setState(() {
        _appBarTitle = '홈';
        _isHome = true;
      });
    }
  }

  /* UI 그리기 */
  @override
  Widget build(BuildContext context) {
    final child = Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
          backgroundColor: Colors.blue[100],
          // 현재 페이지가 홈인 경우에만 앱바에 뒤로가기 버튼 추가!
          leading: !_isHome
              ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _onBack,
          ): null,
        ),
        body: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: (_) => MyApp(onNavigate: _onNavigate));
          },
        )
    );

    // os 별 분기 처리
    if (Platform.isAndroid) {
      return PopScope(
        canPop: _isHome,
        onPopInvoked: _handlePopInvoked,
        child: child,
      );
    } else {
      return child;
    }
  }
}