import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

import 'package:study_buddy/injection.dart';
import 'package:study_buddy/domain/core/tag_entity.dart';
import 'package:study_buddy/domain/core/tag_repository.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';

class Loader extends StatelessWidget {
  final Color color;

  const Loader({Key key, this.color = Colors.white}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color,
      size: 30.0,
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
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
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
              backgroundColor: primaryColor,
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
            labelStyle: TextStyle(color: Colors.white),
            deleteIconColor: Colors.white,
          );
        },
        onChanged: onChanged,
        // onChanged: () {},
      ),
    );
  }
}
