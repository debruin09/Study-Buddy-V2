import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/presentation/decks/deck_form_page.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:study_buddy/presentation/decks/widgets/card_form_fields.dart';

class CardFormPage extends HookWidget {
  final DeckFormBloc deckFormBloc;
  final int index;

  const CardFormPage(
      {Key key, @required this.deckFormBloc, @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formProvider = useProvider(formCardsProvider);

    return BlocBuilder<DeckFormBloc, DeckFormState>(
        cubit: deckFormBloc,
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) {
          return Stack(children: [
            SavingInProgressOverlay(isSaving: deckFormBloc.state.isSaving),
            Scaffold(
              appBar: AppBar(
                  brightness: Brightness.dark,
                  title: Text(
                    'Create card',
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        deckFormBloc.add(const DeckFormEvent.saved());
                      },
                      icon: Icon(
                        Icons.check,
                      ),
                    ),
                  ]),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CardFrontField(
                      index: index,
                      deckFormBloc: deckFormBloc,
                    ),
                    CardBackField(
                      index: index,
                      deckFormBloc: deckFormBloc,
                    ),
                    CardMeField(
                      index: index,
                      deckFormBloc: deckFormBloc,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TagsField(
                        index: index,
                        deckFormBloc: deckFormBloc,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text('Add tags'),
                      onTap: () {
                        print("Tester. $index");
                        _addTags(context, index, deckFormBloc, formProvider);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]);
        });
  }
}

Future _addTags(context, int index, DeckFormBloc deckFormBloc,
    FormCards formProvider) async {
  List<String> tags = [];
  var tagsController = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add tags"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: tagsController,
                ),
                Wrap(
                  children: tags
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
                TagsField(index: index, deckFormBloc: deckFormBloc),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "cancel",
                  style: TextStyle(color: Colors.black),
                )),
            TextButton(
                onPressed: () {
                  // tags.add(tagsController.text);

                  print("This is the updated form value: $tags");
                },
                child: Text(
                  "add",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        );
      });
}
