import 'dart:convert';

import 'package:sigma_tech_task/app/data/models/user_model.dart';

import '../../../core/network/client/api_consumer.dart';
import '../../../core/network/end_points.dart';

abstract class BaseGetUsersRemoteDataSource {
  Future<List<UserModel>> getUsers(int limit);
}

class GetUsersRemoteDataSource extends BaseGetUsersRemoteDataSource {
  final ApiConsumer _apiConsumer;

  GetUsersRemoteDataSource(this._apiConsumer);

  @override
  Future<List<UserModel>> getUsers(int limit) async {
    try {
      final response = await _apiConsumer.get(EndPoints.getUsers(limit));
      final json = jsonDecode(response.data);
      if (response.statusCode == 200) {
        return List<UserModel>.from(
            (json['users'] as List).map((e) => UserModel.fromJson(e)));
      } else {
        throw Exception();
      }
    } on Exception catch (e) {
      print("Exception $e");
      throw Exception();
    }
  }
}
