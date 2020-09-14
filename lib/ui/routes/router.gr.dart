// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/ui/pages/main/home_page.dart';
import 'package:study_buddy/models/deck.dart';
import 'package:study_buddy/ui/pages/splash_page.dart';
import 'package:study_buddy/ui/pages/create/create_new_card.dart';
import 'package:study_buddy/ui/pages/create/create_new_deck.dart';
import 'package:study_buddy/ui/pages/main/deck_study_page.dart';

abstract class Routes {
  static const homePage = '/home-page';
  static const editCardPage = '/edit-card-page';
  static const editDeckPage = '/edit-deck-page';
  static const landingPage = '/';
  static const createNewCardPage = '/create-new-card-page';
  static const createNewDeckPage = '/create-new-deck-page';
  static const deckStudyPage = '/deck-study-page';
  static const all = {
    homePage,
    editCardPage,
    editDeckPage,
    landingPage,
    createNewCardPage,
    createNewDeckPage,
    deckStudyPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(),
          settings: settings,
        );

      case Routes.landingPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LandingPage(),
          settings: settings,
        );
      case Routes.createNewCardPage:
        if (hasInvalidArgs<CreateNewCardPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<CreateNewCardPageArguments>(args);
        }
        final typedArgs = args as CreateNewCardPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateNewCardPage(
            card: typedArgs.card,
          ),
          settings: settings,
        );
      case Routes.createNewDeckPage:
        if (hasInvalidArgs<CreateNewDeckPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<CreateNewDeckPageArguments>(args);
        }
        final typedArgs = args as CreateNewDeckPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateNewDeckPage(
            deck: typedArgs.deck,
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.deckStudyPage:
        if (hasInvalidArgs<DeckStudyPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<DeckStudyPageArguments>(args);
        }
        final typedArgs = args as DeckStudyPageArguments;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DeckStudyPage(
            deck: typedArgs.deck,
          ),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.zoomIn,
          transitionDuration: const Duration(milliseconds: 200),
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//CreateNewCardPage arguments holder class
class CreateNewCardPageArguments {
  final MyCard card;
  CreateNewCardPageArguments({this.card});
}

//CreateNewDeckPage arguments holder class
class CreateNewDeckPageArguments {
  final Deck deck;
  CreateNewDeckPageArguments({this.deck});
}

//DeckStudyPage arguments holder class
class DeckStudyPageArguments {
  final Deck deck;
  DeckStudyPageArguments({@required this.deck});
}
