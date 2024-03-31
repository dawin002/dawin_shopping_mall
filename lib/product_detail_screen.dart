import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  // 상품 정보 담을 변수 선언
  final String productName;
  final String productPrice;
  final String productDescription;

  const ProductDetailScreen(
      {Key? key,
      required this.productName,
      required this.productPrice,
      required this.productDescription});
  // super.key : 상위 페이지로부터 key를 가져옴, 없으면 뒤로 못감
  // required this._product~ : 상위 페이지에서 가져올 것, required는 꼭 필요하다는 뜻

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 상세'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text('상품명 : ${productName}'),
            Text('가격 : ${productPrice}'),
            Text('설명 : ${productDescription}'),
          ],
        ),
      ),
    );
  }
}
