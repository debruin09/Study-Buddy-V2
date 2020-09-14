import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/blocs/card_bloc/card_bloc.dart';
import 'package:study_buddy/blocs/deckCubit/status_cubit.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/services/services.dart';
import 'package:study_buddy/ui/routes/router.gr.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';
import 'package:study_buddy/utils/custom_extensions.dart';

class CustomMyCard extends StatelessWidget {
  CustomMyCard(
      {Key key,
      @required this.globalId,
      @required this.cardBloc,
      @required this.card,
      @required this.cardStatusCubit})
      : super(key: key);

  final GlobalId globalId;
  final MyCard card;
  final CardBloc cardBloc;
  final CardStatusCubit cardStatusCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 13.0,
      ),
      child: GestureDetector(
        onLongPress: () {
          globalId.setCardId(card.id);
          cardStatusCubit.changeCardStatus("edit");
          ExtendedNavigator.rootNavigator.pushNamed(
            Routes.createNewCardPage,
            arguments: CreateNewCardPageArguments(
              card: card,
            ),
          );
        },
        child: Material(
          elevation: 7.0,
          borderRadius: BorderRadius.circular(10.0),
          color: cardColor,
          child: ExpansionTile(
            key: Key(card.id),
            trailing: IconButton(
              onPressed: () {
                cardBloc.add(DeleteCard(card));
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("${card.front} deleted")));
              },
              icon: Icon(Icons.delete_forever),
              color: Colors.red,
            ),
            title: Text(card.front, style: TextStyle(color: Colors.white)),
            subtitle: Container(
              width: double.infinity,
              height: 30.0,
              margin: EdgeInsets.only(
                top: 20.0,
              ),
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: card.tags
                      .map(
                        (tag) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Chip(
                            backgroundColor: tagsColor,
                            label: Text('$tag'),
                            labelStyle: TextStyle(
                              color: appBarColor,
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList()),
            ),
            expandedAlignment: Alignment.topLeft,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.white54,
              ),
              Text(
                "Date: " + DateTime.parse(card.dateCreated).formatDate(),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text("Back: " + card.back, style: TextStyle(color: Colors.white)),
            ],
            childrenPadding:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          ),
        ),
      ),
    );
  }
}
