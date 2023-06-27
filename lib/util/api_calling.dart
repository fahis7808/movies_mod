import 'dart:convert';

import 'package:http/http.dart' as http;


class ApiCalling{

  static const baseUrl = 'https://api.themoviedb.org/3/movie';
  static const apikey = 'api_key=5553f3472085b6448623f8ba0610dd64';

  static Future <Map<String, dynamic>> fetchData(
      String path
      ) async {
    var url = Uri.parse('$baseUrl$path$apikey');
    var response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }


}