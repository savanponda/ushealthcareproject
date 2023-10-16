import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:UShealthcare/apps/Model/location/LocationModel.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constants.dart';

class AppGlobal {

  //static User? user;

  static String token = "";
  static String refreshToken = "";

  static bool isInternet = false;
  static bool isUserLogin = false;
  static String pairId = "";

  static String currency = "\$";

  static EventBus eventBus = EventBus();

  static final perFormatter = new NumberFormat("###,###,###,##0.00");

  static DateFormat apiDateFormat = DateFormat("yyyy-MM-dd");
  static DateFormat viewDateFormat = DateFormat("dd/MM/yyyy");
  static DateFormat viewDateFormat2 = DateFormat("dd MMM yyyy");
  static DateFormat viewTimeFormat = DateFormat("HH:mm");

  static getCountriesData(Function callBack) {
    rootBundle.load('assets/json/countries_states_cities.gz').then((ByteData res) {
      final decoded_data = GZipCodec().decode(res.buffer.asInt8List());

      print(utf8.decode(decoded_data, allowMalformed: true));

      LocationModel apiResponse = LocationModel.fromJson(jsonDecode(utf8.decode(decoded_data, allowMalformed: true)));

      print("========");
      print(apiResponse.data!.locationList!.length);
      print("========");

      callBack(apiResponse.data!.locationList??[]);
    });
  }
  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static hideKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(navigatorKey.currentContext!);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }

  static appLogout() {
    // User user = User();
    // SharedPref.savePreferenceValue(prefKeyUserModel, user);
    // SharedPref.savePreferenceValue(isLogin, false);
    // AppGlobal.user = user;
    // AppGlobal.isUserLogin = false;
  }

  static printLog(dynamic val) {
    if(kDebugMode)
      log(val.toString());
  }

  static rateUs(BuildContext context) async
  {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;

    RateMyApp rateMyApp = RateMyApp(
      preferencesPrefix: '$appName',
      minDays: 0,
      minLaunches: 20,
      remindDays: 7,
      remindLaunches: 10,
      googlePlayIdentifier: '$packageName',
      appStoreIdentifier: '1491556149',
    );

    rateMyApp.init().then((_) {

      print("==============CALL======================");

      //if (rateMyApp.shouldOpenDialog) {
      //print("==============CALL IF======================");
      rateMyApp.showRateDialog(
        context,
        title: 'Rate this app', // The dialog title.
        message: 'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.', // The dialog message.
        rateButton: 'RATE', // The dialog "rate" button text.
        noButton: 'NO THANKS', // The dialog "no" button text.
        laterButton: 'MAYBE LATER', // The dialog "later" button text.
        listener: (button) { // The button click listener (useful if you want to cancel the click event).
          switch(button) {
            case RateMyAppDialogButton.rate:
              print('Clicked on "Rate".');
              break;
            case RateMyAppDialogButton.later:
              print('Clicked on "Later".');
              break;
            case RateMyAppDialogButton.no:
              print('Clicked on "No".');
              break;
          }

          return true; // Return false if you want to cancel the click event.
        },
        //ignoreNativeDialog: false, // Set to false if you want to show the native Apple app rating dialog on iOS.
        dialogStyle: DialogStyle(), // Custom dialog styles.
        onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
        // actionsBuilder: (_) => [], // This one allows you to use your own buttons.
      );

      // Or if you prefer to show a star rating bar :

      /*rateMyApp.showStarRateDialog(
          context,
          title: 'Rate this app', // The dialog title.
          message: 'You like this app ? Then take a little bit of your time to leave a rating :', // The dialog message.
          actionsBuilder: (_, stars) { // Triggered when the user updates the star rating.
            return [ // Return a list of actions (that will be shown at the bottom of the dialog).
              FlatButton(
                child: Text('OK'),
                onPressed: () async {
                  print('Thanks for the ' + (stars == null ? '0' : stars.round().toString()) + ' star(s) !');
                  // You can handle the result as you want (for instance if the user puts 1 star then open your contact page, if he puts more then open the store page, etc...).
                  // This allows to mimic the behavior of the default "Rate" button. See "Advanced > Broadcasting events" for more information :
                  await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                  Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);
                },
              ),
            ];
          },
          ignoreIOS: false, // Set to false if you want to show the native Apple app rating dialog on iOS.
          dialogStyle: DialogStyle( // Custom dialog styles.
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20),
          ),
          starRatingOptions: StarRatingOptions(), // Custom star bar rating options.
          onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
        );*/
      //}
    });
  }

  static launchURL(String url) async{

    Uri uri = Uri.parse(url);
    bool can = await canLaunchUrl(uri);
    if(can)
      launchUrl(uri);
    else {
      throw 'Could not launch $url';
    }
  }
}