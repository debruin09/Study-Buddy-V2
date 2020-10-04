import 'package:flutter/material.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/deck/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/domain/core/local_notification_repository.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/speech/speech_page.dart';
import 'package:study_buddy/presentation/study/widgets/folding_cell_card_wrapper.dart';
import 'package:study_buddy/presentation/study/widgets/similarity_wrapper.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';

class DeckStudyPage extends StatefulWidget {
  final Deck deck;
  const DeckStudyPage({
    Key key,
    @required this.deck,
  }) : super(key: key);
  @override
  _DeckStudyPageState createState() => _DeckStudyPageState();
}

class _DeckStudyPageState extends State<DeckStudyPage> {
  final notification = locator.get<LocalNotificationRepository>();
  final deckBloc = locator.get<DeckBloc>();
  final cardBloc = locator.get<CardBloc>();

  @override
  void initState() {
    cardBloc.add(LoadCards());
    notification.initializing();
    super.initState();
  }

  @override
  void dispose() {
    deckBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          "${widget.deck.deckName}",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<Choices>(onSelected: (choice) {
            if (choice == Choices.record) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SpeechPage()));
            }
          }, itemBuilder: (context) {
            return Choices.values.map((choice) {
              return PopupMenuItem<Choices>(
                  value: choice,
                  child: Text(
                    choice.toString().substring(8),
                    style: TextStyle(color: Colors.black),
                  ));
            }).toList();
          })
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FoldingCellCardWrapper(
                cardBloc: cardBloc,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Column(
                children: [
                  SimilarityWrapper(),
                  TimeIntervalWidget(
                    notificationRepository: notification,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Choices {
  record,
  edit,
}
