import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/domain/deck/deck.dart';

class GlobalId {
  String _userId;
  String _deckId;
  String _cardId;
  User _user;

  void setUser(User val) {
    _user = val;
  }

  User get getUser => _user;

  void setUserId(String val) {
    _userId = val;
  }

  String get userId => _userId;

  void setDeckId(String val) {
    _deckId = val;
  }

  String get deckId => _deckId;

  void setCardId(String val) {
    _cardId = val;
  }

  String get cardId => _cardId;
}

class DecksScope {
  List<Deck> _decks = [];
  void setDecks(List<Deck> val) {
    _decks = val;
  }

  List<Deck> get decks => _decks;
}
