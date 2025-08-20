import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tarot/src/features/cards/domain/card.dart' show Card;

class FirestoreRepository {
  FirestoreRepository(this._firestore);
  final FirebaseFirestore _firestore;

  Query<Card> cardsQuery({required String cardType, required String topic}) {
    try {
      return _firestore
          .collection('cards')
          .withConverter<Card>(
            fromFirestore: (snapshot, _) {
              try {
                return Card.fromJson(snapshot.data()!);
              } catch (e) {
                throw Exception(
                  'Failed to convert Firestore document to Card: $e',
                );
              }
            },
            toFirestore: (card, _) {
              try {
                return card.toJson();
              } catch (e) {
                throw Exception(
                  'Failed to convert Card to Firestore document: $e',
                );
              }
            },
          )
          .where('type', isEqualTo: cardType)
          .where('topic', isEqualTo: topic)
          .orderBy('order');
    } catch (e) {
      throw Exception('Failed to build Firestore query: $e');
    }
  }
}

final firestoreRepositoryProvider = Provider<FirestoreRepository>(
  (ref) => FirestoreRepository(FirebaseFirestore.instance),
);
