import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intern_task/models/qanda.dart';
import 'package:intern_task/models/qanda1.dart';
import 'package:intern_task/models/quiztype.dart';

class AssistantMethods {
  static Future<List<QuizType>> getRequest(String url) async {
    // http.Response response = await http.get(Uri.parse(url));
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    // List<QuizType> quizmodel;

    try {
      if (response.statusCode == 200) {
        String jSonData = response.body;
        List<dynamic> decodeData = jsonDecode(jSonData);

        // var quizmodel = new List<QuizType>.from(decodeData);

        var quizmodel = decodeData
            .map((decodeData) => new QuizType.fromJson(decodeData))
            .toList();

        return quizmodel;
      } else {
        print("failed1");
        throw "failed";
      }
    } catch (exp) {
      print("failed2 $exp");
      throw "failed2";
    }
  }

  static Future<List<QuesAndAns>> getRequestforqanda(String url) async {
    // http.Response response = await http.get(Uri.parse(url));
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    // List<QuizType> quizmodel;

    try {
      if (response.statusCode == 200) {
        String jSonData = response.body;
        List<dynamic> decodeData = jsonDecode(jSonData);

        // var quizmodel = new List<QuizType>.from(decodeData);

        var quizmodel = decodeData
            .map((decodeData) => new QuesAndAns.fromJson(decodeData))
            .toList();

        return quizmodel;
      } else {
        print("failed1");
        throw "failed";
      }
    } catch (exp) {
      print("failed2 $exp");
      throw "failed2";
    }
  }

  static Future<List<QuesAndAns1>> getRequestforqanda1(String url) async {
    // http.Response response = await http.get(Uri.parse(url));
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    // List<QuizType> quizmodel;

    try {
      if (response.statusCode == 200) {
        String jSonData = response.body;
        List<dynamic> decodeData = jsonDecode(jSonData);

        // var quizmodel = new List<QuizType>.from(decodeData);

        var quizmodel = decodeData
            .map((decodeData) => new QuesAndAns1.fromJson(decodeData))
            .toList();

        return quizmodel;
      } else {
        print("failed1");
        throw "failed";
      }
    } catch (exp) {
      print("failed2 $exp");
      throw "failed2";
    }
  }
}
