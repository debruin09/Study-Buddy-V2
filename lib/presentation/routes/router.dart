import 'package:auto_route/auto_route_annotations.dart';
import 'package:study_buddy/presentation/auth/login/login_screen.dart';
import 'package:study_buddy/presentation/auth/register/register_screen.dart';
import 'package:study_buddy/presentation/core/widgets/image_viewer.dart';
import 'package:study_buddy/presentation/decks/card_form_page.dart';
import 'package:study_buddy/presentation/decks/deck_form_page.dart';
import 'package:study_buddy/presentation/pomodoro/pomodoro_page.dart';
import 'package:study_buddy/presentation/settings/settings_page.dart';
import 'package:study_buddy/presentation/studied_cards/studied_cards_page.dart';
import 'package:study_buddy/presentation/study/study_page.dart';
import 'package:study_buddy/presentation/home/home_page.dart';
import 'package:study_buddy/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(page: HomePage),
      MaterialRoute(page: LandingPage, initial: true),
      MaterialRoute(page: DeckFormPage, fullscreenDialog: true),
      MaterialRoute(page: StudyPage, fullscreenDialog: true),
      MaterialRoute(page: PomodoroPage, fullscreenDialog: true),
      MaterialRoute(page: SettingsPage, fullscreenDialog: true),
      MaterialRoute(page: CardFormPage, fullscreenDialog: true),
      MaterialRoute(page: LoginScreen),
      MaterialRoute(page: ImageViewerPage),
      MaterialRoute(page: StudiedCardsPage, fullscreenDialog: true),
      MaterialRoute(page: RegisterScreen),
    ])
class $Router {}
