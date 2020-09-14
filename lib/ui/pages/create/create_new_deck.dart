import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/blocs/card_bloc/card_bloc.dart';
import 'package:study_buddy/blocs/deckCubit/status_cubit.dart';
import 'package:study_buddy/blocs/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/services/services.dart';
import 'package:study_buddy/ui/routes/router.gr.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';
import 'package:study_buddy/ui/widgets/shared.dart';
import 'package:uuid/uuid.dart';

class CreateNewDeckPage extends StatefulWidget {
  final Deck deck;
  const CreateNewDeckPage({Key key, this.deck}) : super(key: key);
  @override
  _CreateNewDeckPageState createState() => _CreateNewDeckPageState();
}

class _CreateNewDeckPageState extends State<CreateNewDeckPage> {
  final deckBloc = locator.get<DeckBloc>();
  final cardBloc = locator.get<CardBloc>();
  final globalId = locator.get<GlobalId>();
  final deckStatusCubit = locator.get<DeckStatusCubit>();
  final cardStatusCubit = locator.get<CardStatusCubit>();
  final GlobalKey<ScaffoldState> _gKey = GlobalKey<ScaffoldState>();

  final TextEditingController _deckNameController = TextEditingController();
  List<String> tags = [];
  String val = "";

  void updateDeck() {
    deckBloc.add(
      UpdateDeck(
        widget.deck,
        Deck(
          id: widget.deck.id,
          deckName: _deckNameController.text.isNotEmpty
              ? _deckNameController.text
              : widget.deck.deckName,
          tags: tags.isNotEmpty ? tags : widget.deck.tags,
        ),
      ),
    );
  }

  void createNewDeck() {
    deckBloc.add(
      AddDeck(
        Deck(
          id: globalId.deckId,
          deckName: _deckNameController.text,
          tags: tags,
        ),
      ),
    );
  }

  @override
  void initState() {
    // When page is in created mode then create a new deck id
    if (deckStatusCubit.state == 'new') {
      final newDeckID = Uuid().v4();
      globalId.setDeckId(newDeckID);
    }
    cardBloc.add(LoadCards());
    super.initState();
  }

  @override
  void dispose() {
    _deckNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gKey,
      backgroundColor: bgColor,
      appBar: AppBar(
          title: BlocBuilder<DeckStatusCubit, String>(
            cubit: deckStatusCubit,
            buildWhen: (p, c) => p != c,
            builder: (context, state) {
              return Text(state == "new" ? 'Create New Deck' : 'Edit Deck');
            },
          ),
          backgroundColor: cardColor,
          actions: [
            FlatButton.icon(
              onPressed: () {
                cardStatusCubit.changeCardStatus("new");
                if (deckStatusCubit.state == "new" &&
                    _deckNameController.text.isNotEmpty) {
                  createNewDeck();
                  ExtendedNavigator.rootNavigator.pushNamed(
                    Routes.createNewCardPage,
                    arguments: CreateNewCardPageArguments(),
                  );
                } else if (deckStatusCubit.state == "edit" &&
                    _deckNameController.text.isNotEmpty) {
                  updateDeck();
                  ExtendedNavigator.rootNavigator.pop();
                } else if (_deckNameController.text.isEmpty &&
                    deckStatusCubit.state == "new") {
                  _gKey.currentState.showSnackBar(SnackBar(
                      content: Text("Fields can't be empty when you save")));
                }

                _deckNameController.clear();
              },
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text(
                "save",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: TextFormField(
                  controller: _deckNameController,
                  decoration: InputDecoration(
                    labelText: "Deck name",
                    focusColor: Colors.white,
                    fillColor: Colors.white,
                    hintText: "Enter deck name",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TagWidget(
                onChanged: () {
                  tags.add(val);
                },
                additionalCallback: (String value) {
                  val = value;
                  return TagEntity(
                    tag: value,
                  );
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              BlocBuilder<DeckStatusCubit, String>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state == "new") {
                    return Container();
                  } else {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlatButton.icon(
                            onPressed: () {
                              cardStatusCubit.changeCardStatus("new");
                              ExtendedNavigator.rootNavigator.pushNamed(
                                Routes.createNewCardPage,
                                arguments: CreateNewCardPageArguments(),
                              );
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            label: Text(
                              "add cards",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                          BlocBuilder<CardBloc, CardState>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            cubit: cardBloc,
                            builder: (context, state) {
                              if (state is CardInitial) {
                                return Container();
                              } else if (state is CardLoadInProgress) {
                                return Loading();
                              } else if (state is CardErrorState) {
                                return Center(child: Text("${state.message}"));
                              } else if (state is CardLoadSuccess) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.cards.length,
                                  itemBuilder: (context, index) => CustomMyCard(
                                    globalId: globalId,
                                    card: state.cards[index],
                                    cardBloc: cardBloc,
                                    cardStatusCubit: cardStatusCubit,
                                  ),
                                );
                              }
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 25.0,
                                    ),
                                    Text("Empty deck",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
