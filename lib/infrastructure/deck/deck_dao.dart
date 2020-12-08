import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:study_buddy/domain/core/value_objects.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/infrastructure/deck/deck_dtos.dart';

part 'deck_dao.freezed.dart';
part 'deck_dao.g.dart';

@freezed
abstract class DeckDao implements _$DeckDao {
  const DeckDao._();

  const factory DeckDao({
    @required String id,
    @required String name,
    @required int easyCard,
    @required int moderateCard,
    @required int hardCard,
    @required List<CardItemDto> cards,
  }) = _DeckDao;

  factory DeckDao.fromDomain(Deck deck) {
    final cards = deck.cards
        .getOrCrash()
        .map(
          (cardItem) => CardItemDto.fromDomain(cardItem),
        )
        .asList();

    return DeckDao(
      id: deck.id.getOrCrash(),
      name: deck.name.getOrCrash(),
      cards: cards,
      easyCard: deck.easyCard.getOrCrash(),
      moderateCard: deck.moderateCard.getOrCrash(),
      hardCard: deck.hardCard.getOrCrash(),
    );
  }

  Deck toDomain() {
    return Deck(
      id: UniqueId.fromUniqueString(id),
      name: DeckName(name),
      easyCard: EasyCard(easyCard),
      hardCard: HardCard(hardCard),
      moderateCard: ModerateCard(moderateCard),
      cards: List6(cards.map((dto) => dto.toDomain()).toImmutableList()),
    );
  }

  factory DeckDao.fromJson(Map<String, dynamic> json) =>
      _$DeckDaoFromJson(json);
}
