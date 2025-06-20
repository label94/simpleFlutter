
// 상품 목록 페이지
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter/models/dao/dao_cart_model.dart';
import 'package:simple_flutter/screens/s_cart_page.dart';

import '../models/repository/r_product.dart';

class ProductListPage extends StatelessWidget {
  
  const ProductListPage({super.key});
  
  // ui 그리기
  @override
  Widget build(BuildContext context) {
    // 상품 저장소에서 상품 목록 가져오기
    final productRepository = Provider.of<ProductRepository>(context);
    final products = productRepository.getProducts();
     
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 목록'),
        actions: [
          // 장바구니 아이콘과 상품 수 표시
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
                },
              ),

              Positioned(
                right: 8,
                top: 8,
                child: Consumer<CartModel>(
                  builder: (_, cart, _) {
                    return cart.itemCount > 0 ?
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                      child: Text(
                        '${cart.itemCount}',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ) : SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(
                product.imageUrl,
                width: 56,
                height: 56,
                errorBuilder: (context, error, stackTrace) {
                  // 이미지 로드 실패 시 대체 아이콘
                  return Icon(Icons.image, size: 56);
                },
              ),
              title: Text(product.name),
              subtitle: Text('₩${product.price.toStringAsFixed(0)}'),
              trailing: Consumer<CartModel>(
                builder: (_, cart, _) {
                  return IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cart.addProduct(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name}을 장바구니에 추가했습니다.'),
                        ),
                      );

                      cart.testLog();
                    },
                  );
                }
              )
            ),
          );
        },
      ),
    );
  }
}