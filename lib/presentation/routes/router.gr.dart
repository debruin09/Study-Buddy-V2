// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/presentation/auth/login/login_screen.dart';
import 'package:study_buddy/presentation/auth/register/register_screen.dart';

import '../create/create_new_card.dart';
import '../create/create_new_deck.dart';
import '../study/deck_study_page.dart';
import '../main/home_page.dart';
import '../splash/splash_page.dart';

class Routes {
  static const String homePage = '/home-page';
  static const String landingPage = '/';
  static const String createNewCardPage = '/create-new-card-page';
  static const String createNewDeckPage = '/create-new-deck-page';
  static const String deckStudyPage = '/deck-study-page';
  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';
  static const all = <String>{
    homePage,
    landingPage,
    createNewCardPage,
    createNewDeckPage,
    deckStudyPage,
    loginScreen,
    registerScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.landingPage, page: LandingPage),
    RouteDef(Routes.createNewCardPage, page: CreateNewCardPage),
    RouteDef(Routes.createNewDeckPage, page: CreateNewDeckPage),
    RouteDef(Routes.deckStudyPage, page: DeckStudyPage),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomePage(),
        settings: data,
      );
    },
    LandingPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LandingPage(),
        settings: data,
      );
    },
    CreateNewCardPage: (data) {
      final args = data.getArgs<CreateNewCardPageArguments>(
        orElse: () => CreateNewCardPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateNewCardPage(
          key: args.key,
          card: args.card,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CreateNewDeckPage: (data) {
      final args = data.getArgs<CreateNewDeckPageArguments>(
        orElse: () => CreateNewDeckPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateNewDeckPage(
          key: args.key,
          deck: args.deck,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    DeckStudyPage: (data) {
      final args = data.getArgs<DeckStudyPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => DeckStudyPage(
          key: args.key,
          deck: args.deck,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    RegisterScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushHomePage() => push<dynamic>(Routes.homePage);

  Future<dynamic> pushLandingPage() => push<dynamic>(Routes.landingPage);

  Future<dynamic> pushCreateNewCardPage({
    Key key,
    MyCard card,
  }) =>
      push<dynamic>(
        Routes.createNewCardPage,
        arguments: CreateNewCardPageArguments(key: key, card: card),
      );

  Future<dynamic> pushCreateNewDeckPage({
    Key key,
    Deck deck,
  }) =>
      push<dynamic>(
        Routes.createNewDeckPage,
        arguments: CreateNewDeckPageArguments(key: key, deck: deck),
      );

  Future<dynamic> pushDeckStudyPage({
    Key key,
    @required Deck deck,
  }) =>
      push<dynamic>(
        Routes.deckStudyPage,
        arguments: DeckStudyPageArguments(key: key, deck: deck),
      );

  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);

  Future<dynamic> pushRegisterScreen() => push<dynamic>(Routes.registerScreen);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CreateNewCardPage arguments holder class
class CreateNewCardPageArguments {
  final Key key;
  final MyCard card;
  CreateNewCardPageArguments({this.key, this.card});
}

/// CreateNewDeckPage arguments holder class
class CreateNewDeckPageArguments {
  final Key key;
  final Deck deck;
  CreateNewDeckPageArguments({this.key, this.deck});
}

/// DeckStudyPage arguments holder class
class DeckStudyPageArguments {
  final Key key;
  final Deck deck;
  DeckStudyPageArguments({this.key, @required this.deck});
}