import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:study_buddy/blocs/auth_bloc/auth_bloc.dart';
import 'package:study_buddy/blocs/deckCubit/status_cubit.dart';
import 'package:study_buddy/blocs/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/services/services.dart';
import 'package:study_buddy/ui/routes/router.gr.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';
import 'package:study_buddy/ui/theme/theme_styles.dart';
import 'package:study_buddy/ui/widgets/shared.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final deckBloc = locator.get<DeckBloc>();
  final globalId = locator.get<GlobalId>();
  final deckStatusCubit = locator.get<DeckStatusCubit>();

  @override
  void dispose() {
    deckBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    deckBloc.add(LoadDecks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            elevation: 0.0,
            pinned: true,
            backgroundColor: appBarColor,
            centerTitle: true,
            title: Text(
              "Home",
              style: appBarTextStyle,
            ),
            leading: Icon(Icons.menu),
            bottom: SearchBar(),
            actions: [
              FlatButton.icon(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(AuthLoggedOut());
                },
                icon: Icon(
                  Icons.person,
                  color: appBarTextColor,
                ),
                label: Text(
                  "logout",
                  style: TextStyle(color: appBarTextColor),
                ),
              )
            ],
          ),
          BlocConsumer<DeckBloc, DeckState>(
            cubit: deckBloc,
            listener: (context, state) {
              if (state is DeckErrorState) {
                return Center(child: Text("${state.message}"));
              }
              return Text("nothing");
            },
            builder: (context, state) {
              if (state is DeckInitial) {
                return SliverToBoxAdapter(child: Container());
              } else if (state is DeckLoadInProgress) {
                return SliverToBoxAdapter(child: Loading());
              } else if (state is DeckLoadSuccess) {
                return SliverPadding(
                  padding: EdgeInsets.only(top: 10.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Dismissible(
                          key: Key(state.decks[index].id),
                          background: Container(color: Colors.red),
                          direction: DismissDirection.horizontal,
                          onDismissed: (direction) {
                            deckBloc.add(DeleteDeck(state.decks[index]));
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "${state.decks[index].deckName} dismissed")));
                          },
                          child: CustomCard(deck: state.decks[index])),
                      childCount: state.decks.length,
                    ),
                  ),
                );
              }
              return SliverToBoxAdapter(
                  child: Text("No Decks yet",
                      style: TextStyle(color: Colors.white)));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: cardColor,
          ),
          backgroundColor: Colors.white,
          onPressed: () {
            deckStatusCubit.changeDeckStatus("new");

            ExtendedNavigator.rootNavigator.pushNamed(
              Routes.createNewDeckPage,
              arguments: CreateNewDeckPageArguments(),
            );
          }),
    );
  }
}
