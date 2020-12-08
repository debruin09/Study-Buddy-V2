import 'package:kt_dart/collection.dart';
import 'package:study_buddy/domain/deck/deck.dart';

class DeckSingleton {
  KtList<Deck> _decks = emptyList();

  // ignore: unnecessary_getters_setters
  KtList<Deck> get decks => _decks;
  // ignore: unnecessary_getters_setters
  set decks(KtList<Deck> val) {
    _decks = val;
  }
}
