import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../networking/api_error_handler.dart';
import '../networking/result_or_failure.dart';

Future<ResultOrFailure<T>> tryCatchBlock<T>(
  Future<T> Function() function,
) async {
  if (!(await InternetConnectionChecker().hasConnection)) {
    return FailureResult(ErrorHandler.handle('No Internet Connection'));
  }

  try {
    final result = await function();
    return SuccessResult(result);
  } catch (error) {
    return FailureResult(ErrorHandler.handle(error));
  }
}
