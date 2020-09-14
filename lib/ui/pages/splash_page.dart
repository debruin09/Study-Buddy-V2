import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/blocs/auth_bloc/auth_bloc.dart';
import 'package:study_buddy/ui/pages/main/home_page.dart';
import 'package:study_buddy/ui/pages/login/login_screen.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthFailure) {
            return LoginScreen();
          }
          if (state is AuthSuccess) {
            return HomePage(user: state.user);
          }
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white.withOpacity(0.8),
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
        },
      ),
    );
  }
}
