import 'dart:convert';

import 'package:atuma_kelechi_kenoly/models/search_term_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class APIGet with ChangeNotifier {
  List<SearchTermModel> _terms = [];

  List<SearchTermModel> get terms {
    return [..._terms];
  }

  sendData() async {
    const url = "https://ven10.co/assessment/filter.json";
    // try {
    final response = await http.get(url);
    List<SearchTermModel> searchTermModel = [];
    final data = jsonDecode(response.body);
    data.forEach((element) {
      searchTermModel.add(SearchTermModel(
          colors: List<String>.from(element["colors"]),
          countries: List<String>.from(element["countries"]),
          endYear: element["end_year"],
          gender: element["gender"],
          startYear: element["start_year"],
          id: element["id"]));
    });
    _terms = searchTermModel;
    notifyListeners();
    // } catch (error) {
    // throw error;
    // }
  }
}
