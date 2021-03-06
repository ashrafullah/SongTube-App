// Flutter
import 'package:flutter/material.dart';

// Internal
import 'package:songtube/provider/app_provider.dart';
import 'package:songtube/screens/moreScreen/settings.dart';
import 'package:songtube/screens/moreScreen/widgets/quickAcessTile.dart';

// Packages
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:songtube/screens/moreScreen/widgets/songtubeBanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppDataProvider appData = Provider.of<AppDataProvider>(context);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          // SongTube Banner
          SongTubeBanner(
            appName: appData.appName,
            appVersion: appData.appVersion,
          ),
          // Settings
          QuickAccessTile(
            tileIcon: Icon(EvaIcons.settingsOutline, color: Colors.redAccent),
            title: "Settings",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsTab()));
            }
          ),
          // Telegram Channel
          QuickAccessTile(
            tileIcon: Icon(MdiIcons.telegram, color: Colors.blue),
            title: "Telegram",
            onTap: () {
              launch("https://t.me/songtubechannel");
            },
          ),
          // Github
          QuickAccessTile(
            tileIcon: Icon(EvaIcons.githubOutline, color: Colors.blueGrey),
            title: "GitHub",
            onTap: () {
              launch("https://github.com/SongTube");
            },
          ),
          // Licenses
          QuickAccessTile(
            tileIcon: Icon(EvaIcons.heartOutline, color: Colors.redAccent),
            title: "Donate",
            onTap: () {
              launch("https://paypal.me/artixo");
            },
          ),
          // Licenses
          QuickAccessTile(
            tileIcon: Icon(MdiIcons.license, color: Colors.green),
            title: "Licenses",
            onTap: () {
              showLicensePage(
                applicationName: appData.appName,
                applicationIcon: Image.asset('assets/images/ic_launcher.png', height: 50, width: 50),
                applicationVersion: appData.appVersion,
                context: context
              );
            },
          )
        ],
      ),
    );
  }
}