import 'package:flutter/material.dart';
import 'package:generics_task_digital_future/models/user_model.dart';
import 'package:generics_task_digital_future/modules/home/widgets/user_card.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Consumer<HomeController>(
            builder: (BuildContext context, HomeController provider, _) {
              if (provider.usersList.isEmpty) {
                return const SizedBox.shrink();
              }
              return IconButton(
                onPressed: () {
                  provider.clearUsersList();
                },
                icon: const Icon(Icons.clear_outlined),
              );
            },
          ),
        ],
      ),
      body: Consumer<HomeController>(
        builder: (BuildContext context, HomeController provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (provider.usersList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () {
                      provider.getUsersList();
                    },
                    child: const Text('Get Users'),
                  ),
                  FilledButton(
                    onPressed: () {
                      provider.getOneUser();
                    },
                    child: const Text('Get One User'),
                  ),
                ],
              ),
            );
          }
          return Scrollbar(
            child: ListView.separated(
              itemCount: provider.usersList.length,
              itemBuilder: (BuildContext context, int index) {
                final UserModel userModel = provider.usersList.elementAt(index);
                return UserCard(userModel: userModel);
              },
              separatorBuilder: (_, __) {
                return const Divider(height: 16.0);
              },
            ),
          );
        },
      ),
    );
  }
}
