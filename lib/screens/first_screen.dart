import 'package:carousel_slider/carousel_slider.dart';
import 'package:dawin_shopping_mall/utils/firebase_store_service.dart';
import 'package:dawin_shopping_mall/screens/product_detail_screen.dart';
import 'package:dawin_shopping_mall/dto/shopping_item.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  // with Single: 탭 컨트롤러 사용하기 위해
  // FirebaseStore 로 부터 가져올 쇼핑몰 정보
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();

  List<ShoppingItem> _shoppingItems = [];

  bool _notLoaded = true; // 아직 로딩 안됨 true, 로딩됨 false

  // 탭 인덱스 관리하는 탭 컨트롤러
  late TabController _tabController;

  // late : 선언만 해두고 나중에 초기화하겠다. initState에서 초기화할 거임

  // 처음에 화면이 열릴 때 실행할 코드 오버라이드
  @override
  void initState() {
    super.initState();
    _updateShoppingItem();
    // 탭 컨트롤러 초기화
    _tabController = TabController(length: 4, vsync: this);
    // vsync: this 넣으면 빨간 줄 뜸
    // _FirstScreenState 클래스 선언시 with SingleTickerProviderStateMixin 붙여야됨
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
      _notLoaded = false; // 데이터 로딩 완료 상태 업데이트
    });
  }

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

  // build : 화면과 관련된 뭔가를 만들어서 보여주는 친구
  @override
  Widget build(BuildContext context) {
    // 바디 위젯 안에 앱바(탭바)를 넣기 위해 스캐폴드로 감쌈
    // 결과적으로 top_screen 의 스캐폴드 안에 first_screen 의 스캐폴드가 들어간 모양
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
        backgroundColor: Colors.blue,
        // 상단 오른쪽에 들어갈 것들 : actions
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
        // AppBar 안의 bottom 자리에 TabBar 가 들어갈 수 있음
        bottom: TabBar(
          tabs: const [
            Tab(
              text: '카테고리1',
            ),
            Tab(
              text: '카테고리2',
            ),
            Tab(
              text: '카테고리3',
            ),
            Tab(
              text: '카테고리4',
            ),
          ],
          // 탭바에서는 컨트롤러로 인덱스 확인
          controller: _tabController,
        ),
      ),
      // 앱바 인덱스 값이 바뀌면 바디(카테고리에 따른 상품 리스트)를 변경해주면 된다!
      body: SingleChildScrollView(
        // 스크롤 넣을 때는 SingleChildScrollView 로 감싸면 됨
        // 스캐폴드로 감싸면서 child: -> body: 로 바뀜
        child: Column(
          children: [
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
            const Divider(
              thickness: 2,
              height: 20,
              color: Colors.grey,
            ),
            Container(
              // 프로그레스바 분기 : 이미지 로딩중 애니메이션
              child: _notLoaded
                  ? Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      // 위젯 전체에 걸린 SingleChildScrollView 와 GridView 의 스크롤 충돌 발생하면
                      // 그리드뷰의 스크롤 가능 여부를 지워주면 정상 작동
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // Wrap : 안에 있는 내용물 사이즈만큼 조절해주는 것 Wrap_contents
                      itemCount: _shoppingItems.length,
                      // itemCount: 20,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0, // 횡 간격
                        mainAxisSpacing: 0, // 종 간격
                        childAspectRatio: 100 / 95, // 하나의 아이템 박스 크기 비율
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          // 전체 Column에 패딩 씌우기
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            // 제스처를 하면 그거에 맞게 함수를 발동시킴
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                            productName:
                                                _shoppingItems[index].name,
                                            productPrice:
                                                _shoppingItems[index].price,
                                            productDescription:
                                                _shoppingItems[index].imageSrc,
                                          )));
                            },
                            child: Column(
                              children: [
                                AspectRatio(
                                  // 비율에 맞게 크기 조절
                                  aspectRatio: 4 / 3,
                                  child: ClipRRect(
                                    // ClipRRect 로 감싸기 : 이미지 꾸미기
                                    borderRadius:
                                        BorderRadius.circular(20), // 모서리 둥글게
                                    child: const Image(
                                      image: NetworkImage(
                                          'https://mblogthumb-phinf.pstatic.net/MjAyMjEwMjRfMTMx/MDAxNjY2NTQxNTAyNTc0.7xNNUaAYuKhHRBRf_rDpoYdVVSM5IyWHUkvJR0lqkiAg.pWW8wOMU-sNwO0EF4gDlaI51Ojm2wbOk0-KHCu8eKQwg.JPEG.gogoa25/IMG_7085.JPG?type=w800'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _shoppingItems[index].name,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      _shoppingItems[index].price,
                                      style:
                                          const TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            ElevatedButton(
              child: const Text('물건 추가'),
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
      ),
    );
  }
}
