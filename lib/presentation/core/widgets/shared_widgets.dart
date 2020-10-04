import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

import 'package:study_buddy/injection.dart';
import 'package:study_buddy/domain/core/tag_entity.dart';
import 'package:study_buddy/domain/core/tag_repository.dart';
import 'package:study_buddy/presentation/theme/theme_colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class TagWidget extends StatelessWidget {
  final tagService = locator.get<TagRepository>();
  final List<TagEntity> selectedTags = [];
  final Function onChanged;
  final Function additionalCallback;

  TagWidget({
    Key key,
    this.onChanged,
    this.additionalCallback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FlutterTagging<TagEntity>(
        initialItems: selectedTags,
        textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
          hintText: "tags",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
        )),

        findSuggestions: tagService.getTags,
        additionCallback: additionalCallback,
        onAdded: (t) {
          return TagEntity(tag: t.tag);
        },
        configureSuggestion: (t) {
          return SuggestionConfiguration(
            title: Text(t.tag),
            additionWidget: Chip(
              backgroundColor: Colors.black,
              avatar: Icon(
                Icons.add_circle,
                color: tagsColor,
              ),
              label: Text('Add New Tag'),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          );
        },
        configureChip: (t) {
          return ChipConfiguration(
            label: Text(t.tag),
            backgroundColor: tagsColor,
            labelStyle: TextStyle(color: Colors.black),
            deleteIconColor: Colors.black,
          );
        },
        onChanged: onChanged,
        // onChanged: () {},
      ),
    );
  }
}
