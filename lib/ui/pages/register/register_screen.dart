import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/blocs/register_bloc/register_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/repositories/auth_repository.dart';
import 'package:study_buddy/ui/pages/register/register_form.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';

/// This is the register UI
class RegisterScreen extends StatelessWidget {
  final AuthRepository _authRepository = locator.get<AuthRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(authRepository: _authRepository),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 180,
                      left: 30.0,
                    ),
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/auth.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 180,
                      left: 30.0,
                    ),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black26,
                            Colors.black38,
                          ]),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 180,
                      left: 30.0,
                    ),
                    height: MediaQuery.of(context).size.height,
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 450.0,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
