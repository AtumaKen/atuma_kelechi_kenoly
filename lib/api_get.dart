import 'dart:convert';

import 'package:http/http.dart' as http;
class APIGet {
   sendData() async{
    const url =
        "https://ven10.co/assessment/filter.json";
    try {
      final response = await http.get(url);
      print(jsonDecode(response.body));
    }catch(error){
      throw error;
    }
  }
}
