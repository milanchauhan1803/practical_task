import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  Map<String, dynamic> jsonData = {};
  RxBool isLoading = false.obs;

  Future<void> mapData() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(
        "https://raw.githubusercontent.com/mwgg/Airports/master/airports.json",
      ));

      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        isLoading.value = false;
        // print("json data:- $jsonData");
      } else {
        throw Exception('Failed to load data');
        isLoading.value = false;
      }
    } finally {}
  }
}
