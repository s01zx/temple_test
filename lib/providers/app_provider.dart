import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:temple_test/helpers/const_values.dart';

class AppProvider with ChangeNotifier {
  List<String> reportList = [];

  List<String> get repList {
    return [...reportList];
  }

  Future<void> getCelebCat() async {
    print("Started fetching");
    var url = Uri.parse("$BASE_URL/App/categories/0");
    try {
      var post = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ).timeout(const Duration(seconds: 20), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Check your internet and try again!');
      });

      var response = json.decode(post.body);
      //print(response);

      if (post.statusCode != 200) {
        throw Exception("Something went wrong");
      } else {
        var data = response["result"] as List<dynamic>;
        if (reportList.isNotEmpty) {
          reportList.clear();
        }
        for (var element in data) {
          reportList.add(element["name"]);
        }
        print("Done fetching.......");
      }
    } on Exception catch (e) {
      throw e;
    }
  }
}
