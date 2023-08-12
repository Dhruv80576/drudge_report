import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:drudge_report/Api/News_model.dart';
import 'package:http/http.dart';

class Api_service {
  String endpoint;
  String baseurl;
  Api_service(this.endpoint, this.baseurl);
  List<News_model> news = [];
  Future<List<News_model>?> getUsers() async {
    try {
      Response response = await get(Uri.parse(endpoint));
      Map body_data = jsonDecode(response.body);
      List articles = body_data["articles"];
      for (var element in articles) {
        news.add(News_model.fromJson(element));
      }

      print(news.elementAt(0).title);
      return news;
    } catch (e) {
      log(e.toString());
      log("Failed");
    }
  }
}
