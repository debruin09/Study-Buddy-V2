import 'package:study_buddy/domain/core/tag_entity.dart';
import 'package:study_buddy/domain/core/tag_repository.dart';

class TagService implements TagRepository {
  @override
  Future<List<TagEntity>> getTags(String query) async {
    await Future.delayed(Duration(milliseconds: 200), null);
    return <TagEntity>[
      TagEntity(
        tag: 'test',
      ),
      TagEntity(
        tag: 'maths',
      ),
      TagEntity(
        tag: 'database',
      ),
    ].where((t) => t.tag.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
