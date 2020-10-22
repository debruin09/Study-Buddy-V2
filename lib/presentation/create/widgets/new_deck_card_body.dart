import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/create/widgets/custom_my_card.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';

class NewDeckCardBody extends StatelessWidget {
  final CardBloc cardBloc;
  final GlobalId globalId;
  final CardStatusCubit cardStatusCubit;

  const NewDeckCardBody(
      {Key key, this.cardBloc, this.globalId, this.cardStatusCubit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(
      buildWhen: (previous, current) => previous != current,
      cubit: cardBloc,
      builder: (context, state) {
        return state.map(
            initial: (_) => SliverToBoxAdapter(child: Container()),
            loading: (_) => SliverToBoxAdapter(child: Loading()),
            success: (state) {
              return SliverPadding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CustomMyCard(
                      globalId: globalId,
                      card: state.cards[index],
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
