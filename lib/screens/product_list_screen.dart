import 'dart:math';

import 'package:flutter/material.dart';

final productItems = [
  {"name": "car1", "imageUrl": "assets/images/cars/car1.jpg"},
  {"name": "car2", "imageUrl": "assets/images/cars/car2.jpg"},
  {"name": "car3", "imageUrl": "assets/images/cars/car3.jpg"},
  {"name": "car4", "imageUrl": "assets/images/cars/car4.jpg"},
  {"name": "car5", "imageUrl": "assets/images/cars/car5.jpg"},
  {"name": "car6", "imageUrl": "assets/images/cars/car6.jpg"},
  {"name": "car7", "imageUrl": "assets/images/cars/car7.jpg"},
  {"name": "car8", "imageUrl": "assets/images/cars/car8.jpg"},
  {"name": "car9", "imageUrl": "assets/images/cars/car9.jpg"},
  {"name": "car10", "imageUrl": "assets/images/cars/car10.jpg"},
  {"name": "car11", "imageUrl": "assets/images/cars/car11.jpg"},
  {"name": "car12", "imageUrl": "assets/images/cars/car12.jpg"},
  {"name": "car13", "imageUrl": "assets/images/cars/car13.jpg"},
  {"name": "car14", "imageUrl": "assets/images/cars/car14.jpg"},
  {"name": "car15", "imageUrl": "assets/images/cars/car15.jpg"},
  {"name": "car16", "imageUrl": "assets/images/cars/car16.jpg"},
  {"name": "car17", "imageUrl": "assets/images/cars/car17.jpg"},
];

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('클래식카 리스트', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        color: Colors.black,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemCount: productItems.length,
            itemBuilder: (context, index) {
              final productItem = productItems[index];
              return GestureDetector(
                onTap: () => {print('Clicked on ${productItem['name']}')},
                child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: Colors.black54,
                    title: Text(productItem['name']!),
                  ),
                  child: Image.asset(
                    productItem['imageUrl']!,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '찜',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '메뉴',
          ),
        ],
      ),
    );
  }
}
