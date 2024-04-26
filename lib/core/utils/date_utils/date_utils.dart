import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDate(DateTime dateTime, String dateFormat) {
    final DateFormat formatter = DateFormat(dateFormat);
    final date = formatter.format(dateTime);

    return date;
  }

  static int getDifferenceDate(DateTime startDate, DateTime endDate) {
    return endDate.difference(startDate).inDays;
  }

  static String getDifferenceCurrentDayTask(DateTime task) {
    DateTime currentDate = DateTime.now();

    DateTime nextTask = DateTime(currentDate.year, task.month, task.day);

    if (currentDate.day == nextTask.day &&
        currentDate.month == nextTask.month) {
      return 0.toString();
    }
    if (currentDate.isAfter(nextTask)) {
      nextTask = DateTime(currentDate.year + 1, task.month, task.day);
    }

    int differenceInDays = nextTask.difference(currentDate).inDays;

    return (differenceInDays + 1).toString();
  }

  static String parseDateToString(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    final String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }

  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }
}
