import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:simple_flutter/screens/photo_screen.dart';
import 'package:simple_flutter/screens/s_user_screen.dart';
import 'package:simple_flutter/utils/logger_dart.dart';
import 'dart:async';

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
            ),

            SizedBox(height: 20),

            // 두 번째 버튼
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostListScreen()
                )
              ),
              child: Text("실제 데이터 가져오기"),
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

    // private 변수 예시
    String _privateVar = '이 변수는 외부에서 접근할 수 없습니다.';

    // 생성자 관련 샘플
    final person1 = Person('홍길동', 30);
    final person2 = Person.guest();
    final person3 = Person.child('아이');
    final person4 = Person.adult('성인');
    final person5 = Person.reDirect('손님');
    final person6 = Person.fromJson({'name' : '김철수', 'age' : 25});

    if (kDebugMode) {
      print('${person1.name}, ${person1.age}');
      print('${person2.name}, ${person2.age}');
      print('${person3.name}, ${person3.age}');
      print('${person4.name}, ${person4.age}');
      print('${person5.name}, ${person5.age}');
      print('${person6.name}, ${person6.age}');
    }

    // 초기화 리스트
    final sample1 = SampleOne('홍길동', 30);
    final sample2 = SampleOne.custom('아이', 10);
    if (kDebugMode) {
      print('${sample1.name}, ${sample1.age}, ${sample1.birthDate}');
      print('${sample2.name}, ${sample2.age}, ${sample2.birthDate}');
    }
    
    LoggerDart.customLog("TestLog", "test test!!", level: LogLevel.error);

    // 추상클래스 관련
    final dog = Dog("Bob");
    dog.sleep();
    dog.makeSound();

    final cat = Cat("miu");
    cat.sleep();
    cat.makeSound();

    final car = Car();
    car.move();
    car.stop();

    final airplane = Airplane();
    airplane.move();
    airplane.stop();

    final bird = Bird("참새");
    bird.eat();
    bird.fly();

    final fish = Fish("물고기");
    fish.eat();
    fish.swim();

    final duck = Duck("오리");
    duck.eat();
    duck.fly();
    duck.swim();

    // 컬렉션 관련
    testCollection();

    // 비동기 처리
    testFuture();
  }

  // 컬렉션
  void testCollection() {
    // 리스트 관련
    testList();

    // Set 관련
    testSet();

    // map 관련
    testMap();
  }

  // 리스트
  void testList() {
    // 리터럴을 사용한 생성
    var fruits = ['apple', 'banana', 'orange'];

    // 타입을 지정한 리스트
    List<String> names = ['홍길동', '김철수', '이영희'];

    // 빈 리스트 생성
    var emptyList = <int>[];

    // 생성자를 이용한 리스트 생성
    var fixedList = List<int>.filled(5, 0); // [0, 0, 0, 0, 0]
    var growableList = List<int>.empty(growable: true); // 빈 리스트 생성, 나중에 추가가 가능한 리스트 생성
    var generatedList = List<int>.generate(5, (i) => i * i ); // [0, 1, 4, 9, 16] , 크기가 5고정이고, 주어진 length 만큼 반복하면서 리스트 생성

    // 연산
    var numbers1 = [1,2,3,4,5];

    // 매핑 (각 요소 변환)
    var doubled = numbers1.map((n) => n * 2).toList();
    LoggerDart.customLog("TestLog", doubled.toString()); // 2,4,6,8,10

    // 필터링 (조건에 맞는 요소만 선택)
    var evenNumbers = numbers1.where((n) => n.isEven).toList(); // 리스트 안의 짝수만 필터링하여 새 리스트 생성
    LoggerDart.customLog("TestLog", evenNumbers.toString()); // 2,4

    // fold (누적 연산)
    var sum = numbers1.fold<int>(0, (prev, curr) => prev + curr); // 왼쪽부터 오른쪽으로 누적
    LoggerDart.customLog("TestLog", sum.toString()); // 15

    // reduce (항목들을 하나로 결합)
    var product = numbers1.reduce((a, b) => a * b); // 왼쪽부터 치례대로 누적 처리해서 곱 연산 수행
    LoggerDart.customLog("TestLog", product.toString()); // 120

    // 평탄화 (중첩 리스트를 단일 리스트로)
    var nested = [[1,2], [3,4], [5]];
    var flattened = nested.expand((list) => list).toList();
    LoggerDart.customLog("TestLog", flattened.toString()); // 1,2,3,4,5

    var numbers2 = [1,2,3,4,5,6,7,8,9,10];

    // 리스트 범위 추출 (sublist)
    var slice = numbers2.sublist(2,5);
    LoggerDart.customLog("TestLog", slice.toString()); // 3,4,5

    // 리스트 복사
    var copy = List<int>.from(numbers2);
    LoggerDart.customLog(TAG, copy.toString());

    // 모든 요소 바꾸기
    numbers2.replaceRange(0, 3, [99, 98, 97]); // 0~3 번째 데이터 변경
    LoggerDart.customLog(TAG, numbers2.toString());

    // 뒤집기
    var reversed = numbers2.reversed.toList();
    LoggerDart.customLog(TAG, reversed.toString());

    // 리스트의 특정 부분 채우기
    numbers2.fillRange(5, 8, 0);
    LoggerDart.customLog(TAG, numbers2.toString()); // 99,98,97,4,5,0,0,0,9,10
  }

  // Set
  void testSet() {
    // 집합 생성
    var fruits = {'apple', 'banana', 'orange'};

    // 타입을 지정한 집합
    Set<String> names = {'홍길동', '김철수', '이영희'};

    // 빈 집합 생성
    var emptySet = <int>{};

    // 리스트에서 생성 (중복 제거)
    var numbers = <int>{1,2,2,3,3,3,4,5,5};
    LoggerDart.customLog(TAG, numbers.toString()); // 1,2,3,4,5

    var set1 = {1,2,3,4,5};
    var set2 = {4,5,6,7,8};

    // 합집합
    var union = set1.union(set2);
    LoggerDart.customLog(TAG, union.toString());

    // 교집합
    var intersection = set1.intersection(set2);
    LoggerDart.customLog(TAG, intersection.toString());

    // 차집합
    var difference = set1.difference(set2);
    LoggerDart.customLog(TAG, difference.toString());

    // 요소 추가
    set1.add(6);
    LoggerDart.customLog(TAG, set1.toString());

    // 여러 요소 추가
    set1.addAll({7,8,9});
    LoggerDart.customLog(TAG, set1.toString());

    // 요소 제거
    set1.remove(9);
    LoggerDart.customLog(TAG, set1.toString());

    // 존재 여부 확인
    LoggerDart.customLog(TAG, set1.contains(5));
  }

  // map
  void testMap() {
    var person = {
      'name': '홍길동',
      'age': 30,
      'isStudent': false
    };

    // 값 접근
    LoggerDart.customLog(TAG, person['name'] ?? "");

    // 키 확인
    LoggerDart.customLog(TAG, person.containsKey('name'));

    // 값 확인
    LoggerDart.customLog(TAG, person.containsValue('홍길동'));

    // 조건부 추가
    person.putIfAbsent('gender', () => '남성');
    LoggerDart.customLog(TAG, person.toString());
  }

  // 비동기 처리
  void testFuture() {
    // LoggerDart.customLog(TAG, "비동기 처리 시작");
    //
    // fetchData().then((data) {
    //   LoggerDart.customLog(TAG, "데이터 : $data");
    // }).catchError((error) {
    //   LoggerDart.customLog(TAG, "에러 : $error", level: LogLevel.error);
    // }).whenComplete(() {
    //   LoggerDart.customLog(TAG, "비동기 처리 완료");
    // });
    //
    // LoggerDart.customLog(TAG, "비동기 처리 종료"); // future 가 완료 되기 전에 호출 됨
    //
    // getFuture().then((data) {
    //   LoggerDart.customLog(TAG, "데이터2 : $data");
    // }).whenComplete(() {
    //   LoggerDart.customLog(TAG, "비동기 처리 완료2");
    // });
    //
    // complexOperation().then((data) {
    //   LoggerDart.customLog(TAG, "데이터3 : $data");
    // }).whenComplete(() {
    //   LoggerDart.customLog(TAG, "비동기 처리 완료3");
    // });

    // Future 체인 => 순서대로 제어 됨
    fetchUserId()
        .then((id) => fetchUserData(id))
        .then((userData) => saveUserData(userData))
        .then((_) => LoggerDart.customLog(TAG, "데이터 저장 완료"));

    fetchAsyncData().then((data) {
      LoggerDart.customLog(TAG, "데이터 : $data");
    }).whenComplete(() {
      LoggerDart.customLog(TAG, "비동기 처리 완료~~");
    });

    // 순차 처리
    sequentialProcessing();

    // 병렬 처리
    parallelProcessing();

    // any
    anyExample();

    // forEach
    forEachExample();

    // wait
    waitExample();

    // Stream 관련
    testStream();
  }

  // 즉시 Future 객체를 반환
  Future<String> fetchData() {
    return Future.delayed(Duration(seconds: 3), () {
      return '서버에서 받은 데이터';
    });
  }

  // 이미 알고 있는 값으로 즉시 완료 되는 Future를 생성
  Future<String> getFuture() {
    return Future.value('이미 알고 있는 값');
  }

  // 복잡한 비동기 로직 제어
  Future<String> complexOperation() {
    final completer = Completer<String>();

    // 비동기 작업
    Timer(Duration(seconds: 2), () {
      if (DateTime.now().second % 2 == 0) {
        completer.complete('성공');
      } else {
        completer.completeError('실패');
      }
    });

    return completer.future;
  }

  // Future 체이닝
  // 여러 비동기 작업을 순차적으로 처리할 때 사용
  Future<String> fetchUserId() => Future.value('user123');
  Future<Map<String, dynamic>> fetchUserData(String id) => Future.value(
      {'id': id, 'name': '홍길동', 'age': 30});
  Future<void> saveUserData(Map<String, dynamic> userData) {
    LoggerDart.customLog(TAG, "saveUserData");
    return Future.value();
  }

  // async
  // async 키워드를 사용 시 무조건 Future 형태를 리턴하기 때문에, 래핑할 필요가 없음!!
  Future<String> fetchAsyncData() async {
    return 'aync data';
  }

  // 순차 처리
  Future<void> sequentialProcessing() async {
    final startTime = DateTime.now();

    final result1 = await task1(); // 2초 소요
    final result2 = await task2(); // 3초 소요
    final result3 = await task3(); // 1초 소요

    // 총 약 6초 소요
    LoggerDart.customLog(TAG, '순차 처리 -> 모든 작업 완료 : $result1, $result2, $result3', level: LogLevel.error);
    LoggerDart.customLog(TAG, '순차 처리 -> 총 소요 시간 : ${DateTime.now().difference(startTime).inSeconds}초', level: LogLevel.error);
  }

  // 병렬 처리
  Future<void> parallelProcessing() async {
    final startTime = DateTime.now();

    // 병렬
    final result = await Future.wait(
      [task1(), task2(), task3()]
    );

    // 총 약 3초 소요 (가장 오래 걸리는 작업 기준)
    LoggerDart.customLog(TAG, '병렬 처리 -> 모든 작업 완료 : $result', level: LogLevel.error);
    LoggerDart.customLog(TAG, '병렬 처리 -> 총 소요 시간 : ${DateTime.now().difference(startTime).inSeconds}초', level: LogLevel.error);
  }

  Future<String> task1() => Future.delayed(Duration(seconds: 2), () => '작업1 결과');
  Future<String> task2() => Future.delayed(Duration(seconds: 3), () => '작업2 결과');
  Future<String> task3() => Future.delayed(Duration(seconds: 1), () => '작업3 결과');

  // Future any
  // 여러 Future 중 하나라도 완료되면 즉시 완료
  Future<void> anyExample() async {
    final result = await Future.any([
      Future.delayed(Duration(seconds: 3), () => '느린 작업'),
      Future.delayed(Duration(seconds: 1), () => '빠른 작업'),
      Future.delayed(Duration(seconds: 2), () => '중간 작업')
    ]);

    LoggerDart.customLog(TAG, 'any => $result');
  }

  // forEach
  // 리스트의 각 항목에 대해 비동기 작업을 순차적으로 수행
  Future<void> forEachExample() async {
    final items = ['아이템1', '아이템2', '아이템3'];

    await Future.forEach(items, (item) async {
      await Future.delayed(Duration(microseconds: 500));
      LoggerDart.customLog(TAG, 'forEach 처리 중 => $item');
    });

    LoggerDart.customLog(TAG, 'forEach 처리 완료');
  }

  // wait
  // 여러 future가 모두 완료할 때 까지 대기
  Future<void> waitExample() async {
    final results = await Future.wait(
      [
        Future.delayed(Duration(seconds: 1), () => '결과1'),
        Future.delayed(Duration(seconds: 2), () => '결과2'),
        Future.delayed(Duration(seconds: 3), () => '결과3')
      ]
    );

    LoggerDart.customLog(TAG, 'waitExample => $results', level: LogLevel.warning);
  }

  // Stream
  void testStream() async {
    // 스트림 구독
    final stream = countStream(5);

    // 첫 번째 방법 : await for
    LoggerDart.customLog(TAG, "첫 번째 방법 - await for 사용");
    await for (final value in stream) {
      LoggerDart.customLog(TAG, "첫 번째 방법 => value : $value");
    }

    // 두 번쨰 방법 : listen
    LoggerDart.customLog(TAG, "두 번째 방법 - listen 사용");
    countStream(5).listen(
        (data) => LoggerDart.customLog(TAG, "두 번째 방법 => value : $data"),
        onError: (error) => LoggerDart.customLog(TAG, "두 번째 방법 => 에러 : $error", level: LogLevel.error),
        onDone: () => LoggerDart.customLog(TAG, "두 번째 방법 => 완료")
    );

    // getControllerStream
    getControllerStream().listen(
        (data) => LoggerDart.customLog(TAG, "getControllerStream => value : $data"),
        onError: (error) => LoggerDart.customLog(TAG, "getControllerStream => 에러 : $error", level: LogLevel.error),
        onDone: () => LoggerDart.customLog(TAG, "getControllerStream => 완료")
    );

    // getIterableStream
    getIterableStream().listen(
        (data) => LoggerDart.customLog(TAG, "getIterable => value : $data"),
        onError: (error) => LoggerDart.customLog(TAG, "getIterable => 에러 : $error", level: LogLevel.error),
        onDone: () => LoggerDart.customLog(TAG, "getIterable => 완료")
    );

    // Stream transform
    streamTransformations();

    // broadcastStream
    broadcastStream();
  }

  // Stream 기본 형태
  Stream<int> countStream(int max) async* {
    for (int i = 1; i <= max; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i; // 스트림에 값 추가
    }
  }

  // Stream Controller
  // 더 세밀한 제어가 필요할 때 사용
  Stream<int> getControllerStream() {
    final controller = StreamController<int>();

    // 데이터 추가
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick <= 5) {
        controller.add(timer.tick);
      } else {
        controller.close();
        timer.cancel();
      }
    });

    return controller.stream;
  }

  // 반복 가능한 객체에서 스트림을 생성
  Stream<int> getIterableStream() {
    return Stream.fromIterable([1,2,3,4,5]);
  }

  // Stream periodic
  // 주기적으로 이벤트를 생성하는 스트림
  // 원래 periodic 는 무한 스트림이기 때문에, 종료 조건이 필요함!
  Stream<int> getPeriodicStream() {
    return Stream.periodic(Duration(seconds: 1), (count) => count + 1).take(5); // 처음 5개 이벤트 만 가져옴
  }

  // Stream 변환
  void streamTransformations() async {
    final stream = Stream.fromIterable([1,2,3,4,5,6,7,8,9,10]);

    // 변환 : 각 값을 두배로 설정
    final doubledStream = stream.map((value) => value * 2);

    // 필터링 : 짝수만 필터링
    final evenStream = doubledStream.where((value) => value.isEven);

    // 제한 : 처음 3개 이벤트 만
    final limitedStream = evenStream.take(3);

    // 결과 출력
    limitedStream.listen(
        (data) => LoggerDart.customLog(TAG, "streamTransformations => value : $data"),
        onError: (error) => LoggerDart.customLog(TAG, "streamTransformations => 에러 : $error", level: LogLevel.error),
    );
  }

  // 일반적인 Stream 패턴
  // 브로드캐스트 스트림 => 여러 리스너가 동시에 구독할 수 있는 스트림
  void broadcastStream() {
    final controller = StreamController<int>.broadcast();

    // 찻번째 구독자
    // take 를 사용하여 3개 이벤트를 받게 되면 자동으로 구독 취소를 하여 메모리 누수 방지
    final subscription1 = controller.stream.take(3).listen(
        (data) => LoggerDart.customLog(TAG, "첫 번째 구독자 => value : $data"),
        onDone: () => LoggerDart.customLog(TAG, "첫 번째 구독자 => 완료"),
    );

    // 두번째 구독자
    final subscription2 = controller.stream.listen(
        (data) => LoggerDart.customLog(TAG, "두 번째 구독자 => value : $data"),
        onDone: () => LoggerDart.customLog(TAG, "두 번째 구독자 => 완료"),
    );

    // 데이터 추가
    controller.add(1);
    controller.add(2);
    controller.add(3);

    // 첫번째 구독 취소를 한 프레임 뒤로 지연(microtask 경우 최 우선으로 처리 됨)
    //Future.microtask(() => subscription1.cancel());

    // 추가 데이터
    controller.add(4);
    controller.add(5);

    // 스트림 닫기
    controller.close();

    // StreamBuilder 선언적
    // StreamBuilder<int>(
    //   stream: countStream(10),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('오류 발생: ${snapshot.error}');
    //     }
    //
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return CircularProgressIndicator();
    //     }
    //
    //     if (snapshot.hasData) {
    //       return Text('현재 값: ${snapshot.data}');
    //     }
    //
    //     return Text('데이터 없음');
    //   },
    // );
  }

  /// Flutter 에는 스트림 데이터를 처리하는 두가지 방법이 존재
  /// async* / await for (명령형)
  /// StreamBuilder (선언적) , 주로 위젯에서 스트림 데이터 처리할 때 많이 사용
  ///

  /* async* / await for */
  Future<void> processStream(Stream<int> stream) async {
    await for (final value in stream) {
      // 각 이벤트 처리
    }
  }
}

