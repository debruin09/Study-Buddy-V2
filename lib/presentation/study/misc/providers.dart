import 'package:flutter_riverpod/all.dart';
import 'package:kt_dart/collection.dart';
import 'package:study_buddy/presentation/decks/misc/card_item_presentation_classes.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

final unstudiedCardsProvider =
    Provider.autoDispose<KtList<CardItemPrimitive>>((ref) {
  final formCards = ref.watch(formCardsProvider);
  return formCards.value.isNotEmpty()
      ? formCards.value.filter((card) => !card.studied)
      : emptyList<CardItemPrimitive>();
});

final showAnswerProvider = StateProvider((ref) => false);
final showRecordProvider = StateProvider((ref) => false);
final isListeningProvider = StateProvider((ref) => false);

final speechToTextProvider =
    Provider<stt.SpeechToText>((ref) => stt.SpeechToText());
