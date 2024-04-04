import 'dart:io'; // File 타입 사용하려면 dart:io 가져와야함

// 이미지 피커를 사용해 이미지를 업로드하는 유틸 클래스
import 'package:image_picker/image_picker.dart';

class ImageUploadUtil {

  // 이미지 피커 라이브러리 객체 생성
  final ImagePicker _picker = ImagePicker();

  // 갤러리에서 사진을 가져오는 함수
  Future<File?> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  // 업로드 함수
  Future<void> uploadImage(File imageFile, String uploadUrl) async {
    // 파이어베이스 스토리지에 이미지를 업로드 하는 코드

  }
  // 깃헙에 있는 저장소에 이미지를 올리고,
  // 해당 깃헙 저장소에 올라간 이미지의 주소를 리턴하는 방식으로도 가능
}