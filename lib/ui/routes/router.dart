import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:study_buddy/ui/pages/create/create_new_card.dart';
import 'package:study_buddy/ui/pages/create/create_new_deck.dart';
import 'package:study_buddy/ui/pages/main/deck_study_page.dart';
import 'package:study_buddy/ui/pages/main/home_page.dart';
import 'package:study_buddy/ui/pages/splash_page.dart';

@MaterialAutoRouter()
class $Router {
  HomePage homePage;
  @initial
  LandingPage landingPage;
  CreateNewCardPage createNewCardPage;
  @MaterialRoute(fullscreenDialog: true)
  CreateNewDeckPage createNewDeckPage;
  @CustomRoute(
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: 200)
  DeckStudyPage deckStudyPage;
}
