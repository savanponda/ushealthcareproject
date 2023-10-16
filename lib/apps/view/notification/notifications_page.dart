import 'package:flutter/material.dart';
import 'package:UShealthcare/apps/common/job_profile_tile.dart';
import 'package:UShealthcare/apps/common/notifications_tile.dart';
import 'package:UShealthcare/helper/WidgetHelper.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetHelper.getHeader(
          context,
          buildTranslate(context, "notifications"),
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
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return jobProfileTile();
              },
            ),
          ),
        )
    );
  }
}
