import 'package:flutter/material.dart';
import 'package:generics_task_digital_future/modules/home/views/home_view.dart';
import 'package:generics_task_digital_future/repositories/users/users_api.dart';
import 'package:provider/provider.dart';

import '../modules/home/controllers/home_controller.dart';

class Routes {
  static const String homeRoute = '/';
}

class RouteGenerator {
  static Route getPages(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => HomeController(
              usersRepository: UsersApi(),
            ),
            child: const HomeView(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static MaterialPageRoute unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('No Route Found'),
          ),
          body: const Center(
            child: Text('No Route Found'),
          ),
        );
      },
    );
  }
}
