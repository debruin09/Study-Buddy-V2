import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/auth/login/login_bloc.dart';
import 'package:study_buddy/domain/auth/auth_repository.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/auth/login/login_form.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';

/// Login Screen UI
class LoginScreen extends StatelessWidget {
  final AuthRepository _authRepository = locator.get<AuthRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(authRepository: _authRepository),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    left: 30.0,
                    bottom: 20.0,
                    top: 50.0,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: LoginForm(
                    authRepository: _authRepository,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
