import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../../../core/utils/exports.dart';
import '../entity/user.dart';
import '../user_base_repository/user_reposotry.dart';
@LazySingleton()

class GetUserDetails extends BaseUseCase<User, UserDetailsParameter> {
  final UserRepository repository;

  GetUserDetails(this.repository);

  @override
  Future<Either<Failure, User>> call(UserDetailsParameter parameter) {
    return repository.getUserDetails(parameter.id);
  }
}class UserDetailsParameter extends Equatable {
  final int id;

  const UserDetailsParameter({required this.id});

  @override
  List<Object?> get props => [id];
}