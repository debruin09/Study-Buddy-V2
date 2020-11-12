import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/application/deck/deck_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/drawer/custom_drawer.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/home/core/build_appbar.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/home/widgets/deck_card.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final deckBloc = locator.get<DeckBloc>();
  final globalId = locator.get<GlobalId>();
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
          buildAppBar(_gKey, context),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            sliver: BlocBuilder<DeckBloc, DeckState>(
              cubit: deckBloc,
              builder: (context, state) {
                return state.map(
                    initial: (_) =>
                        SliverToBoxAdapter(child: Loader(color: primaryColor)),
                    loading: (_) =>
                        SliverToBoxAdapter(child: Loader(color: primaryColor)),
                    success: (state) {
                      deckScope.setDecks(state.decks);
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => GestureDetector(
                            key: Key(state.decks[index].id),
                            onLongPress: () {
                              deleteDialogue(_gKey.currentState, context,
                                  state.decks[index]);
                            },
                            child: DeckCard(deck: state.decks[index]),
                          ),
                          childCount: state.decks.length,
                        ),
                      );
                    },
                    error: (state) => Center(child: Text("${state.message}")));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: bgColor,
          ),
          onPressed: () {
            context.read<DeckStatusCubit>().newDeck();
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
