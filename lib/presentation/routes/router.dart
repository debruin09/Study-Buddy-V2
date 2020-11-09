import 'package:auto_route/auto_route_annotations.dart';
import 'package:study_buddy/presentation/auth/login/login_screen.dart';
import 'package:study_buddy/presentation/auth/register/register_screen.dart';
import 'package:study_buddy/presentation/core/widgets/image_viewer.dart';
import 'package:study_buddy/presentation/create/create_new_card.dart';
import 'package:study_buddy/presentation/create/create_new_deck.dart';
import 'package:study_buddy/presentation/study/deck_study_page.dart';
import 'package:study_buddy/presentation/home/home_page.dart';
import 'package:study_buddy/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(page: HomePage),
      MaterialRoute(page: LandingPage, initial: true),
      MaterialRoute(page: CreateNewCardPage, fullscreenDialog: true),
      MaterialRoute(page: CreateNewDeckPage, fullscreenDialog: true),
      MaterialRoute(page: DeckStudyPage, fullscreenDialog: true),
      MaterialRoute(page: LoginScreen),
      MaterialRoute(page: ImageViewerPage),
      MaterialRoute(page: RegisterScreen),
    ])
class $Router {}
