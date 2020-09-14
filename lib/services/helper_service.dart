import 'package:study_buddy/models/models.dart';

class GlobalId {
  String _userId;
  String _deckId;
  String _cardId;

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

class CardNotification {
  MyCard card;
}
