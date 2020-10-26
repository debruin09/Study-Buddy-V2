import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/deck/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/core/tag_entity.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme/theme_styles.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/create/widgets/new_deck_card_body.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:uuid/uuid.dart';

class CreateNewDeckPage extends StatefulWidget {
  final Deck deck;

  const CreateNewDeckPage({Key key, this.deck}) : super(key: key);
  @override
  _CreateNewDeckPageState createState() => _CreateNewDeckPageState();
}

class _CreateNewDeckPageState extends State<CreateNewDeckPage>
    with SingleTickerProviderStateMixin {
  final globalId = locator.get<GlobalId>();
  final cardStatusCubit = locator.get<CardStatusCubit>();
  final _cardBloc = locator.get<CardBloc>();
  final _deckBloc = locator.get<DeckBloc>();
  final GlobalKey<ScaffoldState> _gKey = GlobalKey<ScaffoldState>();
  final TextEditingController _deckNameController = TextEditingController();
  ScrollController _scrollController;
  AnimationController _hideFabAnimController;

  List<String> tags = [];
  String val = "";

  @override
  void initState() {
    // When page is in created mode then create a new deck id
    if (context.bloc<DeckStatusCubit>().state is NewDeckState) {
      final newDeckID = Uuid().v4();
      globalId.setDeckId(newDeckID);
    }
    if (context.bloc<DeckStatusCubit>().state is EditDeckState) {
      _deckNameController.text = widget.deck.deckName;
    }
    _hideFabAnimController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
      value: 1, // initially visible
    );
    _scrollController = ScrollController();

    _cardBloc.add(LoadCards());
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        // Scrolling up - forward the animation (value goes to 1)
        case ScrollDirection.forward:
          _hideFabAnimController.forward();
          break;
        // Scrolling down - reverse the animation (value goes to 0)
        case ScrollDirection.reverse:
          _hideFabAnimController.reverse();
          break;
        // Idle - keep FAB visibility unchanged
        case ScrollDirection.idle:
          _hideFabAnimController.forward();
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _hideFabAnimController.dispose();
    _deckNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gKey,
      backgroundColor: bgColor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
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
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => ExtendedNavigator.root.pop(),
            ),
          ),
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10.0),
            child: BlocBuilder<DeckStatusCubit, StatusState>(
              cubit: context.bloc<DeckStatusCubit>(),
              buildWhen: (p, c) => p != c,
              builder: (context, state) {
                if (state is NewDeckState) {
                  return Text(
                    'Create New Deck',
                    style: TextStyle(color: Colors.black),
                  );
                } else if (state is EditDeckState) {
                  return Text(
                    'Edit Deck',
                    style: TextStyle(color: Colors.black),
                  );
                }
                return Container();
              },
            ),
          ),
          backgroundColor: bgColor,
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
                  cardStatusCubit.changeCardStatus("new");
                  if (context.bloc<DeckStatusCubit>().state is NewDeckState &&
                      _deckNameController.text.isNotEmpty) {
                    createNewDeck();
                    ExtendedNavigator.root.push(
                      Routes.createNewCardPage,
                      arguments: CreateNewCardPageArguments(),
                    );
                  } else if (context.bloc<DeckStatusCubit>().state
                      is EditDeckState) {
                    updateDeck();
                    _deckNameController.clear();
                    _gKey.currentState.showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Deck updated',
                                style: TextStyle(color: Colors.black)),
                            Icon(Icons.info, color: Colors.black),
                          ],
                        ),
                        backgroundColor: successColor,
                      ),
                    );
                  } else if (_deckNameController.text.isEmpty &&
                      context.bloc<DeckStatusCubit>().state is NewDeckState) {
                    _gKey.currentState.showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fields can't be empty when you save",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.info,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        backgroundColor: infoColor,
                      ),
                    );
                  }
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextFormField(
                        controller: _deckNameController,
                        decoration: inputStyle.copyWith(
                          hintText: "Enter deck name",
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
                  ],
                ),
              ),
            ),
            NewDeckCardBody(
              globalId: globalId,
              cardBloc: _cardBloc,
              cardStatusCubit: cardStatusCubit,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<DeckStatusCubit, StatusState>(
        cubit: context.bloc<DeckStatusCubit>(),
        builder: (context, state) {
          if (state is NewDeckState) {
            return Container();
          } else {
            return FadeTransition(
              opacity: _hideFabAnimController,
              child: ScaleTransition(
                scale: _hideFabAnimController,
                child: FloatingActionButton(
                  onPressed: () {
                    cardStatusCubit.changeCardStatus("new");
                    ExtendedNavigator.root.push(
                      Routes.createNewCardPage,
                      arguments: CreateNewCardPageArguments(),
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: bgColor,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void updateDeck() {
    _deckBloc.add(
      DeckEvent.update(
        updatedDeck: widget.deck,
        newData: Deck(
          dateCreated: DateTime.now().toIso8601String().toString(),
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
    _deckBloc.add(
      DeckEvent.add(
        deck: Deck(
          id: globalId.deckId,
          deckName: _deckNameController.text,
          tags: tags,
          dateCreated: DateTime.now().toIso8601String().toString(),
        ),
      ),
    );
  }
}
