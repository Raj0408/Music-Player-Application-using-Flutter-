import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:harmonoid/main.dart';
import 'package:harmonoid/interface/settings/settings.dart';
import 'package:harmonoid/constants/language.dart';

class VersionSetting extends StatefulWidget {
  VersionSetting({Key? key}) : super(key: key);
  VersionState createState() => VersionState();
}

class VersionState extends State<VersionSetting> {
  String? version = 'v' + VERSION;

  @override
  void initState() {
    super.initState();
    http
        .get(Uri.parse(
            'https://api.github.com/repos/harmonoid/harmonoid/releases'))
        .then((http.Response response) {
      this.setState(() {
        List<dynamic> json = convert.jsonDecode(response.body);
        this.version = json.first['tag_name'];
      });
    }).catchError((exception) {});
  }

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: language!.STRING_SETTING_APP_VERSION_TITLE,
      subtitle: language!.STRING_SETTING_APP_VERSION_SUBTITLE,
      child: Column(
        children: [
          Table(
            children: [
              TableRow(
                children: [
                  Text(language!.STRING_SETTING_APP_VERSION_INSTALLED),
                  // Text('v' + VERSION),
                  Text('v' + 1.0.toString())
                ],
              ),
              // TableRow(children: [
              //   Text(language!.STRING_SETTING_APP_VERSION_LATEST),
              //   Text(this.version ?? language!.STRING_NO_INTERNET_TITLE),
              // ]),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.all(16.0),
      actions: this.version == 'v' + VERSION
          ? null
          : [
              Column(
                children: <Widget>[
                  MaterialButton(
                    onPressed: () => launch('https://github.com/Raj0408'),
                    child: Text(
                      // language!.STRING_DOWNLOAD_UPDATE,
                      'RAJ KANERIYA',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => launch('https://github.com/Bhavin230'),
                    child: Text(
                      // language!.STRING_DOWNLOAD_UPDATE,
                      'BHAVIN KHUNT',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
    );
  }
}
