import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/application/auth/login/login_bloc.dart';
import 'package:study_buddy/presentation/core/widgets/auth_button.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';

/// This is the register form UI
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
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
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.isFailure) {
        Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Register failed'),
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
                  Text('Registering account'),
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
        context.read<AuthBloc>().add(
              const AuthEvent.authStateCheck(),
            );
      }
    }, builder: (context, state) {
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
                validator: (_) => !state.isEmailValid ? 'Invalid Email' : null,
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
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AuthButton(
                color: Colors.red,
                onPressed: () {
                  context
                      .read<LoginBloc>()
                      .add(const LoginEvent.signInWithGooglePressed());
                },
                text: Text(
                  "Sign up with Google",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black, fontSize: 14.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16.0),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            ExtendedNavigator.root.replace(Routes.loginScreen);
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
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
    _loginBloc.add(LoginEvent.registerWithCredentials(
        email: _emailController.text, password: _passwordController.text));
  }
}
