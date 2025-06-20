
// 장바구니 페이지
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter/models/dao/dao_cart_model.dart';

class CartPage extends StatelessWidget {
  
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('장바구니'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          cart.testLog();

          if (cart.items.isEmpty) {
            return Center(
              child: Text('장바구니가 비었습니다.'),
            );
          }
          
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final product = cart.items[index];
                    return ListTile(
                      leading: Image.asset(
                        product.imageUrl,
                        width: 56,
                        height: 56,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.image, size: 56);
                        },
                      ),
                      title: Text(product.name),
                      subtitle: Text('₩${product.price.toStringAsFixed(0)}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          cart.removeProduct(product);
                        },
                      ),
                    );
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, -2)
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('총 결제 금액 : ₩${cart.totalPrice.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),

                    SizedBox(height: 16),

                    ElevatedButton(
                      child: Text('결제하기'),
                      onPressed: () {
                        // 결제 로직 구현
                        showDialog(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: Text('결제 확인'),
                            content: Text('결제가 완료되었습니다!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  cart.clearCart();
                                  Navigator.of(dialogContext).pop(); // 팝업 닫기
                                },
                                child: Text('확인'),
                              )
                            ],
                          )
                        );
                      },
                    ),

                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}