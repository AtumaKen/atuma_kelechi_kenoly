import 'package:atuma_kelechi_kenoly/providers/api_get.dart';
import 'package:atuma_kelechi_kenoly/utility/utility.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  static const routeName = "resultsScreen";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, List<dynamic>> allData = {};
  APIGet dat = APIGet();

  @override
  Widget build(BuildContext context) {
    // List<dynamic> data =  loadAsset();
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: FutureBuilder(
        future: Utility.getFilteredResult(),
        builder: (ctx, dataSnapShot) {
          if (dataSnapShot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            if (dataSnapShot.error != null)
              return Text("Something went wrong");
            else {
              return ListView.builder(
                itemBuilder: (ctx, i) {
                  return ListTile(
                    title: Text("${dataSnapShot.data[i]}"),
                  );
                },
                itemCount: dataSnapShot.data.length,
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // searchTerms(["gender", "first_name"]);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    dat.sendData();
  }
}
