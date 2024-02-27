import 'package:flutter/material.dart';
import 'package:generics_task_digital_future/repositories/users/users_repository.dart';
import 'package:generics_task_digital_future/resources/exception_manager.dart';

import '../../../models/user_model.dart';

class HomeController with ChangeNotifier {
  final UsersRepository usersRepository;
  HomeController({required this.usersRepository});
  bool isLoading = false;
  set setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  List<UserModel> usersList = [];

  void clearUsersList() {
    usersList.clear();
    notifyListeners();
  }

  Future<void> getUsersList() async {
    try {
      setIsLoading = true;
      usersList = await usersRepository.getUsersList();
    } catch (e) {
      ExceptionManager().showException(e.toString());
    } finally {
      setIsLoading = false;
    }
  }

  Future<void> getOneUser() async {
    try {
      setIsLoading = true;
      final UserModel userModel = await usersRepository.getOneUsers();
      usersList.clear();
      usersList.add(userModel);
    } catch (e) {
      ExceptionManager().showException(e.toString());
    } finally {
      setIsLoading = false;
    }
  }
}