/// Sub Class
class Person {
  late String name;
  late int age;

  // 기본 생성자
  Person(this.name, this.age);

  // 이름이 있는 생성자(non-nullable 필드를 정확히 초기화 하지 않으면 사용 불가)
  Person.guest() {
    name = '손님';
    age = 0;
  }

  Person.child(this.name) {
    age = 10;
  }

  Person.adult(this.name) {
    age = 18;
  }

  // 리다이렉팅 생성자 => 한 생성자에서 같은 클래스의 다른 생성자를 호출할 때 리다이렉팅 생성자를 사용
  Person.reDirect(String name) : this(name, 11);
  Person.fromJson(Map<String, dynamic> json) : this(json['name'] as String, json['age'] as int);
}

/// Sub Class
class SampleOne {
  String name;
  int age;
  final DateTime birthDate;

  // 생성자 본문이 실행되기 전에 인스턴스 변수를 초기화 할 때 사용
  SampleOne(this.name, this.age): birthDate = DateTime.now().subtract(Duration(days: 365 * age));

  // 여러 필드 초기화
  SampleOne.custom(String userName, int userAge)
      : name = userName.toUpperCase(),
        age = userAge > 0 ? userAge : 0,
        birthDate = DateTime.now().subtract(Duration(days: 365 * userAge));
}

