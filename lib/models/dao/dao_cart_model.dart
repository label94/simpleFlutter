
// 장바구니 모델 (ChangeNotifier 사용)
import 'package:flutter/material.dart';
import 'package:simple_flutter/utils/logger_dart.dart';
import '../data/dto_product.dart';

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  // 읽기 전용 처리
  List<Product> get items => List.unmodifiable(_items);
  int get itemCount => _items.length;
  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);

  // 상품 추가
  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  // 상품 제거
  void removeProduct(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  // 장바구니 비우기
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void testLog() {
    LoggerDart.customLog("TestLog_CartModel", 'items size : $itemCount');
  }
}