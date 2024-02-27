import 'package:flutter/material.dart';
import 'package:generics_task_digital_future/models/user_model.dart';
import 'package:generics_task_digital_future/resources/app_utils.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${userModel.name}'),
      subtitle: Text('${userModel.email}'),
      trailing: IconButton(
        onPressed: () {
          AppUtils.openUrl('${userModel.phone}');
        },
        icon: const Icon(Icons.call),
      ),
    );
  }
}
