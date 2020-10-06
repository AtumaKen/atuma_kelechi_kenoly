import 'package:atuma_kelechi_kenoly/providers/api_get.dart';
import 'package:atuma_kelechi_kenoly/providers/utility.dart';
import 'package:atuma_kelechi_kenoly/screens/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: APIGet()),
        ChangeNotifierProvider.value(value: Utility())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "Anton",
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
          home: LaunchPage(),
          routes: {
            ResultScreen.routeName: (ctx) => ResultScreen(),
            LaunchPage.routeName: (ctx) => LaunchPage()
          }),
    );
  }
}
