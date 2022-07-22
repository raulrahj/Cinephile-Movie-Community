import 'package:intl/intl.dart';

class ParseDate{

static String dFormat(datetime) => DateFormat.MMMMEEEEd().format(datetime);
static String dFormatDate(datetime) => DateFormat.MMMMd().format(datetime);
   
}