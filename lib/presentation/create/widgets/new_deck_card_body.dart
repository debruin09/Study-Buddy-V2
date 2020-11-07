import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/create/widgets/custom_my_card.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';

class NewDeckCardBody extends ConsumerWidget {
  final CardBloc cardBloc;
  final GlobalId globalId;
  final CardStatusCubit cardStatusCubit;

  NewDeckCardBody({Key key, this.cardBloc, this.globalId, this.cardStatusCubit})
      : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return BlocBuilder<CardBloc, CardState>(
      buildWhen: (previous, current) => previous != current,
      cubit: cardBloc,
      builder: (context, state) {
        return state.map(
            empty: (_) => Text('Deck is empty'),
            initial: (_) => SliverToBoxAdapter(child: Container()),
            loading: (_) => SliverToBoxAdapter(
                  child: Loader(
                    color: primaryColor,
                  ),
                ),
            success: (state) {
              final List<MyCard> cards = List.from(state.cards);

              return SliverPadding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CustomMyCard(
                      globalId: globalId,
                      card: cards[index],
                      cardBloc: cardBloc,
                      cardStatusCubit: cardStatusCubit,
                    ),
                    childCount: state.cards.length,
                  ),
                ),
              );
            },
            error: (state) => Center(child: Text("${state.message}")));
      },
    );
  }
}
