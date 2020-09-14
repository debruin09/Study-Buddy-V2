import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/blocs/auth_bloc/auth_bloc.dart';
import 'package:study_buddy/blocs/deckCubit/status_cubit.dart';
import 'package:study_buddy/blocs/simple_bloc_observer.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/repositories/auth_repository.dart';

import 'package:study_buddy/ui/routes/router.gr.dart' as r;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  final AuthRepository authRepository = locator.get<AuthRepository>();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: authRepository)..add(AuthStarted()),
        ),
        BlocProvider(create: (context) => DeckStatusCubit()),
        BlocProvider(create: (context) => CardStatusCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator<r.Router>(
        router: r.Router(),
      ),
    );
  }
}
