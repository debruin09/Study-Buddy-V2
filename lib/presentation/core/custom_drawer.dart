import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:study_buddy/application/auth/auth_bloc.dart';
import 'package:study_buddy/application/theme/theme_bloc.dart';
import 'package:study_buddy/presentation/core/misc/providers.dart';
import 'package:study_buddy/presentation/core/theme_styles.dart';
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
      color: Theme.of(context).primaryColor,
      width: screenSize.width * 0.75,
      height: screenSize.height,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 100.0,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 30.0, bottom: 40.0),
            padding: EdgeInsets.only(
              top: 30.0,
              left: 30.0,
            ),
            child: Text(
              "Study Buddy",
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  letterSpacing: 2.0,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          DrawerTile(
            onTap: () => ExtendedNavigator.root.pushVocabularyPage(),
            icon: Icons.local_library,
            title: "Vocabulary",
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.wb_sunny,
              ),
              title: Text("Night mode",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 14.0)),
              trailing: Consumer(
                builder: (context, watch, child) {
                  final themeState = watch(themeProvider).state;
                  return Switch(
                      activeColor: Colors.blue[400],
                      value: themeState,
                      onChanged: (_) {
                        BuildContextX(context).read(themeProvider).state =
                            !BuildContextX(context).read(themeProvider).state;

                        !themeState
                            ? ReadContext(context).read<ThemeBloc>().add(
                                ThemeEvent.changed(appTheme: AppTheme.dark))
                            : ReadContext(context).read<ThemeBloc>().add(
                                ThemeEvent.changed(appTheme: AppTheme.light));
                      });
                },
              ),
            ),
          ),
          Divider(
            height: 2.0,
          ),
          DrawerTile(
            onTap: () => ExtendedNavigator.root.pushSettingsPage(),
            icon: Icons.settings_applications,
            title: "Settings",
          ),
          DrawerTile(
            icon: Icons.my_library_books,
            title: "studied cars",
            onTap: () {
              ExtendedNavigator.root.pushStudiedCardsPage();
            },
          ),
          DrawerTile(
            icon: Icons.timelapse,
            title: "pomodoro clok",
            onTap: () {
              ExtendedNavigator.root.pushPomodoroClockPage();
            },
          ),
          DrawerTile(
            icon: Icons.person,
            title: "logout",
            onTap: () {
              ReadContext(context).read<AuthBloc>()
                ..add(const AuthEvent.signedOut());
            },
          ),
          DrawerTile(
            onTap: () => print("help"),
            icon: Icons.help_outline,
            title: "Help",
          ),
          DrawerTile(
            onTap: () => print("feedback"),
            icon: Icons.feedback,
            title: "Send feedback",
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

class DrawerTile extends StatelessWidget {
  final String title;
  final Function onTap;
  final IconData icon;

  const DrawerTile({
    Key key,
    this.title,
    this.onTap,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
        ),
        title: Text(title,
            style:
                Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14.0)),
      ),
    );
  }
}
