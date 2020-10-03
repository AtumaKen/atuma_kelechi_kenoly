import 'package:atuma_kelechi_kenoly/widgets/lunch_page_widget.dart';
import 'package:flutter/material.dart';

class LunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Click to Search",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white70,
      ),
      body: LunchPageWidget(),
    );
  }
}
