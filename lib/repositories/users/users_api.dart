import 'package:generics_task_digital_future/resources/apis_manager.dart';
import 'package:generics_task_digital_future/services/network_service.dart';

import '../../models/user_model.dart';
import 'users_repository.dart';

class UsersApi extends UsersRepository {
  @override
  Future<List<UserModel>> getUsersList() async {
    final String url = ApisManager().getUsersListUrl;
    return await NetworkService().fetchData(
      url,
      (data) {
        final List list = data as List;
        return list.map((e) => UserModel.fromJson(e)).toList();
      },
    );
  }

  @override
  Future<UserModel> getOneUsers() async {
    final String url = ApisManager().getOneUserUrl;
    return await NetworkService().fetchData(
      url,
      (data) {
        // final Map<String,dynamic> map = data as Map<String,dynamic>;
        return UserModel.fromJson(data);
      },
    );
  }
}
