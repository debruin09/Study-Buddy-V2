import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kt_dart/collection.dart';

import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/domain/deck/value_objects.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';

class DeckNameField extends HookWidget {
  const DeckNameField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController();

    return BlocListener<DeckFormBloc, DeckFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEditingController.text = state.deck.name.getOrCrash();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.always,
          controller: textEditingController,
          decoration: const InputDecoration(
            labelText: 'Deck',
            counterText: '',
          ),
          maxLength: DeckName.maxLength,
          maxLines: 1,
          onChanged: (value) => ReadContext(context)
              .read<DeckFormBloc>()
              .add(DeckFormEvent.nameChanged(value)),
          validator: (_) {
            return ReadContext(context)
                .read<DeckFormBloc>()
                .state
                .deck
                .name
                .value
                .fold(
                  (f) => f.maybeMap(
                    empty: (f) => 'Cannot be empty',
                    exceedingLength: (f) => 'Exceeding length, max: ${f.max}',
                    orElse: () => null,
                  ),
                  (r) => null,
                );
          },
        ),
      ),
    );
  }
}
