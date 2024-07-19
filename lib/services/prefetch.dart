import 'dart:convert';
import 'package:http/http.dart' as http;

// API 요청을 위한 기본 URL
const String baseUrl = 'http://3.39.243.184/api/goods/category/';

// 특정 카테고리에 대한 제품 데이터 가져오기
Future<List<Map<String, dynamic>>> fetchProducts(String category) async {
  final response = await http.get(Uri.parse('baseUrl$category'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => {
      'name': item['name'],
      'price': '${item['price']}원',
      'rating': item['rate'].toDouble(),
      'shippingFee': item['deliveryDate'],
      'reviewCount': item['reviewCount'],
      'ecoScore': item['greenScore'],
      'shopName': item['market'],
      'shopUrl': item['marketUrl']
    }).toList();
  } else {
    throw Exception('Failed to load products');
  }
}