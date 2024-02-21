import 'dart:convert';
import 'package:sigma_tech_task/app/data/models/user_model.dart';
import 'package:sigma_tech_task/app/domain/entities/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://dummyjson.com/users?limit=1'));
  final json = jsonDecode(response.body);


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return List<UserModel>.from(
        (json['users'] as List).map((e) => UserModel.fromJson(e)));
  } else {
    
    // If the server did not return a 200 OK response,
    throw Exception('Failed to load album');
  }
}

