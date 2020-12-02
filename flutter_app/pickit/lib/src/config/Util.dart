import 'dart:convert';

import 'package:pickit/src/config/MapStyle.dart';

class Util {
  static String get mapStyleRetro => json.encode(retroStyle);
}
