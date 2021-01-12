import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';

import 'package:study_buddy/application/deck/deck_actor/deck_actor_bloc.dart';
import 'package:study_buddy/application/deck/deck_watcher/deck_watcher_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/custom_drawer.dart';
import 'package:study_buddy/presentation/home/widgets/deck_search.dart';
import 'package:study_buddy/presentation/home/widgets/home_page_body.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
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
            brightness: Brightness.dark,
            centerTitle: false,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () => _gKey.currentState.openDrawer(),
            ),
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text("Home"),
                const SizedBox(width: 10.0),
                Text("beta release",
                    style: TextStyle(color: Colors.yellow, fontSize: 12.0))
              ],
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.watch_later, size: 30.0),
                  tooltip: "Pomodoro",
                  onPressed: () => ExtendedNavigator.root.pushPomodoroPage()),
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
