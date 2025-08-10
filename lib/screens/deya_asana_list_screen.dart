// This screen displays a list of Deya Asanas
import 'package:flutter/material.dart' hide Card;
import 'package:go_router/go_router.dart';
import 'package:tarot/constants.dart';
import 'package:tarot/src/features/cards/domain/card.dart';

// your project structure

class DeyaAsanaListScreen extends StatefulWidget {
  const DeyaAsanaListScreen({super.key});

  @override
  State<DeyaAsanaListScreen> createState() => _DeyaAsanaListScreenState();
}

class _DeyaAsanaListScreenState extends State<DeyaAsanaListScreen> {
  // Selected cards should be a list of card names (List<String>)
  List<Card> _selectedCards = kDeyaCardsHome;
  String _selectedTopic = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          'Deya Asanas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedCards = kDeyaCardsHome;
                    _selectedTopic = 'home';
                  });
                },
                child: Image.asset(
                  'assets/images/spiral-bold.png',
                  width: 45,
                  height: 45,
                ),
              ),

              InkWell(
                onTap: () {
                  setState(() {
                    _selectedCards = kDeyaCardsFire;
                    _selectedTopic = 'fire';
                  });
                },
                child: Image.asset(
                  'assets/images/fire-bold.png',
                  width: 45,
                  height: 45,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedCards = kDeyaCardsEarth;
                    _selectedTopic = 'earth';
                  });
                },
                child: Image.asset(
                  'assets/images/rose-bold.png',
                  width: 45,
                  height: 45,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedCards = kDeyaCardsWind;
                    _selectedTopic = 'wind';
                  });
                },
                child: Image.asset(
                  'assets/images/wind-bold.png',
                  width: 45,
                  height: 45,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedCards = kDeyaCardsWater;
                    _selectedTopic = 'water';
                  });
                },
                child: Image.asset(
                  'assets/images/tear-bold.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7, // Adjust to make image + text fit better
                children: _selectedCards.map((card) {
                  return Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            12,
                          ), // Adjust radius as needed
                          child: Image.asset(
                            'assets/images/deya-asanas-cards/$_selectedTopic/$card.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ), // Replace with your actual widget to display the list
    );
  }
}
