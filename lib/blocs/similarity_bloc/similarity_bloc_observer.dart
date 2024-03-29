import 'package:bloc/bloc.dart';

class SimilarityBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    print('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  // @override
  // Future<void> onError(Bloc bloc, Object error, StackTrace stackTrace) async {
  //   print('onError $error');
  //   super.onError(bloc, error, stackTrace);
  // }
}
