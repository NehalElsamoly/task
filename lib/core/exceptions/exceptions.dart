import 'package:equatable/equatable.dart';

import '../../config/resources/app_strings.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException({required this.message});

  @override
  List<Object?> get props => [message];
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException()
      : super(message: AppStrings.noInternetConnection);
}
