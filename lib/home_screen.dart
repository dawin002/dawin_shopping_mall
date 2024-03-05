import 'package:dawin_shopping_mall/login_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            '로그인 화면',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: const LoginWidget(),
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
