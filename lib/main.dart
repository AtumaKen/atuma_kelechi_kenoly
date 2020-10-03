import 'file:///C:/Users/ASUS/AndroidStudioProjects/atuma_kelechi_kenoly/lib/screens/lunch_page.dart';
import 'package:atuma_kelechi_kenoly/providers/api_get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: APIGet(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Anton",
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: LunchPage(),
      ),
    );
  }
}
