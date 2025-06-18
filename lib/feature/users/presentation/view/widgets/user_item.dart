import 'package:flutter/material.dart';
import '../../../domain/entity/user.dart';

class UserItem extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserItem({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
        radius: 24,
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
