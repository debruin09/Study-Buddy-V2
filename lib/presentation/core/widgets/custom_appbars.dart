import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onPressed;

  const CustomAppBar({Key key, @required this.onPressed}) : super(key: key);
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
          cubit: context.bloc<DeckStatusCubit>(),
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
              onPressed: onPressed,
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
