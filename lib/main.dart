import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onlinebia/style/AppTheme.dart';
import 'package:onlinebia/utils/Constants.dart';

import 'apps/common/internet_bloc/internet_bloc.dart';
import 'apps/view/splash_Screen.dart';
import 'localization/AppLocalizations.dart';

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
late AndroidNotificationChannel channel;
FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await initFirebase();

  // Only call clearSavedSettings() during testing to reset internal values.
  // await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  runApp(MyApp());
}


Future<void> initFirebase() async {
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'Onlinebia', // title
      description: 'Onlinebia Notification.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.toMap()}');
  sendNotification(message, "onBackgroundMessage");
}

sendNotification(RemoteMessage message, String str) async {
  await initFirebase();

  if (message.notification != null) {
    RemoteNotification notification = message.notification!;
    AndroidNotification android = message.notification!.android!;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title, //!+" - "+str,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'notification_icon',
            priority: Priority.high,
          ),
        ),
        //payload: message.notification.toString(),
        payload: Platform.isAndroid ? jsonEncode(message.data) : jsonEncode(
            message.notification!.toMap()),
      );
    }
  }
  else {
    flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data["title"], //+" - "+str,
      message.data["body"],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'notification_icon',
          priority: Priority.high,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        title: 'Onlinebia',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
        routes: <String, WidgetBuilder>{
          //'/': (context) => SplashScreen(),
        },
        navigatorKey: navigatorKey,
        localizationsDelegates: [
          const MyLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("en"),
        ],

      ),
    );
  }
}
