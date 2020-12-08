import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';

import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:study_buddy/presentation/decks/misc/card_type_case.dart';

class CardFrontField extends HookWidget {
  final int index;
  CardFrontField({
    Key key,
    @required this.index,
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
        cardPrimitive: card,
        index: index,
        controller: frontController,
        cardTypeCase: CardTypeCase.front(),
        onChanged: (value) {
          formProvider.value = formProvider.value.map(
            (listCard) =>
                listCard == card ? card.copyWith(front: value) : listCard,
          );
          ReadContext(context)
              .read<DeckFormBloc>()
              .add(DeckFormEvent.cardsChanged(formProvider.value));
        },
      ),
    );
  }
}

class CardBackField extends HookWidget {
  final int index;
  CardBackField({
    Key key,
    @required this.index,
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
        cardPrimitive: card,
        index: index,
        controller: backController,
        cardTypeCase: CardTypeCase.back(),
        onChanged: (value) {
          formProvider.value = formProvider.value.map(
            (listCard) =>
                listCard == card ? card.copyWith(back: value) : listCard,
          );
          ReadContext(context)
              .read<DeckFormBloc>()
              .add(DeckFormEvent.cardsChanged(formProvider.value));
        },
      ),
    );
  }
}

class CardMeField extends HookWidget {
  final int index;
  CardMeField({
    Key key,
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
          ReadContext(context)
              .read<DeckFormBloc>()
              .add(DeckFormEvent.cardsChanged(formProvider.value));
        },
        // isFront: false,
      ),
    );
  }
}

class CardItemFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormCards provider;
  final CardItemPrimitive cardPrimitive;
  final int index;
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
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.always,
        controller: controller,
        decoration: InputDecoration(
          labelText: cardTypeCase.toString(),
          counterText: '',
        ),
        maxLength: CardBack.maxLength,
        minLines: 1,
        maxLines: 5,
        onChanged: onChanged,

        // cardTypeCase.map(
        //   front: (_) {
        //     provider.value = provider.value.map(
        //       (listCard) => listCard == cardPrimitive
        //           ? cardPrimitive.copyWith(front: value)
        //           : listCard,
        //     );
        //   },
        //   back: (_) {
        //     provider.value = provider.value.map(
        //       (listCard) => listCard == cardPrimitive
        //           ? cardPrimitive.copyWith(back: value)
        //           : listCard,
        //     );
        //   },
        //   me: (_) {
        //     provider.value = provider.value.map(
        //       (listCard) => listCard == cardPrimitive
        //           ? cardPrimitive.copyWith(me: value)
        //           : listCard,
        //     );
        //   },
        // );

        // ReadContext(context)
        //     .read<DeckFormBloc>()
        //     .add(DeckFormEvent.cardsChanged(provider.value));

        validator: (_) {
          return cardTypeCase.map(
            front: (_) {
              return ReadContext(context)
                  .read<DeckFormBloc>()
                  .state
                  .deck
                  .cards
                  .value
                  .fold(
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
              return ReadContext(context)
                  .read<DeckFormBloc>()
                  .state
                  .deck
                  .cards
                  .value
                  .fold(
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
              return ReadContext(context)
                  .read<DeckFormBloc>()
                  .state
                  .deck
                  .cards
                  .value
                  .fold(
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

// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/all.dart';
// import 'package:kt_dart/collection.dart';

// import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
// import 'package:study_buddy/domain/deck/value_objects.dart';
// import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
// import 'package:study_buddy/presentation/decks/misc/card_type_case.dart';

// class CardFrontField extends HookWidget {
//   final int index;
//   CardFrontField({
//     Key key,
//     @required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final formProvider = useProvider(formCardsProvider);
//     final card =
//         formProvider.value.getOrElse(index, (_) => CardItemPrimitive.empty());
//     final frontController = useTextEditingController(text: card.front);
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: TextFormField(
//      autovalidateMode: AutovalidateMode.always,
//         controller: frontController,
//         decoration: InputDecoration(
//           labelText: 'Me',
//           counterText: '',
//         ),
//         maxLength: CardFront.maxLength,
//         minLines: 1,
//         maxLines: 5,
//         onChanged: (value) {
//           formProvider.value = formProvider.value.map(
//             (listCard) =>
//                 listCard == card ? card.copyWith(front: value) : listCard,
//           );

//           ReadContext(context)
//               .read<DeckFormBloc>()
//               .add(DeckFormEvent.cardsChanged(formProvider.value));
//         },
//         validator: (_) => ReadContext(context)
//                   .read<DeckFormBloc>()
//                   .state
//                   .deck
//                   .cards
//                   .value
//                   .fold(
//                     (f) => null,
//                     (cardList) => cardList[index].front.value.fold(
//                           (f) => f.maybeMap(
//                             empty: (_) => 'Cannot be empty',
//                             exceedingLength: (_) => 'Too long',
//                             orElse: () => null,
//                           ),
//                           (_) => null,
//                         ),
//                   ),
//       ),
//     );
//   }
// }

// class CardBackField extends HookWidget {
//   final int index;
//   CardBackField({
//     Key key,
//     @required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final formProvider = useProvider(formCardsProvider);
//     final card =
//         formProvider.value.getOrElse(index, (_) => CardItemPrimitive.empty());
//     final backController = useTextEditingController(text: card.back);
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: TextFormField(
//      autovalidateMode: AutovalidateMode.always,
//         controller: backController,
//         decoration: InputDecoration(
//           labelText: 'Me',
//           counterText: '',
//         ),
//         maxLength: CardBack.maxLength,
//         minLines: 1,
//         maxLines: 5,
//         onChanged: (value) {
//           formProvider.value = formProvider.value.map(
//             (listCard) =>
//                 listCard == card ? card.copyWith(back: value) : listCard,
//           );

//           ReadContext(context)
//               .read<DeckFormBloc>()
//               .add(DeckFormEvent.cardsChanged(formProvider.value));
//         },
//         validator: (_) => ReadContext(context)
//                   .read<DeckFormBloc>()
//                   .state
//                   .deck
//                   .cards
//                   .value
//                   .fold(
//                     (f) => null,
//                     (cardList) => cardList[index].back.value.fold(
//                           (f) => f.maybeMap(
//                             empty: (_) => 'Cannot be empty',
//                             exceedingLength: (_) => 'Too long',
//                             orElse: () => null,
//                           ),
//                           (_) => null,
//                         ),
//                   ),
//       ),
//     );
//   }
// }

// class CardMeField extends HookWidget {
//   final int index;
//   CardMeField({
//     Key key,
//     @required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final formProvider = useProvider(formCardsProvider);
//     final card =
//         formProvider.value.getOrElse(index, (_) => CardItemPrimitive.empty());
//     final myController = useTextEditingController(text: card.me);
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: TextFormField(
//      autovalidateMode: AutovalidateMode.always,
//         controller: myController,
//         decoration: InputDecoration(
//           labelText: 'Me',
//           counterText: '',
//         ),
//         maxLength: CardBack.maxLength,
//         minLines: 1,
//         maxLines: 5,
//         onChanged: (value) {
//           formProvider.value = formProvider.value.map(
//             (listCard) =>
//                 listCard == card ? card.copyWith(me: value) : listCard,
//           );

//           ReadContext(context)
//               .read<DeckFormBloc>()
//               .add(DeckFormEvent.cardsChanged(formProvider.value));
//         },
//         validator: (_) => ReadContext(context)
//                   .read<DeckFormBloc>()
//                   .state
//                   .deck
//                   .cards
//                   .value
//                   .fold(
//                     (f) => null,
//                     (cardList) => cardList[index].front.value.fold(
//                           (f) => f.maybeMap(
//                             empty: (_) => 'Cannot be empty',
//                             exceedingLength: (_) => 'Too long',
//                             orElse: () => null,
//                           ),
//                           (_) => null,
//                         ),
//                   ),
//       ),
//     );
//   }
// }
