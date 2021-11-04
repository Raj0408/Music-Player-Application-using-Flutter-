import 'dart:io';
import 'package:flutter/material.dart' hide Intent;
import 'package:flutter/services.dart';
import 'package:libwinmedia/libwinmedia.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dart_discord_rpc/dart_discord_rpc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:harmonoid/core/collection.dart';
import 'package:harmonoid/core/intent.dart';
import 'package:harmonoid/core/configuration.dart';
import 'package:harmonoid/interface/imusicx.dart';
import 'package:harmonoid/interface/exception.dart';
import 'package:harmonoid/constants/language.dart';
import 'package:harmonoid/core/hotkeys.dart';
import 'package:harmonoid/interface/changenotifiers.dart';

const String TITLE = 'IMUSICX';
const String VERSION = '1.0';
const String AUTHOR = 'Raj Kaneriya & Bhavin Khunt<saini123hitesh@gmail.com>';

Future<void> main(List<String> args) async {
  try {
    if (Platform.isWindows) {
      WidgetsFlutterBinding.ensureInitialized();
      await Configuration.initialize();
      await Acrylic.initialize();
      await Acrylic.setEffect(
        effect: configuration.acrylicEnabled!
            ? AcrylicEffect.acrylic
            : AcrylicEffect.solid,
        gradientColor: configuration.themeMode! == ThemeMode.light
            ? Color(0x22DDDDDD)
            : Color(0xCC222222),
      );
      LWM.initialize();
      DiscordRPC.initialize();
      await Intent.initialize(args: args);
      await HotKeys.initialize();
      doWhenWindowReady(() {
        appWindow.minSize = Size(320, 590);
        appWindow.size = Size(1024, 640);
        appWindow.alignment = Alignment.center;
        appWindow.show();
      });
    }
    if (Platform.isLinux) {
      WidgetsFlutterBinding.ensureInitialized();
      await Configuration.initialize();
      LWM.initialize();
      DiscordRPC.initialize();
      await Intent.initialize(args: args);
      await HotKeys.initialize();
    }
    if (Platform.isAndroid) {
      WidgetsFlutterBinding.ensureInitialized();
      if (Platform.isAndroid) if (await Permission.storage.isDenied) {
        PermissionStatus storagePermissionState =
            await Permission.storage.request();
        if (!storagePermissionState.isGranted) {
          SystemNavigator.pop(
            animated: true,
          );
        }
      }
      await Configuration.initialize();
      await Intent.initialize();
    }
    await Collection.initialize(
      collectionDirectories: configuration.collectionDirectories!,
      cacheDirectory: configuration.cacheDirectory!,
      collectionSortType: configuration.collectionSortType!,
    );
    await collection.refresh(onProgress: (progress, total, _) {
      collectionRefresh.set(progress, total);
    });
    await Language.initialize(
      languageRegion: configuration.languageRegion!,
    );
    runApp(
      Hormonoid1(),
    );
  } catch (exception, stacktrace) {
    print(exception);
    print(stacktrace);
    runApp(
      ExceptionApp(
        exception: exception,
        stacktrace: stacktrace,
      ),
    );
  }
}
