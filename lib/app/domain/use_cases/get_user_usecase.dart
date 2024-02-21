import '../../../core/network/failure.dart';
import '../../../core/usecases/base_usecase.dart';
import '../entities/user.dart';
import '../repositories/get_users.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase extends BaseUseCase<List<User>, int>{
  final BaseGetUserRepository getUserRepository;
  GetUserUseCase(this.getUserRepository);

  @override
  Future<Either<Failure, List<User>>> call(int parameters) async{
    return await getUserRepository.getUser(parameters);
  }
}

