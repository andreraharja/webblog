import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:webblog/model_content.dart';

Future<List<DataContent>> getDataContent() async {
  try {
    Map<String, String> headersCollect = {
      'Content-Type': 'application/json',
    };
    http.Response response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: headersCollect);
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<DataContent> dataResult = [];
      jsonData.map((i) => dataResult.add(DataContent.fromJson(i))).toList();
      return dataResult;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}
