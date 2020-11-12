import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/study/deck_study_page.dart';

Widget buildAppBar(
    {gKey,
    context,
    List<TextEditingController> controllers,
    CardStatusCubit cardStatusCubit,
    List<VoidCallback> methods}) {
  return AppBar(
      elevation: 0.0,
      leading: Container(
        padding: EdgeInsets.only(
          right: 10.0,
        ),
        margin: EdgeInsets.only(
          top: 15.0,
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
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 10.0),
        child: BlocBuilder<CardStatusCubit, CardStatusState>(
          cubit: cardStatusCubit,
          buildWhen: (p, c) => p != c,
          builder: (context, state) => state.map(
            newCard: (_) => Text('Create New Card'),
            editCard: (_) => Text('Edit Card'),
          ),
        ),
      ),
      backgroundColor: bgColor,
      actions: [
        Container(
          padding: EdgeInsets.only(
            left: 10.0,
          ),
          margin: EdgeInsets.only(
            top: 15.0,
          ),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              )),
          child: IconButton(
            onPressed: () {
              if (controllers[0].text.isEmpty || controllers[1].text.isEmpty) {
                gKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Fields can't be empty.",
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
              } else {
                cardStatusCubit.state.map(
                  newCard: (_) => methods[0](),
                  editCard: (_) => methods[1](),
                );

                BuildContextX(context).read(showAnswerProvider).state = false;
                controllers[0].clear();
                controllers[1].clear();
                ReadContext(context).read<DeckStatusCubit>().editDeck();
                ExtendedNavigator.root.pop();
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
