// 쇼핑 아이템 데이터를 전달하는 DTO

class ShoppingItem {
  // 필드 생성
  String name;
  String id;
  String price;
  String imageSrc; // 고객이 이미지를 올림 -> 파이어베이스에 업로드해서 주소로 바꿈 -> 주소값을 배정
  // imageSrc 에 파이어베이스 스토리지 주소를 넣으면 됨

  // 초기화
  ShoppingItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageSrc,
  });

  // DB와의 통신을 위해 필요한 코드
  // DB에서 가져온 JSON 데이터를 내가 만든 객체 형식으로 변환시키는 코드
  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageSrc: json['imageSrc'],
    );
  }

  // 내가 만든 객체를 JSON 데이터로 변환시키는 코드
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageSrc': imageSrc,
    };
  }
}
