


import '../../core/services/services_locator.dart';
import '../../core/utils/exports.dart';

import '../../feature/users/presentation/view/screeens/user_details_screen.dart';
import '../../feature/users/presentation/view/screeens/users_list_screen.dart';
import '../../feature/users/presentation/view_model/user_bloc.dart';
import 'un_defined_route.dart';

class AppRouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case AppRoutesNames.rUsersListScreen:
        return
          MaterialPageRoute(
            builder:
                (_) => BlocProvider(
              create: (context) => getIt<UserBloc>(),
              child: const UsersListScreen(),
            ),
          );
  case AppRoutesNames.rUsersListDetailsScreen:
    int id = settings.arguments as int;
    return
          MaterialPageRoute(
            builder:
                (_) => BlocProvider(
              create: (context) => getIt<UserBloc>(),
              child:  UserDetailsScreen(userId: id,),
            ),
          );



      default:
        return unDefinedRoute();
    }
  }
}
