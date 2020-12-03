import 'package:flutter/material.dart';
import 'package:pickit/src/config/Routes.dart';
import 'package:pickit/src/config/Theme.dart';
import 'package:pickit/src/provider/GlobalProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalProvider>(create: (_) => GlobalProvider()),
      ],
      child: MaterialApp(
        title: 'Pick it',
        initialRoute: "main",
        onGenerateRoute: routes,
        theme: PickIt().principalTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
