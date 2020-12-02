import 'package:flutter/material.dart';
import 'package:pickit/src/config/Routes.dart';
import 'package:pickit/src/config/Theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick it',
      initialRoute: "homePage",
      onGenerateRoute: routes,
      theme: SuperSimpleTheme().principalTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
