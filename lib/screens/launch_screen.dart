import 'dart:io';

import 'package:atuma_kelechi_kenoly/providers/api_get.dart';
import 'package:atuma_kelechi_kenoly/widgets/lunch_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaunchPage extends StatefulWidget {
  static const routeName = "/lunchPage";
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  bool _isLoading = false;
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        Provider.of<APIGet>(context).sendData().then((_) {
          setState(() {
            _isLoading = false;
          });
        });
      } on SocketException {
        setState(() {
          _isLoading = false;
        });
        _showErrorDialog(
            "Oops... Something about the network. Check Data Connection");
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        _showErrorDialog(error.toString());
      }
    }
    super.didChangeDependencies();
    _isInit = false;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("An Error Occured!"),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("Okay"),
            onPressed: () => Navigator.of(ctx).pop(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Click on an item to Search",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white70,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : LunchPageWidget(),
    );
  }
}
