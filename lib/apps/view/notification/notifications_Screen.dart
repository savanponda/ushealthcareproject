import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinebia/apps/tiles/NotificationsTile.dart';
import 'package:onlinebia/helper/WidgetHelper.dart';
import 'package:onlinebia/localization/AppLocalizations.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "promoCodeTitle"),
          showBackIcon: false,
          showNotificationIcon: false,
          centerTitle: true,
          onAddressClick: (){
            // NavigatorHelper.remove();
          }
      ),
        body:SingleChildScrollView(
          child: Container(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NotificationTile();
              },
            ),
          ),
        )
    );
  }
}
