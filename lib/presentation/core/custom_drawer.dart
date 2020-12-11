import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/routes/router.gr.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      margin: EdgeInsets.only(top: 25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      width: screenSize.width * 0.75,
      height: screenSize.height,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 100.0,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30.0, bottom: 40.0),
            padding: EdgeInsets.only(
              top: 30.0,
              left: 30.0,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.person_pin,
                  color: primaryColor,
                  size: 30.0,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    "Study Buddy",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Card(
            elevation: 0.0,
            child: ListTile(
              onTap: () => print("Vocab"),
              leading: Icon(
                Icons.local_library,
                color: primaryColor,
              ),
              title: Text("Vocabulary"),
            ),
          ),
          Card(
            elevation: 0.0,
            child: ListTile(
              leading: Icon(
                Icons.wb_sunny,
                color: primaryColor,
              ),
              title: Text("Night mode"),
              trailing: Switch(
                  value: false,
                  onChanged: (isNightMode) {
                    isNightMode = !isNightMode;
                  }),
            ),
          ),
          Divider(
            height: 2.0,
          ),
          Card(
            elevation: 0.0,
            child: ListTile(
              onTap: () => print("settings"),
              leading: Icon(
                Icons.settings_applications,
                color: primaryColor,
              ),
              title: Text("Settings"),
            ),
          ),
          Card(
            elevation: 0.0,
            child: ListTile(
              leading: Icon(
                Icons.my_library_books,
                color: primaryColor,
              ),
              title: Text("studied cards"),
              onTap: () {
                ExtendedNavigator.root.pushStudiedCardsPage();
              },
            ),
          ),
          Card(
            elevation: 0.0,
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: primaryColor,
              ),
              title: Text("logout"),
              onTap: () {
                ReadContext(context).read<AuthBloc>()
                  ..add(const AuthEvent.signedOut());
              },
            ),
          ),
          Card(
            elevation: 0.0,
            child: ListTile(
              onTap: () => print("help"),
              leading: Icon(
                Icons.help_outline,
                color: primaryColor,
              ),
              title: Text("Help"),
            ),
          ),
          Card(
            elevation: 0.0,
            child: ListTile(
              onTap: () => print("feedback"),
              leading: Icon(
                Icons.feedback,
                color: primaryColor,
              ),
              title: Text("Send feedback"),
            ),
          ),
          Divider(
            height: 2.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "from DBTech",
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
