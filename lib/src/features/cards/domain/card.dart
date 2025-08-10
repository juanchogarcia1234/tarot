class Card {
  final String id;
  final String title;
  final String description;
  final CardType type;
  final CardTopic topic;
  final String imagePath;
  final int? order;

  Card({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.topic,
    required this.imagePath,
    this.order,
  });
}

enum CardType { riderWaite, deya }

enum CardTopic { home, fire, earth, wind, water }
