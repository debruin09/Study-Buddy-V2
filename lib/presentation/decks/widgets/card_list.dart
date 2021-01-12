import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';

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
      child: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CardTile(index: index),
            );
          },
          childCount: cards.size,
        ),
      ),
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
    final formCards = useProvider(formCardsProvider);
    final card =
        formCards.value.getOrElse(index, (_) => CardItemPrimitive.empty());

    return GestureDetector(
      onLongPress: () {
        ExtendedNavigator.root.pushCardFormPage(
          deckFormBloc: ReadContext(context).read<DeckFormBloc>(),
          index: index,
        );
      },
      child: Material(
        elevation: 3.0,
        child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.15,
          secondaryActions: [
            IconSlideAction(
              caption: 'Delete',
              icon: Icons.delete,
              color: Colors.red,
              onTap: () {
                formCards.value = formCards.value.minusElement(card);
                ReadContext(context)
                    .read<DeckFormBloc>()
                    .add(DeckFormEvent.cardsChanged(formCards.value));
              },
            ),
          ],
          child: ExpansionTile(
            key: Key(card.id.getOrCrash()),
            title: Text(
              "${card.front} ${card.studied ? "(studied)" : ""}",
            ),
            // subtitle: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20.0),
            //   ),
            //   width: double.infinity,
            //   height: 30.0,
            //   margin: EdgeInsets.only(
            //     top: 20.0,
            //   ),
            //   child: ListView(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       children: card.tags
            //           .map(
            //             (tag) => Padding(
            //               padding: const EdgeInsets.only(right: 8.0),
            //               child: Chip(
            //                 backgroundColor: tagsColor,
            //                 label: Text('$tag'),
            //                 labelStyle: TextStyle(
            //                   fontSize: 11.0,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.bold,
            //                 ),
            //               ),
            //             ),
            //           )
            //           .toList(),),

            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.white54,
              ),
              Text("Back: " + card.back),
              SizedBox(
                height: 8.0,
              ),
              Text("ME: " + card.me)
            ],
            childrenPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          ),
        ),
      ),
    );
  }
}
