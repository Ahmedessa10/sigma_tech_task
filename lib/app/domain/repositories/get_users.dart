import 'package:dartz/dartz.dart';
import '../../../core/network/failure.dart';
import '../entities/user.dart';

abstract class BaseGetUserRepository {
  Future<Either<Failure, List<User>>> getUser(int limit);
}