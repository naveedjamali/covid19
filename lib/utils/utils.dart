
import 'package:intl/intl.dart';

String generateDate(DateTime time) {

  String month;
  String ampm;

  switch (time.month) {
    case 1:
      month = 'JAN';
      break;
    case 2:
      month = 'FEB';
      break;
    case 3:
      month = 'MAR';
      break;
    case 4:
      month = 'APR';
      break;
    case 5:
      month = 'MAY';
      break;
    case 6:
      month = 'JUN';
      break;
    case 7:
      month = 'JUL';
      break;
    case 8:
      month = 'AUG';
      break;
    case 9:
      month = 'SEP';
      break;
    case 10:
      month = 'OCT';
      break;
    case 11:
      month = 'NOV';
      break;
    case 12:
      month = 'DEC';
      break;
  }

  if (time.hour > 0 && time.hour < 12) {
    ampm = "AM";
  } else {
    ampm = "PM";
  }
  return month +
      ' ${time.day}, ${time.year}, ${time.hour}:${time.minute} ' +
      ampm;
}
String formattedNumber(dynamic number){
  return NumberFormat('###,###',).format(number).toString();
}