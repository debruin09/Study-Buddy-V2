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
import 'package:study_buddy/presentation/home/widgets/deck_card.dart';
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
      drawer: CustomDrawer(user: widget.user),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
              padding: EdgeInsets.only(
                right: 10.0,
              ),
              margin: EdgeInsets.only(
                top: 15.0,
              ),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => _gKey.currentState.openDrawer(),
              ),
            ),
            automaticallyImplyLeading: false,
            expandedHeight: 80.0,
            elevation: 0.0,
            pinned: true,
            backgroundColor: bgColor,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0),
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.only(
                  left: 10.0,
                ),
                margin: EdgeInsets.only(
                  top: 15.0,
                ),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    )),
                child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: DeckSearch());
                  },
                  icon: Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<DeckBloc, DeckState>(
            cubit: deckBloc,
            builder: (context, state) {
              return state.map(
                  initial: (_) => SliverPadding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      sliver: SliverToBoxAdapter(
                          child: Loader(
                        color: primaryColor,
                      ))),
                  loading: (_) => SliverPadding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      sliver: SliverToBoxAdapter(
                          child: Loader(
                        color: primaryColor,
                      ))),
                  success: (state) {
                    deckScope.setDecks(state.decks);
                    return SliverPadding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => GestureDetector(
                            key: Key(state.decks[index].id),
                            onLongPress: () {
                              deleteDialogue(_gKey.currentState, context,
                                  state.decks[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20.0,
                              ),
                              child: DeckCard(deck: state.decks[index]),
                            ),
                          ),
                          childCount: state.decks.length,
                        ),
                      ),
                    );
                  },
                  error: (state) => Center(child: Text("${state.message}")));
            },
          ),
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
                  deckBloc.add(DeckEvent.delete(deck: deck));
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
