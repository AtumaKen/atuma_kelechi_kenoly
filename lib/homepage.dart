import 'package:atuma_kelechi_kenoly/providers/api_get.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, List<dynamic>> allData = {};
  APIGet dat = APIGet();

  Future<List<List<dynamic>>> loadAsset() async {
    WidgetsFlutterBinding.ensureInitialized();
    final myData = await rootBundle.loadString('venten/car_ownsers_data.csv');
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
    allData = {
      "first_name": csvTable.skip(0).map((e) => e[1]).toList(),
      "last_name": csvTable.skip(0).map((e) => e[2]).toList(),
      "email": csvTable.map((e) => e[3]).toList(),
      "country": csvTable.map((e) => e[4]).toList(),
      "car_model": csvTable.map((e) => e[5]).toList(),
      "car_model_year": csvTable.map((e) => e[6]).toList(),
      "car_color": csvTable.map((e) => e[7]).toList(),
      "gender": csvTable.skip(0).map((e) => e[8]).skip(0).toList(),
      "job_title": csvTable.map((e) => e[9]).toList(),
      "bio": csvTable.map((e) => e[10]).toList(),
    };
    // print(allData.entries);
    return csvTable;
  }

  searchTerms(List<String> keyss) {
    for (String vals in allData.keys) {
      if (keyss.contains(vals)) print(allData[vals]);
    }
    // for(String vals in allData.keys){
    //   print(keyss.where((element) => element == vals).toList());
    // }
  }

  @override
  Widget build(BuildContext context) {
    // List<dynamic> data =  loadAsset();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: loadAsset(),
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
          searchTerms(["gender", "first_name"]);
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
