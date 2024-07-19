import 'package:flutter/material.dart';
import 'MoreGoodsInfoScreen.dart';
import 'dart:math' as math;

class UpcycleGoodsListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> upcycleProducts = [
    {
      'category': '에코백',
      'products': [
        {'name': '재활용 페트병 에코백', 'price': '15,000원', 'rating': 4.7, 'shippingFee': 0, 'reviewCount': 230, 'ecoScore': 95, 'shopName': '업사이클샵', 'shopUrl': 'https://example.com/upcycleshop1'},
        {'name': '자투리 천 패치워크 에코백', 'price': '18,000원', 'rating': 4.5, 'shippingFee': 2500, 'reviewCount': 180, 'ecoScore': 92, 'shopName': '그린디자인', 'shopUrl': 'https://example.com/greendesign1'},
        {'name': '업사이클 데님 에코백', 'price': '20,000원', 'rating': 4.6, 'shippingFee': 0, 'reviewCount': 150, 'ecoScore': 93, 'shopName': '청바지새활용', 'shopUrl': 'https://example.com/denimup1'},
        {'name': '폐현수막 에코백', 'price': '12,000원', 'rating': 4.3, 'shippingFee': 2000, 'reviewCount': 120, 'ecoScore': 90, 'shopName': '배너리뉴', 'shopUrl': 'https://example.com/bannerrenew1'},
        {'name': '폐우산 업사이클 에코백', 'price': '22,000원', 'rating': 4.8, 'shippingFee': 0, 'reviewCount': 200, 'ecoScore': 94, 'shopName': '우산새생명', 'shopUrl': 'https://example.com/umbrellanew1'},
        {'name': '커피자루 에코백', 'price': '17,000원', 'rating': 4.4, 'shippingFee': 2500, 'reviewCount': 160, 'ecoScore': 91, 'shopName': '커피백새활용', 'shopUrl': 'https://example.com/coffeebagup1'},
      ],
    },
    {
      'category': '키링',
      'products': [
        {'name': '폐타이어 고무 키링', 'price': '8,000원', 'rating': 4.3, 'shippingFee': 0, 'reviewCount': 120, 'ecoScore': 88, 'shopName': '세컨드라이프', 'shopUrl': 'https://example.com/secondlife1'},
        {'name': '폐가죽 업사이클 키링', 'price': '12,000원', 'rating': 4.6, 'shippingFee': 2000, 'reviewCount': 150, 'ecoScore': 90, 'shopName': '리뉴메이드', 'shopUrl': 'https://example.com/renewmade1'},
        {'name': '폐자전거 체인 키링', 'price': '10,000원', 'rating': 4.5, 'shippingFee': 0, 'reviewCount': 100, 'ecoScore': 89, 'shopName': '바이크업', 'shopUrl': 'https://example.com/bikeup1'},
        {'name': '폐플라스틱 키링', 'price': '7,000원', 'rating': 4.2, 'shippingFee': 1500, 'reviewCount': 80, 'ecoScore': 87, 'shopName': '플라스틱새활용', 'shopUrl': 'https://example.com/plasticup1'},
        {'name': '폐전자제품 부품 키링', 'price': '15,000원', 'rating': 4.7, 'shippingFee': 0, 'reviewCount': 180, 'ecoScore': 92, 'shopName': '테크업', 'shopUrl': 'https://example.com/techup1'},
        {'name': '폐유리 모자이크 키링', 'price': '13,000원', 'rating': 4.4, 'shippingFee': 2000, 'reviewCount': 130, 'ecoScore': 91, 'shopName': '글라스업', 'shopUrl': 'https://example.com/glassup2'},
      ],
    },
    {
      'category': '화분',
      'products': [
        {'name': '폐목재 업사이클 화분', 'price': '22,000원', 'rating': 4.8, 'shippingFee': 3000, 'reviewCount': 200, 'ecoScore': 93, 'shopName': '나무새생명', 'shopUrl': 'https://example.com/newlifewood1'},
        {'name': '폐유리병 업사이클 화분', 'price': '25,000원', 'rating': 4.4, 'shippingFee': 0, 'reviewCount': 160, 'ecoScore': 91, 'shopName': '글라스업', 'shopUrl': 'https://example.com/glassup1'},
        {'name': '폐타이어 화분', 'price': '18,000원', 'rating': 4.5, 'shippingFee': 2500, 'reviewCount': 150, 'ecoScore': 90, 'shopName': '타이어새활용', 'shopUrl': 'https://example.com/tireup1'},
        {'name': '폐가전제품 화분', 'price': '28,000원', 'rating': 4.7, 'shippingFee': 0, 'reviewCount': 180, 'ecoScore': 94, 'shopName': '가전업', 'shopUrl': 'https://example.com/applianceup1'},
        {'name': '폐철제품 업사이클 화분', 'price': '20,000원', 'rating': 4.3, 'shippingFee': 3000, 'reviewCount': 130, 'ecoScore': 89, 'shopName': '철새생명', 'shopUrl': 'https://example.com/ironup1'},
        {'name': '폐플라스틱 대형 화분', 'price': '30,000원', 'rating': 4.6, 'shippingFee': 0, 'reviewCount': 170, 'ecoScore': 92, 'shopName': '플라스틱업', 'shopUrl': 'https://example.com/plasticup2'},
      ],
    },
  ];

  Color getEcoScoreColor(int score) {
    double factor = math.pow((score - 50) / 50, 3) as double;
    factor = factor.clamp(0.0, 1.0);

    int red = (255 * (1 - factor)).round();
    int green = (255 * (1 - factor) + 100 * factor).round();
    int blue = (220 * (1 - factor)).round();

    return Color.fromRGBO(red.clamp(0, 255), green.clamp(0, 255), blue.clamp(0, 255), 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('업사이클 제품'),
          bottom: TabBar(
            tabs: [
              Tab(text: '에코백'),
              Tab(text: '키링'),
              Tab(text: '화분'),
            ],
          ),
        ),
        body: TabBarView(
          children: upcycleProducts.map((category) {
            return ListView.builder(
              itemCount: category['products'].length,
              itemBuilder: (context, index) {
                var product = category['products'][index];
                return _buildProductItem(context, product);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, Map<String, dynamic> product) {
    Color scoreColor = getEcoScoreColor(product['ecoScore']);
    bool isHighScore = product['ecoScore'] > 75;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoreGoodsInfoScreen(
              name: product['name'],
              price: product['price'],
              rating: product['rating'],
              shippingFee: product['shippingFee'],
              reviewCount: product['reviewCount'],
              ecoScore: product['ecoScore'],
              shopName: product['shopName'],
              shopUrl: product['shopUrl'],
              imageUrl: product['imageUrl'],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFAED581)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFC8E6C9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(child: Icon(Icons.image, size: 50, color: Color(0xFF7CB342))),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(product['price'], style: TextStyle(color: Color(0xFF33691E))),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        Text(' ${product['rating']}', style: TextStyle(fontSize: 12)),
                        SizedBox(width: 4),
                        Text('리뷰 ${product['reviewCount']}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    Text(
                      product['shippingFee'] == 0 ? '무료배송' : '배송비 ${product['shippingFee']}원',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: scoreColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'ECO ${product['ecoScore']}',
                style: TextStyle(
                  color: isHighScore ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: isHighScore ? 14 : 12,
                ),
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}