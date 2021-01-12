import 'dart:io';

import 'package:study_buddy/domain/deck/deck.dart';

class DecksScope {
  List<Deck> _decks = [];
  void setDecks(List<Deck> val) {
    _decks = val;
  }

  List<Deck> get decks => _decks;
}

class ImageFileDetails {
  File _imageFile;
  String _imageUrl;

  void setImageFile(File value) {
    _imageFile = value;
  }

  void setImageUrl(String value) {
    _imageUrl = value;
  }

  File get imageFile => _imageFile;
  String get imageUrl => _imageUrl;
}
