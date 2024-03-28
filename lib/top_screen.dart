import 'package:dawin_shopping_mall/first_screen.dart';
import 'package:flutter/material.dart';

int _bottomNavigationBarIndex = 0;

AppBar _buildAppBar() {
  // 조건문 추가하자!
  switch (_bottomNavigationBarIndex) {
    case 0:
      return AppBar(
        title: Text('홈'),
        backgroundColor: Colors.redAccent,
      );
    case 1:
      return AppBar(
        title: Text('상품'),
        backgroundColor: Colors.greenAccent,
      );
    default:
      return AppBar(
        title: Text('home'),
        backgroundColor: Colors.cyanAccent,
      );
  }
}

Widget _buildBody() {
  switch (_bottomNavigationBarIndex) {
    case 0:
      return const FirstScreen();
    case 1:
      return const Center();
    default:
      return Container();
  }
}

class TopScreen extends StatefulWidget {
  const TopScreen({super.key});

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), // 앱바가 들어갈 자리
      body: _buildBody(), // 위젯이 들어갈 자리
      bottomNavigationBar: BottomNavigationBar(
        // 선택된 값을 어떻게 가져올까 : currentIndex, onTap
        onTap: (int index) {
          // 상태관리! setState() -> 상태 값이 바뀜과 동시에 화면 다시 불러오기
          setState(() {
            _bottomNavigationBarIndex = index;
          });
          print('_bottomNavigationBarIndex : $_bottomNavigationBarIndex');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
        ],
      ),
    );
  }
}
