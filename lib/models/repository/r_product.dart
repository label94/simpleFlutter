// Repository
import 'package:simple_flutter/models/data/dto_product.dart';

class ProductRepository {
  final _imageRoot = 'assets/images/';

  // 상품 목록 (실제로는 API에서 가져오는 로직 추가하는 부분)
  List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: '노트북',
        price: 120000,
        imageUrl: '${_imageRoot}laptop.png',
      ),

      Product(
        id: '2',
        name: '스마트폰',
        price: 80000,
        imageUrl: '${_imageRoot}smartphone.jpg',
      ),

      Product(
        id: '3',
        name: '헤드폰',
        price: 25000,
        imageUrl: '${_imageRoot}headphones.jpg',
      ),

      Product(
        id: '4',
        name: '스마트워치',
        price: 3500000,
        imageUrl: '${_imageRoot}smart_watch.jpg',
      ),
    ];
  }
}
