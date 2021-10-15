import 'dart:convert';
import 'package:bloc_start/flutter_bloc_lib/models/users.dart';
import 'package:http/http.dart' as http;

const url = 'https://jsonplaceholder.typicode.com/users';

class UsersApiProvider {
  Future<List<User>> getUserList() async {
    final response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    }else{
      throw Exception("Network Error");
    }
  }
}
