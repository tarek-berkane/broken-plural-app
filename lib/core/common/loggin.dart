import 'package:broken_plural_ar/core/data/AppData.dart';
import 'package:flutter/foundation.dart';

import 'package:logging/logging.dart';

/*
Reset = "\x1b[0m"
Bright = "\x1b[1m"
Dim = "\x1b[2m"
Underscore = "\x1b[4m"
Blink = "\x1b[5m"
Reverse = "\x1b[7m"
Hidden = "\x1b[8m"

FgBlack = "\x1b[30m"
FgRed = "\x1b[31m"
FgGreen = "\x1b[32m"
FgYellow = "\x1b[33m"
FgBlue = "\x1b[34m"
FgMagenta = "\x1b[35m"
FgCyan = "\x1b[36m"
FgWhite = "\x1b[37m"

BgBlack = "\x1b[40m"
BgRed = "\x1b[41m"
BgGreen = "\x1b[42m"
BgYellow = "\x1b[43m"
BgBlue = "\x1b[44m"
BgMagenta = "\x1b[45m"
BgCyan = "\x1b[46m"
BgWhite = "\x1b[47m"

*/
void consoleLog(text, {scope, String typeLog = 'DEBUG'}) {
  // do not loggin in production
  if (AppData.appState == AppState.Production) {
    return;
  }

  assert(text != null);

  var name = scope ?? 'Default';

  var time = DateTime.now();

  String color;

  var _typeLog = typeLog?.toUpperCase() ?? 'DEBUG';

  if (_typeLog == "DEBUG") {
    color = '\x1b[36m';
  } else if (_typeLog == "ERROR") {
    color = '\x1b[31m';
  } else {
    color = "\x1b[33m";
  }

  debugPrint(
      "$color $_typeLog \x1b[37m: $text  || scope :\x1b[33m $name \x1b[37m||\x1b[36m  ${time.hour}:" +
          "${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}\x1b[37m");
}

void initLogging(Level minLevel) {
  Logger.root.level = minLevel;
  Logger.root.onRecord.listen((event) {
    String color;

    if (event.level.value < 600) {
      color = '\x1b[32m';
    } else if (event.level.value < 900) {
      color = '\x1b[34m';
    } else {
      color = "\x1b[33m";
    }

    debugPrint(
        "$color ${event.level.name} \x1b[37m: [${event.loggerName}] : ${event.message} || ${event.time}");
  });
}
