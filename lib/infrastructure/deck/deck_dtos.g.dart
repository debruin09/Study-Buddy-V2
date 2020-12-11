// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeckDto _$_$_DeckDtoFromJson(Map<String, dynamic> json) {
  return _$_DeckDto(
    name: json['name'] as String,
    easyCard: json['easyCard'] as int,
    moderateCard: json['moderateCard'] as int,
    hardCard: json['hardCard'] as int,
    cards: (json['cards'] as List)
        ?.map((e) =>
            e == null ? null : CardItemDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serverTimeStamp:
        const ServerTimestampConverter().fromJson(json['serverTimeStamp']),
  );
}

Map<String, dynamic> _$_$_DeckDtoToJson(_$_DeckDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'easyCard': instance.easyCard,
      'moderateCard': instance.moderateCard,
      'hardCard': instance.hardCard,
      'cards': instance.cards?.map((card) => card?.toJson())?.toList(),
      'serverTimeStamp':
          const ServerTimestampConverter().toJson(instance.serverTimeStamp),
    };

_$_CardItemDto _$_$_CardItemDtoFromJson(Map<String, dynamic> json) {
  return _$_CardItemDto(
    id: json['id'] as String,
    front: json['front'] as String,
    back: json['back'] as String,
    me: json['me'] as String,
    studied: json['studied'] as bool,
    color: json['color'] as int,
  );
}

Map<String, dynamic> _$_$_CardItemDtoToJson(_$_CardItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'front': instance.front,
      'back': instance.back,
      'me': instance.me,
      'studied': instance.studied,
      'color': instance.color,
    };
