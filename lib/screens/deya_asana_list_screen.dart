// This screen displays a list of Deya Asanas
import 'dart:developer' as Logger show log;

import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tarot/constants.dart';
import 'package:tarot/firestore_repository.dart';
import 'package:tarot/src/features/cards/domain/card.dart';

// your project structure

class DeyaAsanaListScreen extends ConsumerStatefulWidget {
  const DeyaAsanaListScreen({super.key});

  @override
  ConsumerState<DeyaAsanaListScreen> createState() =>
      _DeyaAsanaListScreenState();
}

class _DeyaAsanaListScreenState extends ConsumerState<DeyaAsanaListScreen> {
  // Selected cards should be a list of card names (List<String>)
  List<Card> _selectedCards = kDeyaCardsHome;
  String _selectedTopic = 'home';

  @override
  Widget build(BuildContext context) {
    final firestoreRepo = ref.watch(firestoreRepositoryProvider);
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
              child: FirestoreQueryBuilder(
                query: firestoreRepo.cardsQuery(
                  cardType: 'deya',
                  topic: 'water',
                ),
                builder: (context, snapshot, _) {
                  if (snapshot.hasError) {
                    Logger.log(snapshot.error.toString());
                    return Center(child: Text('Error: \\${snapshot.error}'));
                  }
                  if (snapshot.isFetching) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.7,
                      children: snapshot.docs.map((doc) {
                        final data = doc.data();
                        return Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child:
                                    data.imagePath != null &&
                                        data.imagePath.toString().isNotEmpty
                                    ? Image.network(
                                        data.imagePath,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(color: Colors.grey[300]),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ), // Replace with your actual widget to display the list
    );
  }
}





// GridView.count(
//                 crossAxisCount: 3,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 childAspectRatio: 0.7, // Adjust to make image + text fit better
//                 children: _selectedCards.map((card) {
//                   return Column(
//                     children: [
//                       Expanded(
//                         flex: 5,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                             12,
//                           ), // Adjust radius as needed
//                           child: Image.asset(
//                             'assets/images/deya-asanas-cards/$_selectedTopic/$card.jpg',
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }).toList(),
//               ),