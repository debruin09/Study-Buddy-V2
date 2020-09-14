import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:study_buddy/blocs/card_bloc/card_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/services/helper_service.dart';
import 'package:study_buddy/ui/widgets/shared.dart';

class FoldingCellCardWrapper extends StatelessWidget {
  final CardBloc cardBloc;
  final CardNotification _cardNotification = locator.get<CardNotification>();

  FoldingCellCardWrapper({Key key, @required this.cardBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: cards.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SimpleFoldingCell.create(
                      borderRadius: 20.0,
                      onOpen: () {
                        _cardNotification.card = cards[index];
                      },
                      // onClose: () => print('cell closed'),
                      animationDuration: Duration(milliseconds: 300),
                      cellSize: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.5),
                      frontWidget: _frontWidget(card: cards[index]),
                      innerWidget: _innerWidget(card: cards[index]),
                    ),
                  );
                }),
          );
        }
        return Loading();
      },
    );
  }

  Widget _innerWidget({MyCard card}) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          final foldingCellState =
              context.findAncestorStateOfType<SimpleFoldingCellState>();
          foldingCellState?.toggleFold();
        },
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          elevation: 7.0,
          color: Colors.greenAccent,
          child: Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  card.back,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _frontWidget({MyCard card}) {
    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          final foldingCellState =
              context.findAncestorStateOfType<SimpleFoldingCellState>();
          foldingCellState?.toggleFold();
        },
        child: Material(
          elevation: 7.0,
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              card.front,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
