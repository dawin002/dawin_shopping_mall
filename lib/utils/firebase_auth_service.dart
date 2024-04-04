import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // 파이어베이스 인증과 관련된 함수를 호출할 것

  // 파이어베이스 인증 인스턴스 생성 (복제품)
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // 로그인 함수
  Future<User?> singInWithEmailAndPassword(
      String email, String password) async {
    try {
      // UserCredential : 유저 자격 증명
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // 에러가 발생했을 때
      print('Sign in error: ${e.message}');
      return null;
    }
  }

  // 회원가입 함수
  Future<User?> singUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // 에러가 발생했을 때
      print('Sign up error: ${e.message}');
      return null;
    }
  }
}
