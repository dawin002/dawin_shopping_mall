import 'package:dawin_shopping_mall/sign_up_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/background_gradation1.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: const Text(
            '회원가입 화면',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: const SignUpWidget(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white54,
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
      ),
    );
  }
}
