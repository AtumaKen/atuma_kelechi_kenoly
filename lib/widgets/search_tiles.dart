import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class SearchTiles extends StatelessWidget {
  final List<String> colors;

  final List<String> countries;
  final int id;
  final String gender;
  final int startYear;
  final int endYear;

  const SearchTiles(
      {Key key,
      @required this.gender,
      @required this.colors,
      @required this.countries,
      @required this.id,
      @required this.startYear,
      @required this.endYear})
      : super(key: key);

  Column _colorsList() {
    if (colors.isEmpty) return null;
    return Column(
      children: colors
          .map((e) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  e,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ))
          .toList(),
    );
  }

  Column _countryList() {
    assert(countries.isNotEmpty);
    if (countries.isEmpty) return null;
    return Column(
      children: countries
          .map((e) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  e,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          elevation: 0,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  id.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  DateFormat.yMMMMEEEEd().format(DateTime.now()),
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Container(
          width: 200,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Gender: ${gender == "" ? "No gender" : gender}"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Colors:"),
                      _colorsList() ?? Text("No Color"),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Countries:"),
                      _countryList() ?? Text("No country"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
