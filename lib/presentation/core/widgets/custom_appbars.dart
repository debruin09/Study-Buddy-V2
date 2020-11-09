import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/deck/deck.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CardStatusCubit cardStatusCubit;
  final TextEditingController deckNameController;
  final gKey;
  final List<Function> methods;
  final Deck deck;
  const CustomAppBar({
    Key key,
    @required this.cardStatusCubit,
    @required this.deckNameController,
    @required this.gKey,
    @required this.methods,
    @required this.deck,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          padding: EdgeInsets.only(
            right: 10.0,
          ),
          margin: EdgeInsets.only(
            top: 5.0,
          ),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => ExtendedNavigator.root.pop(),
          ),
        ),
        elevation: 2.0,
        centerTitle: true,
        title: BlocBuilder<DeckStatusCubit, StatusState>(
          buildWhen: (p, c) => p != c,
          builder: (context, state) {
            if (state is NewDeckState) {
              return Text(
                'Create New Deck',
                style: TextStyle(color: Colors.black),
              );
            } else if (state is EditDeckState) {
              return Text(
                'Edit Deck',
                style: TextStyle(color: Colors.black),
              );
            }
            return Container();
          },
        ),
        backgroundColor: bgColor,
        actions: [
          Container(
            padding: EdgeInsets.only(
              left: 10.0,
            ),
            margin: EdgeInsets.only(
              top: 5.0,
            ),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                )),
            child: IconButton(
              onPressed: () {
                cardStatusCubit.changeCardStatus("new");
                if (context.read<DeckStatusCubit>().state is NewDeckState &&
                    deckNameController.text.isNotEmpty) {
                  methods[0]();
                  ExtendedNavigator.root.push(
                    Routes.createNewCardPage,
                    arguments: CreateNewCardPageArguments(),
                  );
                } else if (context.read<DeckStatusCubit>().state
                    is EditDeckState) {
                  methods[0]();
                  deckNameController.clear();
                  gKey.currentState.showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('${deck.deckName} updated',
                              style: TextStyle(color: Colors.white)),
                          Icon(Icons.check, color: Colors.white),
                        ],
                      ),
                      backgroundColor: successColor,
                    ),
                  );
                } else if (deckNameController.text.isEmpty &&
                    context.read<DeckStatusCubit>().state is NewDeckState) {
                  gKey.currentState.showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fields can't be empty when you save",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.info,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      backgroundColor: infoColor,
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
        ]);
  }

  @override
  Size get preferredSize => Size(double.infinity, 60.0);
}
