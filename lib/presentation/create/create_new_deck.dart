import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/deck/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/infrastructure/core/tag_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/widgets/custom_appbars.dart';
import 'package:study_buddy/presentation/create/core/card_textfield.dart';
import 'package:study_buddy/presentation/create/widgets/new_deck_card_body.dart';
import 'package:study_buddy/presentation/create/widgets/tag_wrapper.dart';
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
  final _tagService = locator.get<TagService>();
  final GlobalKey<ScaffoldState> _gKey = GlobalKey<ScaffoldState>();
  final TextEditingController _deckNameController = TextEditingController();
  ScrollController _scrollController;
  AnimationController _hideFabAnimController;

  String val = "";

  @override
  void initState() {
    // When page is in created mode then create a new deck id
    if (context.read<DeckStatusCubit>().state is NewDeckState) {
      final newDeckID = Uuid().v4();
      globalId.setDeckId(newDeckID);
    }
    if (context.read<DeckStatusCubit>().state is EditDeckState) {
      _deckNameController.text = widget.deck.deckName;
      _tagService.tags.addAll(widget.deck?.tags);
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
      appBar: CustomAppBar(
        cardStatusCubit: cardStatusCubit,
        gKey: _gKey,
        deckNameController: _deckNameController,
        deck: widget.deck,
        methods: [createNewDeck, updateDeck],
      ),
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
                    cardTextField(_deckNameController, "Enter deck name", 1),
                    SizedBox(
                      height: 20.0,
                    ),
                    TagWrapper(
                      tagService: _tagService,
                      val: val,
                      updateDeck: updateDeck,
                      deck: widget.deck,
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
        newData: widget.deck.copyWith(
          dateCreated: DateTime.now().toIso8601String().toString(),
          id: widget.deck.id,
          deckName: _deckNameController.text,
          tags: _tagService.tags,
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
          tags: _tagService.tags,
          dateCreated: DateTime.now().toIso8601String().toString(),
        ),
      ),
    );
  }
}
