import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/config/responsive/responsive_extensions.dart';
import '../../../../../config/routes/routes_names.dart';
import '../../../../../core/enum/enum.dart';
import '../../view_model/user_bloc.dart';
import 'user_details_screen.dart';
import '../widgets/user_item.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    final bloc = context.read<UserBloc>();
    if (bloc.state.users.isEmpty) {
      bloc.add(LoadUsersEvent(bloc.state.page));
    }

    _controller.addListener(() {
      final bloc = context.read<UserBloc>();
      if (_controller.position.pixels >= _controller.position.maxScrollExtent - 200 &&
          bloc.state.listState != RequestStates.loading &&
          !bloc.state.hasReachedEnd) {
        bloc.add(LoadUsersEvent(bloc.state.page));
      }
      debugPrint(">> Loading page: ${bloc.state.page}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: SafeArea(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.listState == RequestStates.loading && state.users.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
        
            if (state.listState == RequestStates.error && state.users.isEmpty) {
              return Center(child: Text(state.listMessage));
            }
        
            return ListView.builder(
              controller: _controller,
              itemCount: state.users.length + 1,
              itemBuilder: (context, index) {
                if (index < state.users.length) {
                  final user = state.users[index];
                  return UserItem(
                    user: user,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => UserDetailsScreen(userId: user.id),
                      //   ),
                      // );
                      Navigator.pushNamed(context, AppRoutesNames.rUsersListDetailsScreen, arguments: user.id);
                    },
                  );
                } else {
                  if (state.hasReachedEnd) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: Text('No more users')),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                }
              },
            ).paddingBody();
          },
        ),
      ),
    );
  }
}
