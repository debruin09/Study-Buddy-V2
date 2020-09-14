import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

import 'package:study_buddy/injection.dart';
import 'package:study_buddy/models/tag_entity.dart';
import 'package:study_buddy/repositories/tag_repository.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';

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
          hintText: "deck tags",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(),
          ),
        )),

        findSuggestions: tagService.getTags,
        additionCallback: additionalCallback,
        // (value) {
        //   return TagEntity(
        //     tag: value,
        //   );
        // },
        onAdded: (t) {
          return TagEntity(tag: t.tag);
        },
        configureSuggestion: (t) {
          return SuggestionConfiguration(
            title: Text(t.tag),
            additionWidget: Chip(
              backgroundColor: cardColor,
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
            deleteIconColor: Colors.redAccent,
          );
        },
        onChanged: onChanged,
        // onChanged: () {},
      ),
    );
  }
}

// Form Button
class FormButton extends StatelessWidget {
  final VoidCallback callback;
  FormButton({
    Key key,
    this.callback,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: Colors.white,
      height: 50.0,
      onPressed: callback,
      child: Text(
        "edit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

// Form Widget
Widget formWidgetBuilder({List<Widget> formItems}) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: formItems,
          ),
        ),
      ),
    ),
  );
}

// New Card Text Input Wigdet
class InputWigdet extends StatelessWidget {
  final int maxLines;

  const InputWigdet({Key key, this.maxLines}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextField(
        maxLines: maxLines,
      ),
    );
  }
}