/// Sub Class
class ImmutablePoint {
  final int x;
  final int y;

  // 인스턴스가 변경 불가능 한 객체일 때 상수 생성자를 사용
  const ImmutablePoint(this.x, this.y);
}

/// 추상 클래스
abstract class Animal {
  String name;

  Animal(this.name);

  // 추상 메서드 (구현 없음)
  void makeSound();

  // 구현 된 메서드
  void sleep() {
    LoggerDart.customLog("TestLog", "$name is sleeping");
  }
}

class Dog extends Animal {
  Dog(super.name);

  // 추상 메서드 구현
  @override
  void makeSound() {
    LoggerDart.customLog("TestLog", "$name says Woof!");
  }
}

class Cat extends Animal {
  Cat(super.name);

  // 추상 메서드 구현
  @override
  void makeSound() {
    LoggerDart.customLog("TestLog", "$name says Meow!");
  }
}

/// 인터페이스
/// Dart 에는 별도의 interface 키워드가 존재하지 않음.
/// 모든 클래스가 암묵적으로 인터페이스 역할 수행 가능!
class Vehicle {
  void move() {
    LoggerDart.customLog("TestLog", "Vehicle is moving");
  }

  void stop() {
    LoggerDart.customLog("TestLog", "Vehicle is stopping");
  }
}

