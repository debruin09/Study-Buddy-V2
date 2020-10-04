import 'package:hooks_riverpod/all.dart';

// class CardsNotifier extends StateNotifier<int> {
//   CardsNotifier(int state) : super(0);

//   void nextCard() => state++;
// }

final cardsProvider = StateProvider<int>((ref) => 0);
final cardCountProvider = StateProvider<int>((ref) => 0);
