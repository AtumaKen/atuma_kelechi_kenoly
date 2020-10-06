import 'package:flutter/cupertino.dart';

class SearchTermModel with ChangeNotifier {
  final int id;
  final int startYear;
  final int endYear;
  final String gender;
  final List<String> countries;
  final List<String> colors;

  SearchTermModel(
      {this.id,
      this.startYear,
      this.endYear,
      this.gender,
      this.countries,
      this.colors});
}
