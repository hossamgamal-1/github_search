class DateTimeHelper {
  static String formatTimeDifference(DateTime date) {
    final now = DateTime.now();

    final Duration duration;
    if (date.isAfter(now)) {
      duration = date.difference(now);
    } else {
      duration = now.difference(date);
    }

    if (duration.inDays > 30) {
      final months = duration.inDays ~/ 30;
      return _prepareText(months, 'month');
    }

    if (duration.inDays > 0) {
      return _prepareText(duration.inDays, 'day');
    }

    if (duration.inHours > 0) {
      return _prepareText(duration.inHours, 'hour');
    }

    return _prepareText(duration.inMinutes, 'minute');
  }

  static String _prepareText(int units, String unitName) {
    return '$units $unitName${units == 1 ? '' : 's'} ago';
  }
}
