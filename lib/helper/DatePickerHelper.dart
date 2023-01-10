import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/AppGlobal.dart';
import '../utils/Constants.dart';

class DatePickerHelper {
  static Future<DateTime> pickDOBDate({dynamic date, String? format, dynamic firstDate}) async {

    AppGlobal.hideKeyboard();

    //final DateFormat dateFormatter = DateFormat(format!=null?format:'yyyy-MM-dd');

    DateTime selectedDate=DateTime.now();
    if(date is DateTime)
      selectedDate=date;
    else if(date is String)
      selectedDate=DateFormat("MM/dd/yyyy").parse(date);

    DateTime firstDateL=DateTime.now();
    if(firstDate is DateTime)
      firstDateL=firstDate;
    else if(firstDate is String)
      firstDateL=DateTime.parse(firstDate);

    if(firstDateL.millisecondsSinceEpoch>selectedDate.millisecondsSinceEpoch){
      selectedDate=firstDateL;
    }

    final DateTime? picked = await showDatePicker(
      context: navigatorKey.currentContext!,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: firstDateL,
    );

    //if (picked != null)
      selectedDate=picked!;

    return selectedDate;
    //return dateFormatter.format(selectedDate);
  }

  static Future<DateTime> pickDate({dynamic date, String? format, dynamic firstDate}) async {

    AppGlobal.hideKeyboard();

    // final DateFormat dateFormatter = DateFormat(format!=null?format:'dd-MM-yyyy');
    final DateFormat dateFormatter = DateFormat("MMM dd, yyyy");

    DateTime selectedDate=DateTime.now();
    if(date is DateTime)
      selectedDate=date;
    else if(date is String)
      selectedDate=dateFormatter.parse(date);

    DateTime firstDateL=DateTime.now();
    if(firstDate is DateTime)
      firstDateL=firstDate;
    else if(firstDate is String)
      firstDateL=dateFormatter.parse(firstDate);

    if(firstDateL.millisecondsSinceEpoch>selectedDate.millisecondsSinceEpoch){
      selectedDate=firstDateL;
    }

    final DateTime? picked = await showDatePicker(
      context: navigatorKey.currentContext!,
      initialDate: selectedDate,
      firstDate: firstDateL,
      lastDate: DateTime(2030),
    );

    //if (picked != null)
      selectedDate=picked!;

    return selectedDate;
    //return dateFormatter.format(selectedDate);
  }

  // static Future<String> pickTime() async {
  //   AppGlobal.hideKeyboard();
  //   TimeOfDay selectedTimeOfDay = TimeOfDay.now();
  //
  //   TimeOfDay picked = await showTimePicker(
  //     context: navigatorKey.currentContext,
  //     initialTime: selectedTimeOfDay,
  //     builder: (BuildContext context, Widget child) {
  //       return MediaQuery(
  //         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
  //         child: child,
  //       );
  //     },
  //   );
  //
  //   return picked.format(navigatorKey.currentContext);
  // }

  static Future<String> pickTime(String? selectedTime) async {
    AppGlobal.hideKeyboard();

    print(selectedTime);

    TimeOfDay selectedTimeOfDay = TimeOfDay.now();
    if(selectedTime!=null) {
      if (selectedTime.isNotEmpty) {
        DateTime date = DateFormat.Hm().parse(selectedTime);
        //print(DateFormat("HH:mm").format(date));

        selectedTimeOfDay = TimeOfDay(
          // hour: int.parse(selectedTime.substring(0,selectedTime.indexOf(":"))),
          // minute: int.parse(selectedTime.substring(selectedTime.indexOf(":") + 1, selectedTime.indexOf(" ")))
          hour: date.hour,
          minute: date.minute,
        );
      } else {
        selectedTimeOfDay = TimeOfDay.now();
      }
    }
    else {
      selectedTimeOfDay = TimeOfDay.now();
    }

    TimeOfDay? picked = await showTimePicker(
      context: navigatorKey.currentContext!,
      initialTime: selectedTimeOfDay,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),//alwaysUse24HourFormat: true
          child: child!,
        );
      },
    );

    // print("======");
    // print(picked.hour);
    // print(picked.hourOfPeriod);
    // print(picked.minute);
    // print(picked.period);
    // print(picked.periodOffset);
    // print("======");

    return getHourAndTimeIn2Digit(picked!.hourOfPeriod!=0?picked.hourOfPeriod:picked.hour)+":"+getHourAndTimeIn2Digit(picked.minute)+" "+(picked.period==DayPeriod.am?"AM":"PM");

    //return picked.format(navigatorKey.currentContext);
  }

  static String getHourAndTimeIn2Digit(dynamic value) {
    String data = value.toString();
    if (data.length == 1) data = "0" + data.toString();

    return data;
  }
}