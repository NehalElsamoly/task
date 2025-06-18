import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/user.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers(int page);
  Future<Either<Failure, User>> getUserDetails(int id);
}
