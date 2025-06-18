import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/enum/enum.dart';
import '../../domain/entity/user.dart';
import '../../domain/users_usecases/get_user_details.dart';
import '../../domain/users_usecases/get_users.dart';


part 'user_event.dart';
part 'user_state.dart';

@Injectable()
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;
  final GetUserDetails getUserDetails;

  UserBloc({
    required this.getUsers,
    required this.getUserDetails,
  }) : super( UserState()) {
    on<LoadUsersEvent>(_onLoadUsers);
    on<LoadUserDetailsEvent>(_onLoadUserDetails);
  }

  Future<void> _onLoadUsers(
      LoadUsersEvent event,
      Emitter<UserState> emit,
      ) async {
    if (state.hasReachedEnd) return;

    // First page logic: reset
    if (event.page == 2) {
      emit(state.copyWith(
        listState: RequestStates.loading,
        page: 2,
        users: [],
        hasReachedEnd: false,
      ));
    }

    final result = await getUsers(UserParamter(page: event.page));

    result.fold(
          (failure) {
        emit(state.copyWith(
          listState: RequestStates.error,
          listMessage: failure.message,
        ));
      },
          (newUsers) {
        final updatedUsers = List.of(state.users)..addAll(newUsers);

        emit(state.copyWith(
          listState: RequestStates.loaded,
          users: updatedUsers,
          hasReachedEnd: newUsers.isEmpty,
          page: event.page + 1,
        ));
      },
    );
  }

  Future<void> _onLoadUserDetails(
      LoadUserDetailsEvent event,
      Emitter<UserState> emit,
      ) async {
    emit(state.copyWith(detailsState: RequestStates.loading));

    final result = await getUserDetails(UserDetailsParameter(id: event.id));

    result.fold(
          (failure) {
        emit(state.copyWith(
          detailsState: RequestStates.error,
          detailsMessage: failure.message,
        ));
      },
          (user) {
        emit(state.copyWith(
          detailsState: RequestStates.loaded,
          userDetails: user,
        ));
      },
    );
  }
}
