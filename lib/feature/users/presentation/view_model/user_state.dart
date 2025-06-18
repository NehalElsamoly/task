part of 'user_bloc.dart';

class UserState extends Equatable {
  final RequestStates listState;
  final RequestStates detailsState;

  final String listMessage;
  final String detailsMessage;

  final List<User> users;
  final User userDetails;

  final bool hasReachedEnd;
  final int page;

   UserState({
    this.listState = RequestStates.initial,
    this.detailsState = RequestStates.initial,
    this.listMessage = '',
    this.detailsMessage = '',
    this.users = const [],
    User? userDetails,
    this.hasReachedEnd = false,
    this.page = 2,
  }) : userDetails = userDetails ??
      User(
        id: 0,
        firstName: '',
        lastName: '',
        email: '',
        avatar: '',
      );

  UserState copyWith({
    RequestStates? listState,
    RequestStates? detailsState,
    String? listMessage,
    String? detailsMessage,
    List<User>? users,
    User? userDetails,
    bool? hasReachedEnd,
    int? page,
  }) {
    return UserState(
      listState: listState ?? this.listState,
      detailsState: detailsState ?? this.detailsState,
      listMessage: listMessage ?? this.listMessage,
      detailsMessage: detailsMessage ?? this.detailsMessage,
      users: users ?? this.users,
      userDetails: userDetails ?? this.userDetails,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
    listState,
    detailsState,
    listMessage,
    detailsMessage,
    users,
    userDetails,
    hasReachedEnd,
    page,
  ];
}
