// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_dao.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeckDao _$_$_DeckDaoFromJson(Map<String, dynamic> json) {
  return _$_DeckDao(
    id: json['id'] as String,
    name: json['name'] as String,
    easyCard: json['easyCard'] as int,
    moderateCard: json['moderateCard'] as int,
    hardCard: json['hardCard'] as int,
    cards: (json['cards'] as List)
        ?.map((e) =>
            e == null ? null : CardItemDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_DeckDaoToJson(_$_DeckDao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'easyCard': instance.easyCard,
      'moderateCard': instance.moderateCard,
      'hardCard': instance.hardCard,
      'cards': instance.cards?.map((card) => card?.toJson())?.toList(),
    };
