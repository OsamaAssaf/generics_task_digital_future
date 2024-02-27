import 'package:generics_task_digital_future/resources/app_utils.dart';

class ExceptionManager {
  ExceptionManager._();

  static final ExceptionManager _instance = ExceptionManager._();

  factory ExceptionManager() => _instance;

  static const Duration timedOutDuration = Duration(seconds: 15);
  static const String timedOutException = 'timedOut';

  final Map<String, dynamic> exceptionsMap = {
    timedOutException: {
      'value': 'Server not reachable',
    },
  };

  void showException([String? error]) {
    final Map<String, dynamic>? exception = exceptionsMap[error];
    AppUtils.snackBar(error != null && exception != null
        ? exception['value'] ?? 'Something went wrong, try again.'
        : 'Something went wrong, try again.');
  }

  void checkTimedOut(int statusCode) {
    if (statusCode == 408) throw timedOutException;
  }
}
