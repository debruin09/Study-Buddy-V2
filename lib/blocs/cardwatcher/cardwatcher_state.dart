part of 'cardwatcher_bloc.dart';

class CardWatcherState {
  final bool isCardNameValid;
  final bool isCardTagsValid; // OPTIONAL
  final bool isFrontValid;
  final bool isBackValid;
  final bool isSuccess;
  final bool isFailure;
  final bool isSubmitting;

  // form validity
  bool get isFormValid =>
      isCardNameValid && isFrontValid && isBackValid || isCardTagsValid;

  CardWatcherState({
    this.isBackValid,
    this.isCardNameValid,
    this.isCardTagsValid,
    this.isFailure,
    this.isSuccess,
    this.isSubmitting,
    this.isFrontValid,
  });

  factory CardWatcherState.initial() {
    return CardWatcherState(
      isBackValid: true,
      isCardNameValid: true,
      isCardTagsValid: true,
      isFrontValid: true,
      isSuccess: true,
      isSubmitting: false,
      isFailure: false,
    );
  }
  factory CardWatcherState.loading() {
    return CardWatcherState(
      isBackValid: true,
      isCardNameValid: true,
      isCardTagsValid: true,
      isFrontValid: true,
      isSuccess: false,
      isSubmitting: true,
      isFailure: false,
    );
  }
  factory CardWatcherState.sucesss() {
    return CardWatcherState(
      isBackValid: true,
      isCardNameValid: true,
      isCardTagsValid: true,
      isFrontValid: true,
      isSuccess: true,
      isSubmitting: false,
      isFailure: false,
    );
  }
  factory CardWatcherState.faliure() {
    return CardWatcherState(
      isBackValid: true,
      isCardNameValid: true,
      isCardTagsValid: true,
      isFrontValid: true,
      isSuccess: false,
      isSubmitting: false,
      isFailure: true,
    );
  }

  CardWatcherState update({
    bool isCardNameValid,
    bool isCardTagsValid,
    bool isFrontValid,
    bool isBackValid,
  }) {
    return copyWith(
      isCardNameValid: isCardNameValid,
      isCardTagsValid: isCardTagsValid,
      isFrontValid: isFrontValid,
      isBackValid: isBackValid,
      isSuccess: false,
      isFailure: false,
      isSubmitting: false,
    );
  }

  CardWatcherState copyWith(
      {bool isCardNameValid,
      bool isCardTagsValid,
      bool isFrontValid,
      bool isBackValid,
      bool isSubmitting,
      bool isSuccess,
      bool isFailure}) {
    return CardWatcherState(
      isCardNameValid: isCardNameValid ?? this.isCardNameValid,
      isCardTagsValid: isCardTagsValid ?? this.isCardTagsValid,
      isFrontValid: isFrontValid ?? this.isFrontValid,
      isBackValid: isBackValid ?? this.isBackValid,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}
