import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_app_structure/controllers/response.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer';

class UContoller {
  final String _BASE_URL = "https://reqres.in/api/users";

  Future<MyResponse?> getUser() async {
    String fileName = "userdata.json";

    var dir = await getTemporaryDirectory();

    File file = new File(dir.path + "/" + fileName);
    if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();
      MyResponse response = MyResponse.fromJson(json.decode(jsonData));
      print(response);
      return response;
    } else {
      print("Loading from API");
      var response = await http.get(Uri.parse(_BASE_URL));

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        MyResponse res = MyResponse.fromJson(json.decode(jsonResponse));
        //save json in local file
        file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);

        return res;
      }
    }
  }
}
