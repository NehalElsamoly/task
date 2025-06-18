import 'package:dartz/dartz.dart';

import '../../../../../config/base_repository/base_repository.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/utils/exports.dart';
import '../../domain/entity/user.dart';
import '../../domain/user_base_repository/user_reposotry.dart';
import '../user_data_source/remote/user_remote_data_source.dart';

@LazySingleton(as: UserRepository)
class UsersRepositoryImpl implements UserRepository {
  final BaseUsersRemoteDataSource remoteDataSource;
  final BaseRepository baseRepository;

  UsersRepositoryImpl({
    required this.remoteDataSource,
    required this.baseRepository,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers(int page) async {
    final remoteCall = remoteDataSource.getUsers(page: page);

    final result = await baseRepository.checkExceptionForRemoteData<List<User>>(remoteCall);
    return result.fold(
          (failure) => left(failure),
          (data) => right(data),
    );
  }

  @override
  Future<Either<Failure, User>>getUserDetails(int id) async {

    final result = await baseRepository.checkExceptionForRemoteData<User>(remoteDataSource.getUserDetails(id: id));

    return result.fold(
          (failure) => left(failure),
          (data) => right(data),
    );
  }
}
