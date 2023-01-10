import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const bool DEVELOPER_MODE = false;

const String BASE_URL = DEVELOPER_MODE
    ? "<Beta API URL>"
    : "<Live API URL>";

const String PRIVACY_POLICY = "https://www.google.com/";
const String TERMS_AND_CONDITION = "https://www.google.com/";
const String FAQ = "https://www.google.com/";

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

DateFormat viewFormat = DateFormat("MMM dd, yyyy (hh:mm a)");
DateFormat viewFormatDate = DateFormat("MMM dd, yyyy");
DateFormat viewFormatTime = DateFormat("hh:mm a");
DateFormat apiFormat = DateFormat("MM-dd-yyyy HH:mm");

//=========ALL CONSTANTS VALUE FOR THE CODING===========

const String prefKeyUserModel = 'prefUserModel';
const String isLogin = 'isLogin';
const String prefKeyEmail = 'prefEmail';
const String prefKeyPassword = 'prefPassword';
const String prefKeyToken = 'prefEmail';
const String prefKeyRefreshToken = 'prefPassword';


//API LIST
const String TOKEN = BASE_URL + "";
const String REFRESH_TOKEN = BASE_URL + "authentication/refresh";