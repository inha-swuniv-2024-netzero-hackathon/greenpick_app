import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  int exp = 280; // 예시 현재 경험치
  int totalEcoPoint = 280; // 예시 누적 포인트
  int purchasedItems = 5; // 예시 구매 제품 갯수

  void _addPoints(int points) {
    setState(() {
      totalEcoPoint += points;
      exp += points;

      // Check for level up
      while (exp >= 300) {
        exp -= 300; // Reduce exp by 300 for each level up
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int ecoLevel = (totalEcoPoint / 300).floor() + 1;
    int expInCurrentLevel = exp % 300;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('My Eco Profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF9CCC65), Colors.green[100]!],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            children: <Widget>[
              // 마스코트 캐릭터
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: ecoLevel == 4 ? 250 : 200,
                height: ecoLevel == 4 ? 250 : 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: ecoLevel == 4 ? Colors.green.withOpacity(0.7) : Colors.green.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.eco,
                    size: 100,
                    color: ecoLevel == 4 ? Colors.green[700] : Color(0xFF9CCC65),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Eco 레벨 $ecoLevel',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              // 현재 경험치 상태바
              Text(
                'EXP: $expInCurrentLevel / 300',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: expInCurrentLevel / 300,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 15,
                ),
              ),
              SizedBox(height: 30),
              // 구매한 제품 갯수
              _buildInfoCard(Icons.shopping_bag, '구매한 제품', '$purchasedItems개'),
              SizedBox(height: 15),
              // 누적 Eco Point
              _buildInfoCard(Icons.eco, '누적 EcoPoint', '$totalEcoPoint점'),
              SizedBox(height: 30),
              // 포인트 얻기 버튼
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _addPoints(100);
                  },
                  child: Text('포인트 얻기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF9CCC65), size: 30),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF9CCC65))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}