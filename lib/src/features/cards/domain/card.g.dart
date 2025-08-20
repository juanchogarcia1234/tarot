// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Card _$CardFromJson(Map<String, dynamic> json) => _Card(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  type: $enumDecode(_$CardTypeEnumMap, json['type']),
  topic: $enumDecode(_$CardTopicEnumMap, json['topic']),
  imagePath: json['imagePath'] as String,
  order: (json['order'] as num?)?.toInt(),
);

Map<String, dynamic> _$CardToJson(_Card instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'type': _$CardTypeEnumMap[instance.type]!,
  'topic': _$CardTopicEnumMap[instance.topic]!,
  'imagePath': instance.imagePath,
  'order': instance.order,
};

const _$CardTypeEnumMap = {
  CardType.riderWaite: 'riderWaite',
  CardType.deya: 'deya',
};

const _$CardTopicEnumMap = {
  CardTopic.home: 'home',
  CardTopic.fire: 'fire',
  CardTopic.earth: 'earth',
  CardTopic.wind: 'wind',
  CardTopic.water: 'water',
};
