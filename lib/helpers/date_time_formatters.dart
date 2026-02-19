import 'package:intl/intl.dart';

class DateTimeFormatters {
  static final _time = DateFormat('h:mm a'); // 7:10 PM
  static final _date = DateFormat('EEE d MMM yyyy'); // Fri 21 Mar 2025

  static String time(DateTime dt) => _time.format(dt);

  static String date(DateTime dt) => _date.format(dt);
}
