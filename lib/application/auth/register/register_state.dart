part of 'register_bloc.dart';

class RegisterState {
  final bool isEmailValid;
  final bool isUsernameValid;
  final bool isTypeValid;
  final bool isRouteValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid =>
      isEmailValid &&
      isPasswordValid &&
      isUsernameValid &&
      isTypeValid &&
      isRouteValid;

  RegisterState(
      {this.isEmailValid,
      this.isRouteValid,
      this.isUsernameValid,
      this.isTypeValid,
      this.isPasswordValid,
      this.isSubmitting,
      this.isSuccess,
      this.isFailure});

  factory RegisterState.initial() {
    return RegisterState(
      isEmailValid: true,
      isUsernameValid: true,
      isTypeValid: true,
      isRouteValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegisterState.loading() {
    return RegisterState(
      isEmailValid: true,
      isUsernameValid: true,
      isRouteValid: true,
      isTypeValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegisterState.failure() {
    return RegisterState(
      isEmailValid: true,
      isUsernameValid: true,
      isRouteValid: true,
      isTypeValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory RegisterState.success() {
    return RegisterState(
      isEmailValid: true,
      isUsernameValid: true,
      isRouteValid: true,
      isTypeValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  RegisterState update({
    bool isEmailValid,
    bool isUsernameValid,
    bool isRouteValid,
    bool isTypeValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isUsernameValid: isUsernameValid,
      isTypeValid: isTypeValid,
      isRouteValid: isRouteValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegisterState copyWith({
    bool isEmailValid,
    bool isUsernameValid,
    bool isRouteValid,
    bool isTypeValid,
    bool isPasswordValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return RegisterState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isTypeValid: isTypeValid ?? this.isTypeValid,
      isRouteValid: isRouteValid ?? this.isRouteValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}

// part of 'register_bloc.dart';

// @freezed
// abstract class RegisterState with _$RegisterState {

//   // bool get isFormValid => isEmailValid && isPasswordValid && isUsernameValid;

//   const factory RegisterState.initial(
//       {@required bool isEmailValid,
//       @required bool isUsernameValid,
//       @required bool isPasswordValid,
//       @required bool isSubmitting,
//       @required bool isSuccess,
//       @required bool isFailure}) = _RegisterIntial;

//   // Initial
//   //   return RegisterState(
//   //     isEmailValid: true,
//   //     isUsernameValid: true,
//   //     isPasswordValid: true,
//   //     isSubmitting: false,
//   //     isSuccess: false,
//   //     isFailure: false,
//   //   );
//   // }

//   factory RegisterState.loading({
//     @required bool isEmailValid,
//     @required bool isUsernameValid,
//     @required bool isPasswordValid,
//     @required bool isSubmitting,
//     @required bool isSuccess,
//     @required bool isFailure,
//   }) = _RegisterLoading;

// // Loading
//   //   return RegisterState(
//   //     isEmailValid: true,
//   //     isUsernameValid: true,
//   //     isPasswordValid: true,
//   //     isSubmitting: true,
//   //     isSuccess: false,
//   //     isFailure: false,
//   //   );
//   // }

//   const factory RegisterState.failure({
//     @required bool isEmailValid,
//     @required bool isUsernameValid,
//     @required bool isPasswordValid,
//     @required bool isSubmitting,
//     @required bool isSuccess,
//     @required bool isFailure,
//   }) = _RegisterStateFailure;

// // failure

//   //   return RegisterState(
//   //     isEmailValid: true,
//   //     isUsernameValid: true,
//   //     isPasswordValid: true,
//   //     isSubmitting: false,
//   //     isSuccess: false,
//   //     isFailure: true,
//   //   );
//   // }

//   factory RegisterState.success({
//     @required bool isEmailValid,
//     @required bool isUsernameValid,
//     @required bool isPasswordValid,
//     @required bool isSubmitting,
//     @required bool isSuccess,
//     @required bool isFailure,
//   }) = _RegisterStateSuccess;

// // succes
//   //   return RegisterState(
//   //     isEmailValid: true,
//   //     isUsernameValid: true,
//   //     isPasswordValid: true,
//   //     isSubmitting: false,
//   //     isSuccess: true,
//   //     isFailure: false,
//   //   );
//   // }

//   // RegisterState update({
//   //   bool isEmailValid,
//   //   bool isUsernameValid,
//   //   bool isRouteValid,
//   //   bool isTypeValid,
//   //   bool isPasswordValid,
//   // }) {
//   //   return copyWith(
//   //     isEmailValid: isEmailValid,
//   //     isUsernameValid: isUsernameValid,
//   //     isPasswordValid: isPasswordValid,
//   //     isSubmitting: false,
//   //     isSuccess: false,
//   //     isFailure: false,
//   //   );
//   // }

//   // RegisterState copyWith({
//   //   bool isEmailValid,
//   //   bool isUsernameValid,
//   //   bool isPasswordValid,
//   //   bool isSubmitting,
//   //   bool isSuccess,
//   //   bool isFailure,
//   // }) {
//   //   return RegisterState(
//   //     isEmailValid: isEmailValid ?? this.isEmailValid,
//   //     isUsernameValid: isUsernameValid ?? this.isUsernameValid,
//   //     isPasswordValid: isPasswordValid ?? this.isPasswordValid,
//   //     isSubmitting: isSubmitting ?? this.isSubmitting,
//   //     isSuccess: isSuccess ?? this.isSuccess,
//   //     isFailure: isFailure ?? this.isFailure,
//   //   );
//   // }
// }
