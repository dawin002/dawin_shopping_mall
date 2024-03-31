import 'package:dawin_shopping_mall/image_upload_util.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ImageUploadUtil _imageUploadUtil = ImageUploadUtil();
  String _imageText = '이미지 선택';

  // 이미지 업로드 함수
  Future<void> _uploadImage() async {
    final pickedImage = await _imageUploadUtil.pickImageFromGallery();
    if (pickedImage != null) {
      setState(() {
        _imageText = pickedImage.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('상품 올리기'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _uploadImage, child: Text(_imageText)),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '상품명',
                  hintText: '상품명을 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '가격',
                  hintText: '가격을 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '설명',
                  hintText: '설명을 입력하세요',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context), child: Text('올리기'))
            ],
          ),
        ));
  }
}
