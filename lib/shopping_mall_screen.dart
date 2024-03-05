import 'package:flutter/material.dart';

class ShoppingMallScreen extends StatefulWidget {
  const ShoppingMallScreen({super.key});

  @override
  State<ShoppingMallScreen> createState() => _ShoppingMallScreenState();
}

class _ShoppingMallScreenState extends State<ShoppingMallScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "ShoppingMallPage",
            style: TextStyle(fontSize: 40, color: Colors.lightGreen),
          )),
        ],
      ),
    );
  }
}
