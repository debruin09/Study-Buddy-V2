import 'package:study_buddy/domain/core/tag_entity.dart';

class TagService {
  List<String> _tags = [];
  List<String> get tags => _tags;

  Future<List<TagEntity>> getTags(String query) async {
    final tagEntity = _tags
        .map((tag) => TagEntity(
              tag: tag,
            ))
        .toList();

    return tagEntity
        .where((t) => t.tag.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
