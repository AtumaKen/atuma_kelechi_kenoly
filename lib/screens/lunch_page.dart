import 'package:atuma_kelechi_kenoly/providers/api_get.dart';
import 'package:atuma_kelechi_kenoly/widgets/lunch_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LunchPage extends StatefulWidget {
  @override
  _LunchPageState createState() => _LunchPageState();
}

class _LunchPageState extends State<LunchPage> {
  bool _isLoading = false;
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<APIGet>(context).sendData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    super.didChangeDependencies();
    _isInit = false;
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
