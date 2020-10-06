import 'package:atuma_kelechi_kenoly/models/search_term_model.dart';
import 'package:atuma_kelechi_kenoly/providers/utility.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key key, this.title}) : super(key: key);
  final String title;
  static const routeName = "resultsScreen";

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Map<String, List<dynamic>> allData = {};
  Set<int> resultIndexes;
  List<List<dynamic>> csvTable;
  List<List<dynamic>> results;

  Future<void> loadAsset() async {
    try {
      final myData = await rootBundle.loadString('venten/car_ownsers_data.csv');

      csvTable = CsvToListConverter().convert(myData);
      //No need for a map. Just put individual columns in a list
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
    } catch (error) {
      throw error;
    }
    return allData;
  }

  filterTerms(SearchTermModel searchTermModel) {
    // ignore: missing_return
    allData.map((key, value) {
      if (key == "gender") {
        if (searchTermModel.gender == "") return;
        // value.where((e) => e == searchTermModel.gender).toList();
        for (int i = 0; i < value.length; i++) {
          if (searchTermModel.gender == value[i]) resultIndexes.add(i);
        }
      }
      if (key == "car_model_year") {
        // ignore: missing_return
        for (int i = 0; i < value.length; i++)
          if (searchTermModel.startYear <= value[i] &&
              value[i] <= searchTermModel) resultIndexes.add(i);
      }
      if (key == "country") {
        if (searchTermModel.countries.isEmpty) return;
        for (int i = 0; i < value.length; i++) {
          if (searchTermModel.countries.contains(value[i]))
            resultIndexes.add(i);
        }
      }
    });
    getFilteredResult();
  }

  getFilteredResult() {
    List<List<dynamic>> results = [];
    resultIndexes.map((e) => results.add(csvTable[e])).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(allData[i].toString()),
                );
              },
              itemCount: allData.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  SearchTermModel args;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    //   Future.delayed(Duration.zero, () {
    //     setState(() {
    //       _isLoading = true;
    //     });
    //     Provider.of<Utility>(context, listen: false)
    //         .loadAsset()
    //         .then((value) =>
    //     Provider.of<Utility>(context, listen: false).filterTerms(args);
    //     Provider.of<Utility>(context, listen: false).getFilteredResult();
    //     data = Provider.of<Utility>(context).results;
    //   }).then((value) => setState(() {
    //         _isLoading = false;
    //       }));
    // }
    setState(() {
      _isLoading = true;
    });
    loadAsset().then((value) {
      Future.delayed(Duration.zero, () {
        args = ModalRoute.of(context).settings.arguments;
        filterTerms(args);
        setState(() {
          _isLoading = false;
        });
      });
    });
  }
}
