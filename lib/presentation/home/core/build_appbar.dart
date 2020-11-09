import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/home/search/deck_search.dart';

SliverAppBar buildAppBar(gKey, context) {
  return SliverAppBar(
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
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () => gKey.currentState.openDrawer(),
      ),
    ),
    automaticallyImplyLeading: false,
    expandedHeight: 65.0,
    pinned: true,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      "Home",
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 3.0),
    ),
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
            showSearch(context: context, delegate: DeckSearch());
          },
          icon: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
