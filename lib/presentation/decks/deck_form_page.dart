import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/deck/deck_form/deck_form_bloc.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/decks/widgets/add_card_tile.dart';
import 'package:study_buddy/presentation/decks/widgets/card_list.dart';
import 'package:study_buddy/presentation/decks/widgets/deck_name_field.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';

class DeckFormPage extends StatelessWidget {
  final Deck deck;

  static final GlobalKey<ScaffoldState> _gKey = GlobalKey<ScaffoldState>();

  DeckFormPage({Key key, @required this.deck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<DeckFormBloc>()
            ..add(DeckFormEvent.initialized(optionOf(deck))),
        ),
      ],
      child: BlocConsumer<DeckFormBloc, DeckFormState>(
        listenWhen: (p, c) =>
            p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    message: failure.map(
                      insufficientPermission: (_) =>
                          'Insufficient permissions ❌',
                      unableToUpdate: (_) =>
                          "Couldn't update the deck. Was it deleted from another device?",
                      unexpected: (_) =>
                          'Unexpected error occured, please contact support.',
                    ),
                  ).show(context);
                },
                (_) {
                  state.isEditing
                      ? ExtendedNavigator.of(context).popUntil(
                          (route) => route.settings.name == Routes.deckFormPage,
                        )
                      : ExtendedNavigator.of(context).popUntil(
                          (route) => route.settings.name == Routes.homePage,
                        );
                },
              );
            },
          );
        },
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) {
          return Stack(
            children: [
              DeckFormPageScaffold(gKey: _gKey),
              SavingInProgressOverlay(isSaving: state.isSaving)
            ],
          );
        },
      ),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;

  const SavingInProgressOverlay({
    Key key,
    @required this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(0.4) : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSaving,
          child: Container(
            width: 120.0,
            height: 30.0,
            color: Colors.white.withOpacity(0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Loader(color: primaryColor),
                const SizedBox(height: 8),
                Text(
                  'Saving',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: primaryColor,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeckFormPageScaffold extends StatelessWidget {
  const DeckFormPageScaffold({
    Key key,
    @required GlobalKey<ScaffoldState> gKey,
  })  : _gKey = gKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _gKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _gKey,
      backgroundColor: bgColor,
      appBar: AppBar(
          brightness: Brightness.dark,
          title: BlocBuilder<DeckFormBloc, DeckFormState>(
            buildWhen: (p, c) => p.isEditing != c.isEditing,
            builder: (context, state) => Text(
              state.isEditing ? 'Edit deck' : 'Create deck',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.form.add(const DeckFormEvent.saved());
              },
              icon: Icon(
                Icons.check,
              ),
            ),
          ]),
      body: BlocBuilder<DeckFormBloc, DeckFormState>(
          buildWhen: (p, c) =>
              p.showErrorMessages != c.showErrorMessages ||
              p.isEditing != c.isEditing,
          builder: (context, state) {
            return Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  const DeckNameField(),
                  if (state.isEditing) ...[
                    const AddCardTile(),
                    const SliverToBoxAdapter(child: Divider()),
                    const CardList(),
                  ],
                ],
              ),
            );
          }),
    );
  }
}
