import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/// Dart Log 표시 관련 유틸 클래스
/// 팩토리 생성자 기법 사용 => 싱글톤과 유사
class LoggerDart {
  final String name;

  // Logger 인스턴스 캐시
  static final Map<String, LoggerDart> _cache = <String, LoggerDart>{};

  // private 생성자
  LoggerDart._internal(this.name);

  // 팩토리 생성자
  factory LoggerDart(String name) {
    // 캐시에 이미 있으면 기존 인스턴스 반환
    return _cache.putIfAbsent(name, () => LoggerDart._internal(name));
  }

  // 커스텀 debugPrint
  static void customDebugPrint(String tag, String message, {LogLevel level = LogLevel.info}) {
    final trace = StackTrace.current;
    final traceString = trace.toString().split('\n')[1];
    final location = traceString.replaceFirst(RegExp(r'#1\s+'), '');
    final levelString = level.toString().split('.').last.toUpperCase();
    final color = _colorForLevel(level);
    debugPrint('$color[$levelString][$location] $tag => $message\x1B[0m'); // LogCat이 아닌 콘솔내에서 출력
  }

  // 커스텀 debugPrint 전용
  static String _colorForLevel(LogLevel level) {
    switch (level) {
      case LogLevel.error:
        return '\x1B[31m'; // 빨강
      case LogLevel.warning:
        return '\x1B[33m'; // 노랑
      default:
        return '\x1B[34m'; // 파랑
    }
  }

  // 커스텀 printLog
  static void customLog(String tag, Object message, {LogLevel level = LogLevel.info, int maxLineLength = 50}) {
    final trace = StackTrace.current;
    final traceString = trace.toString().split('\n')[1];
    final location = traceString.replaceFirst(RegExp(r'#1\s+'), '').trim();
    final prefix = _emojiForLevel(level);

    // 로그 테두리 라인
    final borderTop = '┌───────────────────────────────────────────────────────────────────────────────────────';
    final borderBottom = '└───────────────────────────────────────────────────────────────────────────────────────';

    // 메시지를 maxLineLength 기준으로 줄바꿈하는 함수
    List<String> wrapMessage(String msg, int maxLen) {
      List<String> lines = [];
      int start = 0;
      while (start < msg.length) {
        int end = start + maxLen;
        if (end > msg.length) end = msg.length;
        lines.add(msg.substring(start, end));
        start = end;
      }
      return lines;
    }

    final messageStr = message.toString();
    final wrappedLines = wrapMessage(messageStr, maxLineLength);

    if (kDebugMode) {
      print('[$tag] $borderTop');
      print('[$tag] $prefix $location');
      print('[$tag]   log =>');

      for (int i = 0; i < wrappedLines.length; i++) {
        final lineNumber = (i + 1).toString().padLeft(2, '0');
        final indent = i == 0 ? '' : ' '; // 첫 줄은 기본, 이후 들여쓰기
        print('[$tag]   $lineNumber │ $indent${wrappedLines[i]}');
      }

      print('[$tag] $borderBottom');
    }
  }

  // 커스텀 printLog 관련
  static String _emojiForLevel(LogLevel level) {
    switch (level) {
      case LogLevel.verbose:
        return '🔍 VERBOSE';
      case LogLevel.debug:
        return '🛠️ DEBUG';
      case LogLevel.error:
        return '❌ ERROR';
      case LogLevel.warning:
        return '⚠️ WARNING';
      case LogLevel.info:
        return 'ℹ️ INFO';
    }
  }
}

// Log level 관련 정의
enum LogLevel { info, warning, error, debug, verbose }