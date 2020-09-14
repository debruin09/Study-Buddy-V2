import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, left: 10.0, right: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: TextFormField(
          decoration: InputDecoration(
            focusColor: Colors.white,
            fillColor: Colors.white,
            hintText: "Search for decks, cards and tags",
            prefixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 17.0,
                ),
                onPressed: () {}),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(300.0, 60.0);
}
