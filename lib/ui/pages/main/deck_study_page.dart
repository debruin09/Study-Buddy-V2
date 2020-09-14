import 'package:flutter/material.dart';
import 'package:study_buddy/blocs/card_bloc/card_bloc.dart';

import 'package:study_buddy/blocs/deck_bloc/deck_bloc.dart';
import 'package:study_buddy/blocs/similarity_bloc/similarity_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/repositories/repositories.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';
import 'package:study_buddy/ui/widgets/shared.dart';

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
  final similarityBloc = locator.get<SimilarityBloc>();
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
    similarityBloc.close();
    deckBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text("${widget.deck.deckName}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              SimilarityWrapper(
                similarityBloc: similarityBloc,
              ),
              FoldingCellCardWrapper(
                cardBloc: cardBloc,
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.record_voice_over,
                  color: Colors.greenAccent,
                ),
                label: Text(
                  "record",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TimeIntervalWidget(
                notificationRepository: notification,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
