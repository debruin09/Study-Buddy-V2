// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:study_buddy/models/models.dart';

// class SharedPref {
//  Future read(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     return json.decode(prefs.getString(key));
//   }

//   save(String key, List<Deck> decks) async {
//     final prefs = await SharedPreferences.getInstance();
//     decks.map((deck) => prefs.setString(key, json.encode(deck)));
//   }

//   remove(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.remove(key);
//   }

//   loadSharedPrefs(List<Deck> decks) async {
//   try {
//     decks.map((deck) => Deck.fromJson(await read("user")));

//   } catch (Excepetion) {
//     // do something
//   }
// }
// }
