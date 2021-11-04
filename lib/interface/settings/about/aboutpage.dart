// ignore_for_file: unused_import

/* 
 *  This file is part of Harmonoid (https://github.com/harmonoid/harmonoid).
 *  
 *  Harmonoid is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *  
 *  Harmonoid is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License
 *  along with Harmonoid. If not, see <https://www.gnu.org/licenses/>.
 * 
 *  Copyright 2020-2021, Hitesh Kumar Saini <saini123hitesh@gmail.com>.
 */

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:harmonoid/interface/settings/settings.dart';
import 'package:harmonoid/utils/widgets.dart';
import 'package:harmonoid/constants/language.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  dynamic repository;

  @override
  void initState() {
    super.initState();
    http.get(Uri.parse('www.charusat.ac.in')).then(
      (response) {
        this.setState(
          () => repository = convert.jsonDecode(
            response.body,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 56.0,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.10)
                  : Colors.black.withOpacity(0.10),
              border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).dividerColor.withOpacity(0.12)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NavigatorPopButton(),
                SizedBox(
                  width: 24.0,
                ),
                Text(
                  language!.STRING_ABOUT_TITLE,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomListView(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    top: 4.0,
                    bottom: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).dividerColor.withOpacity(0.12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   'assets/images/about_header.jpg',
                      //   fit: BoxFit.fitWidth,
                      //   alignment: Alignment.center,
                      //   height: 192,
                      //   width:
                      //       MediaQuery.of(context).size.width.normalized - 16.0,
                      // ),
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: Theme.of(context).dividerColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).cardColor,
                                backgroundImage:
                                    //  (this.repository == null ||
                                    //         this.repository!.containsKey('message'))
                                    //     ? null
                                    //     :
                                    NetworkImage(
                                  'https://avatars.githubusercontent.com/u/75374037?s=200&v=4',
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'IMUSICX',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      //   child: Text(
                      //     (this.repository == null ||
                      //             this.repository!.containsKey('message'))
                      //         ? 'GNU General Public License v3.0'
                      //         : this.repository!['license']['name'],
                      //     style: TextStyle(
                      //       color:
                      //           Theme.of(context).brightness == Brightness.dark
                      //               ? Colors.white.withOpacity(0.8)
                      //               : Colors.black.withOpacity(0.8),
                      //       fontSize: 14.0,
                      //     ),
                      //   ),
                      // ),
                      // if (this.repository != null &&
                      //     !this.repository!.containsKey('message'))
                      //   Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 16.0, vertical: 8.0),
                      //     child: Row(children: [
                      //       Chip(
                      //         avatar: Icon(FluentIcons.star_20_regular,
                      //             size: 20.0, color: Colors.white),
                      //         label: Text(
                      //           '${this.repository!['stargazers_count']} stars',
                      //           style: TextStyle(
                      //             color: Colors.white,
                      //           ),
                      //         ),
                      //         backgroundColor:
                      //             Theme.of(context).colorScheme.secondary,
                      //       ),
                      //       SizedBox(width: 8.0),
                      //       Chip(
                      //         avatar: Icon(FluentIcons.branch_fork_20_regular,
                      //             size: 20.0, color: Colors.white),
                      //         label: Text(
                      //           '${this.repository!['forks']} forks',
                      //           style: TextStyle(color: Colors.white),
                      //         ),
                      //         backgroundColor:
                      //             Theme.of(context).colorScheme.secondary,
                      //       ),
                      //     ]),
                      //   ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 8.0,
                          top: 2.0,
                        ),
                        child: (this.repository == null ||
                                this.repository!.containsKey('message'))
                            ? Text(
                                '🎵 Elegant music app to play local music . Distributes music into albums & artists. Has playlists & lyrics.',
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white.withOpacity(1.0)
                                      : Colors.black.withOpacity(0.8),
                                  fontSize: 14.0,
                                ),
                              )
                            : Text(
                                this.repository!['description'],
                                style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white.withOpacity(0.8)
                                      : Colors.black.withOpacity(0.8),
                                  fontSize: 14.0,
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 1.0,
                        indent: 16.0,
                        endIndent: 16.0,
                        height: 1.0,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lead Developer',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Divider(color: Colors.transparent, height: 4.0),
                            Text(
                              'Maintainer & creator of the project.',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.transparent, height: 8.0),
                      ListTile(
                        onTap: () => launch(
                          '',
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/28951144?s=80&v=4',
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        title: Text(
                          'Raj Kaneriya & Bhavin Khunt',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        subtitle: Text(
                          'Deals with playback & parsing of music. Writes UI, state management & lifecycle code. Maintains core C++ plugins.',
                          style: Theme.of(context).textTheme.headline3,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(
                          FluentIcons.link_24_regular,
                          size: 22.0,
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).dividerColor,
                        thickness: 1.0,
                        indent: 16.0,
                        endIndent: 16.0,
                        height: 1.0,
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          MaterialButton(
                            onPressed: () => launch(
                              'https://github.com/raj0408',
                            ),
                            child: Text(
                              'GITHUB',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
