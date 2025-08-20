import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

@freezed
abstract class Card with _$Card {
  const factory Card({
    required String id,
    required String title,
    required String description,
    required CardType type,
    required CardTopic topic,
    required String imagePath,
    required int? order,
  }) = _Card;

  factory Card.fromJson(Map<String, Object?> json) => _$CardFromJson(json);
}

enum CardType { riderWaite, deya }

enum CardTopic { home, fire, earth, wind, water }
