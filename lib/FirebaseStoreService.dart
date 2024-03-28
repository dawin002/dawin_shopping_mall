import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dawin_shopping_mall/shopping_item.dart';

class FirebaseStoreService {
  // 파이어스토어 객체 하나를 가져옴
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firestore에서 쇼핑몰 아이템 목록을 가져오는 함수
  Future<List<ShoppingItem>> fetchShoppingItems() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('shoppingItems').get();

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

}