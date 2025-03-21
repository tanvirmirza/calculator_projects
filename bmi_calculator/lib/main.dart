

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'app.dart';

void main() => runApp(DevicePreview(
    backgroundColor: Colors.black12,
    enabled: !kReleaseMode,
    builder: (context) => MyApp()));