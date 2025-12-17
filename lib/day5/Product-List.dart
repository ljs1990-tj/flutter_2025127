import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    /// 임의의 리스트
    final List<Map<String, dynamic>> productList = [
      {
        'pName': '무선 키보드',
        'category': '전자기기',
        'price': 45000,
        'info': '조용한 타건감의 블루투스 키보드',
      },
      {
        'pName': '텀블러',
        'category': '생활용품',
        'price': 18000,
        'info': '보온·보냉 스테인리스 텀블러',
      },
      {
        'pName': '러닝화',
        'category': '스포츠',
        'price': 129000,
        'info': '장시간 러닝에 적합한 쿠션',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('제품 목록'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue[300],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: '목록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '등록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '마이페이지',
          ),
        ],
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];

          return Card(
            margin: EdgeInsets.all(6),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product['pName'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.category_outlined, size: 18),
                      SizedBox(width: 6),
                      Text(
                        product['category'],
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.payments_outlined, size: 18),
                      SizedBox(width: 6),
                      Text(
                        '₩ ${product['price']}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    product['info'],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
