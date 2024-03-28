import 'package:dawin_shopping_mall/first_screen.dart';
import 'package:flutter/material.dart';

int _bottomNavigationBarIndex = 0;

// 앱바 대신 탭바로 바꾸려고 함
// AppBar _buildAppBar() {
//   // 조건문 추가하자!
//   switch (_bottomNavigationBarIndex) {
//     case 0:
//       return AppBar(
//         title: Text('홈'),
//         backgroundColor: Colors.redAccent,
//       );
//     case 1:
//       return AppBar(
//         title: Text('상품'),
//         backgroundColor: Colors.greenAccent,
//       );
//     default:
//       return AppBar(
//         title: Text('home'),
//         backgroundColor: Colors.cyanAccent,
//       );
//   }
// }

// 빌드 바디 : 선택한 메뉴에 따라 바디 내용을 다르게 보여주는 것
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

// 빌드 플로팅 액션 버튼 함수
Widget? _buildFloatingActionButton() {
  // 선택한 바텀 메뉴에 따라 플로팅 액션 버튼을 보여줄지 말지 결정
  // null 을 반환할 수도 있기 때문에 반환 타입 Widget? (물음표 붙임)
  switch (_bottomNavigationBarIndex) {
    case 0:
      // 플로팅 액션 버튼 반환
      return FloatingActionButton(
        onPressed: () {
          print('Floating Action Button Clicked');
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      );
    default:
      // 널 반환 (플로팅 액션 버튼 가림)
      return null;
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
      // 앱바를 top_screen 이 아닌 first_screen 에서 관리하기 위해 지움
      // appBar: _buildAppBar(), // 앱바가 들어갈 자리
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
      // 고정된 위치에 떠있는 버튼, 앱바/바디/바텀내비게이션바 와 같은 레벨
      floatingActionButton: _buildFloatingActionButton(),
    );
  }
}
