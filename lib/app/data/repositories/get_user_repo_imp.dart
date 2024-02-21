import 'package:dartz/dartz.dart';
import 'package:sigma_tech_task/app/domain/entities/user.dart';
import 'package:sigma_tech_task/app/domain/repositories/get_users.dart';
import 'package:sigma_tech_task/core/network/failure.dart';

import '../data_sources/get_users_data_source.dart';

class GetUserRepoImplementation implements BaseGetUserRepository {
  final BaseGetUsersRemoteDataSource _baseGetUsersRemoteDataSource;

  GetUserRepoImplementation(this._baseGetUsersRemoteDataSource);

  @override
  Future<Either<Failure, List<User>>> getUser(int limit) async {
    try {
      final users = await _baseGetUsersRemoteDataSource.getUsers(limit);
      return Right(users);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
