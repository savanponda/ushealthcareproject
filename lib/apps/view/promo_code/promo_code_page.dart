import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helper/WidgetHelper.dart';
import '../../../localization/AppLocalizations.dart';
import '../../common/promo_code_tile.dart';

class PromoCodePage extends StatefulWidget {
  const PromoCodePage({Key? key}) : super(key: key);

  @override
  State<PromoCodePage> createState() => _PromoCodePageState();
}

class _PromoCodePageState extends State<PromoCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WidgetHelper.getHeader(
            context,
            buildTranslate(context, "promoCodeTitle"),
            showBackIcon: true,
            showNotificationIcon: false,
            centerTitle: true,
            onAddressClick: (){
              // NavigatorHelper.remove();
            }
        ),
        body:SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return PromoCodeTile(removeButton: false, callBack: (){},);
              },
             ),
              ),
            ),
          ),
        )
    );
  }
}
