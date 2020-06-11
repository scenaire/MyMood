//AUTHOR : Jiratchaya Yeeto

import 'package:intl/intl.dart';

class THCalendar {

  String getDateTimeFormatted(var newdate) {
    var formatter = new DateFormat('dd-MM-H:mm');

    String formatted = formatter.format(newdate);
    String thisDateformatted = formatter.format(DateTime.now());

    var arr = formatted.split('-');
    var nowArr = thisDateformatted.split('-');


    if (arr[0] == nowArr [0] ) {
      return "วันนี้ "+ arr[2];
    } else {
      return arr[0]+" "+monthInThai(arr[1])+" "+arr[2];
    }
  }

  String changetoThaiDate(DateTime date) {

    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    var splitArr = formattedDate.split('-');

    //String timeFormatted = DateFormat('HH:mm').format(date);

    return splitArr[0]+" "+monthInThai(splitArr[1])+" "+toBuddhistEra(splitArr[2]);

  }

  String changetoThaiDateSmall(DateTime date) {

    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    var splitArr = formattedDate.split('-');

    //String timeFormatted = DateFormat('HH:mm').format(date);

    return splitArr[0]+" "+monthInThaiSmall(splitArr[1])+" "+toBuddhistEra(splitArr[2])[2]+toBuddhistEra(splitArr[2])[3];

  }

  String dateandTimeFormatted(DateTime date) {
    String formattedDate = DateFormat('dd-MM-H:mm').format(date);
    var splitArr = formattedDate.split('-');

    return splitArr[0]+" "+monthInThai(splitArr[1])+" "+splitArr[2];
  }

  String timeFormatted(DateTime date) {
    String timeFormatted = DateFormat('HH:mm').format(date);
    return timeFormatted;
  }

  String yearFormatted(DateTime date) {
    String yearFormatted = DateFormat('yyyy').format(date);
    return toBuddhistEra(yearFormatted);
  }

  String monthFormatted(DateTime date) {
    String monthFormatted = DateFormat('MM').format(date);
    return monthInThai(monthFormatted);
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

  String monthInThaiSmall(var month) {
    String monthTh;
    switch (month) {
      case '01': monthTh = "ม.ค.";   break;
      case '02': monthTh = "ก.พ.";   break;
      case '03': monthTh = "มี.ค.";   break;
      case '04': monthTh = "เม.ย";   break;
      case '05': monthTh = "พ.ค.";   break;
      case '06': monthTh = "มิ.ย.";   break;
      case '07': monthTh = "ก.ค.";   break;
      case '08': monthTh = "ส.ค.";   break;
      case '09': monthTh = "ก.ย.";   break;
      case '10': monthTh = "ต.ค.";   break;
      case '11': monthTh = "พ.ย.";   break;
      case '12': monthTh = "ธ.ค.";   break;
      default: monthTh = "หือออ";
    }
    return monthTh;
  }

  String toBuddhistEra(var year) {
    var intYear = int.parse(year);
    intYear+=543;
    return intYear.toString();
  }


}