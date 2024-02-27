import 'dart:convert';

import 'package:generics_task_digital_future/resources/exception_manager.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  NetworkService._();

  static final NetworkService _instance = NetworkService._();

  factory NetworkService() => _instance;

  Future<T> fetchData<T>(String url, T Function(dynamic) parser) async {
    try {
      final http.Response response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () => http.Response(ExceptionManager.timedOutException, 408),
          );
      if (response.statusCode == 408) {
        throw ExceptionManager.timedOutException;
      }
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return parser(data);
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
