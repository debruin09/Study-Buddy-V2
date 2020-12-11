import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';

class CardList extends HookWidget {
  const CardList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cards = useProvider(formCardsProvider).value;

    return BlocListener<DeckFormBloc, DeckFormState>(
      listenWhen: (p, c) => p.deck.cards.isFull != c.deck.cards.isFull,
      listener: (context, state) {
        if (state.deck.cards.isFull) {
          FlushbarHelper.createAction(
            message: 'Want longer lists? Activate premium 🤩',
            button: FlatButton(
              onPressed: () {},
              child: const Text(
                'BUY NOW',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
            duration: const Duration(seconds: 5),
          ).show(context);
        }
      },
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: cards.size,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CardTile(index: index),
            );
          }),
    );
  }
}

class CardTile extends HookWidget {
  final int index;

  const CardTile({
    @required this.index,
    double elevation,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formCards = useProvider(formCardsProvider).value;
    final card = formCards.getOrElse(index, (_) => CardItemPrimitive.empty());
    return ListTile(
      title: Text(card.front),
      subtitle: Text(card.back),
    );
  }
}
