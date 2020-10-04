import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/card/card_list_notifier.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object newValue) {
    print('''
        {
          "provider": " ${provider.name ?? provider.runtimeType} ", 
          "newValue": "$newValue"
        }
      ''');
  }
}

final currentCardProvider = StateProvider<MyCard>((ref) => MyCard());

class FoldingCellCardWrapper extends ConsumerWidget {
  final CardBloc cardBloc;

  FoldingCellCardWrapper({Key key, @required this.cardBloc}) : super(key: key);
  @override
  Widget build(BuildContext contexth, ScopedReader watch) {
    final showAnswer = watch(showAnswerProvider).state;
    final currentIndex = watch(cardsProvider).state;
    return BlocBuilder<CardBloc, CardState>(
      cubit: cardBloc,
      builder: (context, state) {
        if (state is CardInitial) {
          return Container();
        } else if (state is CardLoadInProgress) {
          return Loading();
        } else if (state is CardErrorState) {
          return Center(child: Text("${state.message}"));
        } else if (state is CardLoadSuccess) {
          final cards = state.cards;
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    cards[currentIndex].front,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[600],
                  ),
                  showAnswer
                      ? Text(
                          cards[currentIndex].back,
                          style: TextStyle(fontSize: 17.0),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        }
        return Loading();
      },
    );
  }
}

//  context.read(showAnswerProvider).state = false;
//                   context.read(currentCardProvider).state = state.cards[index];
