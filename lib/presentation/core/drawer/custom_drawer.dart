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
      color: Colors.white,
      width: screenSize.width * 0.6,
      height: screenSize.height,
      child: Column(
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
          ListTile(
            leading: Icon(
              Icons.local_library,
              color: primaryColor,
            ),
            title: Text("Vocabulary"),
          ),
          ListTile(
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
          Divider(
            height: 2.0,
          ),
          ListTile(
            leading: Icon(
              Icons.settings_applications,
              color: primaryColor,
            ),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: primaryColor,
            ),
            title: Text("logout"),
            onTap: () {
              context.bloc<AuthBloc>()..add(AuthLoggedOut());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline,
              color: primaryColor,
            ),
            title: Text("Help"),
          ),
          ListTile(
            leading: Icon(
              Icons.feedback,
              color: primaryColor,
            ),
            title: Text("Send feedback"),
          ),
        ],
      ),
    );
  }
}
