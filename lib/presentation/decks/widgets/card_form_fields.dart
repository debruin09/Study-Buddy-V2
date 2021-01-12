import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';

import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:study_buddy/presentation/decks/misc/card_type_case.dart';

class CardFrontField extends HookWidget {
  final int index;
  final DeckFormBloc deckFormBloc;
  CardFrontField({
    Key key,
    @required this.index,
    @required this.deckFormBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = useProvider(formCardsProvider);
    final card =
        formProvider.value.getOrElse(index, (_) => CardItemPrimitive.empty());
    final frontController = useTextEditingController(text: card.front);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CardItemFormField(
        provider: formProvider,
        deckFormBloc: deckFormBloc,
        cardPrimitive: card,
        index: index,
        controller: frontController,
        cardTypeCase: CardTypeCase.front(),
        onChanged: (value) {
          formProvider.value = formProvider.value.map(
            (listCard) =>
                listCard == card ? card.copyWith(front: value) : listCard,
          );
          deckFormBloc.add(DeckFormEvent.cardsChanged(formProvider.value));
        },
      ),
    );
  }
}

class CardBackField extends HookWidget {
  final int index;
  final DeckFormBloc deckFormBloc;
  CardBackField({
    Key key,
    @required this.index,
    @required this.deckFormBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = useProvider(formCardsProvider);
    final card =
        formProvider.value.getOrElse(index, (_) => CardItemPrimitive.empty());
    final backController = useTextEditingController(text: card.back);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CardItemFormField(
        provider: formProvider,
        deckFormBloc: deckFormBloc,
        cardPrimitive: card,
        index: index,
        controller: backController,
        cardTypeCase: CardTypeCase.back(),
        onChanged: (value) {
          formProvider.value = formProvider.value.map(
            (listCard) =>
                listCard == card ? card.copyWith(back: value) : listCard,
          );
          deckFormBloc.add(DeckFormEvent.cardsChanged(formProvider.value));
        },
      ),
    );
  }
}

class CardMeField extends HookWidget {
  final int index;
  final DeckFormBloc deckFormBloc;

  CardMeField({
    Key key,
    @required this.deckFormBloc,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = useProvider(formCardsProvider);
    final card =
        formProvider.value.getOrElse(index, (_) => CardItemPrimitive.empty());
    final backController = useTextEditingController(text: card.me);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CardItemFormField(
        deckFormBloc: deckFormBloc,
        provider: formProvider,
        cardPrimitive: card,
        index: index,
        controller: backController,
        cardTypeCase: CardTypeCase.me(),
        onChanged: (value) {
          formProvider.value = formProvider.value.map(
            (listCard) =>
                listCard == card ? card.copyWith(me: value) : listCard,
          );
          deckFormBloc.add(DeckFormEvent.cardsChanged(formProvider.value));
        },
        // isFront: false,
      ),
    );
  }
}

class TagsField extends HookWidget {
  final int index;
  final DeckFormBloc deckFormBloc;

  TagsField({
    @required this.deckFormBloc,
    @required this.index,
  });
  @override
  Widget build(BuildContext context) {
    final formProvider = useProvider(formCardsProvider);
    final card =
        formProvider.value.getOrElse(index, (_) => CardItemPrimitive.empty());
    return Wrap(
      children: card.tags.map((tag) => Chip(label: Text(tag))).toList(),
    );
  }
}

class CardItemFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormCards provider;
  final CardItemPrimitive cardPrimitive;
  final int index;
  final DeckFormBloc deckFormBloc;
  final Function onChanged;
  final CardTypeCase cardTypeCase;

  CardItemFormField({
    Key key,
    @required this.controller,
    @required this.provider,
    @required this.cardPrimitive,
    @required this.index,
    @required this.onChanged,
    @required this.cardTypeCase,
    @required this.deckFormBloc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    cleanString(String input) {
      final x = input.substring(0, input.length - 2);
      final upper = x[0].toUpperCase() + x.substring(1);
      return upper;
    }

    return TextFormField(
        autovalidateMode: deckFormBloc.state.isEditing
            ? AutovalidateMode.disabled
            : AutovalidateMode.always,
        controller: controller,
        decoration: InputDecoration(
          labelText: cleanString(cardTypeCase.toString().substring(13)),
          counterText: '',
        ),
        maxLength: CardBack.maxLength,
        minLines: 1,
        maxLines: 5,
        onChanged: onChanged,
        validator: (_) {
          return cardTypeCase.map(
            front: (_) {
              return deckFormBloc.state.deck.cards.value.fold(
                (f) => null,
                (cardList) => cardList[index].front.value.fold(
                      (f) => f.maybeMap(
                        empty: (_) => 'Cannot be empty',
                        exceedingLength: (_) => 'Too long',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
              );
            },
            back: (_) {
              return deckFormBloc.state.deck.cards.value.fold(
                (f) => null,
                (cardList) => cardList[index].back.value.fold(
                      (f) => f.maybeMap(
                        empty: (_) => 'Cannot be empty',
                        exceedingLength: (_) => 'Too long',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
              );
            },
            me: (_) {
              return deckFormBloc.state.deck.cards.value.fold(
                (f) => null,
                (cardList) => cardList[index].me.value.fold(
                      (f) => f.maybeMap(
                        empty: (_) => 'Cannot be empty',
                        exceedingLength: (_) => 'Too long',
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
              );
            },
          );
        });
  }
}

enum CardType { Front, Back, Me }
