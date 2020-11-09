import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/auth/login/login_screen.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/home/home_page.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';

class LandingPage extends StatelessWidget {
  final userScope = locator.get<GlobalId>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (success) {
            userScope.setUser(success.user);
            return ExtendedNavigator.root.replace(Routes.homePage,
                arguments: HomePageArguments(user: success.user));
          },
          unauthenticated: (_) =>
              ExtendedNavigator.root.replace(Routes.loginScreen),
        );
      },
      child: _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Study",
                style: GoogleFonts.courgette(
                    color: Colors.white,
                    letterSpacing: 15.0,
                    fontSize: 65.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Buddy",
                style: GoogleFonts.courgette(
                    color: Colors.white,
                    letterSpacing: 15.0,
                    fontSize: 54.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "refine your definitions",
                style: GoogleFonts.questrial(
                    fontSize: 22.0,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Loader(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
