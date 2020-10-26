import 'package:flutter_tagging/flutter_tagging.dart';

class TagEntity extends Taggable {
  final String tag;

// Creates tags
  TagEntity({
    this.tag,
  });

  static String tagToStrings(TagEntity tagEntity) {
    return tagEntity.tag.toString();
  }

  @override
  List<Object> get props => [tag];
}
