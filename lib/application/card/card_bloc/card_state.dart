part of 'card_bloc.dart';

@freezed
abstract class CardState with _$CardState {
  const factory CardState.initial() = CardInitial;
  const factory CardState.loading() = CardLoadInProgress;
  const factory CardState.success({@required Queue<MyCard> cards}) =
      CardLoadSuccess;
  const factory CardState.empty() = EmptyCardState;
  const factory CardState.error({@required String message}) = CardErrorState;
}
