import 'package:dawin_shopping_mall/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  final Function onLogout;

  const ThirdScreen({super.key, required this.onLogout});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  void handleLogout() {
    // 로그아웃 시 필요한 작업 수행
    widget.onLogout(); // 로그아웃 콜백 호출
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image(
                image: NetworkImage(
                    'https://i.namu.wiki/i/oaOZE-a9jn7PYSFduvq3BYriDAAwGWJ8AJhau5GiqVf_FSD6NbYzsg7Nsoawz3bHCt0hx8YPoQw_o51LcH73Sg.webp'),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              '사용자 이름',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'user@example.com',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                surfaceTintColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              onPressed: handleLogout,
              // onPressed: () {
              //   Navigator.pop(context);
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const HomeScreen()));
              // },
              child: const Text(
                '로그아웃',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
