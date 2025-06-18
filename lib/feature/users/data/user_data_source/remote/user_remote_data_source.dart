import '../../../../../config/base_remote_data_source/base_remote_data_source.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/utils/exports.dart';
import '../../models/user_model.dart';
abstract class BaseUsersRemoteDataSource {
  Future<List<UserModel>> getUsers({required int page});
  Future<UserModel> getUserDetails({required int id});
}
@LazySingleton(as: BaseUsersRemoteDataSource)
class UsersRemoteDataSourceImpl implements BaseUsersRemoteDataSource {
  final BaseRemoteDataSource baseRemoteDataSource;

  UsersRemoteDataSourceImpl({
    required this.baseRemoteDataSource,
  });

  @override
  Future<List<UserModel>> getUsers({required int page}) async {
    final Map<String, dynamic> response = await baseRemoteDataSource.get(
      url: "${EndPoints.users}?page=$page",
      requiresAuth: false,
    );

    final List data = response['data'];
    return data.map((json) => UserModel.fromJson(json)).toList();
  }

  @override
  Future<UserModel> getUserDetails({required int id}) async {
    final Map<String, dynamic> response = await baseRemoteDataSource.get(
      url: "${EndPoints.users}/$id",
    );

    final Map<String, dynamic> userData = response['data'];
    return UserModel.fromJson(userData);
  }
}