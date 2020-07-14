import 'package:flutter/foundation.dart';

void consoleLog(text, {appName = null, typeLog = 'DEBUG'}) {
  assert(text != null);

  var name = appName ?? 'Default';

  var time = DateTime.now();

  debugPrint("${typeLog} : ${text} || scope : ${name} || ${time.hour}:" +
      "${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}");
}
