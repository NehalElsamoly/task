import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entity/user.dart';
import '../user_base_repository/user_reposotry.dart';

@LazySingleton()
class GetUsers extends BaseUseCase<List<User>, UserParamter> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<Failure, List<User>>> call(UserParamter parameter) {
    return repository.getUsers(parameter.page);
  }
}

class UserParamter extends Equatable {
  final int page;

  const UserParamter({required this.page});

  @override
  List<Object?> get props => [page];
}
