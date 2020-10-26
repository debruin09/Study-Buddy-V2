import 'package:study_buddy/domain/core/tag_entity.dart';

abstract class TagRepository {
  Future<List<TagEntity>> getTags(String query);
}
