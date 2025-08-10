import 'package:flutter/material.dart';

class CardsListScreen extends StatelessWidget {
  const CardsListScreen({super.key});

  static const List<Map<String, String>> tarotCards = [
    {"image": "assets/images/1.jpg", "title": "Дурак"},
    {"image": "assets/images/2.jpg", "title": "Маг"},
    {"image": "assets/images/3.jpg", "title": "Верховная Жрица"},
    {"image": "assets/images/4.jpg", "title": "Императрица"},
    {"image": "assets/images/5.jpg", "title": "Император"},
    {"image": "assets/images/6.jpg", "title": "Иерофант"},
    // Add more cards as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Карты Таро')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6, // Adjust to make image + text fit better
          children: tarotCards.map((card) {
            return Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Image.asset(card['image']!, fit: BoxFit.cover),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
