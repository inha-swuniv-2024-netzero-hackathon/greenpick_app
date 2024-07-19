import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'MoreGoodsInfoScreen.dart';
import 'dart:math' as math;

class EcoGoodsListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> ecoProducts = [
    {
      'category': '수세미',
      'products': [
        {'name': '천연 리빙생각 수세미', 'price': '5,000원', 'rating': 4.5, 'shippingFee': 0, 'reviewCount': 120, 'ecoScore': 90, 'shopName': '에코샵', 'shopUrl': 'https://example.com/ecoshop1', 'imageUrl': 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/7ac5/419701d07a53a50a072b98b9340b0c1d0b09e1c0136e1b93d874b2b54910.jpg'},
        {'name': '대나무 자연 재사용 수세미', 'price': '6,000원', 'rating': 4.3, 'shippingFee': 2500, 'reviewCount': 80, 'ecoScore': 85, 'shopName': '그린마켓', 'shopUrl': 'https://example.com/greenmarket1', 'imageUrl': 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/f362/a3feb9063e492fee7a6d856347002c855d22f6c6218bfefbca1a101be04e.jpg'},
        {'name': '코코넛 수제 수세미', 'price': '5,500원', 'rating': 4.4, 'shippingFee': 0, 'reviewCount': 100, 'ecoScore': 88, 'shopName': '자연마켓', 'shopUrl': 'https://example.com/naturemarket1', 'imageUrl': 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/ddbc/92b380502b3f6120137b759903b14625a0440ed84d7a01a2c42c6d4133d6.jpg'},
        {'name': '장수 통통한 수세미', 'price': '4,500원', 'rating': 4.2, 'shippingFee': 2000, 'reviewCount': 90, 'ecoScore': 87, 'shopName': '친환경샵', 'shopUrl': 'https://example.com/ecofriendlyshop1', 'imageUrl': 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/39ff/0428f416710374ec2ffb6b1151fda63f39d026add141d41ef85ffd144081.jpg'},
        {'name': '달빛풍선 다용도 주방 천연수세미 20cm 미니사이즈 4개', 'price': '7,000원', 'rating': 4.6, 'shippingFee': 0, 'reviewCount': 110, 'ecoScore': 92, 'shopName': '전통마켓', 'shopUrl': 'https://example.com/traditionalmarket1', 'imageUrl': 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/7c35/13a7f7b02c8b1bd4de023485f1d05e177fea2b172ddb8e21478acbe13f82.png'},
        {'name': '컨티뉴어스 양면 수세미, 1개입, 3개', 'price': '6,500원', 'rating': 4.1, 'shippingFee': 2500, 'reviewCount': 70, 'ecoScore': 86, 'shopName': '리넨샵', 'shopUrl': 'https://example.com/linenshop1', 'imageUrl': 'https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/26d0/32250a361ef2f8a32eeb35384c663b78f2574eb2ae5c076124274d5e7578.jpg'},
      ],
    },
    {
      'category': '친환경 치약',
      'products': [
        {'name': '죽염 치약', 'price': '8,000원', 'rating': 4.7, 'shippingFee': 0, 'reviewCount': 200, 'ecoScore': 88, 'shopName': '자연마켓', 'shopUrl': 'https://example.com/naturemarket2', 'imageUrl': 'https://example.com/images/bamboo_salt_toothpaste.jpg'},
        {'name': '플라스틱 프리 치약', 'price': '10,000원', 'rating': 4.4, 'shippingFee': 3000, 'reviewCount': 150, 'ecoScore': 92, 'shopName': '제로웨이스트샵', 'shopUrl': 'https://example.com/zerowaste1', 'imageUrl': 'https://example.com/images/plastic_free_toothpaste.jpg'},
        {'name': '유기농 치약', 'price': '9,000원', 'rating': 4.5, 'shippingFee': 0, 'reviewCount': 180, 'ecoScore': 90, 'shopName': '오가닉마켓', 'shopUrl': 'https://example.com/organicmarket1', 'imageUrl': 'https://example.com/images/organic_toothpaste.jpg'},
        {'name': '미네랄 치약', 'price': '11,000원', 'rating': 4.6, 'shippingFee': 2500, 'reviewCount': 130, 'ecoScore': 89, 'shopName': '건강마켓', 'shopUrl': 'https://example.com/healthmarket1', 'imageUrl': 'https://example.com/images/mineral_toothpaste.jpg'},
        {'name': '대나무 칫솔 세트', 'price': '15,000원', 'rating': 4.3, 'shippingFee': 0, 'reviewCount': 100, 'ecoScore': 91, 'shopName': '에코라이프', 'shopUrl': 'https://example.com/ecolife2', 'imageUrl': 'https://example.com/images/bamboo_toothbrush_set.jpg'},
        {'name': '천연 구강 케어 세트', 'price': '20,000원', 'rating': 4.8, 'shippingFee': 3000, 'reviewCount': 220, 'ecoScore': 93, 'shopName': '내추럴케어', 'shopUrl': 'https://example.com/naturalcare1', 'imageUrl': 'https://example.com/images/natural_oral_care_set.jpg'},
      ],
    },
    {
      'category': '친환경 빨대',
      'products': [
        {'name': '스테인리스 빨대', 'price': '12,000원', 'rating': 4.6, 'shippingFee': 0, 'reviewCount': 180, 'ecoScore': 95, 'shopName': '에코라이프', 'shopUrl': 'https://example.com/ecolife1', 'imageUrl': 'https://example.com/images/stainless_straw.jpg'},
        {'name': '유리 빨대 세트', 'price': '15,000원', 'rating': 4.2, 'shippingFee': 2500, 'reviewCount': 100, 'ecoScore': 87, 'shopName': '그린라이프', 'shopUrl': 'https://example.com/greenlife1', 'imageUrl': 'https://example.com/images/glass_straw_set.jpg'},
        {'name': '대나무 빨대', 'price': '8,000원', 'rating': 4.4, 'shippingFee': 0, 'reviewCount': 150, 'ecoScore': 92, 'shopName': '내추럴샵', 'shopUrl': 'https://example.com/naturalshop1', 'imageUrl': 'https://example.com/images/bamboo_straw.jpg'},
        {'name': '실리콘 빨대', 'price': '10,000원', 'rating': 4.5, 'shippingFee': 2000, 'reviewCount': 120, 'ecoScore': 88, 'shopName': '제로웨이스트', 'shopUrl': 'https://example.com/zerowaste2', 'imageUrl': 'https://example.com/images/silicone_straw.jpg'},
        {'name': '종이 빨대 100개입', 'price': '5,000원', 'rating': 4.0, 'shippingFee': 0, 'reviewCount': 200, 'ecoScore': 86, 'shopName': '에코팩', 'shopUrl': 'https://example.com/ecopack1', 'imageUrl': 'https://example.com/images/paper_straws.jpg'},
        {'name': '밀짚 빨대 세트', 'price': '7,000원', 'rating': 4.3, 'shippingFee': 2500, 'reviewCount': 90, 'ecoScore': 89, 'shopName': '자연주의', 'shopUrl': 'https://example.com/naturalism1', 'imageUrl': 'https://example.com/images/wheat_straw_set.jpg'},
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
          title: Text('친환경 제품'),
          bottom: TabBar(
            tabs: [
              Tab(text: '수세미'),
              Tab(text: '친환경 치약'),
              Tab(text: '친환경 빨대'),
            ],
          ),
        ),
        body: TabBarView(
          children: ecoProducts.map((category) {
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: product['imageUrl'],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.image, size: 50, color: Color(0xFF7CB342)),
                ),
              ),
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