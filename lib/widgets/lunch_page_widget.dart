import 'package:atuma_kelechi_kenoly/models/search_term_model.dart';
import 'package:atuma_kelechi_kenoly/widgets/search_tiles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LunchPageWidget extends StatelessWidget {
  final List<SearchTermModel> searchList = [
    SearchTermModel(
        colors: ["Green", "Violet", "Yellow", "Blue"],
        countries: ["Brazil", "Ireland", "Egypt", "Peru"],
        id: 1,
  startYear: 2007,
        // startYear: DateFormat.YEAR("2007"),
        endYear: 2009,),
    SearchTermModel(
        id: 2,
        startYear:1990,
        endYear: 2010,
        gender: "",
        countries: [
          "Russia",
          "Portugal",
          "Vietnam",
          "Croatia",
          "Uganda",
          "Iran"
        ],
        colors: [
          "Teal",
          "Maroon",
          "Red",
          "Orange"
        ]),
    SearchTermModel(
        id: 3,
        startYear: 2001,
        endYear: 2009,
        gender: "female",
        countries: ["Poland", "Niger", "Greece"],
        colors: ["Red", "Aquamarine", "Orange", "Mauv"]),
    SearchTermModel(
        id: 4,
        startYear: 1990,
        endYear: 2000,
        countries: ["United States", "Portugal"],
        colors: ["Red"]),
    SearchTermModel(
        id: 5,
        startYear: 2000,
        endYear: 2009,
        gender: "",
        countries: [
          "Myanmar",
          "South Africa",
          "Nicaragua",
          "Finland",
          "Cuba",
          "Mexico"
        ],
        colors: []),
    SearchTermModel(
        id: 6,
        startYear: 2005,
        endYear: 2010,
        gender: "",
        countries: [
          "South Africa",
          "Cuba",
          "Niger",
          "Egypt",
          "Uganda",
          "Kenya"
        ],
        colors: [
          "Red",
          "Aquamarine",
          "Orange",
          "Mauv",
          "Green",
          "Violet",
          "Yellow",
          "Blue",
          "Teal",
          "Maroon",
          "Orange"
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, i) {
      return SearchTiles(
        colors: searchList[i].colors,
        countries: searchList[i].countries,
        endYear: searchList[i].endYear,
        startYear: searchList[i].startYear,
        id: searchList[i].id,
        gender: searchList[i].gender,
      );
    }, itemCount: searchList.length,);
  }
}
