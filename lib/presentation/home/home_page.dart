import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';

import 'package:study_buddy/application/deck/deck_actor/deck_actor_bloc.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/custom_drawer.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/home/misc/deck_singleton.dart';
import 'package:study_buddy/presentation/home/widgets/deck_search.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/home/widgets/deck_card.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage({Key key, this.user}) : super(key: key);

  final GlobalKey<ScaffoldState> _gKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<DeckWatcherBloc>()
            ..add(
              const DeckWatcherEvent.watchAllStarted(),
            ),
        ),
        BlocProvider(
          create: (context) => locator<DeckActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) =>
                    ExtendedNavigator.of(context).replace(Routes.loginScreen),
                orElse: () {},
              );
            },
          ),
          BlocListener<DeckActorBloc, DeckActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  return FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: state.deckFailure.map(
                      unexpected: (_) =>
                          'Unexpected error occured while deleting, please contact support.',
                      insufficientPermission: (_) =>
                          'Insufficient permissions ❌',
                      unableToUpdate: (_) => 'Impossible error',
                    ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          key: _gKey,
          backgroundColor: bgColor,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () => _gKey.currentState.openDrawer(),
            ),
            automaticallyImplyLeading: false,
            title: Text(
              "Home",
              style: Theme.of(context)
                  .appBarTheme
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold, letterSpacing: 3.0),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DeckSearch());
                },
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
              ),
            ],
          ),
          drawer: CustomDrawer(),
          body: HomePageBody(gKey: _gKey),
          floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: bgColor,
              ),
              onPressed: () {
                ExtendedNavigator.root.pushDeckFormPage(deck: null);
              }),
        ),
      ),
    );
  }
}

class HomePageBody extends HookWidget {
  final GlobalKey<ScaffoldState> gKey;
  const HomePageBody({
    Key key,
    @required this.gKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deckSingleton = locator<DeckSingleton>();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: BlocBuilder<DeckWatcherBloc, DeckWatcherState>(
        builder: (context, state) {
          return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => Loader(color: primaryColor),
              loadSuccess: (state) {
                // print("HOME PAGE State decks: ${state.decks}");
                if (state.decks.isEmpty()) {
                  return Center(
                    child: Text(
                      "No deck's found.",
                      style: TextStyle(color: Colors.black38, fontSize: 20.0),
                    ),
                  );
                }
                _deckSingleton.decks = state.decks;

                return ListView.builder(
                  itemCount: state.decks.size,
                  itemBuilder: (context, index) {
                    final deck = state.decks[index];

                    if (deck.failureOption.isSome()) {
                      return ErronousDeck(
                        errorText: deck.failureOption.fold(
                          () => null,
                          (f) => f.maybeMap(
                              empty: (e) => "Sorry, this deck was corrupt ",
                              orElse: () => "Sorry, this deck was corrupt "),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: DeckCard(
                          gKey: gKey,
                          deck: deck,
                        ),
                      );
                    }
                  },
                );
              },
              loadFailure: (state) =>
                  Center(child: Text("${state.deckFailure}")));
        },
      ),
    );
  }
}

class ErronousDeck extends StatelessWidget {
  final String errorText;
  ErronousDeck({@required this.errorText});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.red,
      title: Text(
        errorText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
