// Recent active Deck
import 'package:flutter/material.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';
import 'package:study_buddy/ui/theme/theme_styles.dart';
import 'package:study_buddy/ui/widgets/shared_decorations.dart';

class RecentActiveDeck extends StatelessWidget {
  final Deck deck;

  const RecentActiveDeck({Key key, @required this.deck}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 80.0,
      width: screenSize.width * 0.8,
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: deckDecoration.copyWith(
        color: recentActiveCardColor,
        border: Border.all(width: 0.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("recent deck"),
          Text(
            "${deck.deckName}",
            style: recentActiveTextStyle,
          ),
        ],
      ),
    );
  }
}