class Car implements Vehicle {
  @override
  void move() {
    LoggerDart.customLog("TestLog", "Car is moving");
  }

  @override
  void stop() {
    LoggerDart.customLog("TestLog", "Car is stopping");
  }
}

class Airplane implements Vehicle {
  @override
  void move() {
    LoggerDart.customLog("TestLog", "Airplane is moving");
  }

  @override
  void stop() {
    LoggerDart.customLog("TestLog", "Airplane is stopping");
  }
}

/// 믹스인
/// 클래스 간에 코드를 재사용하는 방법을 제공
/// with 키워드를 사용하여 믹스인의 기능을 클래스에 추가
mixin Swimming {
  void swim() {
    LoggerDart.customLog("TestLog", "Swimming");
  }
}

mixin Flying {
  void fly() {
    LoggerDart.customLog("TestLog", "Flying");
  }
}

// 믹스인 사용
class AnimalSecond {
  String name;
  AnimalSecond(this.name);

  void eat() {
    LoggerDart.customLog("TestLog", "$name is eating");
  }
}

class Bird extends AnimalSecond with Flying {
  Bird(super.name);
}

class Fish extends AnimalSecond with Swimming {
  Fish(super.name);
}

class Duck extends AnimalSecond with Swimming, Flying {
  Duck(super.name);
}

// 믹스인 제한
// on 키워드로 믹스인을 특정 클래스에만 사용하도록 제한
mixin CanFly on Bird {
  void canFly() {
    LoggerDart.customLog("TestLog", "Bird is flying");
  }
}



