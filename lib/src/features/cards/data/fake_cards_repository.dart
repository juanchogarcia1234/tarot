import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tarot/src/features/cards/domain/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'fake_cards_repository.g.dart';

class FakeCardsRepository {
  const FakeCardsRepository(this.ref);

  final Ref ref;

  List<Card> getCardsList(String topic) {
    // This method should return a list of cards based on the topic.
    // For now, we will return an empty list as a placeholder.
    return [];
  }

  Card? getCardById(String id) {
    // This method should return a card by its ID.
    // For now, we will return null as a placeholder.
    return null;
  }

  Future<List<Card>> fetchCards() async {
    // Simulate a network call to fetch cards.
    await Future.delayed(const Duration(seconds: 1));
    return []; // Return an empty list for now.
  }

  Future<Card?> fetchCardById(String id) async {
    // Simulate a network call to fetch a card by its ID.
    await Future.delayed(const Duration(seconds: 1));
    return null; // Return null for now.
  }

  Stream<List<Card>> watchCards() async* {
    // Simulate a stream of cards.
    await Future.delayed(const Duration(seconds: 1));
    yield []; // Yield an empty list for now.
  }
}

@riverpod
FakeCardsRepository fakeCardsRepository(Ref ref) {
  return FakeCardsRepository(ref);
}

@riverpod
Stream<List<Card>> cardsListStreamProvider(Ref ref) {
  final cardsRepository = ref.watch(fakeCardsRepositoryProvider);
  return cardsRepository.watchCards();
}
