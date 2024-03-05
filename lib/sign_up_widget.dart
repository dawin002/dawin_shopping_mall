import 'package:dawin_shopping_mall/FirebaseAuthService.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  // 파이어베이스 인증 서비스(내가 만든거) 객체 생성
  final FirebaseAuthService _authService = FirebaseAuthService();

  // 입력한 텍스트를 읽어올 컨트롤러 객체 생성
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 330,
        height: 420,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '회원 가입',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '이메일',
                    hintText: '이메일을 입력하세요.',
                    labelStyle: TextStyle(color: Colors.white70),
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return '유효한 이메일 주소를 입력해주세요.';
                    }
                    return null;
                  },
                  controller: _emailController,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '비밀번호',
                    hintText: '비밀번호를 입력하세요.',
                    labelStyle: TextStyle(color: Colors.white70),
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '유효한 비밀번호를 입력해주세요.';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: '이름',
                    hintText: '이름을 입력하세요.',
                    labelStyle: TextStyle(color: Colors.white70),
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '유효한 이름을 입력해주세요.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _authService.singUpWithEmailAndPassword(
                        _emailController.text, _passwordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.purple,
                  ),
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white70,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
