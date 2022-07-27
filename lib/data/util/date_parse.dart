import 'package:intl/intl.dart';

class ParseDate {
  static String dFormat(datetime) => DateFormat.MMMMEEEEd().format(datetime);
  static String dFormatDate(datetime) => DateFormat.MMMMd().format(datetime);
  static String dFormatTime(DateTime datetime) {
    print(datetime.toString());
    if (datetime.minute == DateTime.now().minute) {
      return "justnow";
    } else {
      return DateFormat.Hm().format(datetime);
    }
  }
}
