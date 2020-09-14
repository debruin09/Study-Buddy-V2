// import 'dart:async';
// import 'dart:io';

// import 'package:study_buddy/failures/failures.dart';
// import 'package:study_buddy/models/deck.dart';
// import 'package:study_buddy/models/mycard.dart';
// import 'package:study_buddy/repositories/database_repository.dart';

// // class FakeDatabaseClient {
// //   static List<MyCard> cards1 = [
// //     MyCard(
// //       front: 'Amazon SNS',
// //       back: "What is sns provide a definition",
// //       me: "My Defenition of SNS",
// //     ),
// //     MyCard(
// //         front: 'Dynamo DB',
// //         back: "It is a serverless DB",
// //         me: "This is a test me"),
// //   ];

// //   static List<MyCard> cards2 = [
// //     MyCard(
// //       front: "Integrals",
// //       back: "Area under the curve",
// //       me: "Anti-Derivative",
// //     ),
// //     MyCard(
// //         front: "Derivative",
// //         back: "Tangent to a graph",
// //         me: "Rate of change at a point"),
// //   ];

// //   List<Deck> listOfDecks = [
// //     Deck(deckName: "AWS Deck", cards: cards1),
// //     Deck(deckName: "Calculus Deck", cards: cards2),
// //     Deck(deckName: "Biology Deck", cards: cards2),
// //   ];

// //   StreamController<List<Deck>> controller =
// //       StreamController<List<Deck>>.broadcast();
// //   Stream<List<Deck>> get deckStream => controller.stream;
// //   StreamSink<List<Deck>> get deckSink => controller.sink;

// //   void dispose() {
// //     controller.close();
// //   }

// //   FakeDatabaseClient() {
// //     print("running fake db client... ");
// //     deckStream.listen((event) => print(event));
// //   }

// //   Stream snapshot() {
// //     deckSink.add(listOfDecks);
// //     return deckStream;
// //   }
// // }

// class FakeDatabaseService implements DatabaseRepository {
//   //Depend
//   // FakeDatabaseClient fakeDatabaseClient;
//   // FakeDatabaseService(this.fakeDatabaseClient);
//   FakeDatabaseService() {
//     deckSink.add(listOfDecks);
//   }

//   List<Deck> listOfDecks = [
//     Deck(
//         deckName: "AWS Deck",
//         cards: [],
//         id: 'gdgdfgd',
//         lastCreated: "23 August 2020",
//         tags: ["aws", "test"]),
//     Deck(
//         deckName: "Calculus Deck",
//         cards: [],
//         id: 'gdgdfgd',
//         lastCreated: "13 July 2020",
//         tags: ["math", "intergral"]),
//     Deck(
//         deckName: "Biology Deck",
//         cards: [],
//         id: 'gdgdfgd',
//         lastCreated: "5 September 2020",
//         tags: ["bio", "test"]),
//   ];

//   StreamController<List<Deck>> controller =
//       StreamController<List<Deck>>.broadcast();
//   Stream<List<Deck>> get deckStream => controller.stream;
//   StreamSink<List<Deck>> get deckSink => controller.sink;

//   @override
//   Stream<List<Deck>> decks() {
//     try {
//       return deckStream;
//     } on SocketException {
//       throw Failure('No Internet connection 😑');
//     } on HttpException {
//       throw Failure("Couldn't find the post 😱");
//     } on FormatException {
//       throw Failure("Bad response format 👎");
//     }
//   }

//   @override
//   Future<void> addNewDeck(Deck deck) {}

//   @override
//   Future<void> deleteDeck(Deck deck) {}

//   @override
//   Future<void> updateDeck(Deck deck) {}
// }
