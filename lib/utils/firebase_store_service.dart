import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawin_shopping_mall/dto/shopping_item.dart';

class FirebaseStoreService {
  // 파이어스토어 객체 하나를 가져옴
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firestore에서 쇼핑몰 아이템 목록을 가져오는 함수
  Future<List<ShoppingItem>> fetchShoppingItems() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('shoppingItems').get();

      List<ShoppingItem> items = snapshot.docs.map((doc) {
        return ShoppingItem.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return items;
    } catch (e) {
      print("Error fetching shopping items: $e");
      return [];
    }
  }

  // Firestore에 쇼핑몰 아이템을 추가하는 함수
  Future<void> addShoppingItem(ShoppingItem item) async {
    try {
      await _firestore.collection('shoppingItems').add(item.toJson());
      print("Item added successfully");
    } catch (e) {
      print("Error adding item: $e");
    }
  }

  // Firestore에서 쇼핑몰 아이템을 검색하는 함수(SQL문을 이용해 정보를 가져옴)
  Future<List<ShoppingItem>> searchShoppingMallItems(String keyword) async {
    try {
      QuerySnapshot snapshot = await _firestore // 스냅샷 : 디비의 지금 이 순간을 가져옴
          .collection('shoppingItems') // shoppingItems 컬렉션을 가져와
          .where('name', isGreaterThanOrEqualTo: keyword) // 모든 글자가 같거나
          .where('name', isLessThan: keyword + '\uf8ff') // 앞자리 글자가 같으면
          .get(); // get 으로 가져옴

      List<ShoppingItem> items = snapshot.docs.map((doc) {
        return ShoppingItem.fromJson(doc.data() as Map<String, dynamic>);
      }).toList(); // 스냅샷을 ShoppingItem 객체로 맵핑 -> items 리스트에 넣어 반환

      return items;
    } catch (e) {
      print('Error searching shopping mall items: $e');
      return [];
    }
  }
}
