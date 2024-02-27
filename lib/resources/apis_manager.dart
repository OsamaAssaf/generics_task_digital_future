import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApisManager {
  ApisManager._();

  static final ApisManager _instance = ApisManager._();

  factory ApisManager() => _instance;

  final String getUsersListUrl = dotenv.env['GET_USERS_LIST_URL']!;
  final String getOneUserUrl = dotenv.env['GET_ONE_USER_LIST_URL']!;
}
