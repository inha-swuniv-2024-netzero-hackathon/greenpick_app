import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'MyProfileScreen.dart';
import 'MoreGoodsInfoScreen.dart';
import 'EcoGoodsListScreen.dart';
import 'UpcycleGoodsListScreen.dart';
import 'MainDrawer.dart';  // MainDrawer import 추가
import 'dart:math' as math;

class MainScreen extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Green Pick'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => MyProfileScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(position: offsetAnimation, child: child);
                  },
                  transitionDuration: Duration(milliseconds: 300),
                ),
              );
            },
          ),
        ],
      ),
      drawer: MainDrawer(),  // MainDrawer 추가
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: <Widget>[
                  _buildCategoryItem(context, Icons.eco, '재활용 제품'),
                  _buildCategoryItem(context, Icons.recycling, '업사이클 제품'),
                  _buildCategoryItem(context, Icons.battery_charging_full, '에너지 절약'),
                  _buildCategoryItem(context, Icons.nature, '친환경 제품'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '추천 제품',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildProductGrid(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == '친환경 제품') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EcoGoodsListScreen()),
          );
        } else if (title == '업사이클 제품') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UpcycleGoodsListScreen()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: Color(0xFF7CB342)),
            SizedBox(height: 8),
            Text(title, style: TextStyle(color: Color(0xFF33691E))),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.55,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: <Widget>[
        _buildProductItem(context, '하이사이클 커피자루 업사이클링 에코백 코지숄더', '32,000원', 4.5, 0, 120, 85, '코지샵', 'https://www.coupang.com/vp/products/1808460?itemId=7930692&vendorItemId=3116363578&q=%EC%97%85%EC%82%AC%EC%9D%B4%ED%81%B4+%EA%B0%80%EB%B0%A9&itemsCount=36&searchId=48dd197e2602433bb3854c6de8d2aacd&rank=1&isAddedCart=', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/images/2017/03/27/11/8/d04a9098-4bf8-4ce5-8379-2ddbb4861eb7.jpg'),
        _buildProductItem(context, '룰루홈 컬러풀 동글 플라스틱 의자, 옐로우, 1개', '9720', 4.2, 3000, 85, 92, '그린마켓', 'https://example.com/greenmarket', 'https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/rs_quotation_api/2zmyhyvi/0c9f406e6f704862963e6b3b57bcf665.jpg'),
        _buildProductItem(context, '폐플라스틱을 재활용하여 만든 업사이클링 키링 5종', '1200원', 4.8, 0, 200, 78, '지구살림', 'https://example.com/earthcare', 'https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/bdbc/1d8b528756412753d7bfb6a43e48d0df821aeeadba213201f85e478e2504.jpg'),
        _buildProductItem(context, 'JKM591 오리지널 노트', '8,000원', 4.0, 3000, 50, 55, '에코라이프', 'https://example.com/ecolife', 'https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/f731/73144ad7b340e412920ad3ea6a3614485de5c04909810c801f7c891c0021.jpg'),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context, String name, String price, double rating, int shippingFee, int reviewCount, int ecoScore, String shopName, String shopUrl, String imageUrl) {
    Color scoreColor = getEcoScoreColor(ecoScore);
    bool isHighScore = ecoScore > 75;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoreGoodsInfoScreen(
              name: name,
              price: price,
              rating: rating,
              shippingFee: shippingFee,
              reviewCount: reviewCount,
              ecoScore: ecoScore,
              shopName: shopName,
              shopUrl: shopUrl,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFAED581)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
                    Text(price, style: TextStyle(color: Color(0xFF33691E), fontSize: 11)),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.amber),
                        Text(' $rating', style: TextStyle(fontSize: 10)),
                        SizedBox(width: 4),
                        Text('($reviewCount)', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                    Text(
                      shippingFee == 0 ? '무료배송' : '배송비 ${shippingFee}원',
                      style: TextStyle(fontSize: 10, color: Colors.blue),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: scoreColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'ECO $ecoScore',
                        style: TextStyle(
                          color: isHighScore ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}