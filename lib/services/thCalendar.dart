import 'package:intl/intl.dart';

class THCalendar {

  String getDateTimeFormatted(var newdate) {
    var formatter = new DateFormat('dd-MM-H:mm');
    String formatted = formatter.format(newdate);

    var arr = formatted.split('-');

    if (DateTime.now().difference(newdate).inDays == 0) {
      return "วันนี้ "+ arr[2];
    } else if(DateTime.now().difference(newdate).inDays == 1) {
      return "เมื่อวาน "+ arr[2];
    } else {
      return arr[0]+" "+monthInThai(arr[1])+" "+arr[2];
    }
  }

  String monthInThai(var month) {
    String monthTh;
    switch (month) {
      case '01': monthTh = "มกราคม";   break;
      case '02': monthTh = "กุมภาพันธ์";   break;
      case '03': monthTh = "มีนาคม";   break;
      case '04': monthTh = "เมษายน";   break;
      case '05': monthTh = "พฤษภาคม";   break;
      case '06': monthTh = "มิถุนายน";   break;
      case '07': monthTh = "กรกฎาคม";   break;
      case '08': monthTh = "สิงหาคม";   break;
      case '09': monthTh = "กันยายน";   break;
      case '10': monthTh = "ตุลาคม";   break;
      case '11': monthTh = "พฤศจิกายน";   break;
      case '12': monthTh = "ธันวาคม";   break;
      default: monthTh = "หือออ";
    }
    return monthTh;
  }

  String toBuddhistEra (var year) {
    var intYear = int.parse(year);
    intYear+=543;
    return intYear.toString();
  }


}