import 'package:carousel_slider/carousel_slider.dart';
import 'package:dawin_shopping_mall/FirebaseStoreService.dart';
import 'package:dawin_shopping_mall/shopping_item.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // FirebaseStore 로 부터 가져올 쇼핑몰 정보
  FirebaseStoreService _firebaseStoreService = FirebaseStoreService();

  List<ShoppingItem> _shoppingItems = [];

  // 처음에 화면이 열릴 때 실행할 코드 오버라이드
  @override
  void initState() {
    super.initState();
    _updateShoppingItem();
  }

  // FirebaseStore로 부터 shoppingItems 받아오기
  Future<void> _updateShoppingItem() async {
    // _firebaseStoreService.fetchShoppingItems().then((value) {
    //   setState(() {
    //     _shoppingItems = value;
    //   });
    // });
    // 위 주석 코드와 동일한 문장
    final _tmp = await _firebaseStoreService.fetchShoppingItems();
    setState(() {
      _shoppingItems = _tmp;
    });
  }

  // FirebaseStore로 부터 shoppingItems 받아오기 2 (블베님이 뭔가 해보려 했는데 잘 안됨)
  // Future<void> _updateSoppingItem() async {
  //   final _tmp = await _firebaseStoreService.fetchShoppingItems();
  //   setState(() {
  //     shoppingItems = _tmp.cast<ShoppingItem>();
  //   });
  // }

  // final _images = [
  //   'https://ih0.redbubble.net/image.1322057754.0118/raf,360x360,075,t,fafafa:ca443f4786.jpg',
  //   'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMjRfMTA4/MDAxNjY2NTQxNTAxODc2.jP5--4FxmfTGv5cFJpj5Xa6-CerWA4plvjuI3x-g2lgg.Qa-im_7FWkAApgjwN9ixQQ69QIY6MvQyqu7SlB9YdqEg.JPEG.gogoa25/IMG_7075.JPG?type=w800',
  //   'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMjRfMTMg/MDAxNjY2NTQxNTAxMjM4.2qICPuKCeUf6xJmaoY78nyLU1wF4gMVrISKMKWTb6yIg.2sM2m5OfGh1yNQ86hrue2kBCXGGJkaQUQDCNwajUhvcg.JPEG.gogoa25/IMG_7094.JPG?type=w800',
  //   'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMjRfMTMx/MDAxNjY2NTQxNTAyNTc0.7xNNUaAYuKhHRBRf_rDpoYdVVSM5IyWHUkvJR0lqkiAg.pWW8wOMU-sNwO0EF4gDlaI51Ojm2wbOk0-KHCu8eKQwg.JPEG.gogoa25/IMG_7085.JPG?type=w800',
  // ];

  final _imagesList = [
    Image.network(
        'https://ih0.redbubble.net/image.1322057754.0118/raf,360x360,075,t,fafafa:ca443f4786.jpg'),
    Image.network(
        'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMjRfMTA4/MDAxNjY2NTQxNTAxODc2.jP5--4FxmfTGv5cFJpj5Xa6-CerWA4plvjuI3x-g2lgg.Qa-im_7FWkAApgjwN9ixQQ69QIY6MvQyqu7SlB9YdqEg.JPEG.gogoa25/IMG_7075.JPG?type=w800'),
    Image.network(
        'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMjRfMTMg/MDAxNjY2NTQxNTAxMjM4.2qICPuKCeUf6xJmaoY78nyLU1wF4gMVrISKMKWTb6yIg.2sM2m5OfGh1yNQ86hrue2kBCXGGJkaQUQDCNwajUhvcg.JPEG.gogoa25/IMG_7094.JPG?type=w800'),
    Image.network(
        'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMjRfMTMx/MDAxNjY2NTQxNTAyNTc0.7xNNUaAYuKhHRBRf_rDpoYdVVSM5IyWHUkvJR0lqkiAg.pWW8wOMU-sNwO0EF4gDlaI51Ojm2wbOk0-KHCu8eKQwg.JPEG.gogoa25/IMG_7085.JPG?type=w800'),
  ];

  final _itemList = [
    ShoppingItem(id: 'id', name: 'name1', price: 'price', imageSrc: 'imageSrc'),
    ShoppingItem(id: 'id', name: 'name2', price: 'price', imageSrc: 'imageSrc'),
    ShoppingItem(id: 'id', name: 'name3', price: 'price', imageSrc: 'imageSrc'),
    ShoppingItem(id: 'id', name: 'name4', price: 'price', imageSrc: 'imageSrc'),
    ShoppingItem(id: 'id', name: 'name5', price: 'price', imageSrc: 'imageSrc'),
    ShoppingItem(id: 'id', name: 'name6', price: 'price', imageSrc: 'imageSrc'),
    ShoppingItem(id: 'id', name: 'name7', price: 'price', imageSrc: 'imageSrc'),
    ShoppingItem(id: 'id', name: 'name8', price: 'price', imageSrc: 'imageSrc'),
  ];

  @override
  Widget build(BuildContext context) {
    // build : 화면과 관련된 뭔가를 만들어서 보여주는 친구
    // 스크롤 넣을 때는 SingleChildScrollView 로 감싸면 됨
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('첫번째 페이지'),
          CarouselSlider(
            // 이미지가 필요함!
            items: _imagesList,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 0,
            ),
            //
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              ElevatedButton(
                onPressed: null,
                child: Text('카테고리1'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('카테고리2'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('카테고리3'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('카테고리4'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('카테고리5'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('카테고리6'),
              ),
            ]),
          ),
          GridView.builder(
            // 위젯 전체에 걸린 SingleChildScrollView 와 GridView 의 스크롤 충돌 발생하면
            // 그리드뷰의 스크롤 가능 여부를 지워주면 정상 작동
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true, // Wrap : 안에 있는 내용물 사이즈만큼 조절해주는 것 Wrap_contents
            itemCount: _shoppingItems.length,
            // itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10, // 횡 간격
              mainAxisSpacing: 10, // 종 간격
            ),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Expanded(
                    child: Image.network(
                        'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMjRfMTMx/MDAxNjY2NTQxNTAyNTc0.7xNNUaAYuKhHRBRf_rDpoYdVVSM5IyWHUkvJR0lqkiAg.pWW8wOMU-sNwO0EF4gDlaI51Ojm2wbOk0-KHCu8eKQwg.JPEG.gogoa25/IMG_7085.JPG?type=w800'),
                  ),
                  Text(_shoppingItems[index].name),
                  Text(_shoppingItems[index].price),
                ],
              );
            },
          ),
          ElevatedButton(
            child: Text('물건 추가'),
            onPressed: () {
              _firebaseStoreService.addShoppingItem(ShoppingItem(
                  id: "item123",
                  name: "아버지의 유산",
                  price: "100",
                  imageSrc: "imageSrc"));
              _updateShoppingItem();
            },
          ),
        ],
      ),
    );
  }
}
