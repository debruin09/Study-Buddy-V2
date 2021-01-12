import 'package:auto_route/auto_route.dart' as e;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:injectable/injectable.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart' as auto;
import 'package:timezone/data/latest.dart' as lz;
import 'presentation/core/theme_styles.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: primaryColor,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  lz.initializeTimeZones();
  configureInjection(Environment.dev);
  setupLocator();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                locator<AuthBloc>()..add(const AuthEvent.authCheckRequested())),
      ],
      child: ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appThemeStyle,
          builder: e.ExtendedNavigator<auto.Router>(router: auto.Router()),
        ),
      ),
    );
  }
}
