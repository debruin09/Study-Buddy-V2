// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/auth/user.dart';
import '../../domain/deck/deck.dart';
import '../auth/login/login_screen.dart';
import '../auth/register/register_screen.dart';
import '../core/widgets/image_viewer.dart';
import '../decks/deck_form_page.dart';
import '../home/home_page.dart';
import '../splash/splash_page.dart';
import '../studied_cards/studied_cards_page.dart';
import '../study/study_page.dart';

class Routes {
  static const String homePage = '/home-page';
  static const String landingPage = '/';
  static const String deckFormPage = '/deck-form-page';
  static const String studyPage = '/study-page';
  static const String loginScreen = '/login-screen';
  static const String imageViewerPage = '/image-viewer-page';
  static const String studiedCardsPage = '/studied-cards-page';
  static const String registerScreen = '/register-screen';
  static const all = <String>{
    homePage,
    landingPage,
    deckFormPage,
    studyPage,
    loginScreen,
    imageViewerPage,
    studiedCardsPage,
    registerScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.landingPage, page: LandingPage),
    RouteDef(Routes.deckFormPage, page: DeckFormPage),
    RouteDef(Routes.studyPage, page: StudyPage),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.imageViewerPage, page: ImageViewerPage),
    RouteDef(Routes.studiedCardsPage, page: StudiedCardsPage),
    RouteDef(Routes.registerScreen, page: RegisterScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    HomePage: (data) {
      final args = data.getArgs<HomePageArguments>(
        orElse: () => HomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    LandingPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LandingPage(),
        settings: data,
      );
    },
    DeckFormPage: (data) {
      final args = data.getArgs<DeckFormPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => DeckFormPage(
          key: args.key,
          deck: args.deck,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    StudyPage: (data) {
      final args = data.getArgs<StudyPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => StudyPage(
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
    ImageViewerPage: (data) {
      final args = data.getArgs<ImageViewerPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => ImageViewerPage(
          key: args.key,
          imageFile: args.imageFile,
        ),
        settings: data,
      );
    },
    StudiedCardsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StudiedCardsPage(),
        settings: data,
        fullscreenDialog: true,
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
  Future<dynamic> pushHomePage({
    Key key,
    User user,
  }) =>
      push<dynamic>(
        Routes.homePage,
        arguments: HomePageArguments(key: key, user: user),
      );

  Future<dynamic> pushLandingPage() => push<dynamic>(Routes.landingPage);

  Future<dynamic> pushDeckFormPage({
    Key key,
    @required Deck deck,
  }) =>
      push<dynamic>(
        Routes.deckFormPage,
        arguments: DeckFormPageArguments(key: key, deck: deck),
      );

  Future<dynamic> pushStudyPage({
    Key key,
    @required Deck deck,
  }) =>
      push<dynamic>(
        Routes.studyPage,
        arguments: StudyPageArguments(key: key, deck: deck),
      );

  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);

  Future<dynamic> pushImageViewerPage({
    Key key,
    @required File imageFile,
  }) =>
      push<dynamic>(
        Routes.imageViewerPage,
        arguments: ImageViewerPageArguments(key: key, imageFile: imageFile),
      );

  Future<dynamic> pushStudiedCardsPage() =>
      push<dynamic>(Routes.studiedCardsPage);

  Future<dynamic> pushRegisterScreen() => push<dynamic>(Routes.registerScreen);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomePage arguments holder class
class HomePageArguments {
  final Key key;
  final User user;
  HomePageArguments({this.key, this.user});
}

/// DeckFormPage arguments holder class
class DeckFormPageArguments {
  final Key key;
  final Deck deck;
  DeckFormPageArguments({this.key, @required this.deck});
}

/// StudyPage arguments holder class
class StudyPageArguments {
  final Key key;
  final Deck deck;
  StudyPageArguments({this.key, @required this.deck});
}

/// ImageViewerPage arguments holder class
class ImageViewerPageArguments {
  final Key key;
  final File imageFile;
  ImageViewerPageArguments({this.key, @required this.imageFile});
}
