import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

class MoreGoodsInfoScreen extends StatelessWidget {
  final String name;
  final String price;
  final double rating;
  final int shippingFee;
  final int reviewCount;
  final int ecoScore;
  final String shopName;
  final String shopUrl;
  final String imageUrl;

  MoreGoodsInfoScreen({
    required this.name,
    required this.price,
    required this.rating,
    required this.shippingFee,
    required this.reviewCount,
    required this.ecoScore,
    required this.shopName,
    required this.shopUrl,
    required this.imageUrl,
  });

  Color getEcoScoreColor(int score) {
    double factor = math.pow((score - 50) / 50, 3) as double;
    factor = factor.clamp(0.0, 1.0);

    int red = (255 * (1 - factor)).round();
    int green = (255 * (1 - factor) + 100 * factor).round();
    int blue = (220 * (1 - factor)).round();

    return Color.fromRGBO(red.clamp(0, 255), green.clamp(0, 255), blue.clamp(0, 255), 1);
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Color scoreColor = getEcoScoreColor(ecoScore);
    bool isHighScore = ecoScore > 75;

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error, size: 100, color: Colors.grey[400]),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: scoreColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: scoreColor.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(
                      'ECO Score: $ecoScore',
                      style: TextStyle(
                        color: isHighScore ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: isHighScore ? 18 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(price, style: TextStyle(fontSize: 20, color: Colors.green)),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(' $rating', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 16),
                      Text('리뷰 $reviewCount개', style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    shippingFee == 0 ? '무료배송' : '배송비 ${shippingFee}원',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  SizedBox(height: 16),
                  Text('판매처: $shopName', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 24),
                  Text('제품 설명', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('이 제품은 환경 친화적인 재료로 만들어졌습니다. 사용 후 재활용이 가능하며, 탄소 발자국을 줄이는 데 도움이 됩니다.'),
                  SizedBox(height: 24),
                  ElevatedButton(
                    child: Text('구매하기'),
                    onPressed: () {
                      _launchUrl(shopUrl);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}