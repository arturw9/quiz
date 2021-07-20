import 'dart:convert';

import 'package:flutter_application_1/models/question.dart';
import 'package:http/http.dart' as http;


class QuizApi {
  static Future<List<Question>> fetch() async {
    try {
      var url = 'https://script.google.com/macros/s/AKfycbz_dxAiDN0YTgAoRtoLWbLWW_FBqXNP7qrwHywCIL5hYYqs6aZmp1N1h4mzqiBIACw/exec';
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Question>.from(
            data['questions'].map((x) => Question.fromMap(x)));
      } else {
        return List<Question>();
      }

    } catch (error) {
      print(error);
      return List<Question>();
    }
  }
}