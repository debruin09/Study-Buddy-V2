import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';

final filterProvider = StateProvider((ref) => "All");

class FilterDropdown extends HookWidget {
  final KtList<Deck> decks;

  const FilterDropdown({Key key, @required this.decks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final deckNames = decks.map((deck) => deck.name.getOrCrash()).iter.toList();
    deckNames.insert(0, "All");
    final _chosenValue = useProvider(filterProvider);
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Decks',
        labelStyle: Theme.of(context)
            .primaryTextTheme
            .caption
            .copyWith(color: Colors.black),
        border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          isDense: true, // Reduces the dropdowns height by +/- 50%
          icon: Icon(Icons.keyboard_arrow_down),
          value: _chosenValue.state,
          items: deckNames.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (selectedItem) => _chosenValue.state = selectedItem,
        ),
      ),
    );
  }
}
