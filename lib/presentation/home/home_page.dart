import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/application/deck/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/drawer/custom_drawer.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/home/search/deck_search.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/study/widgets/custom_card.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({
    Key key,
    this.user,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final deckBloc = locator.get<DeckBloc>();
  final globalId = locator.get<GlobalId>();
  final deckStatusCubit = locator.get<DeckStatusCubit>();
  final GlobalKey<ScaffoldState> _gKey = GlobalKey<ScaffoldState>();
  final deckScope = locator.get<DecksScope>();

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
      key: _gKey,
      backgroundColor: bgColor,
      drawer: CustomDrawer(user: globalId.getUser),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80.0,
            elevation: 0.0,
            pinned: true,
            backgroundColor: bgColor,
            centerTitle: true,
            title: Text(
              "Home",
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DeckSearch());
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          BlocConsumer<DeckBloc, DeckState>(
            cubit: deckBloc,
            listener: (context, state) {
              if (state is DeckErrorState) {
                return Center(child: Text("${state.message}"));
              }
              return Container();
            },
            builder: (context, state) {
              if (state is DeckInitial) {
                return SliverToBoxAdapter(child: Container());
              } else if (state is DeckLoadInProgress) {
                return SliverToBoxAdapter(child: Loading());
              } else if (state is DeckLoadSuccess) {
                deckScope.setDecks(state.decks);
                return SliverPadding(
                  padding: EdgeInsets.only(top: 10.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => GestureDetector(
                        key: Key(state.decks[index].id),
                        onLongPress: () {
                          deleteDialogue(
                              _gKey.currentState, context, state.decks[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: CustomCard(deck: state.decks[index]),
                        ),
                      ),
                      childCount: state.decks.length,
                    ),
                  ),
                );
              }
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "No decks founded",
                  ),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: bgColor,
          ),
          onPressed: () {
            context.bloc<DeckStatusCubit>().newDeck();
            ExtendedNavigator.root.push(
              Routes.createNewDeckPage,
              arguments: CreateNewDeckPageArguments(),
            );
          }),
    );
  }

  Future<void> deleteDialogue(ScaffoldState state, context, Deck deck) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure you want to delete: "),
            content: Text(deck.deckName),
            actions: [
              FlatButton(
                onPressed: () {
                  deckBloc.add(DeleteDeck(deck));
                  ExtendedNavigator.root.pop();
                  state.showSnackBar(
                      SnackBar(content: Text("${deck.deckName} dismissed")));
                },
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              FlatButton(
                onPressed: () {
                  ExtendedNavigator.root.pop();
                },
                child: Text(
                  "cancel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        });
  }
}
