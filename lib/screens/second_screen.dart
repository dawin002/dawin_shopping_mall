import 'package:dawin_shopping_mall/dto/shopping_item.dart';
import 'package:dawin_shopping_mall/screens/product_detail_screen.dart';
import 'package:dawin_shopping_mall/utils/firebase_store_service.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // FirebaseStoreService 객체를 생성
  FirebaseStoreService firebaseStoreService = FirebaseStoreService();

  // 텍스트 변화 감지하는 컨트롤러 생성
  TextEditingController _searchController = TextEditingController();

  // 검색 결과 담을 리스트 생성
  List<ShoppingItem> _searchResult = [];

  var _notLoaded = false; // 아직 로딩 안되었다는 변수

  @override
  void initState() {
    super.initState();
    // 컨트롤러에 리스터 달아주기 (텍스트 입력 변화 감지)
    _searchController.addListener(() {
      // 컨트롤러에 텍스트가 감지될 때 검색 함수 호출하기
      if (_searchController.text.isNotEmpty) {
        print('Search text: ${_searchController.text}');
        // 감지한 텍스트 바로바로 검색
        searchItems();
      }
    });
  }

  // 감지한 텍스트를 검색하고 결과로 보내기
  searchItems() async {
    setState(() {
      _notLoaded = true;
    });
    List<ShoppingItem> items = await firebaseStoreService
        .searchShoppingMallItems(_searchController.text);
    setState(() {
      _searchResult = items;
      _notLoaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색 페이지'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: _searchController, // 컨트롤러 만들어서 넣기
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '상품 검색',
              ),
              // onSubmitted 안씀, 어차피 컨트롤러로 읽어서 한글자마다 검색할거여서
              // onSubmitted: (value) async { // 검색 버튼이 눌렸을 때 수행할 작업
              //   print('Submitted: $value');
              //   _searchResult = await firebaseStoreService.searchShoppingMallItems(value);
              // },
            ),
          ),
          Expanded(
            child: _notLoaded
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // 일반적인 형태의 리스트를 보여주는 타일
                        title: Text('상품명 ${_searchResult[index].name}'),
                        subtitle: Text('가격 ${_searchResult[index].price}'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                      productName: _searchResult[index].name,
                                      productPrice: _searchResult[index].price,
                                      productDescription:
                                          _searchResult[index].imageSrc)));
                        },
                      );
                    }),
          )
        ],
      ),
    );
  }
}
