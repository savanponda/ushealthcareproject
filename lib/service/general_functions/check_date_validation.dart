String? isValidDateOrNot(
    {required String? selectedDate, required bool isRequired}) {
  if ((selectedDate ?? "").trim() == "") {
    if (isRequired) {
      return "Date Can't be empty";
    } else {
      return null;
    }
  } else {
    if (selectedDate!.length != 10) {
      return "Enter Valid Date";
    } else {
      int year = int.parse(selectedDate.toString().split("/")[2]);
      int month = int.parse(selectedDate.toString().split("/")[1]);
      int date = int.parse(selectedDate.toString().split("/")[0]);
      return checkDateMonthYear(date: date, month: month, year: year);
    }
  }
}

DateTime? getValidDateFromStringValue({required String? selectedDate}) {
  if ((selectedDate ?? "").trim() == "" || selectedDate!.length != 10) {
    return null;
  } else {
    int year = int.parse(selectedDate.toString().split("/")[2]);
    int month = int.parse(selectedDate.toString().split("/")[1]);
    int date = int.parse(selectedDate.toString().split("/")[0]);
    if (checkDateMonthYear(date: date, month: month, year: year) == null) {
      return DateTime(year, month, date);
    } else {
      return null;
    }
  }
}

String? checkDateMonthYear(
    {required int date, required int month, required int year}) {
  if (date > 31 || month > 12) {
    return "Please Enter Valid Date";
  } else {
    if (month == 2 || month == 4 || month == 6 || month == 9 || month == 11) {
      if (date > 30) {
        return "Please Enter Valid Date";
      } else {
        if (month == 2) {
          if (year % 4 == 0 || year % 100 == 0 || year % 400 == 0) {
            if (date > 29) {
              return "Please Enter Valid Date";
            } else {
              return null;
            }
          } else {
            if (date > 28) {
              return "Please Enter Valid Date";
            } else {
              return null;
            }
          }
        } else {
          return null;
        }
      }
    } else {
      return null;
    }
  }
}

//Month Validator :
String? isValidMonthYear(
    {required String? selectedMonthYear, required bool isRequired}) {
  if ((selectedMonthYear ?? "").trim() == "") {
    if (isRequired) {
      return "Month/Year can't be empty";
    } else {
      return null;
    }
  } else {
    if (selectedMonthYear!.length != 7) {
      return "Enter valid Month/Year";
    } else {
      int year = int.parse(selectedMonthYear.toString().split("/")[1]);
      int month = int.parse(selectedMonthYear.toString().split("/")[0]);
      return checkMonthYear(month: month, year: year);
    }
  }
}

DateTime? getValidDateFromMonthYear({required String? selectedMonthYear}) {
  if ((selectedMonthYear ?? "").trim() == "" ||
      selectedMonthYear!.length != 7) {
    return null;
  } else {
    int year = int.parse(selectedMonthYear.toString().split("/")[1]);
    int month = int.parse(selectedMonthYear.toString().split("/")[0]);
    if (checkMonthYear(month: month, year: year) == null) {
      return DateTime(year, month);
    } else {
      return null;
    }
  }
}

String? checkMonthYear({required int month, required int year}) {
  if (month > 12) {
    return "Please enter a valid month (1-12)";
  } else {
    return null;
  }
}
