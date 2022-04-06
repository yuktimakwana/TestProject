import 'dart:convert';
import 'package:flutter_app/Rebloc/ModelClass.dart';
import 'package:http/http.dart' as http;

abstract class NewRepository {
  Future<List<Records>> getData();
}

class ScndRepositoryImpl extends NewRepository {
  @override
  Future<List<Records>> getData() async {

    final url="http://192.168.251.15/Insta_demo/getStoryData.php";
    final response =
    await http.get(Uri.parse(url),headers: {"Accept" : "application/json"});


    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      print("response_body-------"+response.body);
      List<Records>? records = ModelClass.fromJson(data).records;
      return records!;
    } else {
      throw Exception('Failed');
    }
  }
}