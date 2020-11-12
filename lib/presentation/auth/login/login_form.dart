import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/application/auth/login/login_bloc.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/auth_button.dart';

/// This is the login form UI
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChange);
    _passwordController.addListener(_onPasswordChange);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Loging failed'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: primaryColor,
              ),
            );
        }

        if (state.isSubmitting) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Login in'),
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  ],
                ),
                backgroundColor: primaryColor,
              ),
            );
        }

        if (state.isSuccess) {
          BlocProvider.of<AuthBloc>(context).add(
            const AuthEvent.authStateCheck(),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                        style: BorderStyle.solid,
                        width: 3.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  validator: (_) =>
                      !state.isEmailValid ? 'Invalid Email' : null,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                        style: BorderStyle.solid,
                        width: 3.0,
                      ),
                    ),
                  ),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  validator: (_) =>
                      !state.isPasswordValid ? 'Invalid Password' : null,
                ),
                SizedBox(
                  height: 10,
                ),
                AuthButton(
                  color: primaryColor,
                  onPressed: () {
                    if (isButtonEnabled(state)) {
                      _onFormSubmitted();
                    }
                  },
                  text: Text(
                    'LogIn',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ExtendedNavigator.root
                                  .replace(Routes.registerScreen);
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChange() {
    _loginBloc.add(LoginEvent.emailChanged(email: _emailController.text));
  }

  void _onPasswordChange() {
    _loginBloc
        .add(LoginEvent.passwordChanged(password: _passwordController.text));
  }

  void _onFormSubmitted() {
    _loginBloc.add(LoginEvent.loginWithCredentials(
        email: _emailController.text, password: _passwordController.text));
  }
}
