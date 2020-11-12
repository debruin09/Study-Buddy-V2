import 'package:flutter/material.dart';

import 'package:study_buddy/domain/core/tag_entity.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/application/deck/deck_bloc.dart';
import 'package:study_buddy/infrastructure/core/tag_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';

class TagWrapper extends StatelessWidget {
  final TagService tagService;
  final String val;
  final Deck deck;

  const TagWrapper({
    Key key,
    @required this.tagService,
    @required this.val,
    @required this.deck,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TagWidget(
          tagService: tagService,
          onChanged: () {
            tagService.tags.add(val);
          },
          additionalCallback: (String value) {
            return TagEntity(
              tag: value,
            );
          },
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.start,
            spacing: 5.0,
            children: deck != null
                ? deck.tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        deleteIcon: Icon(Icons.cancel),
                        onDeleted: () {
                          tagService.tags.removeWhere((String t) => t == tag);
                          locator.get<DeckBloc>().add(
                                DeckEvent.update(
                                  updatedDeck:
                                      deck.copyWith(tags: tagService.tags),
                                ),
                              );
                        },
                      ),
                    )
                    .toList()
                : [Container()],
          ),
        )
      ],
    );
  }
}
