part of '../../featurelin.dart';

class UserDetailsScreen extends StatelessWidget {
  final int userId;

  const UserDetailsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    bloc.add(LoadUserDetailsEvent(userId));

    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.detailsState == RequestStates.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.detailsState == RequestStates.error) {
            return Center(child: Text(state.detailsMessage));
          }

          final user = state.userDetails;

          return Center(
            child: Column(
              children: [
                20.sizedBoxHeight,
                CircleAvatar(radius: 50.responsiveSize, backgroundImage: NetworkImage(user.avatar)),
                16.sizedBoxHeight,
                Text('${user.firstName} ${user.lastName}', style: const AppTextStyle().bodyMedium14),
                9.sizedBoxHeight,
                Text(user.email, style:  AppTextStyle().bodyLarge16),
              ],
            ).paddingBody(),
          );
        },
      ),
    );
  }
}
