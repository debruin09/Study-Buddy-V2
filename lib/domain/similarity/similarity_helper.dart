import 'package:dartz/dartz.dart';
import 'package:study_buddy/domain/auth/auth_failure.dart';

// TODO: Change the failure type
extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<AuthFailure, U>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          return obj as AuthFailure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
