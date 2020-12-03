import 'package:flutter/material.dart';
import 'package:pickit/src/config/Routes.dart';
import 'package:pickit/src/config/Theme.dart';
import 'package:pickit/src/provider/HomeProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Pick it',
        initialRoute: "homePage",
        onGenerateRoute: routes,
        theme: SuperSimpleTheme().principalTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
