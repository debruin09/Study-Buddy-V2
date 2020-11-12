import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';

class CustomDrawer extends StatelessWidget {
  final User user;
  const CustomDrawer({
    Key key,
    @required this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      width: screenSize.width * 0.6,
      height: screenSize.height * 0.8,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 80.0,
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
                ),
                const SizedBox(width: 10.0),
                Text(
                  "Hello , ${user?.username}",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
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
                Icons.person,
                color: primaryColor,
              ),
              title: Text("logout"),
              onTap: () {
                ReadContext(context).read<AuthBloc>()
                  ..add(const AuthEvent.authLoggedOut());
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
