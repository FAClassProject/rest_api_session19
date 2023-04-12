import 'dart:developer';

import '../APIConstant/api_constants.dart';
import '../model/user_model.dart';
import 'package:http/http.dart'as http;

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print("printing response Body+++++++++++++${response.body}");
        List<UserModel> _model = userModelFromJson(response.body);
        print("Model Length===============${_model.length}");
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}