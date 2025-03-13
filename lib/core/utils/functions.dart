import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../helpers/log_helper.dart';
import '../networking/api_error_handler.dart';
import '../networking/result_or_failure.dart';

Future<ResultOrFailure<T>> tryCatchBlock<T>({
  Future<T?> Function()? preFetch,
  required Future<T> Function() fetch,
  Future<void> Function(T)? postFetch,
}) async {
  if (preFetch != null) {
    try {
      final result = await preFetch();
      if (result != null) return SuccessResult(result);
    } catch (error) {
      LogHelper.logError('Caching Retrieval Error');
    }
  }

  if (!(await InternetConnection().hasInternetAccess)) {
    return FailureResult(ErrorHandler.handle('No Internet Connection'));
  }

  try {
    final result = await fetch();

    if (postFetch != null) postFetch(result);

    return SuccessResult(result);
  } catch (error) {
    return FailureResult(ErrorHandler.handle(error));
  }
}
