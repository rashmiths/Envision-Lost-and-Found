import 'dart:async';

import 'package:flutter/services.dart';
el =
const MethodChannel('flutter_plugin');

static Future<String> get platformVersion async {
  final String version = await _channel.invokeMethod('getPlatformVersion');
  return version;
}
}

class FlutterPlugin {
  static const MethodChannel _chann