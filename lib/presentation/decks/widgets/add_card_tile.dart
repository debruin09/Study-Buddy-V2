import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/kt.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';

class AddCardTile extends HookWidget {
  const AddCardTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formProvider = useProvider(formCardsProvider);

    return BlocConsumer<DeckFormBloc, DeckFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        formProvider.value = state.deck.cards.value.fold(
          (f) => listOf<CardItemPrimitive>(),
          (cardItemList) =>
              cardItemList.map((_) => CardItemPrimitive.fromDomain(_)),
        );
      },
      buildWhen: (p, c) => p.deck.cards.isFull != c.deck.cards.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.deck.cards.isFull,
          title: const Text('Add a card'),
          leading: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.add),
          ),
          onTap: () {
            formProvider.value =
                formProvider.value.plusElement(CardItemPrimitive.empty());

            ReadContext(context).read<DeckFormBloc>().add(
                  DeckFormEvent.cardsChanged(formProvider.value),
                );
          },
        );
      },
    );
  }
}
