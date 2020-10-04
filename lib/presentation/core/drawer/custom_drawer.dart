import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/domain/auth/user.dart';

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
            height: 200.0,
            color: Colors.black,
            alignment: Alignment.center,
            child: Text(
              "Hello , ${user?.username}",
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
          ListTile(
            leading: Icon(Icons.local_library),
            title: Text("Vocabulary"),
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
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
            leading: Icon(Icons.settings_applications),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("logout"),
            onTap: () {
              context.bloc<AuthBloc>()..add(AuthLoggedOut());
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Text("Help"),
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Send feedback"),
          ),
        ],
      ),
    );
  }
}
