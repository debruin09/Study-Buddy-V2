import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/auth/login/login_screen.dart';
import 'package:study_buddy/presentation/main/home_page.dart';
import 'package:study_buddy/presentation/theme/theme_colors.dart';

class LandingPage extends StatelessWidget {
  final getUserId = locator.get<GlobalId>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              return _SplashScreen();
            } else if (state is AuthSuccess) {
              return HomePage();
            } else if (state is AuthFailure) {
              return LoginScreen();
            }
          },
        ));
  }
}

class _SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/splash.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  bgColor.withOpacity(0.85),
                  bgColor.withOpacity(0.85),
                ]),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Study",
                  style: TextStyle(
                      letterSpacing: 15.0,
                      fontSize: 65.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Buddy",
                  style: TextStyle(
                      letterSpacing: 15.0,
                      fontSize: 54.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "refine your definitions",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 34.0,
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
